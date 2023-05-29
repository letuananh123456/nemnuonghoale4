from django.shortcuts import render, redirect, get_object_or_404
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import permissions
from apps.core.utils import validate_data, validate_response, convert_price_to_string, cty_bh, ttdon_hang, loai_hinh_bao_hiem, goi_san_pham_chinh, get_request_hash_data
from django.contrib.auth import authenticate, login
from apps.core.exceptions import HTTP401AuthenticationError, HTTP404NotFoundError, HTTP409ConflictError
from rest_framework import status
from .models import LoginHistory, User
from django.views import View
from .forms import LoginForm, FormWithCaptcha
from django.contrib.auth import logout
from django.core.cache import cache
from apps.payment.models import DonDatHang
from django.contrib import messages
from django.contrib.auth.mixins import LoginRequiredMixin
import json
import requests
from . import models as user_models
from . import utils as user_utils
from . import serializers as user_sers
from apps.payment.views import get_client_ip
import urllib.request
from apps.users.tasks import send_update_password_infor_portal, send_update_register_manager, create_or_update_info_user_taichinh, create_or_update_info_user_yte
from django.conf import settings
from datetime import datetime
import pytz
from django.utils import timezone
from datetime import timedelta
from django.db.models import Q


class LoginAPIView(APIView):
    permission_classes = (permissions.AllowAny,)

    def post(self, request, format=None):
        valid_data = validate_data(user_sers.LoginEmailValidator, request.data)

        username = valid_data.get('username')
        password = valid_data.get('password')
        user = authenticate(username=username, password=password)

        if not user:
            raise HTTP401AuthenticationError('Incorrect email or password1')

        access_token = user_models.generate_access_token(user.id)
        token = user_models.Token.objects.create(user=user, key=access_token)
        data = {
            'id': user.id,
            'username': user.id,
            'email': user.id,
            'access_token': token.key,
        }

        user_utils.create_or_update_login_history(user.id)
        serializer = user_sers.TokenSerializer(data)
        return Response(serializer.data, status=status.HTTP_200_OK)


class GetUserInfoAPIView(APIView):
    permission_classes = (permissions.IsAuthenticated, )

    def get(self, request):
        his = LoginHistory.objects.all()
        ser = user_sers.LoginHistorySerializer(his, many=True)
        return Response(ser.data, status=status.HTTP_200_OK)


class LogoutAPI(APIView):

    def post(self, request, format=None):
        user_models.Token.objects.filter(key=request.auth.key).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


class GetAllUser(APIView):

    def get(self, request, format=None):
        pass


class LoginView(View):

    def get(self, request):
        message = ''
        fm = LoginForm()
        context = {'f': fm, 'message': message}
        return render(request, 'core/login.html', context)

    def post(self, request):
        # test_func.delay()
        login_valid = LoginForm(request.POST)
        fm = LoginForm()
        message = "Đăng nhập thất bại"
        message2 = "( tài khoản hoặc mật khẩu bạn nhập không đúng )"
        context = {'f': fm, 'message': message, 'message2': message2}

        redirect_to = request.GET.get('next', '')

        if login_valid.is_valid():
            username = login_valid.cleaned_data['username']
            password = login_valid.cleaned_data['password']
            user = authenticate(username=username, password=password)
            if not user:
                return render(request, 'core/login.html', context)
            login(request, user)
            if redirect_to == '':
                return redirect('index_page')
            return redirect(redirect_to)
        else:
            return render(request, 'core/login.html', context)


class LogoutView(View):
    def get(self, request):
        logout(request)
        return redirect('index_page')


