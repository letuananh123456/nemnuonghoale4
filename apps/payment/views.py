import urllib.request
import urllib.parse
from datetime import datetime
from django.views import View
from rest_framework.views import APIView
from django.core.serializers import json
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.shortcuts import render, redirect, get_object_or_404
from .models import DonDatHang
from .forms import PaymentForm
from .vnpay import vnpay
from django.conf import settings
import random
import string
from django.contrib.auth.decorators import login_required
from apps.core.utils import convert_price_to_string, validate_response, validate_data
# from apps.payment.tasks import api_order_home_success
from apps.users.models import User
from apps.core.models import NguoiMuaBaoHiem
from apps.payment.utils import send_mana_by_loaihinh
from apps.payment.models import MaGiamGia
from .serializers import UpdateTinhTrangMaGiamGiaSer
from rest_framework.response import Response
from rest_framework import status
from rest_framework import permissions


def random_string_generator(size=10, chars=string.ascii_lowercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))


def unique_order_id_generator(instance):
    order_new_id= random_string_generator()

    Klass= instance.__class__

    qs_exists= DonDatHang.objects.filter(ma_don_hang_bihama=order_new_id).exists()
    if qs_exists:
        return unique_order_id_generator(instance)
    return order_new_id


def index(request):
    return render(request, "payment/index.html", {"title": "Danh sách demo"})


