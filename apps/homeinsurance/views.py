from django.shortcuts import render
from django.shortcuts import render, redirect
from django.views import View
# from .models import  HomeCustomer, HomePrequote, HomeProducts, ListItem, HomeInsurancesSave, RecommendedProducts, Provincial, District
from rest_framework.views import APIView
from rest_framework import permissions
from rest_framework.renderers import TemplateHTMLRenderer, JSONRenderer
from rest_framework.response import Response
from rest_framework import status
from apps.core.utils import validate_data, convert_price_to_string, check_ma_giam_gia ,loai_hop_dong
from apps.core.models import Provincial,District
from apps.homeinsurance import models as home_models
from apps.homeinsurance import serializers as home_serializers
from apps.homeinsurance import utils as home_utils
from apps.core import models as core_model
from apps.payment import models as payment_model
from django.contrib.auth.mixins import LoginRequiredMixin
import json
from datetime import datetime
from apps.users.models import User
from apps.payment.views import unique_order_id_generator
import numpy as np


class AddSpcApiDataHome(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request, format=None):
        valid_data = validate_data(home_serializers.AddSpcApiDataHomeSer, request.data)

        company = valid_data.get('company')
        ten_loai_hinh_bao_hiem = valid_data.get('ten_loai_hinh_bao_hiem')
        id_loai_hinh_bao_hiem = valid_data.get('id_loai_hinh_bao_hiem')
        ten_goi_san_pham_chinh = valid_data.get('ten_goi_san_pham_chinh')
        id_goi_san_pham_chinh = valid_data.get('id_goi_san_pham_chinh')
        so_phi_chinh = valid_data.get('so_phi_chinh')
        if not core_model.Company.objects.filter(id_ten_cong_ty=company).exists():
            return Response(0, status=status.HTTP_400_BAD_REQUEST)
        else:
            cty=core_model.Company.objects.get(id_ten_cong_ty=company)
            if home_models.GoiSanPhamChinh.objects.filter(company=cty , ten_loai_hinh_bao_hiem=ten_loai_hinh_bao_hiem, 
                                                            id_loai_hinh_bao_hiem=id_loai_hinh_bao_hiem, ten_goi_san_pham_chinh=ten_goi_san_pham_chinh,
                                                            id_goi_san_pham_chinh=id_goi_san_pham_chinh,so_phi_chinh=so_phi_chinh).exists():
                return Response(0, status=status.HTTP_400_BAD_REQUEST)
            else:
                gsp = home_models.GoiSanPhamChinh.objects.create(company=cty,ten_loai_hinh_bao_hiem=ten_loai_hinh_bao_hiem, 
                                                        id_loai_hinh_bao_hiem=id_loai_hinh_bao_hiem,
                                                        ten_goi_san_pham_chinh=ten_goi_san_pham_chinh,
                                                        id_goi_san_pham_chinh=id_goi_san_pham_chinh,so_phi_chinh=so_phi_chinh)
                return Response(1, status=status.HTTP_200_OK)


class AddSppApiDataHome(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request, format=None):
        valid_data = validate_data(home_serializers.AddSppApiDataHomeSer, request.data)
        print(valid_data)
        company = valid_data.get('company')
        ten_loai_hinh_bao_hiem = valid_data.get('ten_loai_hinh_bao_hiem')
        id_loai_hinh_bao_hiem = valid_data.get('id_loai_hinh_bao_hiem')
        ten_goi_san_pham_chinh = valid_data.get('ten_goi_san_pham_chinh')
        id_goi_san_pham_chinh = valid_data.get('id_goi_san_pham_chinh')
        ten_goi_san_pham_phu = valid_data.get('ten_goi_san_pham_phu')
        id_goi_san_pham_phu = valid_data.get('id_goi_san_pham_phu')
        so_phi_phu = valid_data.get('so_phi_phu')
        if not core_model.Company.objects.filter(id_ten_cong_ty=company).exists():
            return Response(0, status=status.HTTP_400_BAD_REQUEST)
        else:
            cty=core_model.Company.objects.get(id_ten_cong_ty=company)
            if home_models.GoiSanPhamPhu.objects.filter(company=cty,ten_loai_hinh_bao_hiem=ten_loai_hinh_bao_hiem,
                                        id_loai_hinh_bao_hiem=id_loai_hinh_bao_hiem,
                                        ten_goi_san_pham_chinh=ten_goi_san_pham_chinh, id_goi_san_pham_chinh=id_goi_san_pham_chinh,
                                        ten_goi_san_pham_phu=ten_goi_san_pham_phu, id_goi_san_pham_phu=id_goi_san_pham_phu,so_phi_phu=so_phi_phu).exists():
                return Response(0, status.HTTP_400_BAD_REQUEST)
            else:
                gsp = home_models.GoiSanPhamPhu.objects.get_or_create(company=cty,ten_loai_hinh_bao_hiem=ten_loai_hinh_bao_hiem, 
                                            id_loai_hinh_bao_hiem=id_loai_hinh_bao_hiem,
                                            ten_goi_san_pham_chinh=ten_goi_san_pham_chinh, id_goi_san_pham_chinh=id_goi_san_pham_chinh,
                                            ten_goi_san_pham_phu=ten_goi_san_pham_phu, id_goi_san_pham_phu=id_goi_san_pham_phu,so_phi_phu=so_phi_phu)
                return Response(1, status=status.HTTP_200_OK)