class OTPView(View):
    def get(self, request):

        phone = request.session.get('phone_number', '0')
        if phone == '0':
            return redirect('register_url')
        otp = cache.get(phone)
        print('otp la:', otp)
        # print('so dien thoai: ', phone)
        # print('otp = ', otp)
        return render(request, 'core/register_otp.html')

    def post(self, request):
        phone = request.session.get('phone_number', '0')
        otp = cache.get(phone)
        otp_form = request.POST.get('maotp')

        if cache.ttl(phone) > 0:
            if otp == otp_form:
                user = User.objects.get(username=phone)
                user.is_active = True
                user.save()
            else:
                msg = {'message': 'Mã OTP của bạn sai hoặc hết hạn'}
                return render(request, 'core/register_otp.html', msg)
        else:
            msg = {'message': 'Mã OTP của bạn sai hoặc hết hạn'}
            return render(request, 'core/register_otp.html', msg)

        return redirect('login_url')


class RegisterView(View):
    def get(self, request):
        captcha = FormWithCaptcha()
        full_link_info = settings.BIHAMA_REGISTER_URL+request.get_full_path()
        ref_url = request.GET.get('ref')
        print("khanh=", str(full_link_info), full_link_info)
        if not ref_url:
            return render(request, 'core/register.html', context={'captcha': captcha})
        elif not User.objects.filter(link_info=full_link_info).exists():
            context = {
                'message': "Link giới thiệu bạn nhập không chính xác", 'captcha': captcha}
            return render(request, 'core/register.html', context)
        context = {'ref_url': ref_url, 'captcha': captcha}
        return render(request, 'core/register.html', context)

    def post(self, request):
        phone = request.POST.get('phone_number')
        password1 = request.POST.get('password')
        password2 = request.POST.get('repassword')
        ref_url1 = request.POST.get('id_person_invite')

        if password1 != password2:
            msg = {'message': 'Bạn nhập lại mật khẩu không chính xác'}
            return render(request, 'core/register.html', msg)

        if User.objects.filter(username=phone, is_active=True).exists():
            msg = {'message': 'Tài khoản này đã tồn tại'}
            return render(request, 'core/register.html', msg)

        if not User.objects.filter(username=phone, is_active=False).exists():
            user = User.objects.create_user(
                username=phone, email=None, password=password1, is_active=False)
            user.code_invite = ref_url1
            user.save()

        if User.objects.filter(username=phone, is_active=False).exists():
            request.session['phone_number'] = phone
            otp_code = user_utils.generate_otp_code()
            cache.set(phone, otp_code, timeout=300)
            get_ip = get_client_ip(request)
            if user_models.CountOTP.objects.filter(phone_otp=phone, count_otp__gte=5, ip_client=get_ip).exists():
                msg = {'message': 'Bạn nhập quá số lần cho phép'}
                return render(request, 'core/index-ver2.html', msg)
            else:
                # otp_status = user_utils.send_otp(phone_number=phone, otp_code=otp_code)
                if user_models.CountOTP.objects.filter(phone_otp=phone, ip_client=get_ip).exists():
                    count = user_models.CountOTP.objects.filter(
                        phone_otp=phone, ip_client=get_ip).first()
                    count.count_otp += 1
                    count.save()
                else:
                    user_models.CountOTP.objects.create(
                        phone_otp=phone, ip_client=get_ip, count_otp=1)
                otp_status = 200
                otp_status2 = 0
                if otp_status != 200:
                    otp_status2 = user_utils.send_voic_call(
                        phone_number=phone, otp_code=otp_code)
                if otp_status == 200 or otp_status2 == 200:
                    return redirect('otp_verify')

        # send otp
        # print('so dien thoai1: ', phone)
        # print('otp1 = ', otp_code)
        return render(request, 'core/register.html')


