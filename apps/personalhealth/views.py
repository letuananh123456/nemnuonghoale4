from django.shortcuts import render, redirect
from django.views import View
from . import serializers as personserializers
import json
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import permissions
from rest_framework import status
from apps.core.utils import validate_data, validate_response, get_request_hash_data 
from rest_framework.renderers import TemplateHTMLRenderer, JSONRenderer
from . import models as person_models
from apps.core.utils import convert_price_to_string,loai_hop_dong,check_ma_giam_gia, convert_sex
from .utils import get_total_money_personhealth, get_price_spp_personhealth,convert_spp,relative_ngmua,get_data_dict_personalhealth
from apps.core.models import Provincial,NguoiMuaBaoHiemTam,NguoiMuaBaoHiem,Company
from apps.payment.models import MaGiamGia,DonDatHang
from apps.users.models import User
import datetime
from django.contrib.auth.mixins import LoginRequiredMixin
from apps.payment.views import unique_order_id_generator
from django.conf import settings
from apps.article.models import GioiThieuLoaiHinhBH
from datetime import datetime


# from .tasks import send_manage_personal_hel, update_banghi_fail


# Create your views here.
class GoiSanPhamChinhAPIView(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request, format=None):
        valid_data = validate_data(personserializers.APIGoiSanPhamChinh, request.data)
        company=valid_data.get('company')
        ten_loai_hinh_bao_hiem = valid_data.get('ten_loai_hinh_bao_hiem')
        id_loai_hinh_bao_hiem = valid_data.get('id_loai_hinh_bao_hiem')
        gioi_tinh = valid_data.get('gioi_tinh')
        tuoi = valid_data.get('tuoi')
        ten_goi_san_pham_chinh = valid_data.get('ten_goi_san_pham_chinh')
        id_goi_san_pham_chinh = valid_data.get('id_goi_san_pham_chinh')
        so_phi_chinh = valid_data.get('so_phi_chinh')
        if not Company.objects.filter(id_ten_cong_ty=company).exists():
                return Response(0, status=status.HTTP_400_BAD_REQUEST)
        else:
            cty=Company.objects.get(id_ten_cong_ty=company)
            if person_models.GoiSanPhamChinh.objects.filter(company=cty,ten_loai_hinh_bao_hiem=ten_loai_hinh_bao_hiem, id_loai_hinh_bao_hiem=id_loai_hinh_bao_hiem,
                                        gioi_tinh=gioi_tinh,tuoi=tuoi,ten_goi_san_pham_chinh=ten_goi_san_pham_chinh,id_goi_san_pham_chinh=id_goi_san_pham_chinh,so_phi_chinh=so_phi_chinh).exists():
                return Response(1, status=status.HTTP_400_BAD_REQUEST)
            else:
                
                gsp = person_models.GoiSanPhamChinh.objects.create(company=cty,ten_loai_hinh_bao_hiem=ten_loai_hinh_bao_hiem, id_loai_hinh_bao_hiem=id_loai_hinh_bao_hiem,
                                            gioi_tinh=gioi_tinh,tuoi=tuoi,ten_goi_san_pham_chinh=ten_goi_san_pham_chinh,id_goi_san_pham_chinh=id_goi_san_pham_chinh,so_phi_chinh=so_phi_chinh)
                return Response(1, status=status.HTTP_200_OK)