@login_required(login_url='/dang-nhap/')
def payment(request):
    if request.method == 'POST':
        # Process input data and build url payment
        form = PaymentForm(request.POST)
        if form.is_valid():
            if form.cleaned_data['type_payment'] == "2":
                # print ()
                # order_type = form.cleaned_data['order_type']
                # order_id = form.cleaned_data['order_id']
                ipaddr = get_client_ip(request)

                order_id = request.session.get('ma_don_hang_bihama', 0)
                if order_id == 0:
                    return redirect('index_page')

                # amount = form.cleaned_data['amount']
                order_desc = 'Thanh toan hoa don: '+ str(datetime.now()) +'--'+ str(request.user.id)
                # print(order_id)
                bank_code = ""
                # language = form.cleaned_data['language']
                sodienthoai_pay = str(request.session.get('pay_so_dien_thoai', 0))
                loai_hinh_bao_hiem = int(request.session.get('pay_loai_hinh_bao_hiem', 0))
                cong_ty = int(request.session.get('pay_cong_ty', 0))
                goi_san_pham = int(request.session.get('pay_goi_san_pham', 0))
                goi_san_pham_phu = request.session.get('pay_goi_san_pham_phu', 0)
                so_phi_chinh = int(request.session.get('pay_so_phi_chinh', 0))
                so_phi_phu = int(request.session.get('pay_so_phi_phu', 0))
                so_phi_VAT = int(request.session.get('pay_so_phi_VAT', 0))
                tong_phi_thanh_toan = int(request.session.get('pay_tong_phi_thanh_toan_has_VAT', 0))
                amount = int(request.session.get('pay_tong_phi_thanh_toan_sau_giam_gia', 0))
                loai_hop_dong = int(request.session.get('pay_loai_hop_dong', 0))
                loai_thanh_toan = 3
                magiamgia = request.session.get('pay_ma_giam_gia', 0)
                user=User.objects.get(id=request.user.id)
                tk_ngmua=int(request.session.get('id_ngmua_chinh', 0))
                ng_mua_chinh=NguoiMuaBaoHiem.objects.get(id=tk_ngmua)


                if amount == 0:
                    return redirect('index_page')
                if sodienthoai_pay == '0':
                    return redirect('index_page')
                if not sodienthoai_pay.isdigit():
                    return redirect('index_page')
                # Build URL Payment
                # vnp = vnpay()
                # vnp.requestData['vnp_Version'] = '2.0.0'
                # vnp.requestData['vnp_Command'] = 'pay'
                # vnp.requestData['vnp_TmnCode'] = settings.VNPAY_TMN_CODE
                # vnp.requestData['vnp_Amount'] = amount * 100
                # vnp.requestData['vnp_CurrCode'] = 'VND'
                # vnp.requestData['vnp_TxnRef'] = order_id
                # vnp.requestData['vnp_OrderInfo'] = order_desc
                # vnp.requestData['vnp_OrderType'] = 250000

                paym = DonDatHang.objects.create(ma_don_hang_bihama=order_id, loai_hinh_bao_hiem=loai_hinh_bao_hiem, cong_ty=cong_ty, 
                                                goi_san_pham_chinh=goi_san_pham, goi_san_pham_phu=goi_san_pham_phu, so_phi_chinh=so_phi_chinh, tong_so_phi_phu=so_phi_phu,
                                                so_phi_VAT=so_phi_VAT, tong_phi_thanh_toan=tong_phi_thanh_toan, tong_phi_thanh_toan_sau_giam_gia=amount,
                                                loai_hop_dong=loai_hop_dong, code_ma_giam_gia=magiamgia, user=user, nguoimuabaohiem=ng_mua_chinh, 
                                                loai_thanh_toan=loai_thanh_toan)
                if magiamgia != None:
                    tk_ma_giam_gia = MaGiamGia.objects.get(code_ma_giam_gia=magiamgia)
                    tk_ma_giam_gia.is_su_dung = tk_ma_giam_gia.is_su_dung - 1 
                    tk_ma_giam_gia.save()               
                # Check language, default: vn
                # if language and language != '':
                #     vnp.requestData['vnp_Locale'] = language
                # else:
                #send mana
                send_mana_by_loaihinh(paym.id,paym.loai_hinh_bao_hiem)
                # vnp.requestData['vnp_Locale'] = 'vn'
                #     # Check bank_code, if bank_code is empty, customer will be selected bank on VNPAY
                # if bank_code and bank_code != "":
                #     vnp.requestData['vnp_BankCode'] = bank_code

                # vnp.requestData['vnp_CreateDate'] = datetime.now().strftime('%Y%m%d%H%M%S')  # 20150410063022
                # vnp.requestData['vnp_IpAddr'] = ipaddr
                # vnp.requestData['vnp_ReturnUrl'] = settings.VNPAY_RETURN_URL
                # vnpay_payment_url = vnp.get_payment_url(settings.VNPAY_PAYMENT_URL, settings.VNPAY_HASH_SECRET_KEY)
                # # print(vnpay_payment_url)
                # if request.is_ajax():
                #     # Show VNPAY Popup
                #     result = JsonResponse({'code': '00', 'Message': 'Init Success', 'data': vnpay_payment_url})
                #     return result
                # else:
                #     # Redirect to VNPAY
                #     return redirect(vnpay_payment_url)
            elif form.cleaned_data['type_payment'] == "1":
                loai_thanh_toan = 1
                order_id = request.session.get('ma_don_hang_bihama', 0)
                sodienthoai_pay = str(request.session.get('pay_so_dien_thoai', 0))
                loai_hinh_bao_hiem = int(request.session.get('pay_loai_hinh_bao_hiem', 0))
                cong_ty = int(request.session.get('pay_cong_ty', 0))
                goi_san_pham = int(request.session.get('pay_goi_san_pham', 0))
                goi_san_pham_phu = request.session.get('pay_goi_san_pham_phu', 0)
                so_phi_chinh = int(request.session.get('pay_so_phi_chinh', 0))
                so_phi_phu = int(request.session.get('pay_so_phi_phu', 0))
                so_phi_VAT = int(request.session.get('pay_so_phi_VAT', 0))
                tong_phi_thanh_toan = int(request.session.get('pay_tong_phi_thanh_toan_has_VAT', 0))
                amount = int(request.session.get('pay_tong_phi_thanh_toan_sau_giam_gia', 0))
                loai_hop_dong = int(request.session.get('pay_loai_hop_dong', 0))
                magiamgia = request.session.get('pay_ma_giam_gia', 0)
                user=User.objects.get(id=request.user.id)
                tk_ngmua=int(request.session.get('id_ngmua_chinh', 0))
                ng_mua_chinh=NguoiMuaBaoHiem.objects.get(id=tk_ngmua)

                paym = DonDatHang.objects.create(ma_don_hang_bihama=order_id, loai_hinh_bao_hiem=loai_hinh_bao_hiem, cong_ty=cong_ty, 
                                                goi_san_pham_chinh=goi_san_pham, goi_san_pham_phu=goi_san_pham_phu, so_phi_chinh=so_phi_chinh, tong_so_phi_phu=so_phi_phu,
                                                so_phi_VAT=so_phi_VAT, tong_phi_thanh_toan=tong_phi_thanh_toan, tong_phi_thanh_toan_sau_giam_gia=amount,
                                                loai_hop_dong=loai_hop_dong, code_ma_giam_gia=magiamgia, user=user, nguoimuabaohiem=ng_mua_chinh, 
                                                loai_thanh_toan=loai_thanh_toan)

                if magiamgia != None :
                    tk_ma_giam_gia = MaGiamGia.objects.get(code_ma_giam_gia=magiamgia)
                    tk_ma_giam_gia.is_su_dung = tk_ma_giam_gia.is_su_dung - 1 
                    tk_ma_giam_gia.save()
                #send mana
                send_mana_by_loaihinh(paym.id,paym.loai_hinh_bao_hiem)
                return render(request, "payment/return_cod.html")
            elif form.cleaned_data['type_payment'] == "3":
                loai_thanh_toan = 3
                order_id = request.session.get('ma_don_hang_bihama', 0)
                sodienthoai_pay = str(request.session.get('pay_so_dien_thoai', 0))
                loai_hinh_bao_hiem = int(request.session.get('pay_loai_hinh_bao_hiem', 0))
                cong_ty = int(request.session.get('pay_cong_ty', 0))
                goi_san_pham = int(request.session.get('pay_goi_san_pham', 0))
                goi_san_pham_phu = request.session.get('pay_goi_san_pham_phu', 0)
                so_phi_chinh = int(request.session.get('pay_so_phi_chinh', 0))
                so_phi_phu = int(request.session.get('pay_so_phi_phu', 0))
                so_phi_VAT = int(request.session.get('pay_so_phi_VAT', 0))
                tong_phi_thanh_toan = int(request.session.get('pay_tong_phi_thanh_toan_has_VAT', 0))
                amount = int(request.session.get('pay_tong_phi_thanh_toan_sau_giam_gia', 0))
                loai_hop_dong = int(request.session.get('pay_loai_hop_dong', 0))
                magiamgia = request.session.get('pay_ma_giam_gia', 0)
                user=User.objects.get(id=request.user.id)
                tk_ngmua=int(request.session.get('id_ngmua_chinh', 0))
                ng_mua_chinh=NguoiMuaBaoHiem.objects.get(id=tk_ngmua)

                paym = DonDatHang.objects.create(ma_don_hang_bihama=order_id, loai_hinh_bao_hiem=loai_hinh_bao_hiem, cong_ty=cong_ty, 
                                                goi_san_pham_chinh=goi_san_pham, goi_san_pham_phu=goi_san_pham_phu, so_phi_chinh=so_phi_chinh, tong_so_phi_phu=so_phi_phu,
                                                so_phi_VAT=so_phi_VAT, tong_phi_thanh_toan=tong_phi_thanh_toan, tong_phi_thanh_toan_sau_giam_gia=amount,
                                                loai_hop_dong=loai_hop_dong, code_ma_giam_gia=magiamgia, user=user, nguoimuabaohiem=ng_mua_chinh, 
                                                loai_thanh_toan=loai_thanh_toan)

                if magiamgia != None :
                    tk_ma_giam_gia = MaGiamGia.objects.get(code_ma_giam_gia=magiamgia)
                    tk_ma_giam_gia.is_su_dung = tk_ma_giam_gia.is_su_dung - 1 
                    tk_ma_giam_gia.save()
                #send mana
                send_mana_by_loaihinh(paym.id,paym.loai_hinh_bao_hiem)
                return redirect('payment:chuyen_khoan')

        else:
            print("Form input not validate")
    else:
        tien = int(request.session.get('pay_tong_phi_thanh_toan_sau_giam_gia', 0))
        order_id = request.session.get('ma_don_hang_bihama', 0)
        sodienthoai_pay = str(request.session.get('pay_so_dien_thoai', 0))
        if tien == 0:
            return redirect('index_page')
        context = {
            "tien": convert_price_to_string(tien),
            "order_id":order_id,
            "sodienthoai_pay":sodienthoai_pay
        }
        return render(request, "payment/type_payment.html", context)