class SettingUser(LoginRequiredMixin, View):

    login_url = '/dang-nhap/'

    def get(self, request):

        user_detail = User.objects.get(username=request.user.username)
        context = {
            'user_detail': user_detail
        }
        return render(request, 'users/user-setting.html', context)

    def post(self, request):
        ho_va_ten = request.POST.get("ho_va_ten")
        gender = int(request.POST.get("gender"))
        birth_day = int(request.POST.get("birth_day"))
        birth_month = int(request.POST.get("birth_month"))
        birth_year = int(request.POST.get("birth_year"))
        email_user = request.POST.get("email_user")
        old_password = request.POST.get("old_password")
        new_password = request.POST.get("new_password")
        change_password = request.POST.get("is_change_pass")

        if User.objects.filter(username=request.user.username).exists():
            user = User.objects.get(id=request.user.id)
            user.email = email_user
            user.fullname = ho_va_ten
            user.gender = gender  # nu = 0, nam = 1
            user.birth_day = birth_day
            user.birth_month = birth_month
            user.birth_year = birth_year

            if change_password == "1":
                user_pass = authenticate(
                    username=request.user.username, password=old_password)
                if not user_pass:
                    user_detail = User.objects.get(
                        username=request.user.username)
                    context = {
                        'message1': "Mật khẩu cũ bạn nhập chưa chính xác, thay đổi thông tin thất bại", 'user_detail': user_detail}
                    return render(request, 'users/user-setting.html', context)
                else:
                    user.set_password(new_password)
                    user.save()
                    if user.register_ctv is True:
                        send_update_register_manager.delay(
                            user.username, user.register_ctv)
                    send_update_password_infor_portal.delay(
                        user.fullname, user.images_user, user.gender, user.birth_day, user.birth_month, user.birth_year, user.link_info, user.email, user.password)
                    messages.info(request, 'Thay đổi thông tin thành công')
                    return redirect('login_url')
            else:
                user.save()
                if user.register_ctv is True:
                    send_update_register_manager.delay(
                        user.username, user.register_ctv)
                send_update_password_infor_portal.delay(
                    user.fullname, user.images_user, user.gender, user.birth_day, user.birth_month, user.birth_year, user.link_info, user.email, user.password)
                messages.info(request, 'Thay đổi thông tin thành công')
            data_tai_chinh = user_utils.data_updata_platform_bihama(
                user.password, user.username, user.email, user.fullname, user.gender, user.birth_day, user.birth_month, user.birth_year, user.link_info, api_hope=3)
            data_y_te = user_utils.data_updata_platform_bihama(
                user.password, user.username, user.email, user.fullname, user.gender, user.birth_day, user.birth_month, user.birth_year, user.link_info, api_hope=2)
            create_or_update_info_user_taichinh.delay(data_tai_chinh)
            create_or_update_info_user_yte.delay(data_y_te)
        return redirect('user-setting')


class SettingThongBao(LoginRequiredMixin, View):

    login_url = '/dang-nhap/'

    def get(self, request):
        list_thongbao_chung = user_models.Notification.objects.all()
        user_detail = User.objects.get(username=request.user.username)
        context = {
            'list_thongbao_chung': list_thongbao_chung,
            'user_detail': user_detail
        }
        return render(request, 'users/setting-thongbao.html', context)


class OderManagement(LoginRequiredMixin, View):

    login_url = '/dang-nhap/'

    def get(self, request):
        if User.objects.filter(username=request.user.username).exists():
            user_detail = User.objects.get(username=request.user.username)
            order_product_management = DonDatHang.objects.filter(
                user=request.user)

            list_item_oder = []
            for it in order_product_management:
                sub_item = {}
                sub_item['money_real'] = convert_price_to_string(
                    it.tong_phi_thanh_toan_sau_giam_gia)
                sub_item['tinh_trang_don_dat_hang'] = ttdon_hang(
                    it.tinh_trang_don_dat_hang)
                sub_item['cong_ty'] = cty_bh(it.cong_ty)
                sub_item['loai_hinh_bao_hiem'] = loai_hinh_bao_hiem(
                    it.loai_hinh_bao_hiem)
                sub_item['goi_san_pham_chinh'] = goi_san_pham_chinh(
                    it.goi_san_pham_chinh, it.loai_hinh_bao_hiem)
                sub_item['linkgiaycn'] = it.link_giay_chung_nhan
                list_item_oder.append(sub_item)
            print(list_item_oder)
            context = {
                'list_item_oder': list_item_oder,
                'user_detail': user_detail,
            }
            return render(request, 'users/order_management.html', context)