class InfoHomeinsuranceView(View):
    def get(self, request):
        return render(request, 'product-infor.html')


class HomeInsurance(View):

    def get(self, request):
        list_provincial=Provincial.objects.all().order_by("name")
        context = {
            "list_data": list_provincial
        }
        return render(request, 'homeinsurance/home-insuarance.html',context)
    
    def post(self, request):
        print(request)
        home_type=int(request.POST.get('home_type'))
        muc_dich_home=request.POST.get('muc_dich_home')
        age_home=request.POST.get('age_home')
        home_value=request.POST.get('home_value')
        so_tien_muabh=request.POST.get('so_tien_muabh')
        thanhpho=request.POST.get('thanhpho')
        huyen=request.POST.get('huyen')
        address_detail=request.POST.get('address_detail')
        answer_fire=request.POST.get('answer_fire')
        request.session['home_answer_fire'] = answer_fire
        request.session['home_type'] = int(home_type)
        request.session['muc_dich_home'] = int(muc_dich_home)
        request.session['home_age'] = int(age_home)
        request.session['home_value'] = int(home_value)
        request.session['home_so_tien_muabh'] = int(so_tien_muabh)
        request.session['home_thanhpho'] = int(thanhpho)
        request.session['home_huyen'] = int(huyen)
        request.session['home_address_detail'] = address_detail
        return redirect('homeinsurance:prequote_url_1')


class HomePreQuote1(View):

    def get(self, request):
        return render(request, 'homeinsurance/PreQuote1.html')

    def post(self, request):    
        quyen_so_huu=request.POST.get('quyen_so_huu')
        sex_ngmua=request.POST.get('sex_ngmua')
        full_name_ngmua=request.POST.get('full_name_ngmua')
        email_ngmua=request.POST.get('email_ngmua')
        sdt_ngmua=request.POST.get('sdt_ngmua')
        ngaysinh_ngmua=request.POST.get('ngaysinh_ngmua')
        thangsinh_ngmua=request.POST.get('thangsinh_ngmua')
        namsinh_ngmua=request.POST.get('namsinh_ngmua')

        request.session['quyen_so_huu_home'] = quyen_so_huu
        request.session['sex_ngmua_home'] = sex_ngmua
        request.session['full_name_ngmua_home'] = full_name_ngmua
        request.session['email_ngmua_home'] = email_ngmua
        request.session['sdt_ngmua_home'] = sdt_ngmua
        request.session['ngaysinh_ngmua_home'] = ngaysinh_ngmua
        request.session['thangsinh_ngmua_home'] = thangsinh_ngmua
        request.session['namsinh_ngmua_home'] = namsinh_ngmua

        return redirect('homeinsurance:prequote_url_2')