class GoiSanPhamPhuAPIView(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request, format=None):
        valid_data = validate_data(personserializers.APIGoiSanPhamPhu, request.data)

        company=valid_data.get('company')
        ten_loai_hinh_bao_hiem = valid_data.get('ten_loai_hinh_bao_hiem')
        id_loai_hinh_bao_hiem = valid_data.get('id_loai_hinh_bao_hiem')
        gioi_tinh = valid_data.get('gioi_tinh')
        tuoi = valid_data.get('tuoi')
        ten_goi_san_pham_chinh = valid_data.get('ten_goi_san_pham_chinh')
        id_goi_san_pham_chinh = valid_data.get('id_goi_san_pham_chinh')
        ten_goi_san_pham_phu = valid_data.get('ten_goi_san_pham_phu')
        id_goi_san_pham_phu = valid_data.get('id_goi_san_pham_phu')
        so_phi_phu = valid_data.get('so_phi_phu')
        if not Company.objects.filter(id_ten_cong_ty=company).exists():
                return Response(0, status=status.HTTP_400_BAD_REQUEST)
        else:
            cty=Company.objects.get(id_ten_cong_ty=company)
            if  person_models.GoiSanPhamPhu.objects.filter(company=cty,ten_loai_hinh_bao_hiem=ten_loai_hinh_bao_hiem, id_loai_hinh_bao_hiem=id_loai_hinh_bao_hiem,
                                    gioi_tinh=gioi_tinh,tuoi=tuoi,ten_goi_san_pham_chinh=ten_goi_san_pham_chinh,id_goi_san_pham_chinh=id_goi_san_pham_chinh,ten_goi_san_pham_phu=ten_goi_san_pham_phu,id_goi_san_pham_phu=id_goi_san_pham_phu,so_phi_phu=so_phi_phu).exists():
                return Response(1, status=status.HTTP_400_BAD_REQUEST)
            else:
                gsp = person_models.GoiSanPhamPhu.objects.get_or_create(company=cty,ten_loai_hinh_bao_hiem=ten_loai_hinh_bao_hiem, id_loai_hinh_bao_hiem=id_loai_hinh_bao_hiem,
                                        gioi_tinh=gioi_tinh,tuoi=tuoi,ten_goi_san_pham_chinh=ten_goi_san_pham_chinh,id_goi_san_pham_chinh=id_goi_san_pham_chinh,ten_goi_san_pham_phu=ten_goi_san_pham_phu,id_goi_san_pham_phu=id_goi_san_pham_phu,so_phi_phu=so_phi_phu)
                return Response(1, status=status.HTTP_200_OK)


class InfoPersonalhealthView(View):

    def get(self, request):
        return render(request, 'personalhealth/personalhealth.html')


class ComapreHealth(View):

    def get(self, request):
        arr_family=request.session.get('perhealth_list_family_age')

        personhealth=person_models.GoiSanPhamChinh.objects.filter(id_loai_hinh_bao_hiem=6,id_goi_san_pham_chinh=1,tuoi=18)
        list_item_personhealth = []
        for it in personhealth:
            sub_item = {}
            money=int(get_total_money_personhealth(arr_family,1,it.company.id_ten_cong_ty))
            sub_item['money_real'] = convert_price_to_string(money)
            sub_item['money'] = money
            sub_item['goispc'] = "Gói Đồng"
            sub_item['cty'] = it.company.id_ten_cong_ty
            list_item_personhealth.append(sub_item)

        context={
            # "total_money_not_price":money,
            # "total_money":total_money_ver3,
            "arr_family":arr_family,
            "goi_defaul":"Gói đồng",
            "list_item_personhealth":list_item_personhealth
        }
        return render(request, 'personalhealth/health_compare.html',context)