class ViewMenuMobile(LoginRequiredMixin, View):

    login_url = '/dang-nhap/'

    def get(self, request):
        user_detail = User.objects.get(username=request.user.username)
        context = {
            'user_detail': user_detail
        }
        return render(request, 'users/user-menu-mobile.html', context)


class ElectronicWallet(LoginRequiredMixin, View):

    login_url = '/dang-nhap/'

    def get(self, request):
        ds_account_bank = user_models.BankAccount.objects.filter(
            ctv=request.user).order_by("-created_at")
        l = len(ds_account_bank)
        dict_ds_account_bank = dict()
        form = FormWithCaptcha()
        for i in range(l):
            dict_ds_account_bank[i] = ds_account_bank[i].bank_name + '  -  ' + \
                ds_account_bank[i].fullname + '  -  ' + \
                ds_account_bank[i].bank_number
        context = {'dict_ds_account_bank': dict_ds_account_bank, 'form': form}
        print(context)
        return render(request, 'users/electronic-wallet.html', context)

    def post(self, request):
        if "," not in request.POST.get("bpoint"):
            bpoint = int(request.POST.get("bpoint"))
        else:
            bpoint = int("".join(request.POST.get("bpoint").split(",")))
        thanhtien = request.POST.get("thanhtien")
        bank_id = int(request.POST.get("bank_id"))
        password = request.POST.get("password")
        ds_account_bank = user_models.BankAccount.objects.filter(
            ctv=request.user).order_by("-created_at")
        bank = ds_account_bank[bank_id]
        data = dict()
        data["stk"] = bank.bank_number
        data["bank"] = bank.bank_name
        data["amount_withdraw"] = bpoint
        data["thanhtien"] = thanhtien
        data["nguon"] = 1
        data["created_at"] = timezone.now().strftime("%Y-%m-%d %H:%M:%S")
        headers = {"Content-Type": "application/json"}
        if bpoint < 1000:
            messages.warning(request, 'Số BV tối thiểu rút là 1000  BPoint')
            return redirect('user:electronic-wallet-url')
        if request.user.check_password(password):
            data_hash_ctv = get_request_hash_data(
                data, settings.SECURITY_KEY_CTV_SAN)
            print(data_hash_ctv)
            url_ctv = settings.PORTAL_URL + "vitien/create-lenh-rut-tien/"
            r_ctv = requests.post(
                url=url_ctv, data=data_hash_ctv, headers=headers)
            if r_ctv.status_code == 200 and json.loads(r_ctv.content) == "khong hop le":
                messages.warning(
                    request, 'Số BPoint rút lớn hơn số BPoint được rút. Số BPoint tối thiểu trong tài khoản là 2000')
                return redirect('user:electronic-wallet-url')
            else:
                if r_ctv.status_code == 200 and json.loads(r_ctv.content) == "thanh cong":
                    messages.success(request,
                                     "Thành công.Chúng tôi đang xử lí, vui lòng chờ để chúng tôi chuyển tiền !!!")
                    return redirect('user:electronic-wallet-url')
                else:
                    messages.warning(request,
                                     "Lỗi đường truyền. Vui lòng thực hiện lúc khác")
                    return redirect('user:electronic-wallet-url')
        else:
            messages.warning(request, 'Sai mật khẩu')
            return redirect('user:electronic-wallet-url')


class Tutorial(LoginRequiredMixin, View):

    login_url = '/dang-nhap/'

    def get(self, request):
        order_tutorial = user_models.OderTutorial.objects.all()
        user_detail = User.objects.get(username=request.user.username)
        context = {
            'order_tutorial': order_tutorial,
            'user_detail': user_detail
        }
        return render(request, 'users/tutorial.html', context)