class HomePreQuote2(View):

    def get(self, request):
        list_provincial=Provincial.objects.all().order_by("name")
        thanhpho=request.session.get('home_thanhpho')
        huyen=request.session.get('home_huyen')
        address_detail=request.session.get('home_address_detail') 
        context = {
            "list_data": list_provincial,
            'thanhpho':thanhpho,
            'huyen':huyen,
            'address_detail':address_detail
        }

        return render(request, 'homeinsurance/PreQuote2.html',context)

    def post(self, request):    
        cmt_ngmua=request.POST.get('cmt_ngmua')
        noicap_cmt_ngmua=request.POST.get('noicap_cmt_ngmua')
        ngaycap_cmt_ngmua=request.POST.get('ngaycap_cmt_ngmua')
        thanhpho=request.POST.get('thanhpho')
        huyen=request.POST.get('huyen')
        address_detail=request.POST.get('address_detail_ngmua')
        request.session['cmt_ngmua_home'] = cmt_ngmua
        # request.session['noicap_cmt_ngmua_home'] = noicap_cmt_ngmua
        # request.session['ngaycap_cmt_ngmua_home'] = ngaycap_cmt_ngmua
        request.session['thanhpho_ngmua_home'] = int(thanhpho)
        request.session['huyen_ngmua_home'] = int(huyen)
        request.session['address_detail_home'] = address_detail

        return redirect('homeinsurance:home-prequote-url')


class HomeQuote(View):

    def get(self, request):
        so_tien_muabh = int(request.session.get('home_so_tien_muabh'))
        home_value = request.session.get('home_value')

        home=home_models.GoiSanPhamChinh.objects.filter(id_loai_hinh_bao_hiem=19,id_goi_san_pham_chinh=1)
        list_item_home = []
        for it in home:
            sub_item = {}
            money=int(home_utils.get_spc_money_home(so_tien_muabh,0,19,it.company.id_ten_cong_ty))
            sub_item['money_real'] = convert_price_to_string(money)
            sub_item['money'] = money
            sub_item['home_so_tien_real'] = convert_price_to_string(so_tien_muabh)
            sub_item['home_so_tien'] = so_tien_muabh
            sub_item['cty'] = it.company.id_ten_cong_ty
            list_item_home.append(sub_item)
        context={"list_data":list_item_home,"home_so_tien":so_tien_muabh,"home_value":convert_price_to_string(home_value),'home_value1':home_value,"money_real":money}
        return render(request, 'homeinsurance/Quotes.html',context)


class HomeProduct(View):
    def get(self, request):
        money_spc_home = request.session.get('money_spc_home')
        id_cty_home = request.session.get('id_cty_home')
        money_VAT=int(money_spc_home*0.1)
        money_has_VAT=int(money_spc_home*1.1)
        context={
            "id_cty_home":id_cty_home,
            "money_spc_home":money_spc_home,
            "money_spc_home_real":convert_price_to_string(money_spc_home),
            "money_VAT":money_VAT,
            "money_VAT_real":convert_price_to_string(money_VAT),
            "money_has_VAT":money_has_VAT,
            "money_has_VAT_real":convert_price_to_string(money_has_VAT),
            }
        return render(request, 'homeinsurance/Product.html',context)