class ComaprePrepayment(LoginRequiredMixin,View):
    login_url = '/dang-nhap/'
    def get(self, request):
        arr_family5=request.session.get('perhealth_list_family_age')
        name_goi_vbi=request.session.get('ten_goi_spc_VBI')
        total_hasVAT=request.session.get('tong_phi_hasVAT_VBI')
        nguoimua_perhealth_phone=request.session.get('nguoimua_perhealth_phone')
        nguoimua_perhealth_sex=request.session.get('nguoimua_perhealth_sex')
        nguoimua_perhealth_name=request.session.get('nguoimua_perhealth_name')
        nguoimua_perhealth_daybir=request.session.get('nguoimua_perhealth_daybir')
        nguoimua_perhealth_monthbir=request.session.get('nguoimua_perhealth_monthbir')
        nguoimua_perhealth_yearbir=request.session.get('nguoimua_perhealth_yearbir')
        nguoimua_perhealth_ngayhieuluc=request.session.get('personhealth_ngay_hieu_luc')
        total_hasVAT1=convert_price_to_string(total_hasVAT)
        name_cty=request.session.get('personhealth_name_congty')
        cty=Company.objects.get(id_ten_cong_ty=name_cty)
        name_goi=person_models.GoiSanPhamChinh.objects.filter(id_goi_san_pham_chinh=name_goi_vbi,company=cty)[0]
        sex_ngmua=convert_sex(nguoimua_perhealth_sex)
        list_provincial=Provincial.objects.all().order_by("name")
        context={
            "arr_family":arr_family5,
            "name_goi_vbi":name_goi.ten_goi_san_pham_chinh,
            "total_hasVAT":total_hasVAT1,
            "nguoimua_perhealth_phone":nguoimua_perhealth_phone,
            "nguoimua_perhealth_sex":sex_ngmua,
            "nguoimua_perhealth_name":nguoimua_perhealth_name,
            "nguoimua_perhealth_daybir":nguoimua_perhealth_daybir,
            "nguoimua_perhealth_monthbir":nguoimua_perhealth_monthbir,
            "nguoimua_perhealth_yearbir":nguoimua_perhealth_yearbir,
            "nguoimua_perhealth_ngayhieuluc":nguoimua_perhealth_ngayhieuluc,
            "list_data": list_provincial

        }
        return render(request,'personalhealth/health_prepayment.html',context)

    def post(self, request):
        #ngmua
        name_ngmua=request.session.get('nguoimua_perhealth_name')
        sex_ngmua=request.session.get('nguoimua_perhealth_sex')
        phone_ngmua=request.session.get('nguoimua_perhealth_phone')
        daybirth_ngmua=request.session.get('nguoimua_perhealth_daybir')
        monthbirth_ngmua=request.session.get('nguoimua_perhealth_monthbir')
        yearbirth_ngmua=request.session.get('nguoimua_perhealth_yearbir')

        email_ngmua=request.POST.get("email_ngmua")
        request.session['email_ngmua_perhealth'] = email_ngmua

        tinh_ngmua=request.POST.get("tinh_ngmua")
        request.session['tinh_ngmua_perhealth'] = tinh_ngmua

        huyen_ngmua=request.POST.get("huyen_ngmua")
        request.session['huyen_ngmua_perhealth'] = huyen_ngmua

        adress_detail_ngmua=request.POST.get("address_ngmua")
        request.session['adress_detail_ngmua_perhealth'] = adress_detail_ngmua

        cmtnd_ngmua=request.POST.get("cmtnd_ngmua")
        request.session['cmtnd_ngmua_perhealth'] = cmtnd_ngmua

        ngaycap_cmtnd=request.POST.get("ngaycap_cmtnd_ngmua")
        request.session['ngaycap_cmtnd_perhealth'] = ngaycap_cmtnd

        noicap_cmtnd_ngmua=request.POST.get("noinhan_cmtnd_ngmua")
        request.session['noicap_cmtnd_ngmua_perhealth'] = noicap_cmtnd_ngmua

        # ngaycap_cmtnd_ngmua = datetime.strptime(ngaycap_cmtnd, "%m/%d/%Y").strftime("%Y-%m-%d")
        nguoimua_perhealth_ngayhieuluc=request.session.get('personhealth_ngay_hieu_luc')
        ngay_hieu_luc_hd= datetime.strptime(nguoimua_perhealth_ngayhieuluc, "%d-%m-%Y").strftime("%Y-%m-%d")
        request.session['ngay_hieu_luc_hd_perhealth'] = ngay_hieu_luc_hd

        ngay_ket_thuc=request.POST.get("ngay_ket_thuc")
        request.session['ngay_ket_thuc_person'] = ngay_ket_thuc
        ngay_Ket_thuc_hd= datetime.strptime(ngay_ket_thuc, "%d-%m-%Y").strftime("%Y-%m-%d")
        request.session['ngay_Ket_thuc_hd_perhealth'] = ngay_Ket_thuc_hd


        tk=NguoiMuaBaoHiemTam.objects.create(username=phone_ngmua,fullname=name_ngmua,birth_day=daybirth_ngmua,birth_month=monthbirth_ngmua,
                                            birth_year=yearbirth_ngmua, gioi_tinh=sex_ngmua,email=email_ngmua,dia_chi_tinh_thanh_pho=tinh_ngmua,
                                            dia_chi_quan_huyen=huyen_ngmua,dia_chi_chi_tiet=adress_detail_ngmua,so_cmnd=cmtnd_ngmua,
                                            cmt_ngay_cap=ngaycap_cmtnd,cmt_noi_cap=noicap_cmtnd_ngmua,ngay_hieu_luc=ngay_hieu_luc_hd,
                                            ngay_ket_thuc=ngay_Ket_thuc_hd)

        # ak=NguoiMuaBaoHiem
        arr_family5=request.session.get('perhealth_list_family_age')
        for item in arr_family5:
            ngaysinh=item['bir_ngay']
            thangsinh=item['bir_thang']
            namsinh=item['bir_nam']
            name_ngdc=request.POST.get("name_"+item['name_member'])
            request.session["name_ngdc"+item['name_member']] = name_ngdc

            phone_ngdc=request.POST.get("phone_"+item['name_member'])
            request.session["phone_ngdc"+item['name_member']] = phone_ngdc

            email_ngdc=request.POST.get("email_"+item['name_member'])
            request.session["email_ngdc"+item['name_member']] = email_ngdc

            tinh_ngdc=request.POST.get("tinh_"+item['name_member'])
            request.session["tinh_ngdc"+item['name_member']] = tinh_ngdc

            huyen_ngdc=request.POST.get("huyen_"+item['name_member'])
            request.session["huyen_ngdc"+item['name_member']] = huyen_ngdc

            addrees_ngdc=request.POST.get("address_detail_"+item['name_member'])
            request.session["addrees_ngdc"+item['name_member']] = addrees_ngdc

            cmtnd_ngdc=request.POST.get("cmtnd_"+item['name_member'])
            request.session["cmtnd_ngdc"+item['name_member']] = cmtnd_ngdc

            ngay_cmtnd_ngdc=request.POST.get("ngay_cmtnd_"+item['name_member'])
            request.session["ngay_cmtnd_ngdc"+item['name_member']] = ngay_cmtnd_ngdc

            address_cmtnd_ngdc=request.POST.get("address_cmtnd_detail_"+item['name_member'])
            request.session["address_cmtnd_ngdc"+item['name_member']] = address_cmtnd_ngdc

            quest1=request.POST.get("ques1_"+item['name_member'])
            request.session["quest1"+item['name_member']] = quest1

            quest2=request.POST.get("ques2_"+item['name_member'])
            request.session["quest2"+item['name_member']] = quest2

            content_tired=request.POST.get("content_tired_"+item['name_member'])
            request.session["content_tired"+item['name_member']] = content_tired

            relationship=int(relative_ngmua(item['name_member']))

            tk1=person_models.NguoiDuocBaoHiemTam.objects.create(nguoimuabaohiemtam=tk,username=phone_ngdc,fullname=name_ngdc,
                                                                birth_day=ngaysinh,birth_month=thangsinh,birth_year=namsinh,email=email_ngdc,
                                                                dia_chi_tinh_thanh_pho=tinh_ngdc,dia_chi_quan_huyen=huyen_ngdc,dia_chi_chi_tiet=addrees_ngdc,
                                                                so_cmnd=cmtnd_ngdc,cmt_ngay_cap=ngay_cmtnd_ngdc,cmt_noi_cap=address_cmtnd_ngdc,
                                                                ngay_hieu_luc=ngay_hieu_luc_hd,ngay_ket_thuc=ngay_Ket_thuc_hd,
                                                                cau_hoi_suc_khoe_1=quest1,cau_hoi_suc_khoe_2=quest2,chi_tiet_benh_tat=content_tired,relationship=relationship)
                                                                
       
        return redirect('personalpayment_url')