def payment_ipn(request):
    inputData = request.GET
    if inputData:
        vnp = vnpay()
        vnp.responseData = inputData.dict()
        order_id = inputData['vnp_TxnRef']
        amount = int(inputData['vnp_Amount'])
        order_desc = inputData['vnp_OrderInfo']
        vnp_TransactionNo = inputData['vnp_TransactionNo']
        vnp_ResponseCode = inputData['vnp_ResponseCode']
        vnp_TmnCode = inputData['vnp_TmnCode']
        vnp_PayDate = inputData['vnp_PayDate']
        vnp_BankCode = inputData['vnp_BankCode']
        vnp_CardType = inputData['vnp_CardType']
        if vnp.validate_response(settings.VNPAY_HASH_SECRET_KEY):
            # Check & Update Order Status in your Database
            # Your code here
            try:
                paym = DonDatHang.objects.get( ma_don_hang_bihama=order_id)
                paym.ma_giao_dich_cong_thanh_toan = vnp_TransactionNo
                # paym.tinh_trang_thanh_toan_cong_thanh_toan = 0 
                paym.is_da_gui_cong_thanh_toan=True
                paym.save()
                if (amount/100) != paym.tong_phi_thanh_toan_sau_giam_gia:
                    result = JsonResponse({'RspCode': '04', 'Message': 'Invalid Amount'})
                else:
                    if paym.tinh_trang_thanh_toan_cong_thanh_toan == 0:
                        if vnp_ResponseCode == '00':
                            print('Payment Success. Your code implement here')
                            paym.tinh_trang_thanh_toan_cong_thanh_toan = 1   # THANH CONG
                            paym.save()
                            #send mana
                            send_mana_by_loaihinh(paym.id,paym.loai_hinh_bao_hiem)
                        else:
                            paym.tinh_trang_thanh_toan_cong_thanh_toan = 2   # THAT BAI / LOI
                            paym.save()
                            #send mama
                            send_mana_by_loaihinh(paym.id,paym.loai_hinh_bao_hiem)
                        result = JsonResponse({'RspCode': '00', 'Message': 'Confirm Success'})                    
                    # Return VNPAY: Merchant update success
                    else:
                        # Already Update
                        result = JsonResponse({'RspCode': '02', 'Message': 'Order Already Update'})
            except:
                result = JsonResponse({'RspCode': '01', 'Message': 'Order not found'})
            

        else:
            # Invalid Signature
            result = JsonResponse({'RspCode': '97', 'Message': 'Invalid Signature'})
    else:
        result = JsonResponse({'RspCode': '99', 'Message': 'Invalid request'})

    return result