class HomeForm(LoginRequiredMixin,View):
    login_url = '/dang-nhap/'
    def get(self, request):
        list_provincial=Provincial.objects.all().order_by("name")

        home_type = request.session.get('home_type')
        home_age = request.session.get('home_age')
        home_thanhpho = request.session.get('home_thanhpho')
        home_huyen = request.session.get('home_huyen')
        home_address_detail = request.session.get('home_address_detail')

        thanhpho=core_model.Provincial.objects.get(code=home_thanhpho)
        huyen=core_model.District.objects.get(id=home_huyen)

        home_so_tien_muabh = request.session.get('home_so_tien_muabh')
        in_home_value = request.session.get('in_home_value')

        money_spc_home = request.session.get('money_spc_home')
        money_spp_home = request.session.get('money_spp_home')
        money_VAT_home = request.session.get('money_VAT_home')
        money_total_hasVAT_home = request.session.get('money_total_hasVAT_home')

        id_cty_home = request.session.get('id_cty_home')

        if id_cty_home == 3:
            sonamhopdong = 1
        home_type_real=home_utils.get_home_type(home_type)

        tinh_ngmua=request.session.get("thanhpho_ngmua_home")
        huyen_ngmua=request.session.get("huyen_ngmua_home")
        name_ngmua=request.session.get('full_name_ngmua_home')
        email_ngmua=request.session.get("email_ngmua_home")
        phone_ngmua=request.session.get('sdt_ngmua_home')
        adress_detail_ngmua=request.session.get("address_detail_home")
        cmtnd_ngmua=request.session.get("cmt_ngmua_home")
        daybirth_ngmua=request.session.get('ngaysinh_ngmua_home')
        monthbirth_ngmua=request.session.get('thangsinh_ngmua_home')
        yearbirth_ngmua=request.session.get('namsinh_ngmua_home')

        muc_dich_nha=request.session.get("muc_dich_home")
        if muc_dich_nha == 1:
            mucd="Để ở"
        elif muc_dich_nha == 2:
            mucd="Đi thuê"
        elif muc_dich_nha == 3:
            mucd="Cho thuê"
        elif muc_dich_nha == 4:
            mucd="Nhà có yếu tố kinh doanh"
        cty_home=core_model.Company.objects.get(id_ten_cong_ty=id_cty_home)
        context = {
            "list_data": list_provincial,
            "home_type": home_type_real,
            "home_age": home_age,
            "home_thanhpho": thanhpho.name,
            "home_huyen": huyen.name,
            "home_address_detail": home_address_detail,
            "sonamhopdong":sonamhopdong,
            "home_so_tien_muabh": convert_price_to_string(home_so_tien_muabh),
            "in_home_value": convert_price_to_string(in_home_value),
            "money_spc_home": convert_price_to_string(money_spc_home),
            "money_spp_home": convert_price_to_string(money_spp_home),
            "money_VAT_home": convert_price_to_string(money_VAT_home),
            "money_total_hasVAT_home": money_total_hasVAT_home,
            "money_total_hasVAT_home_real": convert_price_to_string(money_total_hasVAT_home),
            "tinh":tinh_ngmua,
            "huyen":huyen_ngmua,
            "name_ngmua":name_ngmua,
            "email_ngmua":email_ngmua,
            "phone_ngmua":phone_ngmua,
            "adress_detail_ngmua":adress_detail_ngmua,
            "mucd":mucd,
            "cmtnd_ngmua":cmtnd_ngmua,
            "daybirth_ngmua":daybirth_ngmua,
            "monthbirth_ngmua":monthbirth_ngmua,
            "yearbirth_ngmua":yearbirth_ngmua,
            "id_cty_home":cty_home.ten_cong_ty

        }
        return render(request, 'homeinsurance/form.html',context)

    def post(self, request):
        name_ng_nhan=request.POST.get('name_ng_nhan')
        email_ng_nhan=request.POST.get('email_ng_nhan')
        phone_ng_nhan=request.POST.get('phone_ng_nhan')
        tinh_ng_nhan=request.POST.get('tinh_ng_nhan')
        huyen_ng_nhan=request.POST.get('huyen_ng_nhan')
        address_ng_nhan=request.POST.get('address_ng_nhan')
        mgg=request.POST.get("mgg")

        # tao ma don hang
        user=User.objects.get(id=request.user.id)
        order_id = unique_order_id_generator(request.user.username)
        # create model ngmua chinh
        name_ngmua=request.session.get('full_name_ngmua_home')
        sex_ngmua=request.session.get('sex_ngmua_home')
        phone_ngmua=request.session.get('sdt_ngmua_home')
        email_ngmua=request.session.get("email_ngmua_home")
        daybirth_ngmua=request.session.get('ngaysinh_ngmua_home')
        monthbirth_ngmua=request.session.get('thangsinh_ngmua_home')
        yearbirth_ngmua=request.session.get('namsinh_ngmua_home')

        cmtnd_ngmua=request.session.get("cmt_ngmua_home")
        tinh_ngmua=request.session.get("thanhpho_ngmua_home")
        huyen_ngmua=request.session.get("huyen_ngmua_home")
        adress_detail_ngmua=request.session.get("address_detail_home")

        nguoimua_home_ngayhieuluc=request.session.get('ngay_hieu_luc_home')
        nguoimua_home_ngayketthuc=request.session.get('ngay_ket_thuc_home')    

        mua_chinh=core_model.NguoiMuaBaoHiem.objects.create(username=phone_ngmua,fullname=name_ngmua,birth_day=daybirth_ngmua,birth_month=monthbirth_ngmua,
                                            birth_year=yearbirth_ngmua, gioi_tinh=sex_ngmua,email=email_ngmua,dia_chi_tinh_thanh_pho=tinh_ngmua,
                                            dia_chi_quan_huyen=huyen_ngmua,dia_chi_chi_tiet=adress_detail_ngmua,so_cmnd=cmtnd_ngmua,
                                            ngay_hieu_luc=nguoimua_home_ngayhieuluc,
                                            ngay_ket_thuc=nguoimua_home_ngayketthuc,ho_ten_nhan=name_ng_nhan,email_nhan=email_ng_nhan,
                                            so_dien_thoai_nhan=phone_ng_nhan,dia_chi_tinh_thanh_pho_nhan=tinh_ng_nhan,
                                            dia_chi_quan_huyen_nhan=huyen_ng_nhan,dia_chi_chi_tiet_nhan=address_ng_nhan)

        home_so_tien_muabh=request.session.get('home_so_tien_muabh')
        loai_nha=request.session.get("home_type")
        muc_dich_nha=request.session.get("muc_dich_home")
        tuoi_tho_ngoi_nha=request.session.get("home_age")
        dia_chi_tinh_thanh_pho=request.session.get("home_thanhpho")
        dia_chi_quan_huyen=request.session.get("home_huyen")
        dia_chi_chi_tiet=request.session.get("home_address_detail")
        gia_tri_can_nha=request.session.get("home_value")
        gia_tri_tai_san_ben_trong=request.session.get("in_home_value")
        relationship= request.session.get("quyen_so_huu_home")

        home_answer_fire= request.session.get("home_answer_fire")

        tk1=home_models.NguoiDuocBaoHiem.objects.create(nguoimuabaohiem=mua_chinh,ma_don_hang_bihama=order_id,loai_nha=loai_nha,
                                                        muc_dich_nha=muc_dich_nha,tuoi_tho_ngoi_nha=tuoi_tho_ngoi_nha,
                                                        dia_chi_tinh_thanh_pho=dia_chi_tinh_thanh_pho,dia_chi_quan_huyen=dia_chi_quan_huyen,
                                                        dia_chi_chi_tiet=dia_chi_chi_tiet,gia_tri_can_nha=gia_tri_can_nha, so_tien_bh=home_so_tien_muabh,
                                                        gia_tri_tai_san_ben_trong=gia_tri_tai_san_ben_trong,ngay_hieu_luc=nguoimua_home_ngayhieuluc,
                                                        ngay_ket_thuc=nguoimua_home_ngayketthuc,relationship=relationship,is_fire=home_answer_fire)    
        home_models.NguoiThuHuong.objects.create(nguoiduocbaohiem=tk1,fullname=name_ngmua,birth_day=daybirth_ngmua,birth_month=monthbirth_ngmua,
                                                        birth_year=yearbirth_ngmua,so_cmnd=cmtnd_ngmua,gioi_tinh=sex_ngmua)
        id_cty_home=request.session.get('id_cty_home')
        if gia_tri_tai_san_ben_trong != 0:
            name_goi_home=2
        else:
            name_goi_home=1
        arr_list_spp_home = request.session.get('arr_list_spp_home')

       
        money_spc_home = request.session.get('money_spc_home')
        money_spp_home = request.session.get('money_spp_home')
        money_VAT_home = request.session.get('money_VAT_home')
        money_total_hasVAT_home = request.session.get('money_total_hasVAT_home')

        if mgg is None or mgg == "":
            code_giam_gia=None
            total_money_hasDiscount=money_total_hasVAT_home
        else:
            code_giam_gia=mgg
            tk= payment_model.MaGiamGia.objects.get(code_ma_giam_gia=code_giam_gia)
            discount=tk.discount
            total_money_hasDiscount=int(money_total_hasVAT_home*(1-discount))


        total_money_final_no_VAT=money_spc_home+money_spp_home
        pay_loai_hop_dong=loai_hop_dong(user,total_money_final_no_VAT,19)          #19 - BH sức nhà tư nhân
        request.session['id_ngmua_chinh']=mua_chinh.id
        request.session['ma_don_hang_bihama'] = order_id
        request.session['pay_so_dien_thoai'] = request.user.username
        request.session['pay_cong_ty'] = id_cty_home                               #cty Opes
        request.session['pay_loai_hinh_bao_hiem'] = 19                           #19 - BH sức nhà tư nhân
        request.session['pay_goi_san_pham'] = name_goi_home
        request.session['pay_goi_san_pham_phu'] = arr_list_spp_home
        request.session['pay_so_phi_chinh'] = money_spc_home
        request.session['pay_so_phi_phu'] = money_spp_home
        request.session['pay_so_phi_VAT'] = money_VAT_home
        request.session['pay_tong_phi_thanh_toan_has_VAT'] = money_total_hasVAT_home
        request.session['pay_loai_hop_dong'] = pay_loai_hop_dong
        request.session['pay_ma_giam_gia'] = code_giam_gia
        request.session['pay_tong_phi_thanh_toan_sau_giam_gia'] = total_money_hasDiscount
        return redirect('payment')