class ShowBvWalletApi(APIView):
    permission_classes = (permissions.AllowAny,)

    def get(self, request, format=None):
        username = request.user.username
        # return bv_value
        PORTAL_RETURN_BV_VALUE_URL = 'http://portal.bihama.vn/vitien/get-user-bv/?username='
        url = PORTAL_RETURN_BV_VALUE_URL+username
        # http://localhost:8000/vitien/get-user-bv/?username=0964348800
        print(url)
        r = requests.get(url)
        bv = json.loads(r.content)
        print(bv)
        if User.objects.filter(username=username).exists():
            data = {'bv_value_red': bv['red_bv'],
                    'bv_value_gen': bv['green_bv']}
            return Response(data=data, status=status.HTTP_200_OK)
        return Response(1, status=status.HTTP_400_BAD_REQUEST)


class UpdateInforUserCTV_API(APIView):
    permission_classes = {permissions.AllowAny}

    def post(self, request):
        valid_data = validate_data(user_sers.UpdateInforUserApi, request.data)

        password = valid_data.get("password")
        username = valid_data.get("username")
        email = valid_data.get("email")
        ho_va_ten = valid_data.get("ho_va_ten")
        images_user = valid_data.get("images_user")
        gender = valid_data.get("gender")
        birth_day = valid_data.get("birth_day")
        birth_month = valid_data.get("birth_month")
        birth_year = valid_data.get("birth_year")
        link_info = valid_data.get("link_info")
        secret = valid_data.get("secret")

        dict_check = dict()
        dict_check["password"] = password
        dict_check["username"] = username
        dict_check["email"] = email
        dict_check["ho_va_ten"] = ho_va_ten
        dict_check["images_user"] = images_user
        dict_check["gender"] = gender
        dict_check["birth_day"] = birth_day
        dict_check["birth_month"] = birth_month
        dict_check["birth_year"] = birth_year
        dict_check["link_info"] = link_info
        dict_check["secret"] = secret

        if validate_response(dict_check, settings.SECURITY_KEY_CTV_SAN):
            if user_models.User.objects.filter(link_info=link_info).exists():
                user = user_models.User.objects.get(link_info=link_info)
            else:
                return Response("username no exists", status=status.HTTP_400_BAD_REQUEST)
            user.password = password
            user.username = username
            user.email = email
            user.fullname = ho_va_ten
            user.images_user = images_user
            user.gender = gender
            user.birth_day = birth_day
            user.birth_month = birth_month
            user.birth_year = birth_year
            user.link_info = link_info
            user.save()
            return Response(1, status=status.HTTP_200_OK)
        else:
            return Response(0, status=status.HTTP_401_UNAUTHORIZED)