def payment_return(request):
    inputData = request.GET
    if inputData:
        vnp = vnpay()
        vnp.responseData = inputData.dict()
        order_id = inputData['vnp_TxnRef']
        amount = int(inputData['vnp_Amount']) / 100
        order_desc = inputData['vnp_OrderInfo']
        vnp_TransactionNo = inputData['vnp_TransactionNo']
        vnp_ResponseCode = inputData['vnp_ResponseCode']
        vnp_TmnCode = inputData['vnp_TmnCode']
        vnp_PayDate = inputData['vnp_PayDate']
        vnp_BankCode = inputData['vnp_BankCode']
        vnp_CardType = inputData['vnp_CardType']
        if vnp.validate_response(settings.VNPAY_HASH_SECRET_KEY):
            try:
                paym = DonDatHang.objects.get( ma_don_hang_bihama=order_id)
                if amount != paym.tong_phi_thanh_toan_sau_giam_gia:
                    return render(request, "payment/payment_return.html", {"title": "Kết quả thanh toán",
                                                                "result": "Thất bại", "order_id": order_id,
                                                                "amount": "Số tiền thanh toán không hợp lệ",
                                                                "order_desc": order_desc,
                                                                "vnp_TransactionNo": vnp_TransactionNo,
                                                                "vnp_ResponseCode": vnp_ResponseCode})
                else:
                    if vnp_ResponseCode == "00":
                        return render(request, "payment/payment_return.html", {"title": "Kết quả thanh toán",
                                                                    "result": "Thành công", "order_id": order_id,
                                                                    "amount": amount,
                                                                    "order_desc": order_desc,
                                                                    "vnp_TransactionNo": vnp_TransactionNo,
                                                                    "vnp_ResponseCode": vnp_ResponseCode})
                    else:
                        return render(request, "payment/payment_return.html", {"title": "Kết quả thanh toán",
                                                                    "result": "Lỗi", "order_id": order_id,
                                                                    "amount": amount,
                                                                    "order_desc": order_desc,
                                                                    "vnp_TransactionNo": vnp_TransactionNo,
                                                                    "vnp_ResponseCode": vnp_ResponseCode})
            except:
                return render(request, "payment/payment_return.html", {"title": "Kết quả thanh toán",
                                                                "result": "Thất bại", "order_id": "Mã đơn hàng không tồn tại",
                                                                "amount": amount,
                                                                "order_desc": order_desc,
                                                                "vnp_TransactionNo": vnp_TransactionNo,
                                                                "vnp_ResponseCode": "Thất bại"})
        else:
            return render(request, "payment/payment_return.html",
                          {"title": "Kết quả thanh toán", "result": "Lỗi", "order_id": order_id, "amount": amount,
                           "order_desc": order_desc, "vnp_TransactionNo": vnp_TransactionNo,
                           "vnp_ResponseCode": vnp_ResponseCode, "msg": "Sai checksum"})
    else:
        return render(request, "payment/payment_return.html", {"title": "Kết quả thanh toán", "result": ""})