class CopperHealthVBI(View):

    def get(self, request):
        total_money_new=request.session.get('personhealth_total_money_new1')
        money_real_money=convert_price_to_string(total_money_new)
        total_hasVAT=convert_price_to_string(int(total_money_new*1.1))
        total_VAT=convert_price_to_string(int(total_money_new*0.1))
        context={
            "total_money_spc":money_real_money,
            "total_hasVAT":total_hasVAT,
            "total_VAT":total_VAT,
        }
        return render(request,'personalhealth/goidongVBI.html',context)


class SilverHealthVBI(View):

    def get(self, request):
        total_money_new=request.session.get('personhealth_total_money_new1')
        money_real_money=convert_price_to_string(total_money_new)
        total_hasVAT=convert_price_to_string(int(total_money_new*1.1))
        total_VAT=convert_price_to_string(int(total_money_new*0.1))
        context={
            "total_money_spc":money_real_money,
            "total_hasVAT":total_hasVAT,
            "total_VAT":total_VAT,
        }
        return render(request,'personalhealth/goibacVBI.html',context)


class TitaniumHealthVBI(View):

    def get(self, request):
        total_money_new=request.session.get('personhealth_total_money_new1')
        money_real_money=convert_price_to_string(total_money_new)
        total_hasVAT=convert_price_to_string(int(total_money_new*1.1))
        total_VAT=convert_price_to_string(int(total_money_new*0.1))
        context={
            "total_money_spc":money_real_money,
            "total_hasVAT":total_hasVAT,
            "total_VAT":total_VAT,
        }
        return render(request,'personalhealth/goititanVBI.html',context)