class APIChangeHomeValue(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request):
        valid_data = validate_data(home_serializers.APIChangeHomeValueSer, request.data)
        so_tien_muabh=int(valid_data.get('so_tien_muabh'))
        in_home_value=int(valid_data.get('in_home_value'))

        home=home_models.GoiSanPhamChinh.objects.filter(id_loai_hinh_bao_hiem=19,id_goi_san_pham_chinh=1)
        list_item_home = []
        for it in home:
            sub_item = {}
            money=int(home_utils.get_spc_money_home(so_tien_muabh,in_home_value,19,it.company.id_ten_cong_ty))
            sub_item['money_real'] = convert_price_to_string(money)
            sub_item['money'] = money
            sub_item['home_so_tien_real'] = convert_price_to_string(so_tien_muabh)
            sub_item['home_so_tien'] = so_tien_muabh
            sub_item['in_home_value_real'] = convert_price_to_string(in_home_value)
            sub_item['in_home_value'] = in_home_value
            sub_item['cty'] = it.company.id_ten_cong_ty
            list_item_home.append(sub_item)
        data={"list_data":list_item_home}
        return Response(data=data, status=status.HTTP_200_OK)


class APIChangeListSpp(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request):
        valid_data = validate_data(home_serializers.APIChangeListSppSer, request.data)
        id_cty_home=valid_data.get('id_cty_home')
        arr_list_spp=json.loads(valid_data.get('arr_list_spp'))
        in_home_value=request.session.get('in_home_value')
        home_so_tien_muabh=request.session.get('home_so_tien_muabh')
        money_spc_home=request.session.get('money_spc_home')
        money_spp_home=home_utils.get_spp_money_home(home_so_tien_muabh,in_home_value,19,id_cty_home,arr_list_spp)
        money_VAT = int((money_spc_home+money_spp_home)*0.1)
        money_has_VAT = int((money_spc_home+money_spp_home)*1.1)
        data={
            "money_spc_home":money_spc_home,
            "money_spc_home_real":convert_price_to_string(money_spc_home),
            "money_spp_home":money_spp_home,
            "money_spp_home_real":convert_price_to_string(money_spp_home),
            "money_VAT":money_VAT,
            "money_VAT_real":convert_price_to_string(money_VAT),
            "money_has_VAT":money_has_VAT,
            "money_has_VAT_real":convert_price_to_string(money_has_VAT),
        }
        return Response(data=data, status=status.HTTP_200_OK)