class BankAccount_CTVAPI(APIView):
    permission_classes = [permissions.AllowAny, ]

    def post(self, request):
        validated = validate_data(
            user_sers.BankAccount_CTVSerializer, request.data)
        link_info = validated.get("link_info")
        bank_name = validated.get("bank_name")
        fullname = validated.get("fullname")
        bank_number = validated.get("bank_number")
        branch = validated.get("branch")
        created_at = validated.get("created_at").strftime("%Y-%m-%d %H:%M:%S")
        secret = validated.get("secret")

        dict_check = dict()

        dict_check["link_info"] = link_info
        dict_check["bank_name"] = bank_name
        dict_check["fullname"] = fullname
        dict_check["bank_number"] = bank_number
        dict_check["branch"] = branch
        dict_check["created_at"] = created_at
        dict_check["secret"] = secret
        print(dict_check.keys() == request.data.keys())
        for k in request.data.keys():
            print(dict_check[k] == request.data[k], k)
        print(dict_check)
        k = validate_response(dict_check, settings.SECURITY_KEY_CTV_SAN)
        if k:
            user = user_models.User.objects.filter(link_info=link_info)
            if user.exists():
                user_models.BankAccount.objects.create(ctv=user[0], bank_name=bank_name,
                                                       fullname=fullname, bank_number=bank_number, branch=branch, created_at=created_at)
                return Response(1, status=status.HTTP_200_OK)
            else:
                return Response(0, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response(0, status=status.HTTP_403_FORBIDDEN)


class feedback_lenh_rut_tien(APIView):
    permission_classes = [permissions.AllowAny]

    def post(self, request):
        validated = validate_data(
            user_sers.feedback_LenhRutTienSerializer, request.data)
        stk = validated.get("stk")
        amount_withdraw = validated.get("amount_withdraw")
        created_at = validated.get(
            "created_at").strftime("%Y-%m-%d %H:%M:%S.%f")
        trangthai = validated.get("status")
        secret = validated.get("secret")

        dict_check = dict()
        dict_check["stk"] = stk
        dict_check["amount_withdraw"] = amount_withdraw
        dict_check["created_at"] = created_at
        dict_check["status"] = trangthai
        dict_check["secret"] = secret
        print(created_at)
        utc = pytz.utc
        loc_dt = utc.localize(datetime.strptime(
            created_at, "%Y-%m-%d %H:%M:%S.%f"))
        print(loc_dt)
        k = validate_response(dict_check, settings.SECURITY_KEY_MANA_SAN)
        if k:
            acc = user_models.BankAccount.objects.filter(bank_number=stk)
            if acc.exists():
                lrt = user_models.LenhRutTien.objects.filter(
                    bank_account=acc[0], created_at=loc_dt, status=0, amount_withdraw=amount_withdraw)
                if lrt.exists():
                    pass
                    lrt.update(status=trangthai)
                    return Response(1, status=status.HTTP_200_OK)
                else:
                    return Response(0, status=status.HTTP_400_BAD_REQUEST)
            else:
                return Response(0, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response(0, status=status.HTTP_403_FORBIDDEN)


class ThongBaoTroThanhCongTacVien(APIView):
    def post(self, request):
        validated = validate_data(
            user_sers.Feedback_Dangki_CTVSerializer, request.data)
        dict_check = dict(validated)
        k = validate_response(dict_check, settings.SECURITY_KEY_CTV_SAN)
        if k:
            user_models.User.objects.filter(username=dict_check['username']).update(
                link_info=dict_check['link_info'])
            return Response(1, status=status.HTTP_200_OK)
        else:
            return Response(1, status=status.HTTP_401_UNAUTHORIZED)


class ForgotPassWord(View):

    def get(self, request):

        return render(request, 'core/forgot_pass.html')

    def post(self, request):
        sdt = request.POST.get('phone_number')
        if User.objects.filter(username=sdt, is_active=True).exists():
            user = User.objects.get(username=sdt)
            if user_models.ForgotPassword.objects.filter(user=user).exists():
                count_pw = user_models.ForgotPassword.objects.get(user=user)
            else:
                count_pw = user_models.ForgotPassword.objects.create(
                    user=user, ngay_thay_doi=user.created_at)
            current_day = timezone.now()
            ishieuluc = current_day.date() - count_pw.ngay_thay_doi.date()
            if ishieuluc >= timedelta(days=1):
                request.session['phone_forgot_pw'] = sdt
                otp_code = user_utils.generate_otp_code()
                cache.set(sdt, otp_code, timeout=300)
                # otp_status = user_utils.send_otp(phone_number=sdt, otp_code=otp_code)
                otp_status = 200
                otp_status2 = 0
                if otp_status != 200:
                    otp_status2 = user_utils.send_voic_call(
                        phone_number=sdt, otp_code=otp_code)
                if otp_status == 200 or otp_status2 == 200:
                    return redirect('lay_matkhau')
            else:
                msg = {
                    'message': 'Tài khoản này mới lấy lại mật khẩu hoặc vừa mới tạo !!! Vui lòng thử lại vào ngày hôm sau (Mỗi ngày được lấy lại 1 lần)'}
                return render(request, 'core/forgot_pass.html', msg)
        else:
            msg = {
                'message': 'Tài khoản này không tồn tại !!! Vui lòng nhập đúng số điện thoại'}
            return render(request, 'core/forgot_pass.html', msg)


class OTPForGotPassWord(View):
    def get(self, request):

        phone = request.session.get('phone_forgot_pw', '0')
        if phone == '0':
            return redirect('forgot_passw')
        otp = cache.get(phone)
        print('otp la:', otp)
        return render(request, 'core/lay_matkhau.html')

    def post(self, request):
        phone = request.session.get('phone_forgot_pw', '0')
        otp = cache.get(phone)
        otp_form = request.POST.get('maotp')
        newpassword = request.POST.get('newpassword')
        re_newpassword = request.POST.get('re_newpassword')

        if cache.ttl(phone) > 0:
            if otp == otp_form:
                if newpassword != re_newpassword:
                    msg = {'message': 'Bạn nhập lại mật khẩu không chính xác'}
                    return render(request, 'core/register.html', msg)
                elif (newpassword == re_newpassword) and (User.objects.filter(username=phone, is_active=True).exists()):
                    user = User.objects.get(username=phone)
                    user.set_password(newpassword)
                    user.save()
                    count_pw = user_models.ForgotPassword.objects.get(
                        user=user)
                    count_pw.ngay_thay_doi = timezone.now().date()
                    count_pw.save()
                    if user.link_info != None or user.link_info != "":
                        send_update_password_infor_portal.delay(
                            user.fullname, user.images_user, user.gender, user.birth_day, user.birth_month, user.birth_year, user.link_info, user.email, user.password)
                else:
                    msg = {
                        'message': 'Tài khoản này không tồn tại !!! Vui lòng nhập đúng số điện thoại'}
                    return render(request, 'core/forgot_pass.html', msg)
            else:
                msg = {'message': 'Mã OTP của bạn sai hoặc hết hạn'}
                return render(request, 'core/lay_matkhau.html', msg)
        else:
            msg = {'message': 'Mã OTP của bạn sai hoặc hết hạn'}
            return render(request, 'core/lay_matkhau.html', msg)

        return redirect('login_url')


class PhanHoiThayDoiTuyenTren(APIView):
    permission_classes = [permissions.AllowAny]

    def post(self, requests):
        validated = validate_data(
            user_sers.Feedback_thay_doi_tuyen_tren, requests.data)
        dict_check = dict(validated)
        k = validate_response(dict_check, settings.SECURITY_KEY_MANA_SAN)
        if k:
            user1 = User.objects.filter(link_info=dict_check["link_info"])
            user2 = User.objects.filter(
                link_info="https://www.bihama.vn/dang-ky/?ref="+dict_check["code_info_thaydoi"])
            if user1.exists() and user2.exists():
                user1.first().update(
                    code_invite=dict_check["code_info_thaydoi"])
                return Response(1, status=status.HTTP_200_OK)
            else:
                return Response(0, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response(0, status=status.HTTP_401_UNAUTHORIZED)


class PhanHoiThayDiaDiemKinhDoanAPI(APIView):
    permission_classes = [permissions.AllowAny]

    def post(self, request):
        valided = validate_data(
            user_sers.PhanHoiThayDiaDiemKinhDoanhSerializer, request.data)
        link_info = valided.get("link_info")
        dia_chi_tinh_thanh_pho_kd_moi = valided.get(
            "dia_chi_tinh_thanh_pho_kd_moi")
        dia_chi_quan_huyen_kd_moi = valided.get("dia_chi_quan_huyen_kd_moi")
        dia_chi_chi_tiet_kd_moi = valided.get("dia_chi_chi_tiet_kd_moi")
        secret = valided.get("secret")

        dict_check = dict()
        dict_check["link_info"] = link_info
        dict_check["dia_chi_tinh_thanh_pho_kd_moi"] = dia_chi_tinh_thanh_pho_kd_moi
        dict_check["dia_chi_quan_huyen_kd_moi"] = dia_chi_quan_huyen_kd_moi
        dict_check["dia_chi_chi_tiet_kd_moi"] = dia_chi_chi_tiet_kd_moi
        dict_check["secret"] = secret

        k = validate_response(dict_check, settings.SECURITY_KEY_MANA_SAN)
        if k:
            user_filter = user_models.User.objects.filter(link_info=link_info)
            if user_filter.exists():
                user = user_filter.first()
                user.dia_chi_tinh_thanh_pho = dia_chi_tinh_thanh_pho_kd_moi
                user.dia_chi_quan_huyen = dia_chi_quan_huyen_kd_moi
                user.dia_chi_chi_tiet = dia_chi_chi_tiet_kd_moi
                return Response('thanh cong', status=status.HTTP_200_OK)
            else:
                return Response('khong ton tai', status=status.HTTP_200_OK)
        else:
            return Response('khong co quyen truy cap', status=status.HTTP_401_UNAUTHORIZED)


class UserBihamaPlatformAPI(APIView):
    permission_classes = {permissions.AllowAny}

    def post(self, request):
        valid_data = validate_data(user_sers.UpdateInforUserApi, request.data)

        password = valid_data.get("password")
        username = valid_data.get("username")
        email = valid_data.get("email")
        ho_va_ten = valid_data.get("ho_va_ten")
        gender = valid_data.get("gender")
        birth_day = valid_data.get("birth_day")
        birth_month = valid_data.get("birth_month")
        birth_year = valid_data.get("birth_year")
        link_info = valid_data.get("link_info")
        code_invite = valid_data.get("code_invite")
        # 1 là sàn, 2 là y tế, 3 là tài chình
        api_hope = valid_data.get("api_hope")
        secret = valid_data.get("secret")

        dict_check = dict()
        dict_check["password"] = password
        dict_check["username"] = username
        dict_check["email"] = email
        dict_check["ho_va_ten"] = ho_va_ten
        dict_check["gender"] = gender
        dict_check["birth_day"] = birth_day
        dict_check["birth_month"] = birth_month
        dict_check["birth_year"] = birth_year
        dict_check["link_info"] = link_info
        dict_check["code_invite"] = code_invite
        # 1 là sàn, 2 là y tế, 3 là tài chình
        dict_check["api_hope"] = api_hope
        dict_check["secret"] = secret
        if api_hope == 3:
            if validate_response(dict_check, settings.SECURITY_KEY_TAICHINH_SAN):
                if user_models.User.objects.filter(username=username, is_active=True).exists():
                    user = user_models.User.objects.get(username=username)
                    user.password = password
                    user.username = username
                    user.email = email
                    user.ho_va_ten = ho_va_ten
                    user.gender = gender
                    user.birth_day = birth_day
                    user.birth_month = birth_month
                    user.birth_year = birth_year
                    user.link_info = link_info
                    user.code_invite = code_invite
                    user.save()
                    return Response(1, status=status.HTTP_200_OK)

                elif user_models.User.objects.filter(username=username, is_active=False).exists():
                    user = user_models.User.objects.get(username=username)
                    user.password = password
                    user.username = username
                    user.is_active = True
                    user.save()
                    return Response(1, status=status.HTTP_200_OK)
                else:
                    user = user_models.User.objects.create_user(
                        username=username, email=None, password=password, is_active=True)
                    return Response(1, status=status.HTTP_200_OK)
            else:
                return Response(0, status=status.HTTP_401_UNAUTHORIZED)
        elif api_hope == 2:
            if validate_response(dict_check, settings.SECURITY_KEY_YTE_SAN):
                if user_models.User.objects.filter(username=username, is_active=True).exists():
                    user = user_models.User.objects.get(username=username)
                    user.password = password
                    user.email = email
                    user.ho_va_ten = ho_va_ten
                    user.gender = gender
                    user.birth_day = birth_day
                    user.birth_month = birth_month
                    user.birth_year = birth_year
                    user.link_info = link_info
                    user.code_invite = code_invite
                    user.save()
                elif user_models.User.objects.filter(username=username, is_active=False).exists():
                    user = user_models.User.objects.get(username=username)
                    user.password = password
                    user.is_active = True
                    user.save()
                else:
                    user = user_models.User.objects.create_user(
                        username=username, email=None, password=password, is_active=True)
                return Response('thanh cong', status=status.HTTP_200_OK)
            else:
                return Response(0, status=status.HTTP_401_UNAUTHORIZED)
        else:
            return Response(0, status=status.HTTP_401_UNAUTHORIZED)