class GoldHealthVBI(View):

    def get(self, request):
        total_money_new=request.session.get('personhealth_total_money_new1')
        money_real_money=convert_price_to_string(total_money_new)
        total_hasVAT=convert_price_to_string(int(total_money_new*1.1))
        total_VAT=convert_price_to_string(int(total_money_new*0.1))
        context={
            "total_money_spc":money_real_money,
            "total_hasVAT":total_hasVAT,
            "total_VAT":total_VAT,
        }
        return render(request,'personalhealth/goivangVBI.html',context)


class PlatinumHealthVBI(View):

    def get(self, request):
        total_money_new=request.session.get('personhealth_total_money_new1')
        money_real_money=convert_price_to_string(total_money_new)
        total_hasVAT=convert_price_to_string(int(total_money_new*1.1))
        total_VAT=convert_price_to_string(int(total_money_new*0.1))
        context={
            "total_money_spc":money_real_money,
            "total_hasVAT":total_hasVAT,
            "total_VAT":total_VAT,
        }
        return render(request,'personalhealth/goibachkimVBI.html',context)


class DiamonHealthVBI(View):
    
    def get(self, request):
        total_money_new=request.session.get('personhealth_total_money_new1')
        money_real_money=convert_price_to_string(total_money_new)
        total_hasVAT=convert_price_to_string(int(total_money_new*1.1))
        total_VAT=convert_price_to_string(int(total_money_new*0.1))
        context={
            "total_money_spc":money_real_money,
            "total_hasVAT":total_hasVAT,
            "total_VAT":total_VAT,
        }
        return render(request,'personalhealth/goikimcuongVBI.html',context)