class ApiPushSpcHome(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request):
        valid_data = validate_data(home_serializers.ApiPushSpcHomeSer, request.data)

        id_cty_home=valid_data.get('id_cty_home')
        inpi_ngay_hieu_luc=valid_data.get('inpi_ngay_hieu_luc')
        inpi_ngay_ket_thuc=valid_data.get('inpi_ngay_ket_thuc')
        so_tien_muabh=valid_data.get('so_tien_muabh')
        in_home_value=valid_data.get('in_home_value')

        money=int(home_utils.get_spc_money_home(so_tien_muabh,in_home_value,19,id_cty_home))

        ngay_hieu_luc_hd= datetime.strptime(inpi_ngay_hieu_luc, "%d-%m-%Y").strftime("%Y-%m-%d")
        ngay_ket_thuc_hd= datetime.strptime(inpi_ngay_ket_thuc, "%d-%m-%Y").strftime("%Y-%m-%d")

        request.session['id_cty_home'] = int(id_cty_home)
        request.session['money_spc_home'] = int(money)
        request.session['ngay_hieu_luc_home'] = ngay_hieu_luc_hd
        request.session['ngay_ket_thuc_home'] = ngay_ket_thuc_hd
        request.session['home_so_tien_muabh'] = int(so_tien_muabh)
        request.session['in_home_value'] = int(in_home_value)
        return Response(1, status=status.HTTP_200_OK)