def query(request):
    if request.method == 'GET':
        return render(request, "payment/query.html", {"title": "Kiểm tra kết quả giao dịch"})
    else:
        # Add paramter
        vnp = vnpay()
        vnp.requestData = {}
        vnp.requestData['vnp_Command'] = 'querydr'
        vnp.requestData['vnp_Version'] = '2.0.0'
        vnp.requestData['vnp_TmnCode'] = settings.VNPAY_TMN_CODE
        vnp.requestData['vnp_TxnRef'] = request.POST['order_id']
        vnp.requestData['vnp_OrderInfo'] = 'Kiem tra ket qua GD OrderId:' + request.POST['order_id']
        vnp.requestData['vnp_TransDate'] = request.POST['trans_date']  # 20150410063022
        vnp.requestData['vnp_CreateDate'] = datetime.now().strftime('%Y%m%d%H%M%S')  # 20150410063022
        vnp.requestData['vnp_IpAddr'] = get_client_ip(request)
        requestUrl = vnp.get_payment_url(settings.VNPAY_API_URL, settings.VNPAY_HASH_SECRET_KEY)
        responseData = urllib.request.urlopen(requestUrl).read().decode()
        print('RequestURL:' + requestUrl)
        print('VNPAY Response:' + responseData)
        data = responseData.split('&')
        for x in data:
            tmp = x.split('=')
            if len(tmp) == 2:
                vnp.responseData[tmp[0]] = urllib.parse.unquote(tmp[1]).replace('+', ' ')

        print('Validate data from VNPAY:' + str(vnp.validate_response(settings.VNPAY_HASH_SECRET_KEY)))
        return render(request, "payment/query.html", {"title": "Kiểm tra kết quả giao dịch", "data": vnp.responseData})


def refund(request):
    return render(request, "payment/refund.html", {"title": "Gửi yêu cầu hoàn tiền"})


def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip


class UpdateTinhTrangMaGiamGia(APIView):
    permission_classes = {permissions.AllowAny}

    def post(self, request):
        validate = validate_data(UpdateTinhTrangMaGiamGiaSer, request.data)
        code_ma_giam_gia = validate.get("code_ma_giam_gia")
        tinhtrang = validate.get("tinhtrang")
        secret = validate.get("secret")

        data_check = dict()

        data_check["code_ma_giam_gia"] = code_ma_giam_gia
        data_check["tinhtrang"] = tinhtrang
        data_check["secret"] = secret

        if validate_response(data_check, settings.SECURITY_KEY_CTV_MANA):
            if MaGiamGia.objects.filter(code_ma_giam_gia=code_ma_giam_gia).exists():
                mgg = MaGiamGia.objects.get(code_ma_giam_gia=code_ma_giam_gia)
                mgg.tinh_trang = tinhtrang
                mgg.save()
                return Response("status : done", status.HTTP_200_OK)
            else:
                return Response("status : fail", status.HTTP_400_BAD_REQUEST)
        else:
            return Response("status : fail", status.HTTP_401_UNAUTHORIZED)


class ChuyenKhoan(View):
    def get(self, request):
        order_id = request.session.get('ma_don_hang_bihama', 0)
        amount = int(request.session.get('pay_tong_phi_thanh_toan_sau_giam_gia', 0))
        context={'order_id':order_id, 'amount':convert_price_to_string(amount)}
        return render(request, "payment/chuyenkhoan.html",context)