class Personalpayment(LoginRequiredMixin,View):
    login_url = '/dang-nhap/'
    def get(self, request):
       
        name_ngmua=request.session.get('nguoimua_perhealth_name')
        name_cty=request.session.get('personhealth_name_congty')
        arr_family=len(request.session.get('perhealth_list_family_age'))

        total_money_final_VBI=request.session.get('total_money_final_VBI')
        phi_VAT_VBI=request.session.get('phi_VAT_VBI')
        tong_phi_hasVAT_VBI=request.session.get('tong_phi_hasVAT_VBI')
        name_goi_vbi=request.session.get('ten_goi_spc_VBI')
        ngay_hieu_luc= request.session.get('personhealth_ngay_hieu_luc')
        ngay_ket_thuc= request.session.get("ngay_ket_thuc_person")
        list_provincial=Provincial.objects.all().order_by("name")
        cty=Company.objects.get(id_ten_cong_ty=name_cty)
        name_goi=person_models.GoiSanPhamChinh.objects.filter(id_goi_san_pham_chinh=name_goi_vbi,company=cty)[0]

        email_ngmua = request.session.get('email_ngmua_perhealth') 
        phone_ngmua=request.session.get('nguoimua_perhealth_phone')
        tinh_ngmua = request.session.get('tinh_ngmua_perhealth')
        huyen_ngmua = request.session.get('huyen_ngmua_perhealth') 
        adress_detail_ngmua = request.session.get('adress_detail_ngmua_perhealth')

        context={
            "name_cty":name_goi.company.ten_cong_ty,
            "name_ngmua":name_ngmua,
            "name_goi":name_goi.ten_goi_san_pham_chinh,
            "so_ngdc":arr_family,
            "total_money_final_VBI":convert_price_to_string(total_money_final_VBI),
            "phi_VAT_VBI":convert_price_to_string(phi_VAT_VBI),
            "tong_phi_hasVAT_VBI":convert_price_to_string(tong_phi_hasVAT_VBI),
            "tong_phi_hasVAT_VBI1":tong_phi_hasVAT_VBI,
            "ngay_hieu_luc":ngay_hieu_luc,
            "ngay_ket_thuc":ngay_ket_thuc,
            "list_data":list_provincial,
            "email_ngmua":email_ngmua,
            "phone_ngmua":phone_ngmua,
            "tinh_ngmua":tinh_ngmua,
            "huyen_ngmua":huyen_ngmua,
            "adress_detail_ngmua":adress_detail_ngmua,

        }
        return render(request,'personalhealth/personalpayment.html',context)

    def post(self,request):
        name_ng_nhan_don=request.POST.get("name_ng_nhan")
        email_ng_nhan_don=request.POST.get("email_ng_nhan")
        phone_ng_nhan_don=request.POST.get("phone_ng_nhan")
        tinh_ng_nhan_don=request.POST.get("tinh_ng_nhan")
        huyen_ng_nhan_don=request.POST.get("huyen_ng_nhan")
        address_ng_nhan_don=request.POST.get("address_ng_nhan")
        mgg=request.POST.get("mgg")
        # tao ma don hang
        user=User.objects.get(id=request.user.id)
        order_id = unique_order_id_generator(request.user.username)
        # create model ngmua chinh
        name_ngmua=request.session.get('nguoimua_perhealth_name')
        sex_ngmua=request.session.get('nguoimua_perhealth_sex')
        phone_ngmua=request.session.get('nguoimua_perhealth_phone')
        daybirth_ngmua=request.session.get('nguoimua_perhealth_daybir')
        monthbirth_ngmua=request.session.get('nguoimua_perhealth_monthbir')
        yearbirth_ngmua=request.session.get('nguoimua_perhealth_yearbir')
        email_ngmua = request.session.get('email_ngmua_perhealth') 
        tinh_ngmua = request.session.get('tinh_ngmua_perhealth')
        huyen_ngmua = request.session.get('huyen_ngmua_perhealth') 
        adress_detail_ngmua = request.session.get('adress_detail_ngmua_perhealth')
        cmtnd_ngmua = request.session.get('cmtnd_ngmua_perhealth')
        ngaycap_cmtnd = request.session.get('ngaycap_cmtnd_perhealth') 
        noicap_cmtnd_ngmua = request.session.get('noicap_cmtnd_ngmua_perhealth')
        ngay_hieu_luc_hd = request.session.get('ngay_hieu_luc_hd_perhealth')
        ngay_Ket_thuc_hd = request.session.get('ngay_Ket_thuc_hd_perhealth')

        mua_chinh=NguoiMuaBaoHiem.objects.create(username=phone_ngmua,fullname=name_ngmua,birth_day=daybirth_ngmua,birth_month=monthbirth_ngmua,
                                            birth_year=yearbirth_ngmua, gioi_tinh=sex_ngmua,email=email_ngmua,dia_chi_tinh_thanh_pho=tinh_ngmua,
                                            dia_chi_quan_huyen=huyen_ngmua,dia_chi_chi_tiet=adress_detail_ngmua,so_cmnd=cmtnd_ngmua,
                                            cmt_ngay_cap=ngaycap_cmtnd,cmt_noi_cap=noicap_cmtnd_ngmua,ngay_hieu_luc=ngay_hieu_luc_hd,
                                            ngay_ket_thuc=ngay_Ket_thuc_hd,ho_ten_nhan=name_ng_nhan_don,email_nhan=email_ng_nhan_don,
                                            so_dien_thoai_nhan=phone_ng_nhan_don,dia_chi_tinh_thanh_pho_nhan=tinh_ng_nhan_don,
                                            dia_chi_quan_huyen_nhan=huyen_ng_nhan_don,dia_chi_chi_tiet_nhan=address_ng_nhan_don)

        request.session['id_ngmua_chinh']=mua_chinh.id
        # create model ngdc chinh

        arr_family=request.session.get('perhealth_list_family_age')
        for item in arr_family:
            ngaysinh=item['bir_ngay']
            thangsinh=item['bir_thang']
            namsinh=item['bir_nam']
            name_ngdc=request.session.get("name_ngdc"+item['name_member'])
            phone_ngdc= request.session.get("phone_ngdc"+item['name_member'])
            email_ngdc = request.session.get("email_ngdc"+item['name_member'])
            tinh_ngdc= request.session.get("tinh_ngdc"+item['name_member'])
            huyen_ngdc= request.session.get("huyen_ngdc"+item['name_member'])
            addrees_ngdc=  request.session.get("addrees_ngdc"+item['name_member']) 
            cmtnd_ngdc= request.session.get("cmtnd_ngdc"+item['name_member'])
            ngay_cmtnd_ngdc=request.session.get("ngay_cmtnd_ngdc"+item['name_member'])     
            address_cmtnd_ngdc=request.session.get("address_cmtnd_ngdc"+item['name_member'])     
            quest1=request.session.get("quest1"+item['name_member'])     
            quest2= request.session.get("quest2"+item['name_member'])  
            content_tired= request.session.get("content_tired"+item['name_member'])
            relationship=int(relative_ngmua(item['name_member']))

            ngdc=person_models.NguoiDuocBaoHiem.objects.create(nguoimuabaohiem=mua_chinh,ma_don_hang_bihama=order_id,username=phone_ngdc,fullname=name_ngdc,
                                                                birth_day=ngaysinh,birth_month=thangsinh,birth_year=namsinh,email=email_ngdc,
                                                                dia_chi_tinh_thanh_pho=tinh_ngdc,dia_chi_quan_huyen=huyen_ngdc,dia_chi_chi_tiet=addrees_ngdc,
                                                                so_cmnd=cmtnd_ngdc,cmt_ngay_cap=ngay_cmtnd_ngdc,cmt_noi_cap=address_cmtnd_ngdc,
                                                                ngay_hieu_luc=ngay_hieu_luc_hd,ngay_ket_thuc=ngay_Ket_thuc_hd,
                                                                cau_hoi_suc_khoe_1=quest1,cau_hoi_suc_khoe_2=quest2,chi_tiet_benh_tat=content_tired,
                                                                relationship=relationship)                                

        # // tao don
        # 6 - BH sức khoẻ cá nhân
        
        name_cty=request.session.get('personhealth_name_congty')
        name_goi_vbi=request.session.get('ten_goi_spc_VBI')
        arr_spp_per = request.session.get('perhealth_list_spp_VBI')
        arr_list_spp=[]
        for item in arr_spp_per:
            item_spp=json.loads(item['name_spp_per'])
            arr_list_spp.append(int(item_spp))
        money_spc=int(request.session.get('personhealth_total_money_new1'))
        money_spp = request.session.get('total_money_spp_VBI') 
        total_VAT = request.session.get('phi_VAT_VBI')
        total_hasVAT = request.session.get('tong_phi_hasVAT_VBI')
        if mgg is None or mgg == "":
            code_giam_gia=None
            total_money_hasDiscount=total_hasVAT
        else:
            code_giam_gia=mgg
            tk= MaGiamGia.objects.get(code_ma_giam_gia=code_giam_gia)
            discount=tk.discount
            total_money_hasDiscount=int(total_hasVAT*(1-discount))

        total_money_final_VBI=request.session.get('total_money_final_VBI')
        pay_loai_hop_dong=loai_hop_dong(user,total_money_final_VBI,6)           #6 - BH sức khoẻ cá nhân

        request.session['ma_don_hang_bihama'] = order_id
        request.session['pay_so_dien_thoai'] = request.user.username
        request.session['pay_cong_ty'] = name_cty                               #cty VBI
        request.session['pay_loai_hinh_bao_hiem'] = 6                           #6 - BH sức khoẻ cá nhân
        request.session['pay_goi_san_pham'] = name_goi_vbi
        request.session['pay_goi_san_pham_phu'] = arr_list_spp
        request.session['pay_so_phi_chinh'] = money_spc
        request.session['pay_so_phi_phu'] = money_spp
        request.session['pay_so_phi_VAT'] = total_VAT
        request.session['pay_tong_phi_thanh_toan_has_VAT'] = total_hasVAT
        request.session['pay_loai_hop_dong'] = pay_loai_hop_dong
        request.session['pay_ma_giam_gia'] = code_giam_gia
        request.session['pay_tong_phi_thanh_toan_sau_giam_gia'] = total_money_hasDiscount
        
        return redirect('payment')