class APIPushSppMoneyHome(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request):
        valid_data = validate_data(home_serializers.APIPushSppMoneyHomeSer, request.data)

        arr_list_spp=json.loads(valid_data.get('arr_list_spp'))

        id_cty_home=request.session.get('id_cty_home')
        in_home_value=request.session.get('in_home_value')
        home_so_tien_muabh=request.session.get('home_so_tien_muabh')
        money_spc_home=request.session.get('money_spc_home')

        money_spp_home_real=home_utils.get_spp_money_home(home_so_tien_muabh,in_home_value,19,id_cty_home,arr_list_spp)

        money_VAT_real = int((money_spc_home+money_spp_home_real)*0.1)
        money_has_VAT_real = int((money_spc_home+money_spp_home_real)*1.1)

        rounding=1 if (money_has_VAT_real%1000)>0 else 0
        money=int(1000*(int(money_has_VAT_real/1000)+rounding))

        request.session['money_spp_home'] = int(money_spp_home_real)
        request.session['money_VAT_home'] = int(money_VAT_real)
        request.session['money_total_hasVAT_home'] = money
        request.session['arr_list_spp_home'] = arr_list_spp

        #ng mua tam
        name_ngmua=request.session.get('full_name_ngmua_home')
        sex_ngmua=request.session.get('sex_ngmua_home')
        phone_ngmua=request.session.get('sdt_ngmua_home')
        email_ngmua=request.session.get("email_ngmua_home")
        daybirth_ngmua=request.session.get('ngaysinh_ngmua_home')
        monthbirth_ngmua=request.session.get('thangsinh_ngmua_home')
        yearbirth_ngmua=request.session.get('namsinh_ngmua_home')

        cmtnd_ngmua=request.session.get("cmt_ngmua_home")
        tinh_ngmua=request.session.get("thanhpho_ngmua_home")
        huyen_ngmua=request.session.get("huyen_ngmua_home")
        adress_detail_ngmua=request.session.get("address_detail_home")

        nguoimua_home_ngayhieuluc=request.session.get('ngay_hieu_luc_home')
        nguoimua_home_ngayketthuc=request.session.get('ngay_ket_thuc_home')    

        tk=core_model.NguoiMuaBaoHiemTam.objects.create(username=phone_ngmua,fullname=name_ngmua,birth_day=daybirth_ngmua,birth_month=monthbirth_ngmua,
                                            birth_year=yearbirth_ngmua, gioi_tinh=sex_ngmua,email=email_ngmua,dia_chi_tinh_thanh_pho=tinh_ngmua,
                                            dia_chi_quan_huyen=huyen_ngmua,dia_chi_chi_tiet=adress_detail_ngmua,so_cmnd=cmtnd_ngmua
                                            ,ngay_hieu_luc=nguoimua_home_ngayhieuluc,
                                            ngay_ket_thuc=nguoimua_home_ngayketthuc)

        loai_nha=request.session.get("home_type")
        muc_dich_nha=request.session.get("muc_dich_home")
        tuoi_tho_ngoi_nha=request.session.get("home_age")
        dia_chi_tinh_thanh_pho=request.session.get("home_thanhpho")
        dia_chi_quan_huyen=request.session.get("home_huyen")
        dia_chi_chi_tiet=request.session.get("home_address_detail")
        gia_tri_can_nha=request.session.get("home_value")
        gia_tri_tai_san_ben_trong=request.session.get("in_home_value")
        relationship= request.session.get("quyen_so_huu_home")
        home_answer_fire= request.session.get("home_answer_fire")

        tk1=home_models.NguoiDuocBaoHiemTam.objects.create(nguoimuabaohiemtam=tk,loai_nha=loai_nha,muc_dich_nha=muc_dich_nha,
                                                            tuoi_tho_ngoi_nha=tuoi_tho_ngoi_nha,
                                                            dia_chi_tinh_thanh_pho=dia_chi_tinh_thanh_pho,dia_chi_quan_huyen=dia_chi_quan_huyen,
                                                            dia_chi_chi_tiet=dia_chi_chi_tiet,gia_tri_can_nha=gia_tri_can_nha, 
                                                            gia_tri_tai_san_ben_trong=gia_tri_tai_san_ben_trong,ngay_hieu_luc=nguoimua_home_ngayhieuluc,
                                                            ngay_ket_thuc=nguoimua_home_ngayketthuc,so_tien_bh=home_so_tien_muabh,relationship=relationship,
                                                            is_fire=home_answer_fire)
        return Response(1, status=status.HTTP_200_OK)
    