class APIPersonHealthDataFamily(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request):
        valid_data = validate_data(personserializers.APIPersonHealthDataFamilySer, request.data)
        info_famlily = valid_data.get('infodata')
        family= json.loads(info_famlily)
        key='phone'
        if key in family:
            request.session['nguoimua_perhealth_phone'] = family['phone']
        else:
            request.session['nguoimua_perhealth_phone']=request.user.username
        request.session['nguoimua_perhealth_sex'] = int(family['sex'])
        request.session['nguoimua_perhealth_name'] = family['name']
        request.session['nguoimua_perhealth_daybir'] = int(family['day_birth'])
        request.session['nguoimua_perhealth_monthbir'] = int(family['month_birth'])
        request.session['nguoimua_perhealth_yearbir'] = int(family['year_birth'])
        request.session['perhealth_list_family_age']=family['family']     #list nguoi dc bh VBI
        money = get_total_money_personhealth(family['family'],1,1)      # 1 cty VBI
        request.session['total_money_personhealth'] = money
        return Response(1, status=status.HTTP_200_OK)


class APIPersonHealthPushChangeGoi(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request):
        valid_data = validate_data(personserializers.APIPersonHealthPushChangeGoiSer, request.data)
        person_health_goi = valid_data.get('goisp')

        arr_family1=request.session.get('perhealth_list_family_age')

        money_price_not_str=get_total_money_personhealth(arr_family1,person_health_goi,1)                   # 1 cty VBI
        money = convert_price_to_string(get_total_money_personhealth(arr_family1,person_health_goi,1))      # 1 cty VBI
        data={'money':money,'money_price_not_str':money_price_not_str}
        return Response(data, status=status.HTTP_200_OK)


class APIPersonHealthPushSPP(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request):
        valid_data = validate_data(personserializers.APIPersonHealthPushSPPSer, request.data)
        name_goi_vbi = valid_data.get('name_goi_vbi')
        arr_spp_per = json.loads(valid_data.get('arr_spp_per'))
        arr_family3=request.session.get('perhealth_list_family_age')
        total_money_new=int(request.session.get('personhealth_total_money_new1'))
        moneyspp1=0
        for item in arr_spp_per:
            item_spp=json.loads(item['name_spp_per'])
            moneyspp=get_price_spp_personhealth(arr_family3,name_goi_vbi,item_spp,1)   # 1 cty VBI
            moneyspp1=moneyspp1+moneyspp

        total_money=total_money_new+moneyspp1
        total_hasVAT=convert_price_to_string(int(total_money*1.1))
        total_VAT=convert_price_to_string(int(total_money*0.1))
        moneyspp=convert_price_to_string(moneyspp1)

        data={
            "total_hasVAT":total_hasVAT,
            "total_VAT":total_VAT,
            "moneyspp":moneyspp
        }
        return Response(data,status=status.HTTP_200_OK)


class APIPushArrSppPersonhealth(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request):
        valid_data = validate_data(personserializers.APIPushArrSppPersonhealthSer, request.data)
        name_goi_vbi = valid_data.get('name_goi_vbi')
        arr_spp = valid_data.get('value_input_spp')
        arr_spp_per = json.loads(arr_spp)
        arr_family4=request.session.get('perhealth_list_family_age')
        total_money_new=int(request.session.get('personhealth_total_money_new1'))

        # print("khanh",type(total_money_new),type(arr_spp_per))
        moneyspp1=0
        for item in arr_spp_per:
            item_spp=json.loads(item['name_spp_per'])
            moneyspp=get_price_spp_personhealth(arr_family4,name_goi_vbi,item_spp,1)    # 1 cty VBI
            moneyspp1=moneyspp1+moneyspp

        total_money=total_money_new+moneyspp1
        total_hasVAT=int(total_money*1.1)
        total_VAT=int(total_money*0.1)

        # print("khanh",total_money,moneyspp1,total_VAT,total_hasVAT)
        request.session['ten_goi_spc_VBI'] = name_goi_vbi       #ten goi spc
        request.session['total_money_final_VBI'] = total_money  #tong phi cuoi cung chua co VAT VBI
        request.session['total_money_spp_VBI'] = moneyspp1      #tong quyen loi phu chua co VAT VBI
        request.session['tong_phi_hasVAT_VBI']=total_hasVAT     # tong phi cuoi cung da co VAT VBI
        request.session['phi_VAT_VBI']=total_VAT                # phi VAT VBI
        request.session['perhealth_list_spp_VBI']=arr_spp_per   # list spp VBI
        return Response(1,status=status.HTTP_200_OK)


class APIPushSpcPersonhealth(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request):
        valid_data = validate_data(personserializers.APIPushSpcPersonhealthSer, request.data)

        name_congty=int(valid_data.get("name_congty"))
        goispms=int(valid_data.get("goispper"))
        ngay_hieu_luc=valid_data.get("inpi_ngay_hieu_luc")

        arr_family=request.session.get('perhealth_list_family_age')
        money = get_total_money_personhealth(arr_family,goispms,name_congty)      # 1 cty VBI

        request.session['personhealth_name_congty'] = int(name_congty)
        request.session['personhealth_total_money_new1'] = int(money)
        request.session['personhealth_ngay_hieu_luc'] = ngay_hieu_luc

        return Response(data={'spc':goispms},status=status.HTTP_200_OK)
