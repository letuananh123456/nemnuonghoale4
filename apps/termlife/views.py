from django.shortcuts import render, redirect
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import permissions
from rest_framework import status
from rest_framework.renderers import TemplateHTMLRenderer, JSONRenderer
from apps.users.models import User
from apps.core.utils import validate_data, convert_sex, convert_price_to_string
from django.views import View
from apps.core.models import Provincial,Company, LinhVuNgheNghiep,NguoiMuaBaoHiemTam,District,NguoiMuaBaoHiem
from apps.article.models import GioiThieuLoaiHinhBH
from apps.core.utils import loai_hop_dong
# Create your views here.
from apps.termlife import models as termlife_models
from apps.termlife import utils as termlife_utils
from apps.termlife import serializers as termlife_serializers
import json
from apps.payment.views import unique_order_id_generator
from django.contrib.auth.mixins import LoginRequiredMixin
from  apps.payment import models as payment_model

class AddSpcApiDataTermLife(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request, format=None):
        valid_data = validate_data(termlife_serializers.AddSpcApiDataTermLifeSer, request.data)

        company = valid_data.get('company')
        ten_loai_hinh_bao_hiem = valid_data.get('ten_loai_hinh_bao_hiem')
        id_loai_hinh_bao_hiem = valid_data.get('id_loai_hinh_bao_hiem')
        gioi_tinh = valid_data.get('gioi_tinh')
        tuoi = valid_data.get('tuoi')
        so_nam_hop_dong = valid_data.get('so_nam_hop_dong')
        so_nam_dong_phi = valid_data.get('so_nam_dong_phi')
        cach_tra_phi = valid_data.get('cach_tra_phi')
        ten_goi_san_pham_chinh = valid_data.get('ten_goi_san_pham_chinh')
        id_goi_san_pham_chinh = valid_data.get('id_goi_san_pham_chinh')
        so_phi_chinh_hang_nam = valid_data.get('so_phi_chinh_hang_nam')
        so_phi_chinh_hang_nua_nam = valid_data.get('so_phi_chinh_hang_nua_nam')
        so_phi_chinh_hang_quy = valid_data.get('so_phi_chinh_hang_quy')
        so_phi_chinh_hang_thang = valid_data.get('so_phi_chinh_hang_thang')


        if not Company.objects.filter(id_ten_cong_ty=company).exists():
            return Response(0, status=status.HTTP_400_BAD_REQUEST)
        else:
            cty=Company.objects.get(id_ten_cong_ty=company)
            if termlife_models.GoiSanPhamChinh.objects.filter(company=cty , ten_loai_hinh_bao_hiem=ten_loai_hinh_bao_hiem, 
                                                            id_loai_hinh_bao_hiem=id_loai_hinh_bao_hiem,gioi_tinh=gioi_tinh, tuoi=tuoi,
                                                            so_nam_hop_dong=so_nam_hop_dong,so_nam_dong_phi=so_nam_dong_phi,
                                                            cach_tra_phi=cach_tra_phi,ten_goi_san_pham_chinh=ten_goi_san_pham_chinh,
                                                            id_goi_san_pham_chinh=id_goi_san_pham_chinh,so_phi_chinh_hang_nam=so_phi_chinh_hang_nam,
                                                            so_phi_chinh_hang_nua_nam=so_phi_chinh_hang_nua_nam,so_phi_chinh_hang_quy=so_phi_chinh_hang_quy,
                                                            so_phi_chinh_hang_thang=so_phi_chinh_hang_thang).exists():
                return Response(0, status=status.HTTP_400_BAD_REQUEST)
            else:
                gsp = termlife_models.GoiSanPhamChinh.objects.create(company=cty , ten_loai_hinh_bao_hiem=ten_loai_hinh_bao_hiem, 
                                                            id_loai_hinh_bao_hiem=id_loai_hinh_bao_hiem,gioi_tinh=gioi_tinh, tuoi=tuoi,
                                                            so_nam_hop_dong=so_nam_hop_dong,so_nam_dong_phi=so_nam_dong_phi,
                                                            cach_tra_phi=cach_tra_phi,ten_goi_san_pham_chinh=ten_goi_san_pham_chinh,
                                                            id_goi_san_pham_chinh=id_goi_san_pham_chinh,so_phi_chinh_hang_nam=so_phi_chinh_hang_nam,
                                                            so_phi_chinh_hang_nua_nam=so_phi_chinh_hang_nua_nam,so_phi_chinh_hang_quy=so_phi_chinh_hang_quy,
                                                            so_phi_chinh_hang_thang=so_phi_chinh_hang_thang)
                return Response(1, status=status.HTTP_200_OK)


class AddSpcpApiDataTermLife(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request, format=None):
        valid_data = validate_data(termlife_serializers.AddSppApiDataTermLifeSer, request.data)

        company = valid_data.get('company')
        ten_loai_hinh_bao_hiem = valid_data.get('ten_loai_hinh_bao_hiem')
        id_loai_hinh_bao_hiem = valid_data.get('id_loai_hinh_bao_hiem')
        gioi_tinh = valid_data.get('gioi_tinh')
        tuoi = valid_data.get('tuoi')
        so_nam_hop_dong = valid_data.get('so_nam_hop_dong')
        so_nam_dong_phi = valid_data.get('so_nam_dong_phi')
        cach_tra_phi = valid_data.get('cach_tra_phi')
        ten_goi_san_pham_chinh = valid_data.get('ten_goi_san_pham_chinh')
        id_goi_san_pham_chinh = valid_data.get('id_goi_san_pham_chinh')
        ten_goi_san_pham_phu = valid_data.get('ten_goi_san_pham_phu')
        id_goi_san_pham_phu = valid_data.get('id_goi_san_pham_phu')
        so_tien_bao_hiem = valid_data.get('so_tien_bao_hiem')
        so_phi_phu_nam = valid_data.get('so_phi_phu_nam')

        if not Company.objects.filter(id_ten_cong_ty=company).exists():
            return Response(0, status=status.HTTP_400_BAD_REQUEST)
        else:
            cty=Company.objects.get(id_ten_cong_ty=company)
            if termlife_models.GoiSanPhamPhu.objects.filter(company=cty , ten_loai_hinh_bao_hiem=ten_loai_hinh_bao_hiem, 
                                                            id_loai_hinh_bao_hiem=id_loai_hinh_bao_hiem,gioi_tinh=gioi_tinh, tuoi=tuoi,
                                                            so_nam_hop_dong=so_nam_hop_dong,so_nam_dong_phi=so_nam_dong_phi,
                                                            cach_tra_phi=cach_tra_phi,ten_goi_san_pham_chinh=ten_goi_san_pham_chinh,
                                                            id_goi_san_pham_chinh=id_goi_san_pham_chinh,ten_goi_san_pham_phu=ten_goi_san_pham_phu,
                                                            id_goi_san_pham_phu=id_goi_san_pham_phu,so_tien_bao_hiem=so_tien_bao_hiem,
                                                            so_phi_phu_nam=so_phi_phu_nam).exists():
                return Response(0, status=status.HTTP_400_BAD_REQUEST)
            else:
                gsp = termlife_models.GoiSanPhamPhu.objects.create(company=cty , ten_loai_hinh_bao_hiem=ten_loai_hinh_bao_hiem, 
                                                            id_loai_hinh_bao_hiem=id_loai_hinh_bao_hiem,gioi_tinh=gioi_tinh, tuoi=tuoi,
                                                            so_nam_hop_dong=so_nam_hop_dong,so_nam_dong_phi=so_nam_dong_phi,
                                                            cach_tra_phi=cach_tra_phi,ten_goi_san_pham_chinh=ten_goi_san_pham_chinh,
                                                            id_goi_san_pham_chinh=id_goi_san_pham_chinh,ten_goi_san_pham_phu=ten_goi_san_pham_phu,
                                                            id_goi_san_pham_phu=id_goi_san_pham_phu,so_tien_bao_hiem=so_tien_bao_hiem,
                                                            so_phi_phu_nam=so_phi_phu_nam)
                return Response(1, status=status.HTTP_200_OK)


class ProductTuky(View):
    def get(self, request):
        return render(request, 'termlife/product_tuky.html')

    def post(self, request):
        sex_ngdc=request.POST.get('sex_ngdc')
        name_ngdc=request.POST.get('name_ngdc')
        ngays_ngdc=request.POST.get('ngays_ngdc')
        thangs_ngdc=request.POST.get('thangs_ngdc')
        nams_ngdc=request.POST.get('nams_ngdc')
        phone_ngdc=request.POST.get('phone_ngdc')
        age_ngdc=request.POST.get('age_ngdc')

        request.session['sex_ngdc_termlife']=int(sex_ngdc)
        request.session['name_ngdc_termlife']=name_ngdc
        request.session['ngays_ngdc_termlife']=int(ngays_ngdc)
        request.session['thangs_ngdc_termlife']=int(thangs_ngdc)
        request.session['nams_ngdc_termlife']=int(nams_ngdc)
        request.session['phone_ngdc_termlife']=phone_ngdc
        request.session['age_ngdc_termlife']=int(age_ngdc)

        return redirect('termlife:compare-url')


class CompareProductView(View):
    def get(self, request):
        sex_ngdc=request.session.get('sex_ngdc_termlife')
        name_ngdc=request.session.get('name_ngdc_termlife')
        age_ngdc=request.session.get('age_ngdc_termlife')
        hoanphi=termlife_models.GoiSanPhamChinh.objects.filter(id_loai_hinh_bao_hiem=1,id_goi_san_pham_chinh=1,tuoi=age_ngdc,so_nam_hop_dong=2,so_nam_dong_phi=1,cach_tra_phi=1)
        list_term_life1 = []
        for it in hoanphi:
            sub_item = {}
            money=int(termlife_utils.get_money_spc_term_life(1,sex_ngdc,age_ngdc,10000000,2,1,1,it.company.id_ten_cong_ty,1,1))
            sub_item['money_real'] = convert_price_to_string(money)
            sub_item['cty'] = it.company.id_ten_cong_ty
            sub_item['name_cty'] = it.company.ten_cong_ty

            list_term_life1.append(sub_item)
        truyenthong=termlife_models.GoiSanPhamChinh.objects.filter(id_loai_hinh_bao_hiem=1,id_goi_san_pham_chinh=2,gioi_tinh=sex_ngdc,tuoi=age_ngdc,so_nam_hop_dong=10,so_nam_dong_phi=10,cach_tra_phi=2)
        list_term_life2 = []
        for it in truyenthong:
            sub_item = {}
            money=int(termlife_utils.get_money_spc_term_life(1,sex_ngdc,age_ngdc,30000000,10,10,2,it.company.id_ten_cong_ty,1,2))
            sub_item['money_real'] = convert_price_to_string(money)
            sub_item['cty'] = it.company.id_ten_cong_ty
            sub_item['name_cty'] = it.company.ten_cong_ty

            list_term_life2.append(sub_item)
        thaisan=termlife_models.GoiSanPhamChinh.objects.filter(id_loai_hinh_bao_hiem=1,id_goi_san_pham_chinh=3,gioi_tinh=1,tuoi=age_ngdc,so_nam_hop_dong=5,so_nam_dong_phi=1,cach_tra_phi=1)
        list_term_life3 = []
        mess=""
        if sex_ngdc == 1:
            for it in thaisan:
                sub_item = {}
                money=int(termlife_utils.get_money_spc_term_life(1,sex_ngdc,age_ngdc,30000000,5,1,1,it.company.id_ten_cong_ty,1,3))
                sub_item['money_real'] = convert_price_to_string(money)
                sub_item['cty'] = it.company.id_ten_cong_ty
                sub_item['name_cty'] = it.company.ten_cong_ty
                list_term_life3.append(sub_item)
        else:
            mess="Giới tính không phù hợp để chọn sản phẩm thai sản"
        context={"mess":mess,"list_term_life1":list_term_life1,"list_term_life2":list_term_life2,"list_term_life3":list_term_life3,"sex_ngdc":convert_sex(sex_ngdc),"name_ngdc":name_ngdc,"age_ngdc":age_ngdc,"sex":sex_ngdc}
        return render(request, 'termlife/compare.html',context)


class HoanPhiView(LoginRequiredMixin,View):
    login_url = '/dang-nhap/'
    def get(self, request):
        list_provincial=Provincial.objects.all().order_by("name")
        list_job=LinhVuNgheNghiep.objects.all().order_by("code_linhvuc")

        sex_ngdc=request.session.get('sex_ngdc_termlife')
        name_ngdc=request.session.get('name_ngdc_termlife')
        ngays_ngdc=request.session.get('ngays_ngdc_termlife')
        thangs_ngdc=request.session.get('thangs_ngdc_termlife')
        nams_ngdc=request.session.get('nams_ngdc_termlife')
        phone_ngdc=request.session.get('phone_ngdc_termlife')
        age_ngdc=request.session.get('age_ngdc_termlife')

        sotienbh_termlife=request.session.get('sotienbh_termlife')
        sonamhd_termlife=request.session.get('sonamhd_termlife')
        sonamdp_termlife=request.session.get('sonamdp_termlife')
        cachtraphi_termlife=request.session.get('cachtraphi_termlife')
        spchinh_termlife=request.session.get('spchinh_termlife')
        loai_tra_phi_termlife=request.session.get('loai_tra_phi_termlife')
        smoking_ngdc_termlife=request.session.get('smoking_ngdc_termlife')
        sophichinh_termlife=request.session.get('sophichinh_termlife')
        phiVat=int(sophichinh_termlife*0.1)
        total_tl=int(sophichinh_termlife*1.1)
        if cachtraphi_termlife == 2 :
            cachtra="nhiều lần"
        else:
            cachtra="1 lần"
        context = {
            "list_data": list_provincial,
            'list_job':list_job,
            'name_ngdc':name_ngdc,
            'sex_ngdc':sex_ngdc,
            'ngays_ngdc':ngays_ngdc,
            'thangs_ngdc':thangs_ngdc,
            'nams_ngdc':nams_ngdc,
            'phone_ngdc':phone_ngdc,
            'sonamhd_termlife':sonamhd_termlife,
            'sonamdp_termlife':sonamdp_termlife,
            'cachtra':cachtra,
            'sotienbh_termlife': convert_price_to_string(sotienbh_termlife),
            'sophichinh_termlife': convert_price_to_string(sophichinh_termlife),
            'phiVat':convert_price_to_string(phiVat),
            'total_tl':convert_price_to_string(total_tl)

        }
        return render(request, 'termlife/hoanphi-fubon.html',context)        
    def post (self, request):
        stbh_phauthuat=request.POST.get('stbh_phauthuat')
        snhd_phauthuat=request.POST.get('snhd_phauthuat')
        sndp_phauthuat=request.POST.get('sndp_phauthuat')
        ctp_phauthuat=request.POST.get('ctp_phauthuat')
        list_spp=[]

        if stbh_phauthuat != None and snhd_phauthuat != None and sndp_phauthuat != None and ctp_phauthuat != None:
            dictspp1={'loaispp':1,'stbh':stbh_phauthuat,'snhd':snhd_phauthuat,'sndp':sndp_phauthuat,'ctp':ctp_phauthuat}
            list_spp.append(dictspp1)
        stbh_hiemngheo=request.POST.get('stbh_hiemngheo')
        snhd_hiemngheo=request.POST.get('snhd_hiemngheo')
        sndp_hiemngheo=request.POST.get('sndp_hiemngheo')
        ctp_hiemngheo=request.POST.get('ctp_hiemngheo')
        if stbh_hiemngheo != None and snhd_hiemngheo != None and sndp_hiemngheo != None and ctp_hiemngheo != None:
            dictspp2={'loaispp':2,'stbh':stbh_hiemngheo,'snhd':snhd_hiemngheo,'sndp':sndp_hiemngheo,'ctp':ctp_hiemngheo}
            list_spp.append(dictspp2)
        request.session['list_spp_termlife']=list_spp

        #ngmua
        phone_ngmua=request.user.username
        name_nm=request.POST.get('name_nm')
        sex_nm=request.POST.get('sex_nm')
        daybirth_nm=request.POST.get('daybirth_nm')
        monthbirth_nm=request.POST.get('monthbirth_nm')
        yearbirth_nm=request.POST.get('yearbirth_nm')
        email_nm=request.POST.get('email_nm')
        cmt_nm=request.POST.get('cmt_nm')
        ngaycap_nm=request.POST.get('ngaycap_nm')
        noicapcmt_nm=request.POST.get('noicapcmt_nm')
        thanhpho_nm=request.POST.get('thanhpho_nm')
        huyen_nm=request.POST.get('huyen_nm')
        diachi_nm=request.POST.get('diachi_nm')

        tthon_nm=request.POST.get('tthon_nm')
        linhvuc_nm=request.POST.get('linhvuc_nm')
        job_nm=request.POST.get('job_nm')
        detailjob_nm=request.POST.get('detailjob_nm')
        cannang_nm=request.POST.get('cannang_nm')
        chieucao_nm=request.POST.get('chieucao_nm')
        quoctich_nm=request.POST.get('quoctich_nm')
        congdanmy_nm=request.POST.get('congdanmy_nm')
        # base64cmttruoc_nm=request.POST.get('base64cmttruoc_nm')
        # base64cmtsau_nm=request.POST.get('base64cmtsau_nm') 
        base64cmttruoc_nm=None
        base64cmtsau_nm=None

        tk=NguoiMuaBaoHiemTam.objects.create(username=phone_ngmua,fullname=name_nm,birth_day=daybirth_nm,birth_month=monthbirth_nm,
                                            birth_year=yearbirth_nm, gioi_tinh=sex_nm,email=email_nm,dia_chi_tinh_thanh_pho=thanhpho_nm,
                                            dia_chi_quan_huyen=huyen_nm,dia_chi_chi_tiet=diachi_nm,so_cmnd=cmt_nm,
                                            cmt_ngay_cap=ngaycap_nm,cmt_noi_cap=noicapcmt_nm,images_cmt_mattruoc=base64cmttruoc_nm,
                                            images_cmt_matsau=base64cmtsau_nm,status_marriage=tthon_nm,job=detailjob_nm,weight=cannang_nm,
                                            height=chieucao_nm,nationality=quoctich_nm,nationality_paper=congdanmy_nm)

        request.session['name_nm_termlife']=name_nm
        request.session['sex_nm_termlife']=sex_nm
        request.session['daybirth_nm_termlife']=daybirth_nm
        request.session['monthbirth_nm_termlife']=monthbirth_nm
        request.session['yearbirth_nm_termlife']= yearbirth_nm
        request.session['sdt_nm_termlife']=phone_ngmua
        request.session['email_nm_termlife']=email_nm
        request.session['cmt_nm_termlife']=cmt_nm
        request.session['ngaycap_nm_termlife']= ngaycap_nm
        request.session['noicapcmt_nm_termlife']=noicapcmt_nm
        request.session['thanhpho_nm_termlife']=thanhpho_nm
        request.session['huyen_nm_termlife']=huyen_nm
        request.session['diachi_nm_termlife']=diachi_nm
        request.session['tthon_nm_termlife']=tthon_nm
        request.session['detailjob_nm_termlife']=detailjob_nm
        request.session['cannang_nm_termlife']=cannang_nm
        request.session['chieucao_nm_termlife']=chieucao_nm
        request.session['quoctich_nm_termlife']=quoctich_nm
        request.session['congdanmy_nm_termlife']=congdanmy_nm
        request.session['base64cmttruoc_nm_termlife']=base64cmttruoc_nm
        request.session['base64cmtsau_nm_termlife']=base64cmtsau_nm

        #ngdc
        name_ngdc=request.POST.get('name_ngdc')
        sex_ngdc=request.POST.get('sex_ngdc')
        daybirth_ngdc=request.POST.get('daybirth_ngdc')
        monthbirth_ngdc=request.POST.get('monthbirth_ngdc')
        yearbirth_ngdc=request.POST.get('yearbirth_ngdc')
        sdt_ngdc=request.session.get('phone_ngdc_termlife')
        email_ngdc=request.POST.get('email_ngdc')
        cmt_ngdc=request.POST.get('cmt_ngdc')
        ngaycap_ngdc=request.POST.get('ngaycap_ngdc')
        noicapcmt_ngdc=request.POST.get('noicapcmt_ngdc')
        thanhpho_ngdc=request.POST.get('thanhpho_ngdc')
        huyen_ngdc=request.POST.get('huyen_ngdc')
        diachi_ngdc=request.POST.get('diachi_ngdc')
        tthon_ngdc=request.POST.get('tthon_ngdc')
        linhvuc_ngdc=request.POST.get('linhvuc_ngdc')
        job_ngdc=request.POST.get('job_ngdc')
        detailjob_ngdc=request.POST.get('detailjob_ngdc')
        cannang_ngdc=request.POST.get('cannang_ngdc')
        chieucao_ngdc=request.POST.get('chieucao_ngdc')
        quoctich_ngdc=request.POST.get('quoctich_ngdc')
        congdanmy_ngdc=request.POST.get('congdanmy_ngdc')
        quanhenm=request.POST.get('quanhenm')
        hutthuoc_ngdc=request.POST.get('hutthuoc_ngdc')
        # base64cmttruoc_ngdc=request.POST.get('base64cmttruoc_ngdc')
        # base64cmtsau_ngdc=request.POST.get('base64cmtsau_ngdc')
        base64cmttruoc_ngdc=None
        base64cmtsau_ngdc=None

        sotienbh_termlife=request.session.get('sotienbh_termlife')
        sonamhd_termlife=request.session.get('sonamhd_termlife')
        sonamdp_termlife=request.session.get('sonamdp_termlife')
        cachtraphi_termlife=request.session.get('cachtraphi_termlife')
        loai_tra_phi_termlife=request.session.get('loai_tra_phi_termlife')

        tk1=termlife_models.NguoiDuocBaoHiemTam.objects.create(nguoimuabaohiemtam=tk,username=sdt_ngdc,fullname=name_ngdc,birth_day=daybirth_ngdc,
                                            birth_month=monthbirth_ngdc,
                                            birth_year=yearbirth_ngdc, gioi_tinh=sex_ngdc,email=email_ngdc,dia_chi_tinh_thanh_pho=thanhpho_ngdc,
                                            dia_chi_quan_huyen=huyen_ngdc,dia_chi_chi_tiet=diachi_ngdc,so_cmnd=cmt_ngdc,
                                            cmt_ngay_cap=ngaycap_ngdc,cmt_noi_cap=noicapcmt_ngdc,images_cmt_mattruoc=base64cmttruoc_ngdc,
                                            images_cmt_matsau=base64cmtsau_ngdc,status_marriage=tthon_ngdc,job=detailjob_ngdc,weight=cannang_ngdc,
                                            height=chieucao_ngdc,nationality=quoctich_ngdc,nationality_paper=congdanmy_ngdc,relationship=quanhenm,
                                            is_smoke=hutthuoc_ngdc,so_tien_bao_hiem=sotienbh_termlife,so_nam_hop_dong=sonamhd_termlife,
                                            so_nam_dong_phi=sonamdp_termlife,cach_tra_phi=cachtraphi_termlife,dinh_ky_dong_phi=loai_tra_phi_termlife)

        request.session['name_ngdc_termlife']=name_ngdc
        request.session['sex_ngdc_termlife']=sex_ngdc
        request.session['daybirth_ngdc_termlife']=daybirth_ngdc
        request.session['monthbirth_ngdc_termlife']=monthbirth_ngdc
        request.session['yearbirth_ngdc_termlife']= yearbirth_ngdc
        request.session['email_ngdc_termlife']=email_ngdc
        request.session['cmt_ngdc_termlife']=cmt_ngdc
        request.session['ngaycap_ngdc_termlife']= ngaycap_ngdc
        request.session['noicapcmt_ngdc_termlife']=noicapcmt_ngdc
        request.session['thanhpho_ngdc_termlife']=thanhpho_ngdc
        request.session['huyen_ngdc_termlife']=huyen_ngdc
        request.session['diachi_ngdc_termlife']=diachi_ngdc
        request.session['tthon_ngdc_termlife']=tthon_ngdc
        request.session['detailjob_ngdc_termlife']=detailjob_ngdc
        request.session['cannang_ngdc_termlife']=cannang_ngdc
        request.session['chieucao_ngdc_termlife']=chieucao_ngdc
        request.session['quoctich_ngdc_termlife']=quoctich_ngdc
        request.session['congdanmy_ngdc_termlife']=congdanmy_ngdc
        request.session['quanhenm_termlife']=quanhenm
        request.session['hutthuoc_ngdc_termlife']=hutthuoc_ngdc
        request.session['base64cmttruoc_ngdc_termlife']=base64cmttruoc_ngdc
        request.session['base64cmtsau_ngdc_termlife']=base64cmtsau_ngdc

        #ngthuhuong1
        ten_nth1=request.POST.get('ten_nth1')
        gender_nth1=request.POST.get('gender_nth1')
        ngaysinh_nth1=request.POST.get('ngaysinh_nth1')
        thangsinh_nth1=request.POST.get('thangsinh_nth1')
        namsinh_nth1=request.POST.get('namsinh_nth1')
        cmt_nth1=request.POST.get('cmt_nth1')
        ngaycap_nth1=request.POST.get('ngaycap_nth1')
        noicapcmt_nth1=request.POST.get('noicapcmt_nth1')
        quanhe_nth1=request.POST.get('quanhe_nth1')
        tile_nth1=request.POST.get('tile_nth1')
        # base64cmttruoc_nth1=request.POST.get('base64cmttruoc_nth1')
        # base64cmtsau_nth1=request.POST.get('base64cmtsau_nth1')
        base64cmttruoc_nth1=None
        base64cmtsau_nth1=None
        tk2=termlife_models.NguoiThuHuongTam.objects.create(nguoiduocbaohiemtam=tk1,fullname=ten_nth1,birth_day=ngaysinh_nth1,
                                                            birth_month=thangsinh_nth1,birth_year=namsinh_nth1,gioi_tinh=gender_nth1,
                                                            so_cmnd=cmt_nth1,cmt_ngay_cap=ngaycap_nth1,cmt_noi_cap=noicapcmt_nth1,
                                                            relationship=quanhe_nth1,ty_le_thu_huong=tile_nth1,images_cmt_mattruoc=base64cmttruoc_nth1,
                                                            images_cmt_matsau=base64cmtsau_nth1)

        request.session['ten_nth1_termlife']=ten_nth1
        request.session['gender_nth1_termlife']=gender_nth1
        request.session['ngaysinh_nth1_termlife']=ngaysinh_nth1
        request.session['thangsinh_nth1_termlife']=thangsinh_nth1
        request.session['namsinh_nth1_termlife']=namsinh_nth1
        request.session['cmt_nth1_termlife']=cmt_nth1
        request.session['ngaycap_nth1_termlife']=ngaycap_nth1
        request.session['noicapcmt_nth1_termlife']=noicapcmt_nth1
        request.session['quanhe_nth1_termlife']=quanhe_nth1
        request.session['tile_nth1_termlife']=tile_nth1
        request.session['base64cmttruoc_nth1_termlife']=base64cmttruoc_nth1
        request.session['base64cmtsau_nth1_termlife']=base64cmtsau_nth1

        #ngthuhuong2
        ten_nth2=request.POST.get('ten_nth2')
        gender_nth2=request.POST.get('gender_nth2')
        ngaysinh_nth2=request.POST.get('ngaysinh_nth2')
        thangsinh_nth2=request.POST.get('thangsinh_nth2')
        namsinh_nth2=request.POST.get('namsinh_nth2')
        cmt_nth2=request.POST.get('cmt_nth2')
        ngaycap_nth2=request.POST.get('ngaycap_nth2')
        noicapcmt_nth2=request.POST.get('noicapcmt_nth2')
        quanhe_nth2=request.POST.get('quanhe_nth2')
        tile_nth2=request.POST.get('tile_nth2')
        # base64cmttruoc_nth2=request.POST.get('base64cmttruoc_nth2')
        # base64cmtsau_nth2=request.POST.get('base64cmtsau_nth2')
        base64cmttruoc_nth2=None
        base64cmtsau_nth2=None
        if ten_nth2 != None and gender_nth2 != None and ngaysinh_nth2 != None and thangsinh_nth2 != None and namsinh_nth2 != None and cmt_nth2 != None and ngaycap_nth2 != None and noicapcmt_nth2 != None and quanhe_nth2 != None and tile_nth2 != None and base64cmttruoc_nth2 != None and base64cmtsau_nth2 != None:
            tk3=termlife_models.NguoiThuHuongTam.objects.create(nguoiduocbaohiemtam=tk1,fullname=ten_nth2,birth_day=ngaysinh_nth2,
                                                            birth_month=thangsinh_nth2,birth_year=namsinh_nth2,gioi_tinh=gender_nth2,
                                                            so_cmnd=cmt_nth2,cmt_ngay_cap=ngaycap_nth2,cmt_noi_cap=noicapcmt_nth2,
                                                            relationship=quanhe_nth2,ty_le_thu_huong=tile_nth2,images_cmt_mattruoc=base64cmttruoc_nth2,
                                                            images_cmt_matsau=base64cmtsau_nth2)
            request.session['ten_nth2_termlife']=ten_nth2
            request.session['gender_nth2_termlife']=gender_nth2
            request.session['ngaysinh_nth2_termlife']=ngaysinh_nth2
            request.session['thangsinh_nth2_termlife']=thangsinh_nth2
            request.session['namsinh_nth2_termlife']=namsinh_nth2
            request.session['cmt_nth2_termlife']=cmt_nth2
            request.session['ngaycap_nth2_termlife']=ngaycap_nth2
            request.session['noicapcmt_nth2_termlife']=noicapcmt_nth2
            request.session['quanhe_nth2_termlife']=quanhe_nth2
            request.session['tile_nth2_termlife']=tile_nth2
            request.session['base64cmttruoc_nth2_termlife']=base64cmttruoc_nth2
            request.session['base64cmtsau_nth2_termlife']=base64cmtsau_nth2

        return redirect('termlife:question-health-hoanphi')


class TruyenThongView(LoginRequiredMixin,View):
    login_url = '/dang-nhap/'
    def get(self, request):
        list_provincial=Provincial.objects.all().order_by("name")
        list_job=LinhVuNgheNghiep.objects.all().order_by("code_linhvuc")

        sex_ngdc=request.session.get('sex_ngdc_termlife')
        name_ngdc=request.session.get('name_ngdc_termlife')
        ngays_ngdc=request.session.get('ngays_ngdc_termlife')
        thangs_ngdc=request.session.get('thangs_ngdc_termlife')
        nams_ngdc=request.session.get('nams_ngdc_termlife')
        phone_ngdc=request.session.get('phone_ngdc_termlife')
        age_ngdc=request.session.get('age_ngdc_termlife')

        sotienbh_termlife=request.session.get('sotienbh_termlife')
        sonamhd_termlife=request.session.get('sonamhd_termlife')
        sonamdp_termlife=request.session.get('sonamdp_termlife')
        cachtraphi_termlife=request.session.get('cachtraphi_termlife')
        spchinh_termlife=request.session.get('spchinh_termlife')
        loai_tra_phi_termlife=request.session.get('loai_tra_phi_termlife')
        smoking_ngdc_termlife=request.session.get('smoking_ngdc_termlife')
        sophichinh_termlife=request.session.get('sophichinh_termlife')
        phiVat=int(sophichinh_termlife*0.1)
        total_tl=int(sophichinh_termlife*1.1)
        if cachtraphi_termlife == 2 :
            cachtra="nhiều lần"
        else:
            cachtra="1 lần"
        context = {
            "list_data": list_provincial,
            'list_job':list_job,
            'name_ngdc':name_ngdc,
            'sex_ngdc':sex_ngdc,
            'ngays_ngdc':ngays_ngdc,
            'thangs_ngdc':thangs_ngdc,
            'nams_ngdc':nams_ngdc,
            'phone_ngdc':phone_ngdc,
            'sonamhd_termlife':sonamhd_termlife,
            'sonamdp_termlife':sonamdp_termlife,
            'cachtra':cachtra,
            'sotienbh_termlife': convert_price_to_string(sotienbh_termlife),
            'sophichinh_termlife': convert_price_to_string(sophichinh_termlife),
            'phiVat':convert_price_to_string(phiVat),
            'total_tl':convert_price_to_string(total_tl)

        }
        return render(request, 'termlife/truyenthong-fubon.html',context)        
    def post (self, request):
        stbh_phauthuat=request.POST.get('stbh_phauthuat')
        snhd_phauthuat=request.POST.get('snhd_phauthuat')
        sndp_phauthuat=request.POST.get('sndp_phauthuat')
        ctp_phauthuat=request.POST.get('ctp_phauthuat')
        list_spp=[]

        if stbh_phauthuat != None and snhd_phauthuat != None and sndp_phauthuat != None and ctp_phauthuat != None:
            dictspp1={'loaispp':1,'stbh':stbh_phauthuat,'snhd':snhd_phauthuat,'sndp':sndp_phauthuat,'ctp':ctp_phauthuat}
            list_spp.append(dictspp1)
        stbh_hiemngheo=request.POST.get('stbh_hiemngheo')
        snhd_hiemngheo=request.POST.get('snhd_hiemngheo')
        sndp_hiemngheo=request.POST.get('sndp_hiemngheo')
        ctp_hiemngheo=request.POST.get('ctp_hiemngheo')
        if stbh_hiemngheo != None and snhd_hiemngheo != None and sndp_hiemngheo != None and ctp_hiemngheo != None:
            dictspp2={'loaispp':2,'stbh':stbh_hiemngheo,'snhd':snhd_hiemngheo,'sndp':sndp_hiemngheo,'ctp':ctp_hiemngheo}
            list_spp.append(dictspp2)

        request.session['list_spp_termlife']=list_spp

        #ngmua
        phone_ngmua=request.user.username
        name_nm=request.POST.get('name_nm')
        sex_nm=request.POST.get('sex_nm')
        daybirth_nm=request.POST.get('daybirth_nm')
        monthbirth_nm=request.POST.get('monthbirth_nm')
        yearbirth_nm=request.POST.get('yearbirth_nm')
        email_nm=request.POST.get('email_nm')
        cmt_nm=request.POST.get('cmt_nm')
        ngaycap_nm=request.POST.get('ngaycap_nm')
        noicapcmt_nm=request.POST.get('noicapcmt_nm')
        thanhpho_nm=request.POST.get('thanhpho_nm')
        huyen_nm=request.POST.get('huyen_nm')
        diachi_nm=request.POST.get('diachi_nm')

        tthon_nm=request.POST.get('tthon_nm')
        linhvuc_nm=request.POST.get('linhvuc_nm')
        job_nm=request.POST.get('job_nm')
        detailjob_nm=request.POST.get('detailjob_nm')
        cannang_nm=request.POST.get('cannang_nm')
        chieucao_nm=request.POST.get('chieucao_nm')
        quoctich_nm=request.POST.get('quoctich_nm')
        congdanmy_nm=request.POST.get('congdanmy_nm')
        base64cmttruoc_nm=request.POST.get('base64cmttruoc_nm')
        base64cmtsau_nm=request.POST.get('base64cmtsau_nm') 

        tk=NguoiMuaBaoHiemTam.objects.create(username=phone_ngmua,fullname=name_nm,birth_day=daybirth_nm,birth_month=monthbirth_nm,
                                            birth_year=yearbirth_nm, gioi_tinh=sex_nm,email=email_nm,dia_chi_tinh_thanh_pho=thanhpho_nm,
                                            dia_chi_quan_huyen=huyen_nm,dia_chi_chi_tiet=diachi_nm,so_cmnd=cmt_nm,
                                            cmt_ngay_cap=ngaycap_nm,cmt_noi_cap=noicapcmt_nm,images_cmt_mattruoc=base64cmttruoc_nm,
                                            images_cmt_matsau=base64cmtsau_nm,status_marriage=tthon_nm,job=detailjob_nm,weight=cannang_nm,
                                            height=chieucao_nm,nationality=quoctich_nm,nationality_paper=congdanmy_nm)

        request.session['name_nm_termlife']=name_nm
        request.session['sex_nm_termlife']=sex_nm
        request.session['daybirth_nm_termlife']=daybirth_nm
        request.session['monthbirth_nm_termlife']=monthbirth_nm
        request.session['yearbirth_nm_termlife']= yearbirth_nm
        request.session['sdt_nm_termlife']=phone_ngmua
        request.session['email_nm_termlife']=email_nm
        request.session['cmt_nm_termlife']=cmt_nm
        request.session['ngaycap_nm_termlife']= ngaycap_nm
        request.session['noicapcmt_nm_termlife']=noicapcmt_nm
        request.session['thanhpho_nm_termlife']=thanhpho_nm
        request.session['huyen_nm_termlife']=huyen_nm
        request.session['diachi_nm_termlife']=diachi_nm
        request.session['tthon_nm_termlife']=tthon_nm
        request.session['detailjob_nm_termlife']=detailjob_nm
        request.session['cannang_nm_termlife']=cannang_nm
        request.session['chieucao_nm_termlife']=chieucao_nm
        request.session['quoctich_nm_termlife']=quoctich_nm
        request.session['congdanmy_nm_termlife']=congdanmy_nm
        request.session['base64cmttruoc_nm_termlife']=base64cmttruoc_nm
        request.session['base64cmtsau_nm_termlife']=base64cmtsau_nm

        #ngdc
        name_ngdc=request.POST.get('name_ngdc')
        sex_ngdc=request.POST.get('sex_ngdc')
        daybirth_ngdc=request.POST.get('daybirth_ngdc')
        monthbirth_ngdc=request.POST.get('monthbirth_ngdc')
        yearbirth_ngdc=request.POST.get('yearbirth_ngdc')
        sdt_ngdc=request.session.get('phone_ngdc_termlife')
        email_ngdc=request.POST.get('email_ngdc')
        cmt_ngdc=request.POST.get('cmt_ngdc')
        ngaycap_ngdc=request.POST.get('ngaycap_ngdc')
        noicapcmt_ngdc=request.POST.get('noicapcmt_ngdc')
        thanhpho_ngdc=request.POST.get('thanhpho_ngdc')
        huyen_ngdc=request.POST.get('huyen_ngdc')
        diachi_ngdc=request.POST.get('diachi_ngdc')
        tthon_ngdc=request.POST.get('tthon_ngdc')
        linhvuc_ngdc=request.POST.get('linhvuc_ngdc')
        job_ngdc=request.POST.get('job_ngdc')
        detailjob_ngdc=request.POST.get('detailjob_ngdc')
        cannang_ngdc=request.POST.get('cannang_ngdc')
        chieucao_ngdc=request.POST.get('chieucao_ngdc')
        quoctich_ngdc=request.POST.get('quoctich_ngdc')
        congdanmy_ngdc=request.POST.get('congdanmy_ngdc')
        quanhenm=request.POST.get('quanhenm')
        hutthuoc_ngdc=request.POST.get('hutthuoc_ngdc')
        base64cmttruoc_ngdc=request.POST.get('base64cmttruoc_ngdc')
        base64cmtsau_ngdc=request.POST.get('base64cmtsau_ngdc')

        sotienbh_termlife=request.session.get('sotienbh_termlife')
        sonamhd_termlife=request.session.get('sonamhd_termlife')
        sonamdp_termlife=request.session.get('sonamdp_termlife')
        cachtraphi_termlife=request.session.get('cachtraphi_termlife')
        loai_tra_phi_termlife=request.session.get('loai_tra_phi_termlife')

        tk1=termlife_models.NguoiDuocBaoHiemTam.objects.create(nguoimuabaohiemtam=tk,username=sdt_ngdc,fullname=name_ngdc,birth_day=daybirth_ngdc,
                                            birth_month=monthbirth_ngdc,
                                            birth_year=yearbirth_ngdc, gioi_tinh=sex_ngdc,email=email_ngdc,dia_chi_tinh_thanh_pho=thanhpho_ngdc,
                                            dia_chi_quan_huyen=huyen_ngdc,dia_chi_chi_tiet=diachi_ngdc,so_cmnd=cmt_ngdc,
                                            cmt_ngay_cap=ngaycap_ngdc,cmt_noi_cap=noicapcmt_ngdc,images_cmt_mattruoc=base64cmttruoc_ngdc,
                                            images_cmt_matsau=base64cmtsau_ngdc,status_marriage=tthon_ngdc,job=detailjob_ngdc,weight=cannang_ngdc,
                                            height=chieucao_ngdc,nationality=quoctich_ngdc,nationality_paper=congdanmy_ngdc,relationship=quanhenm,
                                            is_smoke=hutthuoc_ngdc,so_tien_bao_hiem=sotienbh_termlife,so_nam_hop_dong=sonamhd_termlife,
                                            so_nam_dong_phi=sonamdp_termlife,cach_tra_phi=cachtraphi_termlife,dinh_ky_dong_phi=loai_tra_phi_termlife)

        request.session['name_ngdc_termlife']=name_ngdc
        request.session['sex_ngdc_termlife']=sex_ngdc
        request.session['daybirth_ngdc_termlife']=daybirth_ngdc
        request.session['monthbirth_ngdc_termlife']=monthbirth_ngdc
        request.session['yearbirth_ngdc_termlife']= yearbirth_ngdc
        request.session['email_ngdc_termlife']=email_ngdc
        request.session['cmt_ngdc_termlife']=cmt_ngdc
        request.session['ngaycap_ngdc_termlife']= ngaycap_ngdc
        request.session['noicapcmt_ngdc_termlife']=noicapcmt_ngdc
        request.session['thanhpho_ngdc_termlife']=thanhpho_ngdc
        request.session['huyen_ngdc_termlife']=huyen_ngdc
        request.session['diachi_ngdc_termlife']=diachi_ngdc
        request.session['tthon_ngdc_termlife']=tthon_ngdc
        request.session['detailjob_ngdc_termlife']=detailjob_ngdc
        request.session['cannang_ngdc_termlife']=cannang_ngdc
        request.session['chieucao_ngdc_termlife']=chieucao_ngdc
        request.session['quoctich_ngdc_termlife']=quoctich_ngdc
        request.session['congdanmy_ngdc_termlife']=congdanmy_ngdc
        request.session['quanhenm_termlife']=quanhenm
        request.session['hutthuoc_ngdc_termlife']=hutthuoc_ngdc
        request.session['base64cmttruoc_ngdc_termlife']=base64cmttruoc_ngdc
        request.session['base64cmtsau_ngdc_termlife']=base64cmtsau_ngdc

        #ngthuhuong1
        ten_nth1=request.POST.get('ten_nth1')
        gender_nth1=request.POST.get('gender_nth1')
        ngaysinh_nth1=request.POST.get('ngaysinh_nth1')
        thangsinh_nth1=request.POST.get('thangsinh_nth1')
        namsinh_nth1=request.POST.get('namsinh_nth1')
        cmt_nth1=request.POST.get('cmt_nth1')
        ngaycap_nth1=request.POST.get('ngaycap_nth1')
        noicapcmt_nth1=request.POST.get('noicapcmt_nth1')
        quanhe_nth1=request.POST.get('quanhe_nth1')
        tile_nth1=request.POST.get('tile_nth1')
        base64cmttruoc_nth1=request.POST.get('base64cmttruoc_nth1')
        base64cmtsau_nth1=request.POST.get('base64cmtsau_nth1')

        tk2=termlife_models.NguoiThuHuongTam.objects.create(nguoiduocbaohiemtam=tk1,fullname=ten_nth1,birth_day=ngaysinh_nth1,
                                                            birth_month=thangsinh_nth1,birth_year=namsinh_nth1,gioi_tinh=gender_nth1,
                                                            so_cmnd=cmt_nth1,cmt_ngay_cap=ngaycap_nth1,cmt_noi_cap=noicapcmt_nth1,
                                                            relationship=quanhe_nth1,ty_le_thu_huong=tile_nth1,images_cmt_mattruoc=base64cmttruoc_nth1,
                                                            images_cmt_matsau=base64cmtsau_nth1)

        request.session['ten_nth1_termlife']=ten_nth1
        request.session['gender_nth1_termlife']=gender_nth1
        request.session['ngaysinh_nth1_termlife']=ngaysinh_nth1
        request.session['thangsinh_nth1_termlife']=thangsinh_nth1
        request.session['namsinh_nth1_termlife']=namsinh_nth1
        request.session['cmt_nth1_termlife']=cmt_nth1
        request.session['ngaycap_nth1_termlife']=ngaycap_nth1
        request.session['noicapcmt_nth1_termlife']=noicapcmt_nth1
        request.session['quanhe_nth1_termlife']=quanhe_nth1
        request.session['tile_nth1_termlife']=tile_nth1
        request.session['base64cmttruoc_nth1_termlife']=base64cmttruoc_nth1
        request.session['base64cmtsau_nth1_termlife']=base64cmtsau_nth1

        #ngthuhuong2
        ten_nth2=request.POST.get('ten_nth2')
        gender_nth2=request.POST.get('gender_nth2')
        ngaysinh_nth2=request.POST.get('ngaysinh_nth2')
        thangsinh_nth2=request.POST.get('thangsinh_nth2')
        namsinh_nth2=request.POST.get('namsinh_nth2')
        cmt_nth2=request.POST.get('cmt_nth2')
        ngaycap_nth2=request.POST.get('ngaycap_nth2')
        noicapcmt_nth2=request.POST.get('noicapcmt_nth2')
        quanhe_nth2=request.POST.get('quanhe_nth2')
        tile_nth2=request.POST.get('tile_nth2')
        base64cmttruoc_nth2=request.POST.get('base64cmttruoc_nth2')
        base64cmtsau_nth2=request.POST.get('base64cmtsau_nth2')
        if ten_nth2 != None and gender_nth2 != None and ngaysinh_nth2 != None and thangsinh_nth2 != None and namsinh_nth2 != None and cmt_nth2 != None and ngaycap_nth2 != None and noicapcmt_nth2 != None and quanhe_nth2 != None and tile_nth2 != None and base64cmttruoc_nth2 != None and base64cmtsau_nth2 != None:
            tk3=termlife_models.NguoiThuHuongTam.objects.create(nguoiduocbaohiemtam=tk1,fullname=ten_nth2,birth_day=ngaysinh_nth2,
                                                            birth_month=thangsinh_nth2,birth_year=namsinh_nth2,gioi_tinh=gender_nth2,
                                                            so_cmnd=cmt_nth2,cmt_ngay_cap=ngaycap_nth2,cmt_noi_cap=noicapcmt_nth2,
                                                            relationship=quanhe_nth2,ty_le_thu_huong=tile_nth2,images_cmt_mattruoc=base64cmttruoc_nth2,
                                                            images_cmt_matsau=base64cmtsau_nth2)
            request.session['ten_nth2_termlife']=ten_nth2
            request.session['gender_nth2_termlife']=gender_nth2
            request.session['ngaysinh_nth2_termlife']=ngaysinh_nth2
            request.session['thangsinh_nth2_termlife']=thangsinh_nth2
            request.session['namsinh_nth2_termlife']=namsinh_nth2
            request.session['cmt_nth2_termlife']=cmt_nth2
            request.session['ngaycap_nth2_termlife']=ngaycap_nth2
            request.session['noicapcmt_nth2_termlife']=noicapcmt_nth2
            request.session['quanhe_nth2_termlife']=quanhe_nth2
            request.session['tile_nth2_termlife']=tile_nth2
            request.session['base64cmttruoc_nth2_termlife']=base64cmttruoc_nth2
            request.session['base64cmtsau_nth2_termlife']=base64cmtsau_nth2

        return redirect('termlife:question-health-hoanphi')


class ThaiSanView(LoginRequiredMixin,View):
    login_url = '/dang-nhap/'
    def get(self, request):
        list_provincial=Provincial.objects.all().order_by("name")
        list_job=LinhVuNgheNghiep.objects.all().order_by("code_linhvuc")

        sex_ngdc=request.session.get('sex_ngdc_termlife')
        name_ngdc=request.session.get('name_ngdc_termlife')
        ngays_ngdc=request.session.get('ngays_ngdc_termlife')
        thangs_ngdc=request.session.get('thangs_ngdc_termlife')
        nams_ngdc=request.session.get('nams_ngdc_termlife')
        phone_ngdc=request.session.get('phone_ngdc_termlife')
        age_ngdc=request.session.get('age_ngdc_termlife')

        sotienbh_termlife=request.session.get('sotienbh_termlife')
        sonamhd_termlife=request.session.get('sonamhd_termlife')
        sonamdp_termlife=request.session.get('sonamdp_termlife')
        cachtraphi_termlife=request.session.get('cachtraphi_termlife')
        spchinh_termlife=request.session.get('spchinh_termlife')
        loai_tra_phi_termlife=request.session.get('loai_tra_phi_termlife')
        smoking_ngdc_termlife=request.session.get('smoking_ngdc_termlife')
        sophichinh_termlife=request.session.get('sophichinh_termlife')
        phiVat=int(sophichinh_termlife*0.1)
        total_tl=int(sophichinh_termlife*1.1)
        if cachtraphi_termlife == 2 :
            cachtra="nhiều lần"
        else:
            cachtra="1 lần"
        context = {
            "list_data": list_provincial,
            'list_job':list_job,
            'name_ngdc':name_ngdc,
            'sex_ngdc':sex_ngdc,
            'ngays_ngdc':ngays_ngdc,
            'thangs_ngdc':thangs_ngdc,
            'nams_ngdc':nams_ngdc,
            'phone_ngdc':phone_ngdc,
            'sonamhd_termlife':sonamhd_termlife,
            'sonamdp_termlife':sonamdp_termlife,
            'cachtra':cachtra,
            'sotienbh_termlife': convert_price_to_string(sotienbh_termlife),
            'sophichinh_termlife': convert_price_to_string(sophichinh_termlife),
            'phiVat':convert_price_to_string(phiVat),
            'total_tl':convert_price_to_string(total_tl)

        }
        return render(request, 'termlife/thaisan-fubon.html',context)        
    def post (self, request):
        stbh_phauthuat=request.POST.get('stbh_phauthuat')
        snhd_phauthuat=request.POST.get('snhd_phauthuat')
        sndp_phauthuat=request.POST.get('sndp_phauthuat')
        ctp_phauthuat=request.POST.get('ctp_phauthuat')
        list_spp=[]

        if stbh_phauthuat != None and snhd_phauthuat != None and sndp_phauthuat != None and ctp_phauthuat != None:
            dictspp1={'loaispp':1,'stbh':stbh_phauthuat,'snhd':snhd_phauthuat,'sndp':sndp_phauthuat,'ctp':ctp_phauthuat}
            list_spp.append(dictspp1)
        stbh_hiemngheo=request.POST.get('stbh_hiemngheo')
        snhd_hiemngheo=request.POST.get('snhd_hiemngheo')
        sndp_hiemngheo=request.POST.get('sndp_hiemngheo')
        ctp_hiemngheo=request.POST.get('ctp_hiemngheo')
        if stbh_hiemngheo != None and snhd_hiemngheo != None and sndp_hiemngheo != None and ctp_hiemngheo != None:
            dictspp2={'loaispp':2,'stbh':stbh_hiemngheo,'snhd':snhd_hiemngheo,'sndp':sndp_hiemngheo,'ctp':ctp_hiemngheo}
            list_spp.append(dictspp2)

        request.session['list_spp_termlife']=list_spp

        #ngmua
        phone_ngmua=request.user.username
        name_nm=request.POST.get('name_nm')
        sex_nm=request.POST.get('sex_nm')
        daybirth_nm=request.POST.get('daybirth_nm')
        monthbirth_nm=request.POST.get('monthbirth_nm')
        yearbirth_nm=request.POST.get('yearbirth_nm')
        email_nm=request.POST.get('email_nm')
        cmt_nm=request.POST.get('cmt_nm')
        ngaycap_nm=request.POST.get('ngaycap_nm')
        noicapcmt_nm=request.POST.get('noicapcmt_nm')
        thanhpho_nm=request.POST.get('thanhpho_nm')
        huyen_nm=request.POST.get('huyen_nm')
        diachi_nm=request.POST.get('diachi_nm')

        tthon_nm=request.POST.get('tthon_nm')
        linhvuc_nm=request.POST.get('linhvuc_nm')
        job_nm=request.POST.get('job_nm')
        detailjob_nm=request.POST.get('detailjob_nm')
        cannang_nm=request.POST.get('cannang_nm')
        chieucao_nm=request.POST.get('chieucao_nm')
        quoctich_nm=request.POST.get('quoctich_nm')
        congdanmy_nm=request.POST.get('congdanmy_nm')
        base64cmttruoc_nm=request.POST.get('base64cmttruoc_nm')
        base64cmtsau_nm=request.POST.get('base64cmtsau_nm') 

        tk=NguoiMuaBaoHiemTam.objects.create(username=phone_ngmua,fullname=name_nm,birth_day=daybirth_nm,birth_month=monthbirth_nm,
                                            birth_year=yearbirth_nm, gioi_tinh=sex_nm,email=email_nm,dia_chi_tinh_thanh_pho=thanhpho_nm,
                                            dia_chi_quan_huyen=huyen_nm,dia_chi_chi_tiet=diachi_nm,so_cmnd=cmt_nm,
                                            cmt_ngay_cap=ngaycap_nm,cmt_noi_cap=noicapcmt_nm,images_cmt_mattruoc=base64cmttruoc_nm,
                                            images_cmt_matsau=base64cmtsau_nm,status_marriage=tthon_nm,job=detailjob_nm,weight=cannang_nm,
                                            height=chieucao_nm,nationality=quoctich_nm,nationality_paper=congdanmy_nm)

        request.session['name_nm_termlife']=name_nm
        request.session['sex_nm_termlife']=sex_nm
        request.session['daybirth_nm_termlife']=daybirth_nm
        request.session['monthbirth_nm_termlife']=monthbirth_nm
        request.session['yearbirth_nm_termlife']= yearbirth_nm
        request.session['sdt_nm_termlife']=phone_ngmua
        request.session['email_nm_termlife']=email_nm
        request.session['cmt_nm_termlife']=cmt_nm
        request.session['ngaycap_nm_termlife']= ngaycap_nm
        request.session['noicapcmt_nm_termlife']=noicapcmt_nm
        request.session['thanhpho_nm_termlife']=thanhpho_nm
        request.session['huyen_nm_termlife']=huyen_nm
        request.session['diachi_nm_termlife']=diachi_nm
        request.session['tthon_nm_termlife']=tthon_nm
        request.session['detailjob_nm_termlife']=detailjob_nm
        request.session['cannang_nm_termlife']=cannang_nm
        request.session['chieucao_nm_termlife']=chieucao_nm
        request.session['quoctich_nm_termlife']=quoctich_nm
        request.session['congdanmy_nm_termlife']=congdanmy_nm
        request.session['base64cmttruoc_nm_termlife']=base64cmttruoc_nm
        request.session['base64cmtsau_nm_termlife']=base64cmtsau_nm

        #ngdc
        name_ngdc=request.POST.get('name_ngdc')
        sex_ngdc=request.POST.get('sex_ngdc')
        daybirth_ngdc=request.POST.get('daybirth_ngdc')
        monthbirth_ngdc=request.POST.get('monthbirth_ngdc')
        yearbirth_ngdc=request.POST.get('yearbirth_ngdc')
        sdt_ngdc=request.session.get('phone_ngdc_termlife')
        email_ngdc=request.POST.get('email_ngdc')
        cmt_ngdc=request.POST.get('cmt_ngdc')
        ngaycap_ngdc=request.POST.get('ngaycap_ngdc')
        noicapcmt_ngdc=request.POST.get('noicapcmt_ngdc')
        thanhpho_ngdc=request.POST.get('thanhpho_ngdc')
        huyen_ngdc=request.POST.get('huyen_ngdc')
        diachi_ngdc=request.POST.get('diachi_ngdc')
        tthon_ngdc=request.POST.get('tthon_ngdc')
        linhvuc_ngdc=request.POST.get('linhvuc_ngdc')
        job_ngdc=request.POST.get('job_ngdc')
        detailjob_ngdc=request.POST.get('detailjob_ngdc')
        cannang_ngdc=request.POST.get('cannang_ngdc')
        chieucao_ngdc=request.POST.get('chieucao_ngdc')
        quoctich_ngdc=request.POST.get('quoctich_ngdc')
        congdanmy_ngdc=request.POST.get('congdanmy_ngdc')
        quanhenm=request.POST.get('quanhenm')
        hutthuoc_ngdc=request.POST.get('hutthuoc_ngdc')
        base64cmttruoc_ngdc=request.POST.get('base64cmttruoc_ngdc')
        base64cmtsau_ngdc=request.POST.get('base64cmtsau_ngdc')

        sotienbh_termlife=request.session.get('sotienbh_termlife')
        sonamhd_termlife=request.session.get('sonamhd_termlife')
        sonamdp_termlife=request.session.get('sonamdp_termlife')
        cachtraphi_termlife=request.session.get('cachtraphi_termlife')
        loai_tra_phi_termlife=request.session.get('loai_tra_phi_termlife')

        tk1=termlife_models.NguoiDuocBaoHiemTam.objects.create(nguoimuabaohiemtam=tk,username=sdt_ngdc,fullname=name_ngdc,birth_day=daybirth_ngdc,
                                            birth_month=monthbirth_ngdc,
                                            birth_year=yearbirth_ngdc, gioi_tinh=sex_ngdc,email=email_ngdc,dia_chi_tinh_thanh_pho=thanhpho_ngdc,
                                            dia_chi_quan_huyen=huyen_ngdc,dia_chi_chi_tiet=diachi_ngdc,so_cmnd=cmt_ngdc,
                                            cmt_ngay_cap=ngaycap_ngdc,cmt_noi_cap=noicapcmt_ngdc,images_cmt_mattruoc=base64cmttruoc_ngdc,
                                            images_cmt_matsau=base64cmtsau_ngdc,status_marriage=tthon_ngdc,job=detailjob_ngdc,weight=cannang_ngdc,
                                            height=chieucao_ngdc,nationality=quoctich_ngdc,nationality_paper=congdanmy_ngdc,relationship=quanhenm,
                                            is_smoke=hutthuoc_ngdc,so_tien_bao_hiem=sotienbh_termlife,so_nam_hop_dong=sonamhd_termlife,
                                            so_nam_dong_phi=sonamdp_termlife,cach_tra_phi=cachtraphi_termlife,dinh_ky_dong_phi=loai_tra_phi_termlife)

        request.session['name_ngdc_termlife']=name_ngdc
        request.session['sex_ngdc_termlife']=sex_ngdc
        request.session['daybirth_ngdc_termlife']=daybirth_ngdc
        request.session['monthbirth_ngdc_termlife']=monthbirth_ngdc
        request.session['yearbirth_ngdc_termlife']= yearbirth_ngdc
        request.session['email_ngdc_termlife']=email_ngdc
        request.session['cmt_ngdc_termlife']=cmt_ngdc
        request.session['ngaycap_ngdc_termlife']= ngaycap_ngdc
        request.session['noicapcmt_ngdc_termlife']=noicapcmt_ngdc
        request.session['thanhpho_ngdc_termlife']=thanhpho_ngdc
        request.session['huyen_ngdc_termlife']=huyen_ngdc
        request.session['diachi_ngdc_termlife']=diachi_ngdc
        request.session['tthon_ngdc_termlife']=tthon_ngdc
        request.session['detailjob_ngdc_termlife']=detailjob_ngdc
        request.session['cannang_ngdc_termlife']=cannang_ngdc
        request.session['chieucao_ngdc_termlife']=chieucao_ngdc
        request.session['quoctich_ngdc_termlife']=quoctich_ngdc
        request.session['congdanmy_ngdc_termlife']=congdanmy_ngdc
        request.session['quanhenm_termlife']=quanhenm
        request.session['hutthuoc_ngdc_termlife']=hutthuoc_ngdc
        request.session['base64cmttruoc_ngdc_termlife']=base64cmttruoc_ngdc
        request.session['base64cmtsau_ngdc_termlife']=base64cmtsau_ngdc

        #ngthuhuong1
        ten_nth1=request.POST.get('ten_nth1')
        gender_nth1=request.POST.get('gender_nth1')
        ngaysinh_nth1=request.POST.get('ngaysinh_nth1')
        thangsinh_nth1=request.POST.get('thangsinh_nth1')
        namsinh_nth1=request.POST.get('namsinh_nth1')
        cmt_nth1=request.POST.get('cmt_nth1')
        ngaycap_nth1=request.POST.get('ngaycap_nth1')
        noicapcmt_nth1=request.POST.get('noicapcmt_nth1')
        quanhe_nth1=request.POST.get('quanhe_nth1')
        tile_nth1=request.POST.get('tile_nth1')
        base64cmttruoc_nth1=request.POST.get('base64cmttruoc_nth1')
        base64cmtsau_nth1=request.POST.get('base64cmtsau_nth1')

        tk2=termlife_models.NguoiThuHuongTam.objects.create(nguoiduocbaohiemtam=tk1,fullname=ten_nth1,birth_day=ngaysinh_nth1,
                                                            birth_month=thangsinh_nth1,birth_year=namsinh_nth1,gioi_tinh=gender_nth1,
                                                            so_cmnd=cmt_nth1,cmt_ngay_cap=ngaycap_nth1,cmt_noi_cap=noicapcmt_nth1,
                                                            relationship=quanhe_nth1,ty_le_thu_huong=tile_nth1,images_cmt_mattruoc=base64cmttruoc_nth1,
                                                            images_cmt_matsau=base64cmtsau_nth1)

        request.session['ten_nth1_termlife']=ten_nth1
        request.session['gender_nth1_termlife']=gender_nth1
        request.session['ngaysinh_nth1_termlife']=ngaysinh_nth1
        request.session['thangsinh_nth1_termlife']=thangsinh_nth1
        request.session['namsinh_nth1_termlife']=namsinh_nth1
        request.session['cmt_nth1_termlife']=cmt_nth1
        request.session['ngaycap_nth1_termlife']=ngaycap_nth1
        request.session['noicapcmt_nth1_termlife']=noicapcmt_nth1
        request.session['quanhe_nth1_termlife']=quanhe_nth1
        request.session['tile_nth1_termlife']=tile_nth1
        request.session['base64cmttruoc_nth1_termlife']=base64cmttruoc_nth1
        request.session['base64cmtsau_nth1_termlife']=base64cmtsau_nth1

        #ngthuhuong2
        ten_nth2=request.POST.get('ten_nth2')
        gender_nth2=request.POST.get('gender_nth2')
        ngaysinh_nth2=request.POST.get('ngaysinh_nth2')
        thangsinh_nth2=request.POST.get('thangsinh_nth2')
        namsinh_nth2=request.POST.get('namsinh_nth2')
        cmt_nth2=request.POST.get('cmt_nth2')
        ngaycap_nth2=request.POST.get('ngaycap_nth2')
        noicapcmt_nth2=request.POST.get('noicapcmt_nth2')
        quanhe_nth2=request.POST.get('quanhe_nth2')
        tile_nth2=request.POST.get('tile_nth2')
        base64cmttruoc_nth2=request.POST.get('base64cmttruoc_nth2')
        base64cmtsau_nth2=request.POST.get('base64cmtsau_nth2')
        if ten_nth2 != None and gender_nth2 != None and ngaysinh_nth2 != None and thangsinh_nth2 != None and namsinh_nth2 != None and cmt_nth2 != None and ngaycap_nth2 != None and noicapcmt_nth2 != None and quanhe_nth2 != None and tile_nth2 != None and base64cmttruoc_nth2 != None and base64cmtsau_nth2 != None:
            tk3=termlife_models.NguoiThuHuongTam.objects.create(nguoiduocbaohiemtam=tk1,fullname=ten_nth2,birth_day=ngaysinh_nth2,
                                                            birth_month=thangsinh_nth2,birth_year=namsinh_nth2,gioi_tinh=gender_nth2,
                                                            so_cmnd=cmt_nth2,cmt_ngay_cap=ngaycap_nth2,cmt_noi_cap=noicapcmt_nth2,
                                                            relationship=quanhe_nth2,ty_le_thu_huong=tile_nth2,images_cmt_mattruoc=base64cmttruoc_nth2,
                                                            images_cmt_matsau=base64cmtsau_nth2)
            request.session['ten_nth2_termlife']=ten_nth2
            request.session['gender_nth2_termlife']=gender_nth2
            request.session['ngaysinh_nth2_termlife']=ngaysinh_nth2
            request.session['thangsinh_nth2_termlife']=thangsinh_nth2
            request.session['namsinh_nth2_termlife']=namsinh_nth2
            request.session['cmt_nth2_termlife']=cmt_nth2
            request.session['ngaycap_nth2_termlife']=ngaycap_nth2
            request.session['noicapcmt_nth2_termlife']=noicapcmt_nth2
            request.session['quanhe_nth2_termlife']=quanhe_nth2
            request.session['tile_nth2_termlife']=tile_nth2
            request.session['base64cmttruoc_nth2_termlife']=base64cmttruoc_nth2
            request.session['base64cmtsau_nth2_termlife']=base64cmtsau_nth2

        return redirect('termlife:question-health-hoanphi')


class QuestionHealthHoanPhiView(LoginRequiredMixin,View):
    login_url = '/dang-nhap/'
    def get(self, request):
        return render(request, 'termlife/question-health-hoanphi.html')
    def post (self, request):
        chukyngmua=request.POST.get('chukyngmua')
        chukyngdc=request.POST.get('chukyngdc')
        # quest1
        quest1,quest2,quest3,quest4,quest5,quest6,quest7,quest8=[],[],[],[],[],[],[],[]

        ngay_dieu_tri11=request.POST.get('ngay_dieu_tri11')
        chuan_doan11=request.POST.get('chuan_doan11')
        chi_tiet_dieu_tri11=request.POST.get('chi_tiet_dieu_tri11')
        ket_qua11=request.POST.get('ket_qua11')
        benhvien_bacsi11=request.POST.get('benhvien_bacsi11')

        ngay_dieu_tri12=request.POST.get('ngay_dieu_tri12')
        chuan_doan12=request.POST.get('chuan_doan12')
        chi_tiet_dieu_tri12=request.POST.get('chi_tiet_dieu_tri12')
        ket_qua12=request.POST.get('ket_qua12')
        benhvien_bacsi12=request.POST.get('benhvien_bacsi12')

        ngay_dieu_tri13=request.POST.get('ngay_dieu_tri13')
        chuan_doan13=request.POST.get('chuan_doan13')
        chi_tiet_dieu_tri13=request.POST.get('chi_tiet_dieu_tri13')
        ket_qua13=request.POST.get('ket_qua13')
        benhvien_bacsi13=request.POST.get('benhvien_bacsi13')

        if ngay_dieu_tri11 != None and chuan_doan11 != None and chi_tiet_dieu_tri11 != None and ket_qua11 != None and benhvien_bacsi11 != None:
            lan1={'ngdt':ngay_dieu_tri11,'cdoan':chuan_doan11,'ctdt':chi_tiet_dieu_tri11,'ketqua':ket_qua11,'bacsi':benhvien_bacsi11}
            quest1.append(lan1)
        if ngay_dieu_tri12 != None and chuan_doan12 != None and chi_tiet_dieu_tri12 != None and ket_qua12 != None and benhvien_bacsi12 != None:
            lan2={'ngdt':ngay_dieu_tri12,'cdoan':chuan_doan12,'ctdt':chi_tiet_dieu_tri12,'ketqua':ket_qua12,'bacsi':benhvien_bacsi12}
            quest1.append(lan2)
        if ngay_dieu_tri13 != None and chuan_doan13 != None and chi_tiet_dieu_tri13 != None and ket_qua13 != None and benhvien_bacsi13 != None:
            lan3={'ngdt':ngay_dieu_tri13,'cdoan':chuan_doan13,'ctdt':chi_tiet_dieu_tri13,'ketqua':ket_qua13,'bacsi':benhvien_bacsi13}
            quest1.append(lan3)
        # quest2
        ngay_dieu_tri21=request.POST.get('ngay_dieu_tri21')
        chuan_doan21=request.POST.get('chuan_doan21')
        chi_tiet_dieu_tri21=request.POST.get('chi_tiet_dieu_tri21')
        ket_qua21=request.POST.get('ket_qua21')
        benhvien_bacsi21=request.POST.get('benhvien_bacsi21')

        ngay_dieu_tri22=request.POST.get('ngay_dieu_tri22')
        chuan_doan22=request.POST.get('chuan_doan22')
        chi_tiet_dieu_tri22=request.POST.get('chi_tiet_dieu_tri22')
        ket_qua22=request.POST.get('ket_qua22')
        benhvien_bacsi22=request.POST.get('benhvien_bacsi22')

        ngay_dieu_tri23=request.POST.get('ngay_dieu_tri23')
        chuan_doan23=request.POST.get('chuan_doan23')
        chi_tiet_dieu_tri23=request.POST.get('chi_tiet_dieu_tri23')
        ket_qua23=request.POST.get('ket_qua23')
        benhvien_bacsi23=request.POST.get('benhvien_bacsi23')

        if ngay_dieu_tri21 != None and chuan_doan21 != None and chi_tiet_dieu_tri21 != None and ket_qua21 != None and  benhvien_bacsi21 != None:
            lan1={'ngdt':ngay_dieu_tri21,'cdoan':chuan_doan21,'ctdt':chi_tiet_dieu_tri21,'ketqua':ket_qua21,'bacsi':benhvien_bacsi21}
            quest2.append(lan1)
        if ngay_dieu_tri22 != None and chuan_doan22 != None and chi_tiet_dieu_tri22 != None and ket_qua22 != None and benhvien_bacsi22 != None:
            lan2={'ngdt':ngay_dieu_tri22,'cdoan':chuan_doan22,'ctdt':chi_tiet_dieu_tri22,'ketqua':ket_qua22,'bacsi':benhvien_bacsi22}
            quest2.append(lan2)
        if ngay_dieu_tri23 != None and chuan_doan23 != None and chi_tiet_dieu_tri23 != None and ket_qua23 != None and benhvien_bacsi23 != None:
            lan3={'ngdt':ngay_dieu_tri23,'cdoan':chuan_doan23,'ctdt':chi_tiet_dieu_tri23,'ketqua':ket_qua23,'bacsi':benhvien_bacsi23}
            quest2.append(lan3)

        # quest3
        ngay_dieu_tri31=request.POST.get('ngay_dieu_tri31')
        chuan_doan31=request.POST.get('chuan_doan31')
        chi_tiet_dieu_tri31=request.POST.get('chi_tiet_dieu_tri31')
        ket_qua31=request.POST.get('ket_qua31')
        benhvien_bacsi31=request.POST.get('benhvien_bacsi31')

        ngay_dieu_tri32=request.POST.get('ngay_dieu_tri32')
        chuan_doan32=request.POST.get('chuan_doan32')
        chi_tiet_dieu_tri32=request.POST.get('chi_tiet_dieu_tri32')
        ket_qua32=request.POST.get('ket_qua32')
        benhvien_bacsi32=request.POST.get('benhvien_bacsi32')

        ngay_dieu_tri33=request.POST.get('ngay_dieu_tri33')
        chuan_doan33=request.POST.get('chuan_doan33')
        chi_tiet_dieu_tri33=request.POST.get('chi_tiet_dieu_tri33')
        ket_qua33=request.POST.get('ket_qua33')
        benhvien_bacsi33=request.POST.get('benhvien_bacsi33')

        if ngay_dieu_tri31 != None and chuan_doan31 != None and chi_tiet_dieu_tri31 != None and ket_qua31 != None and benhvien_bacsi31 != None:
            lan1={'ngdt':ngay_dieu_tri31,'cdoan':chuan_doan31,'ctdt':chi_tiet_dieu_tri31,'ketqua':ket_qua31,'bacsi':benhvien_bacsi31}
            quest3.append(lan1)
        if ngay_dieu_tri32 != None and chuan_doan32 != None and chi_tiet_dieu_tri32 != None and ket_qua32 != None and benhvien_bacsi32 != None:
            lan2={'ngdt':ngay_dieu_tri32,'cdoan':chuan_doan32,'ctdt':chi_tiet_dieu_tri32,'ketqua':ket_qua32,'bacsi':benhvien_bacsi32}
            quest3.append(lan2)
        if ngay_dieu_tri33 != None and chuan_doan33 != None and chi_tiet_dieu_tri33 != None and ket_qua33 != None and benhvien_bacsi33 != None:
            lan3={'ngdt':ngay_dieu_tri33,'cdoan':chuan_doan33,'ctdt':chi_tiet_dieu_tri33,'ketqua':ket_qua33,'bacsi':benhvien_bacsi33}
            quest3.append(lan3)

        # quest4
        ngay_dieu_tri41=request.POST.get('ngay_dieu_tri41')
        chuan_doan41=request.POST.get('chuan_doan41')
        chi_tiet_dieu_tri41=request.POST.get('chi_tiet_dieu_tri41')
        ket_qua41=request.POST.get('ket_qua41')
        benhvien_bacsi41=request.POST.get('benhvien_bacsi41')

        ngay_dieu_tri42=request.POST.get('ngay_dieu_tri42')
        chuan_doan42=request.POST.get('chuan_doan42')
        chi_tiet_dieu_tri42=request.POST.get('chi_tiet_dieu_tri42')
        ket_qua42=request.POST.get('ket_qua42')
        benhvien_bacsi42=request.POST.get('benhvien_bacsi42')

        ngay_dieu_tri43=request.POST.get('ngay_dieu_tri43')
        chuan_doan43=request.POST.get('chuan_doan43')
        chi_tiet_dieu_tri43=request.POST.get('chi_tiet_dieu_tri43')
        ket_qua43=request.POST.get('ket_qua43')
        benhvien_bacsi43=request.POST.get('benhvien_bacsi43')

        if ngay_dieu_tri41 != None and chuan_doan41 != None and chi_tiet_dieu_tri41 != None and ket_qua41 != None and benhvien_bacsi41 != None:
            lan1={'ngdt':ngay_dieu_tri41,'cdoan':chuan_doan41,'ctdt':chi_tiet_dieu_tri41,'ketqua':ket_qua41,'bacsi':benhvien_bacsi41}
            quest4.append(lan1)
        if ngay_dieu_tri42 != None and chuan_doan42 != None and chi_tiet_dieu_tri42 != None and ket_qua42 != None and benhvien_bacsi42 != None:
            lan2={'ngdt':ngay_dieu_tri42,'cdoan':chuan_doan42,'ctdt':chi_tiet_dieu_tri42,'ketqua':ket_qua42,'bacsi':benhvien_bacsi42}
            quest4.append(lan2)
        if ngay_dieu_tri43 != None and chuan_doan43 != None and chi_tiet_dieu_tri43 != None and ket_qua43 != None and benhvien_bacsi43 != None:
            lan3={'ngdt':ngay_dieu_tri43,'cdoan':chuan_doan43,'ctdt':chi_tiet_dieu_tri43,'ketqua':ket_qua43,'bacsi':benhvien_bacsi43}
            quest4.append(lan3)

       # quest5
        ngay_dieu_tri51=request.POST.get('ngay_dieu_tri51')
        chuan_doan51=request.POST.get('chuan_doan51')
        chi_tiet_dieu_tri51=request.POST.get('chi_tiet_dieu_tri51')
        ket_qua51=request.POST.get('ket_qua51')
        benhvien_bacsi51=request.POST.get('benhvien_bacsi51')

        ngay_dieu_tri52=request.POST.get('ngay_dieu_tri52')
        chuan_doan52=request.POST.get('chuan_doan52')
        chi_tiet_dieu_tri52=request.POST.get('chi_tiet_dieu_tri52')
        ket_qua52=request.POST.get('ket_qua52')
        benhvien_bacsi52=request.POST.get('benhvien_bacsi52')

        ngay_dieu_tri53=request.POST.get('ngay_dieu_tri53')
        chuan_doan53=request.POST.get('chuan_doan53')
        chi_tiet_dieu_tri53=request.POST.get('chi_tiet_dieu_tri53')
        ket_qua53=request.POST.get('ket_qua53')
        benhvien_bacsi53=request.POST.get('benhvien_bacsi53')

        if ngay_dieu_tri51 != None and chuan_doan51 != None and chi_tiet_dieu_tri51 != None and ket_qua51 != None and benhvien_bacsi51 != None:
            lan1={'ngdt':ngay_dieu_tri51,'cdoan':chuan_doan51,'ctdt':chi_tiet_dieu_tri51,'ketqua':ket_qua51,'bacsi':benhvien_bacsi51}
            quest5.append(lan1)
        if ngay_dieu_tri52 != None and chuan_doan52 != None and chi_tiet_dieu_tri52 != None and ket_qua52 != None and benhvien_bacsi52 != None:
            lan2={'ngdt':ngay_dieu_tri52,'cdoan':chuan_doan52,'ctdt':chi_tiet_dieu_tri52,'ketqua':ket_qua52,'bacsi':benhvien_bacsi52}
            quest5.append(lan2)
        if ngay_dieu_tri53 != None and chuan_doan53 != None and chi_tiet_dieu_tri53 != None and ket_qua53 != None and benhvien_bacsi53 != None:
            lan3={'ngdt':ngay_dieu_tri53,'cdoan':chuan_doan53,'ctdt':chi_tiet_dieu_tri53,'ketqua':ket_qua53,'bacsi':benhvien_bacsi53}
            quest5.append(lan3)

        # quest6
        ngay_dieu_tri61=request.POST.get('ngay_dieu_tri61')
        chuan_doan61=request.POST.get('chuan_doan61')
        chi_tiet_dieu_tri61=request.POST.get('chi_tiet_dieu_tri61')
        ket_qua61=request.POST.get('ket_qua61')
        benhvien_bacsi61=request.POST.get('benhvien_bacsi61')

        ngay_dieu_tri62=request.POST.get('ngay_dieu_tri62')
        chuan_doan62=request.POST.get('chuan_doan62')
        chi_tiet_dieu_tri62=request.POST.get('chi_tiet_dieu_tri62')
        ket_qua62=request.POST.get('ket_qua62')
        benhvien_bacsi62=request.POST.get('benhvien_bacsi62')

        ngay_dieu_tri63=request.POST.get('ngay_dieu_tri63')
        chuan_doan63=request.POST.get('chuan_doan63')
        chi_tiet_dieu_tri63=request.POST.get('chi_tiet_dieu_tri63')
        ket_qua63=request.POST.get('ket_qua63')
        benhvien_bacsi63=request.POST.get('benhvien_bacsi63')

        if ngay_dieu_tri61 != None and chuan_doan61 != None and chi_tiet_dieu_tri61 != None and ket_qua61 != None and benhvien_bacsi61 != None:
            lan1={'ngdt':ngay_dieu_tri61,'cdoan':chuan_doan61,'ctdt':chi_tiet_dieu_tri61,'ketqua':ket_qua61,'bacsi':benhvien_bacsi61}
            quest6.append(lan1)
        if ngay_dieu_tri62 != None and chuan_doan62 != None and chi_tiet_dieu_tri62 != None and ket_qua62 != None and benhvien_bacsi62 != None:
            lan2={'ngdt':ngay_dieu_tri62,'cdoan':chuan_doan62,'ctdt':chi_tiet_dieu_tri62,'ketqua':ket_qua62,'bacsi':benhvien_bacsi62}
            quest6.append(lan2)
        if ngay_dieu_tri63 != None and chuan_doan63 != None and chi_tiet_dieu_tri63 != None and ket_qua63 != None and benhvien_bacsi63 != None:
            lan3={'ngdt':ngay_dieu_tri63,'cdoan':chuan_doan63,'ctdt':chi_tiet_dieu_tri63,'ketqua':ket_qua63,'bacsi':benhvien_bacsi63}
            quest6.append(lan3)
        # quest7
        ngay_dieu_tri71=request.POST.get('ngay_dieu_tri71')
        chuan_doan71=request.POST.get('chuan_doan71')
        chi_tiet_dieu_tri71=request.POST.get('chi_tiet_dieu_tri71')
        ket_qua71=request.POST.get('ket_qua71')
        benhvien_bacsi71=request.POST.get('benhvien_bacsi71')

        ngay_dieu_tri72=request.POST.get('ngay_dieu_tri72')
        chuan_doan72=request.POST.get('chuan_doan72')
        chi_tiet_dieu_tri72=request.POST.get('chi_tiet_dieu_tri72')
        ket_qua72=request.POST.get('ket_qua72')
        benhvien_bacsi72=request.POST.get('benhvien_bacsi72')

        ngay_dieu_tri73=request.POST.get('ngay_dieu_tri73')
        chuan_doan73=request.POST.get('chuan_doan73')
        chi_tiet_dieu_tri73=request.POST.get('chi_tiet_dieu_tri73')
        ket_qua73=request.POST.get('ket_qua73')
        benhvien_bacsi73=request.POST.get('benhvien_bacsi73')

        if ngay_dieu_tri71 != None and chuan_doan71 != None and chi_tiet_dieu_tri71 != None and ket_qua71 != None and benhvien_bacsi71 != None:
            lan1={'ngdt':ngay_dieu_tri71,'cdoan':chuan_doan71,'ctdt':chi_tiet_dieu_tri71,'ketqua':ket_qua71,'bacsi':benhvien_bacsi71}
            quest7.append(lan1)
        if ngay_dieu_tri72 != None and chuan_doan72 != None and chi_tiet_dieu_tri72 != None and ket_qua72 != None and benhvien_bacsi72 != None:
            lan2={'ngdt':ngay_dieu_tri72,'cdoan':chuan_doan72,'ctdt':chi_tiet_dieu_tri72,'ketqua':ket_qua72,'bacsi':benhvien_bacsi72}
            quest7.append(lan2)
        if ngay_dieu_tri73 != None and chuan_doan73 != None and chi_tiet_dieu_tri73 != None and ket_qua73 != None and benhvien_bacsi73 != None:
            lan3={'ngdt':ngay_dieu_tri73,'cdoan':chuan_doan73,'ctdt':chi_tiet_dieu_tri73,'ketqua':ket_qua73,'bacsi':benhvien_bacsi73}
            quest7.append(lan3)
        # quest8
        ngay_dieu_tri81=request.POST.get('ngay_dieu_tri81')
        chuan_doan81=request.POST.get('chuan_doan81')
        chi_tiet_dieu_tri81=request.POST.get('chi_tiet_dieu_tri81')
        ket_qua81=request.POST.get('ket_qua81')
        benhvien_bacsi81=request.POST.get('benhvien_bacsi81')

        ngay_dieu_tri82=request.POST.get('ngay_dieu_tri82')
        chuan_doan82=request.POST.get('chuan_doan82')
        chi_tiet_dieu_tri82=request.POST.get('chi_tiet_dieu_tri82')
        ket_qua82=request.POST.get('ket_qua82')
        benhvien_bacsi82=request.POST.get('benhvien_bacsi82')

        ngay_dieu_tri83=request.POST.get('ngay_dieu_tri83')
        chuan_doan83=request.POST.get('chuan_doan83')
        chi_tiet_dieu_tri83=request.POST.get('chi_tiet_dieu_tri83')
        ket_qua83=request.POST.get('ket_qua83')
        benhvien_bacsi83=request.POST.get('benhvien_bacsi83')

        if ngay_dieu_tri81 != None and chuan_doan81 != None and chi_tiet_dieu_tri81 != None and ket_qua81 != None and benhvien_bacsi81 != None:
            lan1={'ngdt':ngay_dieu_tri81,'cdoan':chuan_doan81,'ctdt':chi_tiet_dieu_tri81,'ketqua':ket_qua81,'bacsi':benhvien_bacsi81}
            quest8.append(lan1)
        if ngay_dieu_tri82 != None and chuan_doan82 != None and chi_tiet_dieu_tri82 != None and ket_qua82 != None and benhvien_bacsi82 != None:
            lan2={'ngdt':ngay_dieu_tri82,'cdoan':chuan_doan82,'ctdt':chi_tiet_dieu_tri82,'ketqua':ket_qua82,'bacsi':benhvien_bacsi82}
            quest8.append(lan2)
        if ngay_dieu_tri83 != None and chuan_doan83 != None and chi_tiet_dieu_tri83 != None and ket_qua83 != None and benhvien_bacsi83 != None:
            lan3={'ngdt':ngay_dieu_tri83,'cdoan':chuan_doan83,'ctdt':chi_tiet_dieu_tri83,'ketqua':ket_qua83,'bacsi':benhvien_bacsi83}
            quest8.append(lan3)
        request.session['quest1_termlife']=quest1
        request.session['quest2_termlife']=quest2
        request.session['quest3_termlife']=quest3
        request.session['quest4_termlife']=quest4
        request.session['quest5_termlife']=quest5
        request.session['quest6_termlife']=quest6
        request.session['quest7_termlife']=quest7
        request.session['quest8_termlife']=quest8
        request.session['chukyngmua_termlife']=chukyngmua
        request.session['chukyngdc_termlife']=chukyngdc

        return redirect('termlife:summary-order-termlife') 


class QuestionHealthTruyenThongView(LoginRequiredMixin,View):
    login_url = '/dang-nhap/'
    def get(self, request):
        return render(request, 'termlife/question-health-truyenthong.html')
    def post (self, request):
        chukyngmua=request.POST.get('chukyngmua')
        chukyngdc=request.POST.get('chukyngdc')
        # quest1
        quest1,quest2,quest3,quest4,quest5,quest6,quest7,quest8=[],[],[],[],[],[],[],[]

        ngay_dieu_tri11=request.POST.get('ngay_dieu_tri11')
        chuan_doan11=request.POST.get('chuan_doan11')
        chi_tiet_dieu_tri11=request.POST.get('chi_tiet_dieu_tri11')
        ket_qua11=request.POST.get('ket_qua11')
        benhvien_bacsi11=request.POST.get('benhvien_bacsi11')

        ngay_dieu_tri12=request.POST.get('ngay_dieu_tri12')
        chuan_doan12=request.POST.get('chuan_doan12')
        chi_tiet_dieu_tri12=request.POST.get('chi_tiet_dieu_tri12')
        ket_qua12=request.POST.get('ket_qua12')
        benhvien_bacsi12=request.POST.get('benhvien_bacsi12')

        ngay_dieu_tri13=request.POST.get('ngay_dieu_tri13')
        chuan_doan13=request.POST.get('chuan_doan13')
        chi_tiet_dieu_tri13=request.POST.get('chi_tiet_dieu_tri13')
        ket_qua13=request.POST.get('ket_qua13')
        benhvien_bacsi13=request.POST.get('benhvien_bacsi13')

        if ngay_dieu_tri11 != None and chuan_doan11 != None and chi_tiet_dieu_tri11 != None and ket_qua11 != None and benhvien_bacsi11 != None:
            lan1={'ngdt':ngay_dieu_tri11,'cdoan':chuan_doan11,'ctdt':chi_tiet_dieu_tri11,'ketqua':ket_qua11,'bacsi':benhvien_bacsi11}
            quest1.append(lan1)
        if ngay_dieu_tri12 != None and chuan_doan12 != None and chi_tiet_dieu_tri12 != None and ket_qua12 != None and benhvien_bacsi12 != None:
            lan2={'ngdt':ngay_dieu_tri12,'cdoan':chuan_doan12,'ctdt':chi_tiet_dieu_tri12,'ketqua':ket_qua12,'bacsi':benhvien_bacsi12}
            quest1.append(lan2)
        if ngay_dieu_tri13 != None and chuan_doan13 != None and chi_tiet_dieu_tri13 != None and ket_qua13 != None and benhvien_bacsi13 != None:
            lan3={'ngdt':ngay_dieu_tri13,'cdoan':chuan_doan13,'ctdt':chi_tiet_dieu_tri13,'ketqua':ket_qua13,'bacsi':benhvien_bacsi13}
            quest1.append(lan3)
        # quest2
        ngay_dieu_tri21=request.POST.get('ngay_dieu_tri21')
        chuan_doan21=request.POST.get('chuan_doan21')
        chi_tiet_dieu_tri21=request.POST.get('chi_tiet_dieu_tri21')
        ket_qua21=request.POST.get('ket_qua21')
        benhvien_bacsi21=request.POST.get('benhvien_bacsi21')

        ngay_dieu_tri22=request.POST.get('ngay_dieu_tri22')
        chuan_doan22=request.POST.get('chuan_doan22')
        chi_tiet_dieu_tri22=request.POST.get('chi_tiet_dieu_tri22')
        ket_qua22=request.POST.get('ket_qua22')
        benhvien_bacsi22=request.POST.get('benhvien_bacsi22')

        ngay_dieu_tri23=request.POST.get('ngay_dieu_tri23')
        chuan_doan23=request.POST.get('chuan_doan23')
        chi_tiet_dieu_tri23=request.POST.get('chi_tiet_dieu_tri23')
        ket_qua23=request.POST.get('ket_qua23')
        benhvien_bacsi23=request.POST.get('benhvien_bacsi23')

        if ngay_dieu_tri21 != None and chuan_doan21 != None and chi_tiet_dieu_tri21 != None and ket_qua21 != None and  benhvien_bacsi21 != None:
            lan1={'ngdt':ngay_dieu_tri21,'cdoan':chuan_doan21,'ctdt':chi_tiet_dieu_tri21,'ketqua':ket_qua21,'bacsi':benhvien_bacsi21}
            quest2.append(lan1)
        if ngay_dieu_tri22 != None and chuan_doan22 != None and chi_tiet_dieu_tri22 != None and ket_qua22 != None and benhvien_bacsi22 != None:
            lan2={'ngdt':ngay_dieu_tri22,'cdoan':chuan_doan22,'ctdt':chi_tiet_dieu_tri22,'ketqua':ket_qua22,'bacsi':benhvien_bacsi22}
            quest2.append(lan2)
        if ngay_dieu_tri23 != None and chuan_doan23 != None and chi_tiet_dieu_tri23 != None and ket_qua23 != None and benhvien_bacsi23 != None:
            lan3={'ngdt':ngay_dieu_tri23,'cdoan':chuan_doan23,'ctdt':chi_tiet_dieu_tri23,'ketqua':ket_qua23,'bacsi':benhvien_bacsi23}
            quest2.append(lan3)

        # quest3
        ngay_dieu_tri31=request.POST.get('ngay_dieu_tri31')
        chuan_doan31=request.POST.get('chuan_doan31')
        chi_tiet_dieu_tri31=request.POST.get('chi_tiet_dieu_tri31')
        ket_qua31=request.POST.get('ket_qua31')
        benhvien_bacsi31=request.POST.get('benhvien_bacsi31')

        ngay_dieu_tri32=request.POST.get('ngay_dieu_tri32')
        chuan_doan32=request.POST.get('chuan_doan32')
        chi_tiet_dieu_tri32=request.POST.get('chi_tiet_dieu_tri32')
        ket_qua32=request.POST.get('ket_qua32')
        benhvien_bacsi32=request.POST.get('benhvien_bacsi32')

        ngay_dieu_tri33=request.POST.get('ngay_dieu_tri33')
        chuan_doan33=request.POST.get('chuan_doan33')
        chi_tiet_dieu_tri33=request.POST.get('chi_tiet_dieu_tri33')
        ket_qua33=request.POST.get('ket_qua33')
        benhvien_bacsi33=request.POST.get('benhvien_bacsi33')

        if ngay_dieu_tri31 != None and chuan_doan31 != None and chi_tiet_dieu_tri31 != None and ket_qua31 != None and benhvien_bacsi31 != None:
            lan1={'ngdt':ngay_dieu_tri31,'cdoan':chuan_doan31,'ctdt':chi_tiet_dieu_tri31,'ketqua':ket_qua31,'bacsi':benhvien_bacsi31}
            quest3.append(lan1)
        if ngay_dieu_tri32 != None and chuan_doan32 != None and chi_tiet_dieu_tri32 != None and ket_qua32 != None and benhvien_bacsi32 != None:
            lan2={'ngdt':ngay_dieu_tri32,'cdoan':chuan_doan32,'ctdt':chi_tiet_dieu_tri32,'ketqua':ket_qua32,'bacsi':benhvien_bacsi32}
            quest3.append(lan2)
        if ngay_dieu_tri33 != None and chuan_doan33 != None and chi_tiet_dieu_tri33 != None and ket_qua33 != None and benhvien_bacsi33 != None:
            lan3={'ngdt':ngay_dieu_tri33,'cdoan':chuan_doan33,'ctdt':chi_tiet_dieu_tri33,'ketqua':ket_qua33,'bacsi':benhvien_bacsi33}
            quest3.append(lan3)

        # quest4
        ngay_dieu_tri41=request.POST.get('ngay_dieu_tri41')
        chuan_doan41=request.POST.get('chuan_doan41')
        chi_tiet_dieu_tri41=request.POST.get('chi_tiet_dieu_tri41')
        ket_qua41=request.POST.get('ket_qua41')
        benhvien_bacsi41=request.POST.get('benhvien_bacsi41')

        ngay_dieu_tri42=request.POST.get('ngay_dieu_tri42')
        chuan_doan42=request.POST.get('chuan_doan42')
        chi_tiet_dieu_tri42=request.POST.get('chi_tiet_dieu_tri42')
        ket_qua42=request.POST.get('ket_qua42')
        benhvien_bacsi42=request.POST.get('benhvien_bacsi42')

        ngay_dieu_tri43=request.POST.get('ngay_dieu_tri43')
        chuan_doan43=request.POST.get('chuan_doan43')
        chi_tiet_dieu_tri43=request.POST.get('chi_tiet_dieu_tri43')
        ket_qua43=request.POST.get('ket_qua43')
        benhvien_bacsi43=request.POST.get('benhvien_bacsi43')

        if ngay_dieu_tri41 != None and chuan_doan41 != None and chi_tiet_dieu_tri41 != None and ket_qua41 != None and benhvien_bacsi41 != None:
            lan1={'ngdt':ngay_dieu_tri41,'cdoan':chuan_doan41,'ctdt':chi_tiet_dieu_tri41,'ketqua':ket_qua41,'bacsi':benhvien_bacsi41}
            quest4.append(lan1)
        if ngay_dieu_tri42 != None and chuan_doan42 != None and chi_tiet_dieu_tri42 != None and ket_qua42 != None and benhvien_bacsi42 != None:
            lan2={'ngdt':ngay_dieu_tri42,'cdoan':chuan_doan42,'ctdt':chi_tiet_dieu_tri42,'ketqua':ket_qua42,'bacsi':benhvien_bacsi42}
            quest4.append(lan2)
        if ngay_dieu_tri43 != None and chuan_doan43 != None and chi_tiet_dieu_tri43 != None and ket_qua43 != None and benhvien_bacsi43 != None:
            lan3={'ngdt':ngay_dieu_tri43,'cdoan':chuan_doan43,'ctdt':chi_tiet_dieu_tri43,'ketqua':ket_qua43,'bacsi':benhvien_bacsi43}
            quest4.append(lan3)

       # quest5
        ngay_dieu_tri51=request.POST.get('ngay_dieu_tri51')
        chuan_doan51=request.POST.get('chuan_doan51')
        chi_tiet_dieu_tri51=request.POST.get('chi_tiet_dieu_tri51')
        ket_qua51=request.POST.get('ket_qua51')
        benhvien_bacsi51=request.POST.get('benhvien_bacsi51')

        ngay_dieu_tri52=request.POST.get('ngay_dieu_tri52')
        chuan_doan52=request.POST.get('chuan_doan52')
        chi_tiet_dieu_tri52=request.POST.get('chi_tiet_dieu_tri52')
        ket_qua52=request.POST.get('ket_qua52')
        benhvien_bacsi52=request.POST.get('benhvien_bacsi52')

        ngay_dieu_tri53=request.POST.get('ngay_dieu_tri53')
        chuan_doan53=request.POST.get('chuan_doan53')
        chi_tiet_dieu_tri53=request.POST.get('chi_tiet_dieu_tri53')
        ket_qua53=request.POST.get('ket_qua53')
        benhvien_bacsi53=request.POST.get('benhvien_bacsi53')

        if ngay_dieu_tri51 != None and chuan_doan51 != None and chi_tiet_dieu_tri51 != None and ket_qua51 != None and benhvien_bacsi51 != None:
            lan1={'ngdt':ngay_dieu_tri51,'cdoan':chuan_doan51,'ctdt':chi_tiet_dieu_tri51,'ketqua':ket_qua51,'bacsi':benhvien_bacsi51}
            quest5.append(lan1)
        if ngay_dieu_tri52 != None and chuan_doan52 != None and chi_tiet_dieu_tri52 != None and ket_qua52 != None and benhvien_bacsi52 != None:
            lan2={'ngdt':ngay_dieu_tri52,'cdoan':chuan_doan52,'ctdt':chi_tiet_dieu_tri52,'ketqua':ket_qua52,'bacsi':benhvien_bacsi52}
            quest5.append(lan2)
        if ngay_dieu_tri53 != None and chuan_doan53 != None and chi_tiet_dieu_tri53 != None and ket_qua53 != None and benhvien_bacsi53 != None:
            lan3={'ngdt':ngay_dieu_tri53,'cdoan':chuan_doan53,'ctdt':chi_tiet_dieu_tri53,'ketqua':ket_qua53,'bacsi':benhvien_bacsi53}
            quest5.append(lan3)

        # quest6
        ngay_dieu_tri61=request.POST.get('ngay_dieu_tri61')
        chuan_doan61=request.POST.get('chuan_doan61')
        chi_tiet_dieu_tri61=request.POST.get('chi_tiet_dieu_tri61')
        ket_qua61=request.POST.get('ket_qua61')
        benhvien_bacsi61=request.POST.get('benhvien_bacsi61')

        ngay_dieu_tri62=request.POST.get('ngay_dieu_tri62')
        chuan_doan62=request.POST.get('chuan_doan62')
        chi_tiet_dieu_tri62=request.POST.get('chi_tiet_dieu_tri62')
        ket_qua62=request.POST.get('ket_qua62')
        benhvien_bacsi62=request.POST.get('benhvien_bacsi62')

        ngay_dieu_tri63=request.POST.get('ngay_dieu_tri63')
        chuan_doan63=request.POST.get('chuan_doan63')
        chi_tiet_dieu_tri63=request.POST.get('chi_tiet_dieu_tri63')
        ket_qua63=request.POST.get('ket_qua63')
        benhvien_bacsi63=request.POST.get('benhvien_bacsi63')

        if ngay_dieu_tri61 != None and chuan_doan61 != None and chi_tiet_dieu_tri61 != None and ket_qua61 != None and benhvien_bacsi61 != None:
            lan1={'ngdt':ngay_dieu_tri61,'cdoan':chuan_doan61,'ctdt':chi_tiet_dieu_tri61,'ketqua':ket_qua61,'bacsi':benhvien_bacsi61}
            quest6.append(lan1)
        if ngay_dieu_tri62 != None and chuan_doan62 != None and chi_tiet_dieu_tri62 != None and ket_qua62 != None and benhvien_bacsi62 != None:
            lan2={'ngdt':ngay_dieu_tri62,'cdoan':chuan_doan62,'ctdt':chi_tiet_dieu_tri62,'ketqua':ket_qua62,'bacsi':benhvien_bacsi62}
            quest6.append(lan2)
        if ngay_dieu_tri63 != None and chuan_doan63 != None and chi_tiet_dieu_tri63 != None and ket_qua63 != None and benhvien_bacsi63 != None:
            lan3={'ngdt':ngay_dieu_tri63,'cdoan':chuan_doan63,'ctdt':chi_tiet_dieu_tri63,'ketqua':ket_qua63,'bacsi':benhvien_bacsi63}
            quest6.append(lan3)
        # quest7
        ngay_dieu_tri71=request.POST.get('ngay_dieu_tri71')
        chuan_doan71=request.POST.get('chuan_doan71')
        chi_tiet_dieu_tri71=request.POST.get('chi_tiet_dieu_tri71')
        ket_qua71=request.POST.get('ket_qua71')
        benhvien_bacsi71=request.POST.get('benhvien_bacsi71')

        ngay_dieu_tri72=request.POST.get('ngay_dieu_tri72')
        chuan_doan72=request.POST.get('chuan_doan72')
        chi_tiet_dieu_tri72=request.POST.get('chi_tiet_dieu_tri72')
        ket_qua72=request.POST.get('ket_qua72')
        benhvien_bacsi72=request.POST.get('benhvien_bacsi72')

        ngay_dieu_tri73=request.POST.get('ngay_dieu_tri73')
        chuan_doan73=request.POST.get('chuan_doan73')
        chi_tiet_dieu_tri73=request.POST.get('chi_tiet_dieu_tri73')
        ket_qua73=request.POST.get('ket_qua73')
        benhvien_bacsi73=request.POST.get('benhvien_bacsi73')

        if ngay_dieu_tri71 != None and chuan_doan71 != None and chi_tiet_dieu_tri71 != None and ket_qua71 != None and benhvien_bacsi71 != None:
            lan1={'ngdt':ngay_dieu_tri71,'cdoan':chuan_doan71,'ctdt':chi_tiet_dieu_tri71,'ketqua':ket_qua71,'bacsi':benhvien_bacsi71}
            quest7.append(lan1)
        if ngay_dieu_tri72 != None and chuan_doan72 != None and chi_tiet_dieu_tri72 != None and ket_qua72 != None and benhvien_bacsi72 != None:
            lan2={'ngdt':ngay_dieu_tri72,'cdoan':chuan_doan72,'ctdt':chi_tiet_dieu_tri72,'ketqua':ket_qua72,'bacsi':benhvien_bacsi72}
            quest7.append(lan2)
        if ngay_dieu_tri73 != None and chuan_doan73 != None and chi_tiet_dieu_tri73 != None and ket_qua73 != None and benhvien_bacsi73 != None:
            lan3={'ngdt':ngay_dieu_tri73,'cdoan':chuan_doan73,'ctdt':chi_tiet_dieu_tri73,'ketqua':ket_qua73,'bacsi':benhvien_bacsi73}
            quest7.append(lan3)
        # quest8
        ngay_dieu_tri81=request.POST.get('ngay_dieu_tri81')
        chuan_doan81=request.POST.get('chuan_doan81')
        chi_tiet_dieu_tri81=request.POST.get('chi_tiet_dieu_tri81')
        ket_qua81=request.POST.get('ket_qua81')
        benhvien_bacsi81=request.POST.get('benhvien_bacsi81')

        ngay_dieu_tri82=request.POST.get('ngay_dieu_tri82')
        chuan_doan82=request.POST.get('chuan_doan82')
        chi_tiet_dieu_tri82=request.POST.get('chi_tiet_dieu_tri82')
        ket_qua82=request.POST.get('ket_qua82')
        benhvien_bacsi82=request.POST.get('benhvien_bacsi82')

        ngay_dieu_tri83=request.POST.get('ngay_dieu_tri83')
        chuan_doan83=request.POST.get('chuan_doan83')
        chi_tiet_dieu_tri83=request.POST.get('chi_tiet_dieu_tri83')
        ket_qua83=request.POST.get('ket_qua83')
        benhvien_bacsi83=request.POST.get('benhvien_bacsi83')

        if ngay_dieu_tri81 != None and chuan_doan81 != None and chi_tiet_dieu_tri81 != None and ket_qua81 != None and benhvien_bacsi81 != None:
            lan1={'ngdt':ngay_dieu_tri81,'cdoan':chuan_doan81,'ctdt':chi_tiet_dieu_tri81,'ketqua':ket_qua81,'bacsi':benhvien_bacsi81}
            quest8.append(lan1)
        if ngay_dieu_tri82 != None and chuan_doan82 != None and chi_tiet_dieu_tri82 != None and ket_qua82 != None and benhvien_bacsi82 != None:
            lan2={'ngdt':ngay_dieu_tri82,'cdoan':chuan_doan82,'ctdt':chi_tiet_dieu_tri82,'ketqua':ket_qua82,'bacsi':benhvien_bacsi82}
            quest8.append(lan2)
        if ngay_dieu_tri83 != None and chuan_doan83 != None and chi_tiet_dieu_tri83 != None and ket_qua83 != None and benhvien_bacsi83 != None:
            lan3={'ngdt':ngay_dieu_tri83,'cdoan':chuan_doan83,'ctdt':chi_tiet_dieu_tri83,'ketqua':ket_qua83,'bacsi':benhvien_bacsi83}
            quest8.append(lan3)
        request.session['quest1_termlife']=quest1
        request.session['quest2_termlife']=quest2
        request.session['quest3_termlife']=quest3
        request.session['quest4_termlife']=quest4
        request.session['quest5_termlife']=quest5
        request.session['quest6_termlife']=quest6
        request.session['quest7_termlife']=quest7
        request.session['quest8_termlife']=quest8
        request.session['chukyngmua_termlife']=chukyngmua
        request.session['chukyngdc_termlife']=chukyngdc

        return redirect('termlife:summary-order-termlife') 


class QuestionHealthThaiSanView(LoginRequiredMixin,View):
    login_url = '/dang-nhap/'
    def get(self, request):
        return render(request, 'termlife/question-health-thaisan.html')
    def post (self, request):
        chukyngmua=request.POST.get('chukyngmua')
        chukyngdc=request.POST.get('chukyngdc')
        # quest1
        quest1,quest2,quest3,quest4,quest5,quest6,quest7,quest8=[],[],[],[],[],[],[],[]

        ngay_dieu_tri11=request.POST.get('ngay_dieu_tri11')
        chuan_doan11=request.POST.get('chuan_doan11')
        chi_tiet_dieu_tri11=request.POST.get('chi_tiet_dieu_tri11')
        ket_qua11=request.POST.get('ket_qua11')
        benhvien_bacsi11=request.POST.get('benhvien_bacsi11')

        ngay_dieu_tri12=request.POST.get('ngay_dieu_tri12')
        chuan_doan12=request.POST.get('chuan_doan12')
        chi_tiet_dieu_tri12=request.POST.get('chi_tiet_dieu_tri12')
        ket_qua12=request.POST.get('ket_qua12')
        benhvien_bacsi12=request.POST.get('benhvien_bacsi12')

        ngay_dieu_tri13=request.POST.get('ngay_dieu_tri13')
        chuan_doan13=request.POST.get('chuan_doan13')
        chi_tiet_dieu_tri13=request.POST.get('chi_tiet_dieu_tri13')
        ket_qua13=request.POST.get('ket_qua13')
        benhvien_bacsi13=request.POST.get('benhvien_bacsi13')

        if ngay_dieu_tri11 != None and chuan_doan11 != None and chi_tiet_dieu_tri11 != None and ket_qua11 != None and benhvien_bacsi11 != None:
            lan1={'ngdt':ngay_dieu_tri11,'cdoan':chuan_doan11,'ctdt':chi_tiet_dieu_tri11,'ketqua':ket_qua11,'bacsi':benhvien_bacsi11}
            quest1.append(lan1)
        if ngay_dieu_tri12 != None and chuan_doan12 != None and chi_tiet_dieu_tri12 != None and ket_qua12 != None and benhvien_bacsi12 != None:
            lan2={'ngdt':ngay_dieu_tri12,'cdoan':chuan_doan12,'ctdt':chi_tiet_dieu_tri12,'ketqua':ket_qua12,'bacsi':benhvien_bacsi12}
            quest1.append(lan2)
        if ngay_dieu_tri13 != None and chuan_doan13 != None and chi_tiet_dieu_tri13 != None and ket_qua13 != None and benhvien_bacsi13 != None:
            lan3={'ngdt':ngay_dieu_tri13,'cdoan':chuan_doan13,'ctdt':chi_tiet_dieu_tri13,'ketqua':ket_qua13,'bacsi':benhvien_bacsi13}
            quest1.append(lan3)
        # quest2
        ngay_dieu_tri21=request.POST.get('ngay_dieu_tri21')
        chuan_doan21=request.POST.get('chuan_doan21')
        chi_tiet_dieu_tri21=request.POST.get('chi_tiet_dieu_tri21')
        ket_qua21=request.POST.get('ket_qua21')
        benhvien_bacsi21=request.POST.get('benhvien_bacsi21')

        ngay_dieu_tri22=request.POST.get('ngay_dieu_tri22')
        chuan_doan22=request.POST.get('chuan_doan22')
        chi_tiet_dieu_tri22=request.POST.get('chi_tiet_dieu_tri22')
        ket_qua22=request.POST.get('ket_qua22')
        benhvien_bacsi22=request.POST.get('benhvien_bacsi22')

        ngay_dieu_tri23=request.POST.get('ngay_dieu_tri23')
        chuan_doan23=request.POST.get('chuan_doan23')
        chi_tiet_dieu_tri23=request.POST.get('chi_tiet_dieu_tri23')
        ket_qua23=request.POST.get('ket_qua23')
        benhvien_bacsi23=request.POST.get('benhvien_bacsi23')

        if ngay_dieu_tri21 != None and chuan_doan21 != None and chi_tiet_dieu_tri21 != None and ket_qua21 != None and  benhvien_bacsi21 != None:
            lan1={'ngdt':ngay_dieu_tri21,'cdoan':chuan_doan21,'ctdt':chi_tiet_dieu_tri21,'ketqua':ket_qua21,'bacsi':benhvien_bacsi21}
            quest2.append(lan1)
        if ngay_dieu_tri22 != None and chuan_doan22 != None and chi_tiet_dieu_tri22 != None and ket_qua22 != None and benhvien_bacsi22 != None:
            lan2={'ngdt':ngay_dieu_tri22,'cdoan':chuan_doan22,'ctdt':chi_tiet_dieu_tri22,'ketqua':ket_qua22,'bacsi':benhvien_bacsi22}
            quest2.append(lan2)
        if ngay_dieu_tri23 != None and chuan_doan23 != None and chi_tiet_dieu_tri23 != None and ket_qua23 != None and benhvien_bacsi23 != None:
            lan3={'ngdt':ngay_dieu_tri23,'cdoan':chuan_doan23,'ctdt':chi_tiet_dieu_tri23,'ketqua':ket_qua23,'bacsi':benhvien_bacsi23}
            quest2.append(lan3)

        # quest3
        ngay_dieu_tri31=request.POST.get('ngay_dieu_tri31')
        chuan_doan31=request.POST.get('chuan_doan31')
        chi_tiet_dieu_tri31=request.POST.get('chi_tiet_dieu_tri31')
        ket_qua31=request.POST.get('ket_qua31')
        benhvien_bacsi31=request.POST.get('benhvien_bacsi31')

        ngay_dieu_tri32=request.POST.get('ngay_dieu_tri32')
        chuan_doan32=request.POST.get('chuan_doan32')
        chi_tiet_dieu_tri32=request.POST.get('chi_tiet_dieu_tri32')
        ket_qua32=request.POST.get('ket_qua32')
        benhvien_bacsi32=request.POST.get('benhvien_bacsi32')

        ngay_dieu_tri33=request.POST.get('ngay_dieu_tri33')
        chuan_doan33=request.POST.get('chuan_doan33')
        chi_tiet_dieu_tri33=request.POST.get('chi_tiet_dieu_tri33')
        ket_qua33=request.POST.get('ket_qua33')
        benhvien_bacsi33=request.POST.get('benhvien_bacsi33')

        if ngay_dieu_tri31 != None and chuan_doan31 != None and chi_tiet_dieu_tri31 != None and ket_qua31 != None and benhvien_bacsi31 != None:
            lan1={'ngdt':ngay_dieu_tri31,'cdoan':chuan_doan31,'ctdt':chi_tiet_dieu_tri31,'ketqua':ket_qua31,'bacsi':benhvien_bacsi31}
            quest3.append(lan1)
        if ngay_dieu_tri32 != None and chuan_doan32 != None and chi_tiet_dieu_tri32 != None and ket_qua32 != None and benhvien_bacsi32 != None:
            lan2={'ngdt':ngay_dieu_tri32,'cdoan':chuan_doan32,'ctdt':chi_tiet_dieu_tri32,'ketqua':ket_qua32,'bacsi':benhvien_bacsi32}
            quest3.append(lan2)
        if ngay_dieu_tri33 != None and chuan_doan33 != None and chi_tiet_dieu_tri33 != None and ket_qua33 != None and benhvien_bacsi33 != None:
            lan3={'ngdt':ngay_dieu_tri33,'cdoan':chuan_doan33,'ctdt':chi_tiet_dieu_tri33,'ketqua':ket_qua33,'bacsi':benhvien_bacsi33}
            quest3.append(lan3)

        # quest4
        ngay_dieu_tri41=request.POST.get('ngay_dieu_tri41')
        chuan_doan41=request.POST.get('chuan_doan41')
        chi_tiet_dieu_tri41=request.POST.get('chi_tiet_dieu_tri41')
        ket_qua41=request.POST.get('ket_qua41')
        benhvien_bacsi41=request.POST.get('benhvien_bacsi41')

        ngay_dieu_tri42=request.POST.get('ngay_dieu_tri42')
        chuan_doan42=request.POST.get('chuan_doan42')
        chi_tiet_dieu_tri42=request.POST.get('chi_tiet_dieu_tri42')
        ket_qua42=request.POST.get('ket_qua42')
        benhvien_bacsi42=request.POST.get('benhvien_bacsi42')

        ngay_dieu_tri43=request.POST.get('ngay_dieu_tri43')
        chuan_doan43=request.POST.get('chuan_doan43')
        chi_tiet_dieu_tri43=request.POST.get('chi_tiet_dieu_tri43')
        ket_qua43=request.POST.get('ket_qua43')
        benhvien_bacsi43=request.POST.get('benhvien_bacsi43')

        if ngay_dieu_tri41 != None and chuan_doan41 != None and chi_tiet_dieu_tri41 != None and ket_qua41 != None and benhvien_bacsi41 != None:
            lan1={'ngdt':ngay_dieu_tri41,'cdoan':chuan_doan41,'ctdt':chi_tiet_dieu_tri41,'ketqua':ket_qua41,'bacsi':benhvien_bacsi41}
            quest4.append(lan1)
        if ngay_dieu_tri42 != None and chuan_doan42 != None and chi_tiet_dieu_tri42 != None and ket_qua42 != None and benhvien_bacsi42 != None:
            lan2={'ngdt':ngay_dieu_tri42,'cdoan':chuan_doan42,'ctdt':chi_tiet_dieu_tri42,'ketqua':ket_qua42,'bacsi':benhvien_bacsi42}
            quest4.append(lan2)
        if ngay_dieu_tri43 != None and chuan_doan43 != None and chi_tiet_dieu_tri43 != None and ket_qua43 != None and benhvien_bacsi43 != None:
            lan3={'ngdt':ngay_dieu_tri43,'cdoan':chuan_doan43,'ctdt':chi_tiet_dieu_tri43,'ketqua':ket_qua43,'bacsi':benhvien_bacsi43}
            quest4.append(lan3)

       # quest5
        ngay_dieu_tri51=request.POST.get('ngay_dieu_tri51')
        chuan_doan51=request.POST.get('chuan_doan51')
        chi_tiet_dieu_tri51=request.POST.get('chi_tiet_dieu_tri51')
        ket_qua51=request.POST.get('ket_qua51')
        benhvien_bacsi51=request.POST.get('benhvien_bacsi51')

        ngay_dieu_tri52=request.POST.get('ngay_dieu_tri52')
        chuan_doan52=request.POST.get('chuan_doan52')
        chi_tiet_dieu_tri52=request.POST.get('chi_tiet_dieu_tri52')
        ket_qua52=request.POST.get('ket_qua52')
        benhvien_bacsi52=request.POST.get('benhvien_bacsi52')

        ngay_dieu_tri53=request.POST.get('ngay_dieu_tri53')
        chuan_doan53=request.POST.get('chuan_doan53')
        chi_tiet_dieu_tri53=request.POST.get('chi_tiet_dieu_tri53')
        ket_qua53=request.POST.get('ket_qua53')
        benhvien_bacsi53=request.POST.get('benhvien_bacsi53')

        if ngay_dieu_tri51 != None and chuan_doan51 != None and chi_tiet_dieu_tri51 != None and ket_qua51 != None and benhvien_bacsi51 != None:
            lan1={'ngdt':ngay_dieu_tri51,'cdoan':chuan_doan51,'ctdt':chi_tiet_dieu_tri51,'ketqua':ket_qua51,'bacsi':benhvien_bacsi51}
            quest5.append(lan1)
        if ngay_dieu_tri52 != None and chuan_doan52 != None and chi_tiet_dieu_tri52 != None and ket_qua52 != None and benhvien_bacsi52 != None:
            lan2={'ngdt':ngay_dieu_tri52,'cdoan':chuan_doan52,'ctdt':chi_tiet_dieu_tri52,'ketqua':ket_qua52,'bacsi':benhvien_bacsi52}
            quest5.append(lan2)
        if ngay_dieu_tri53 != None and chuan_doan53 != None and chi_tiet_dieu_tri53 != None and ket_qua53 != None and benhvien_bacsi53 != None:
            lan3={'ngdt':ngay_dieu_tri53,'cdoan':chuan_doan53,'ctdt':chi_tiet_dieu_tri53,'ketqua':ket_qua53,'bacsi':benhvien_bacsi53}
            quest5.append(lan3)

        # quest6
        ngay_dieu_tri61=request.POST.get('ngay_dieu_tri61')
        chuan_doan61=request.POST.get('chuan_doan61')
        chi_tiet_dieu_tri61=request.POST.get('chi_tiet_dieu_tri61')
        ket_qua61=request.POST.get('ket_qua61')
        benhvien_bacsi61=request.POST.get('benhvien_bacsi61')

        ngay_dieu_tri62=request.POST.get('ngay_dieu_tri62')
        chuan_doan62=request.POST.get('chuan_doan62')
        chi_tiet_dieu_tri62=request.POST.get('chi_tiet_dieu_tri62')
        ket_qua62=request.POST.get('ket_qua62')
        benhvien_bacsi62=request.POST.get('benhvien_bacsi62')

        ngay_dieu_tri63=request.POST.get('ngay_dieu_tri63')
        chuan_doan63=request.POST.get('chuan_doan63')
        chi_tiet_dieu_tri63=request.POST.get('chi_tiet_dieu_tri63')
        ket_qua63=request.POST.get('ket_qua63')
        benhvien_bacsi63=request.POST.get('benhvien_bacsi63')

        if ngay_dieu_tri61 != None and chuan_doan61 != None and chi_tiet_dieu_tri61 != None and ket_qua61 != None and benhvien_bacsi61 != None:
            lan1={'ngdt':ngay_dieu_tri61,'cdoan':chuan_doan61,'ctdt':chi_tiet_dieu_tri61,'ketqua':ket_qua61,'bacsi':benhvien_bacsi61}
            quest6.append(lan1)
        if ngay_dieu_tri62 != None and chuan_doan62 != None and chi_tiet_dieu_tri62 != None and ket_qua62 != None and benhvien_bacsi62 != None:
            lan2={'ngdt':ngay_dieu_tri62,'cdoan':chuan_doan62,'ctdt':chi_tiet_dieu_tri62,'ketqua':ket_qua62,'bacsi':benhvien_bacsi62}
            quest6.append(lan2)
        if ngay_dieu_tri63 != None and chuan_doan63 != None and chi_tiet_dieu_tri63 != None and ket_qua63 != None and benhvien_bacsi63 != None:
            lan3={'ngdt':ngay_dieu_tri63,'cdoan':chuan_doan63,'ctdt':chi_tiet_dieu_tri63,'ketqua':ket_qua63,'bacsi':benhvien_bacsi63}
            quest6.append(lan3)
        # quest7
        ngay_dieu_tri71=request.POST.get('ngay_dieu_tri71')
        chuan_doan71=request.POST.get('chuan_doan71')
        chi_tiet_dieu_tri71=request.POST.get('chi_tiet_dieu_tri71')
        ket_qua71=request.POST.get('ket_qua71')
        benhvien_bacsi71=request.POST.get('benhvien_bacsi71')

        ngay_dieu_tri72=request.POST.get('ngay_dieu_tri72')
        chuan_doan72=request.POST.get('chuan_doan72')
        chi_tiet_dieu_tri72=request.POST.get('chi_tiet_dieu_tri72')
        ket_qua72=request.POST.get('ket_qua72')
        benhvien_bacsi72=request.POST.get('benhvien_bacsi72')

        ngay_dieu_tri73=request.POST.get('ngay_dieu_tri73')
        chuan_doan73=request.POST.get('chuan_doan73')
        chi_tiet_dieu_tri73=request.POST.get('chi_tiet_dieu_tri73')
        ket_qua73=request.POST.get('ket_qua73')
        benhvien_bacsi73=request.POST.get('benhvien_bacsi73')

        if ngay_dieu_tri71 != None and chuan_doan71 != None and chi_tiet_dieu_tri71 != None and ket_qua71 != None and benhvien_bacsi71 != None:
            lan1={'ngdt':ngay_dieu_tri71,'cdoan':chuan_doan71,'ctdt':chi_tiet_dieu_tri71,'ketqua':ket_qua71,'bacsi':benhvien_bacsi71}
            quest7.append(lan1)
        if ngay_dieu_tri72 != None and chuan_doan72 != None and chi_tiet_dieu_tri72 != None and ket_qua72 != None and benhvien_bacsi72 != None:
            lan2={'ngdt':ngay_dieu_tri72,'cdoan':chuan_doan72,'ctdt':chi_tiet_dieu_tri72,'ketqua':ket_qua72,'bacsi':benhvien_bacsi72}
            quest7.append(lan2)
        if ngay_dieu_tri73 != None and chuan_doan73 != None and chi_tiet_dieu_tri73 != None and ket_qua73 != None and benhvien_bacsi73 != None:
            lan3={'ngdt':ngay_dieu_tri73,'cdoan':chuan_doan73,'ctdt':chi_tiet_dieu_tri73,'ketqua':ket_qua73,'bacsi':benhvien_bacsi73}
            quest7.append(lan3)
        # quest8
        ngay_dieu_tri81=request.POST.get('ngay_dieu_tri81')
        chuan_doan81=request.POST.get('chuan_doan81')
        chi_tiet_dieu_tri81=request.POST.get('chi_tiet_dieu_tri81')
        ket_qua81=request.POST.get('ket_qua81')
        benhvien_bacsi81=request.POST.get('benhvien_bacsi81')

        ngay_dieu_tri82=request.POST.get('ngay_dieu_tri82')
        chuan_doan82=request.POST.get('chuan_doan82')
        chi_tiet_dieu_tri82=request.POST.get('chi_tiet_dieu_tri82')
        ket_qua82=request.POST.get('ket_qua82')
        benhvien_bacsi82=request.POST.get('benhvien_bacsi82')

        ngay_dieu_tri83=request.POST.get('ngay_dieu_tri83')
        chuan_doan83=request.POST.get('chuan_doan83')
        chi_tiet_dieu_tri83=request.POST.get('chi_tiet_dieu_tri83')
        ket_qua83=request.POST.get('ket_qua83')
        benhvien_bacsi83=request.POST.get('benhvien_bacsi83')

        if ngay_dieu_tri81 != None and chuan_doan81 != None and chi_tiet_dieu_tri81 != None and ket_qua81 != None and benhvien_bacsi81 != None:
            lan1={'ngdt':ngay_dieu_tri81,'cdoan':chuan_doan81,'ctdt':chi_tiet_dieu_tri81,'ketqua':ket_qua81,'bacsi':benhvien_bacsi81}
            quest8.append(lan1)
        if ngay_dieu_tri82 != None and chuan_doan82 != None and chi_tiet_dieu_tri82 != None and ket_qua82 != None and benhvien_bacsi82 != None:
            lan2={'ngdt':ngay_dieu_tri82,'cdoan':chuan_doan82,'ctdt':chi_tiet_dieu_tri82,'ketqua':ket_qua82,'bacsi':benhvien_bacsi82}
            quest8.append(lan2)
        if ngay_dieu_tri83 != None and chuan_doan83 != None and chi_tiet_dieu_tri83 != None and ket_qua83 != None and benhvien_bacsi83 != None:
            lan3={'ngdt':ngay_dieu_tri83,'cdoan':chuan_doan83,'ctdt':chi_tiet_dieu_tri83,'ketqua':ket_qua83,'bacsi':benhvien_bacsi83}
            quest8.append(lan3)
        request.session['quest1_termlife']=quest1
        request.session['quest2_termlife']=quest2
        request.session['quest3_termlife']=quest3
        request.session['quest4_termlife']=quest4
        request.session['quest5_termlife']=quest5
        request.session['quest6_termlife']=quest6
        request.session['quest7_termlife']=quest7
        request.session['quest8_termlife']=quest8
        request.session['chukyngmua_termlife']=chukyngmua
        request.session['chukyngdc_termlife']=chukyngdc

        return redirect('termlife:summary-order-termlife') 

      
class SummaryOrderTermlifeView(LoginRequiredMixin,View):
    login_url = '/dang-nhap/'
    def get(self, request):
        name_nm=request.session.get('name_nm_termlife')
        phone_nm=request.session.get('sdt_nm_termlife')
        email_nm=request.session.get('email_nm_termlife')
        thanhpho_nm=request.session.get('thanhpho_nm_termlife')
        huyen_nm=request.session.get('huyen_nm_termlife')
        diachi_nm=request.session.get('diachi_nm_termlife')
        list_provincial=Provincial.objects.all().order_by("name")
        name_ngdc=request.session.get('name_ngdc_termlife')
        sdt_ngdc=request.session.get('phone_ngdc_termlife')
        email_ngdc=request.session.get('email_ngdc_termlife')
        diachi_ngdc=request.session.get('diachi_ngdc_termlife')
        thanhpho=Provincial.objects.get(code=request.session.get('thanhpho_ngdc_termlife'))
        huyen=District.objects.get(id=request.session.get('huyen_ngdc_termlife'))
        cty_tl=Company.objects.get(id_ten_cong_ty=request.session.get('cty_termlife'))
        moneyc=request.session.get('sophichinh_termlife')
        spchinh=request.session.get('spchinh_termlife')
        list_spp=request.session.get('list_spp_termlife')
        if len(list_spp)==1 and list_spp[0]['loaispp']==1:
            spp_tl=termlife_utils.get_money_spp_term_life(list_spp[0],{},request.session.get('sex_ngdc_termlife'),request.session.get('age_ngdc_termlife'),request.session.get('cty_termlife'),spchinh)
        elif len(list_spp)==1 and list_spp[0]['loaispp']==2:
            spp_tl=termlife_utils.get_money_spp_term_life({},list_spp[0],request.session.get('sex_ngdc_termlife'),request.session.get('age_ngdc_termlife'),request.session.get('cty_termlife'),spchinh)
        elif len(list_spp)==2:
            spp_tl=termlife_utils.get_money_spp_term_life(list_spp[0],list_spp[1],request.session.get('sex_ngdc_termlife'),request.session.get('age_ngdc_termlife'),request.session.get('cty_termlife'),spchinh)
        else:
            spp_tl=0
        phiVATtl=(moneyc+spp_tl)*0.1
        total_moneytl=(moneyc+spp_tl)*1.1
        request.session['sophiphu_termlife']=spp_tl
        request.session['phiVAT_termlife']=phiVATtl
        request.session['total_moneyhasVAT_termlife']=total_moneytl

        context = {
            "list_data": list_provincial,
            'name_ngdc':name_ngdc,
            'sdt_ngdc':sdt_ngdc,
            'email_ngdc':email_ngdc,
            'thanhpho_ngdc':thanhpho,
            'huyen_ngdc':huyen,
            'diachi_ngdc':diachi_ngdc,
            'ctytl':cty_tl.ten_cong_ty,
            'moneyc':convert_price_to_string(moneyc),
            'spp_tl':convert_price_to_string(int(spp_tl)),
            'phiVATtl':convert_price_to_string(int(phiVATtl)) ,
            'total_moneyhasVAT':convert_price_to_string(int(total_moneytl)),
            'name_nm':name_nm,
            'phone_nm':phone_nm,
            'email_nm':email_nm,
            'thanhpho_nm':thanhpho_nm,
            'huyen_nm':huyen_nm,
            'diachi_nm':diachi_nm

        }
        return render(request, 'termlife/summary-order-termlife.html',context)
    def post(self, request):
        name_ng_nhan=request.POST.get('name_ng_nhan')
        email_ng_nhan=request.POST.get('email_ng_nhan')
        phone_ng_nhan=request.POST.get('phone_ng_nhan')
        tinh_ng_nhan=request.POST.get('tinh_ng_nhan')
        huyen_ng_nhan=request.POST.get('huyen_ng_nhan')
        address_ng_nhan=request.POST.get('address_ng_nhan')
        mgg=request.POST.get('mgg')

        name_nm= request.session.get('name_nm_termlife')
        sex_nm=request.session.get('sex_nm_termlife')
        daybirth_nm=  request.session.get('daybirth_nm_termlife')
        monthbirth_nm= request.session.get('monthbirth_nm_termlife')
        yearbirth_nm=request.session.get('yearbirth_nm_termlife')
        phone_ngmua=  request.session.get('sdt_nm_termlife')
        email_nm=request.session.get('email_nm_termlife')
        cmt_nm=request.session.get('cmt_nm_termlife')
        ngaycap_nm=request.session.get('ngaycap_nm_termlife')
        noicapcmt_nm= request.session.get('noicapcmt_nm_termlife')
        thanhpho_nm= request.session.get('thanhpho_nm_termlife')
        huyen_nm= request.session.get('huyen_nm_termlife')
        diachi_nm= request.session.get('diachi_nm_termlife')
        tthon_nm= request.session.get('tthon_nm_termlife')
        detailjob_nm= request.session.get('detailjob_nm_termlife')
        cannang_nm= request.session.get('cannang_nm_termlife')
        chieucao_nm= request.session.get('chieucao_nm_termlife')
        quoctich_nm=    request.session.get('quoctich_nm_termlife')
        congdanmy_nm= request.session.get('congdanmy_nm_termlife')
        base64cmttruoc_nm= request.session.get('base64cmttruoc_nm_termlife')
        base64cmtsau_nm=  request.session.get('base64cmtsau_nm_termlife')

        muachinh=NguoiMuaBaoHiem.objects.create(username=phone_ngmua,fullname=name_nm,birth_day=daybirth_nm,birth_month=monthbirth_nm,
                                            birth_year=yearbirth_nm, gioi_tinh=sex_nm,email=email_nm,dia_chi_tinh_thanh_pho=thanhpho_nm,
                                            dia_chi_quan_huyen=huyen_nm,dia_chi_chi_tiet=diachi_nm,so_cmnd=cmt_nm,
                                            cmt_ngay_cap=ngaycap_nm,cmt_noi_cap=noicapcmt_nm,images_cmt_mattruoc=base64cmttruoc_nm,
                                            images_cmt_matsau=base64cmtsau_nm,status_marriage=tthon_nm,job=detailjob_nm,weight=cannang_nm,
                                            height=chieucao_nm,nationality=quoctich_nm,nationality_paper=congdanmy_nm,ho_ten_nhan=name_ng_nhan,
                                            email_nhan=email_ng_nhan,so_dien_thoai_nhan=phone_ng_nhan,dia_chi_tinh_thanh_pho_nhan=tinh_ng_nhan,
                                            dia_chi_quan_huyen_nhan=huyen_ng_nhan,dia_chi_chi_tiet_nhan=address_ng_nhan)

        sdt_ngdc=request.session.get('phone_ngdc_termlife')
        name_ngdc=request.session.get('name_ngdc_termlife')
        sex_ngdc=request.session.get('sex_ngdc_termlife')
        daybirth_ngdc=request.session.get('daybirth_ngdc_termlife')
        monthbirth_ngdc=request.session.get('monthbirth_ngdc_termlife')
        yearbirth_ngdc=request.session.get('yearbirth_ngdc_termlife') 
        email_ngdc=request.session.get('email_ngdc_termlife')
        cmt_ngdc=request.session.get('cmt_ngdc_termlife')
        ngaycap_ngdc=request.session.get('ngaycap_ngdc_termlife') 
        noicapcmt_ngdc=request.session.get('noicapcmt_ngdc_termlife')
        thanhpho_ngdc=request.session.get('thanhpho_ngdc_termlife')
        huyen_ngdc=request.session.get('huyen_ngdc_termlife')
        diachi_ngdc=request.session.get('diachi_ngdc_termlife')
        tthon_ngdc=request.session.get('tthon_ngdc_termlife')
        detailjob_ngdc=request.session.get('detailjob_ngdc_termlife')
        cannang_ngdc=request.session.get('cannang_ngdc_termlife')
        chieucao_ngdc=request.session.get('chieucao_ngdc_termlife')
        quoctich_ngdc=request.session.get('quoctich_ngdc_termlife')
        congdanmy_ngdc=request.session.get('congdanmy_ngdc_termlife')
        quanhenm=request.session.get('quanhenm_termlife')
        hutthuoc_ngdc=request.session.get('hutthuoc_ngdc_termlife')
        base64cmttruoc_ngdc=request.session.get('base64cmttruoc_ngdc_termlife')
        base64cmtsau_ngdc=request.session.get('base64cmtsau_ngdc_termlife')
        sotienbh_termlife=request.session.get('sotienbh_termlife')
        sonamhd_termlife=request.session.get('sonamhd_termlife')
        sonamdp_termlife=request.session.get('sonamdp_termlife')
        cachtraphi_termlife=request.session.get('cachtraphi_termlife')
        loai_tra_phi_termlife=request.session.get('loai_tra_phi_termlife')

        ngdc=termlife_models.NguoiDuocBaoHiem.objects.create(nguoimuabaohiem=muachinh,username=sdt_ngdc,fullname=name_ngdc,birth_day=daybirth_ngdc,
                                            birth_month=monthbirth_ngdc,
                                            birth_year=yearbirth_ngdc, gioi_tinh=sex_ngdc,email=email_ngdc,dia_chi_tinh_thanh_pho=thanhpho_ngdc,
                                            dia_chi_quan_huyen=huyen_ngdc,dia_chi_chi_tiet=diachi_ngdc,so_cmnd=cmt_ngdc,
                                            cmt_ngay_cap=ngaycap_ngdc,cmt_noi_cap=noicapcmt_ngdc,images_cmt_mattruoc=base64cmttruoc_ngdc,
                                            images_cmt_matsau=base64cmtsau_ngdc,status_marriage=tthon_ngdc,job=detailjob_ngdc,weight=cannang_ngdc,
                                            height=chieucao_ngdc,nationality=quoctich_ngdc,nationality_paper=congdanmy_ngdc,relationship=quanhenm,
                                            is_smoke=hutthuoc_ngdc,so_tien_bao_hiem=sotienbh_termlife,so_nam_hop_dong=sonamhd_termlife,
                                            so_nam_dong_phi=sonamdp_termlife,cach_tra_phi=cachtraphi_termlife,dinh_ky_dong_phi=loai_tra_phi_termlife)
        
        ten_nth1=request.session.get('ten_nth1_termlife')
        gender_nth1=request.session.get('gender_nth1_termlife')
        ngaysinh_nth1=request.session.get('ngaysinh_nth1_termlife')
        thangsinh_nth1=request.session.get('thangsinh_nth1_termlife')
        namsinh_nth1=request.session.get('namsinh_nth1_termlife')
        cmt_nth1=request.session.get('cmt_nth1_termlife')
        ngaycap_nth1=request.session.get('ngaycap_nth1_termlife')
        noicapcmt_nth1=request.session.get('noicapcmt_nth1_termlife')
        quanhe_nth1=request.session.get('quanhe_nth1_termlife')
        tile_nth1=request.session.get('tile_nth1_termlife')
        base64cmttruoc_nth1=request.session.get('base64cmttruoc_nth1_termlife')
        base64cmtsau_nth1=request.session.get('base64cmtsau_nth1_termlife')

        th1=termlife_models.NguoiThuHuong.objects.create(nguoiduocbaohiem=ngdc,fullname=ten_nth1,birth_day=ngaysinh_nth1,
                                                            birth_month=thangsinh_nth1,birth_year=namsinh_nth1,gioi_tinh=gender_nth1,
                                                            so_cmnd=cmt_nth1,cmt_ngay_cap=ngaycap_nth1,cmt_noi_cap=noicapcmt_nth1,
                                                            relationship=quanhe_nth1,ty_le_thu_huong=tile_nth1,images_cmt_mattruoc=base64cmttruoc_nth1,
                                                            images_cmt_matsau=base64cmtsau_nth1)
        ten_nth2=request.session.get('ten_nth2_termlife')
        gender_nth2=request.session.get('gender_nth2_termlife')
        ngaysinh_nth2=request.session.get('ngaysinh_nth2_termlife')
        thangsinh_nth2=request.session.get('thangsinh_nth2_termlife')
        namsinh_nth2=request.session.get('namsinh_nth2_termlife')
        cmt_nth2=request.session.get('cmt_nth2_termlife')
        ngaycap_nth2=request.session.get('ngaycap_nth2_termlife')
        noicapcmt_nth2=request.session.get('noicapcmt_nth2_termlife')
        quanhe_nth2=request.session.get('quanhe_nth2_termlife')
        tile_nth2=request.session.get('tile_nth2_termlife')
        base64cmttruoc_nth2=request.session.get('base64cmttruoc_nth2_termlife')
        base64cmtsau_nth2=request.session.get('base64cmtsau_nth2_termlife')
        if ten_nth2 != None and gender_nth2 != None and ngaysinh_nth2 != None and thangsinh_nth2 != None and namsinh_nth2 != None and cmt_nth2 != None and ngaycap_nth2 != None and noicapcmt_nth2 != None and quanhe_nth2 != None and tile_nth2 != None and base64cmttruoc_nth2 != None and base64cmtsau_nth2 != None:
            th2=termlife_models.NguoiThuHuong.objects.create(nguoiduocbaohiem=ngdc,fullname=ten_nth2,birth_day=ngaysinh_nth2,
                                                            birth_month=thangsinh_nth2,birth_year=namsinh_nth2,gioi_tinh=gender_nth2,
                                                            so_cmnd=cmt_nth2,cmt_ngay_cap=ngaycap_nth2,cmt_noi_cap=noicapcmt_nth2,
                                                            relationship=quanhe_nth2,ty_le_thu_huong=tile_nth2,images_cmt_mattruoc=base64cmttruoc_nth2,
                                                            images_cmt_matsau=base64cmtsau_nth2)
        user=User.objects.get(id=request.user.id)
        sophichinh=request.session.get('sophichinh_termlife')
        sophiphu=request.session.get('sophiphu_termlife')
        total_money_final_no_VAT=sophichinh+sophiphu
        total_money_hasVAT_tl=int(total_money_final_no_VAT*1.1)
        if mgg is None or mgg == "":
            code_giam_gia=None
            total_money_hasDiscount=total_money_hasVAT_tl
        else:
            code_giam_gia=mgg
            tk= payment_model.MaGiamGia.objects.get(code_ma_giam_gia=code_giam_gia)
            discount=tk.discount
            total_money_hasDiscount=int(total_money_hasVAT_tl*(1-discount))
        cty=request.session.get('cty_termlife')
        goispchinh=request.session.get('spchinh_termlife')
        list_spp=request.session.get('list_spp_termlife')

        order_id = unique_order_id_generator(request.user.username)
        pay_loai_hop_dong=loai_hop_dong(user,total_money_final_no_VAT,1)          #1 - BH tử kỳ
        request.session['id_ngmua_chinh']= muachinh.id                             #mua_chinh.id
        request.session['ma_don_hang_bihama'] = order_id
        request.session['pay_so_dien_thoai'] = request.user.username
        request.session['pay_cong_ty'] = cty                               #cty fubon
        request.session['pay_loai_hinh_bao_hiem'] = 1                           #1 - BH tử kỳ
        request.session['pay_goi_san_pham'] = goispchinh
        request.session['pay_goi_san_pham_phu'] = list_spp
        request.session['pay_so_phi_chinh'] = sophichinh
        request.session['pay_so_phi_phu'] = sophiphu
        request.session['pay_so_phi_VAT'] = int(total_money_final_no_VAT*0.1)
        request.session['pay_tong_phi_thanh_toan_has_VAT'] = total_money_hasVAT_tl
        request.session['pay_loai_hop_dong'] = pay_loai_hop_dong
        request.session['pay_ma_giam_gia'] = code_giam_gia
        request.session['pay_tong_phi_thanh_toan_sau_giam_gia'] = total_money_hasDiscount

        return redirect('payment')


class CompareMultiProductView(View):
    def get(self, request):
        return render(request, 'termlife/compare-multi-product.html')


class ApiChangeProductTermlife(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request, format=None):
        valid_data = validate_data(termlife_serializers.ApiChangeProductTermlifeSer, request.data)
        sotienbh = valid_data.get('stbh')
        sonamhd = valid_data.get('snhd')
        sonamdp = valid_data.get('sndphi')
        cachtraphi = valid_data.get('tra_phi')
        spchinh = valid_data.get('loaispc')
        loai_tra_phi =valid_data.get('ht_tra_phi')
        age_ngdc=request.session.get('age_ngdc_termlife')
        sex_ngdc=request.session.get('sex_ngdc_termlife')
        if spchinh == 1:
            term_life=termlife_models.GoiSanPhamChinh.objects.filter(id_loai_hinh_bao_hiem=1,id_goi_san_pham_chinh=spchinh,tuoi=age_ngdc,so_nam_hop_dong=sonamhd,so_nam_dong_phi=sonamdp,cach_tra_phi=cachtraphi)
        else:
            term_life=termlife_models.GoiSanPhamChinh.objects.filter(id_loai_hinh_bao_hiem=1,id_goi_san_pham_chinh=spchinh,gioi_tinh=sex_ngdc,tuoi=age_ngdc,so_nam_hop_dong=sonamhd,so_nam_dong_phi=sonamdp,cach_tra_phi=cachtraphi)
        list_term_life = []
        for it in term_life:
            sub_item = {}
            money=int(termlife_utils.get_money_spc_term_life(1,sex_ngdc,age_ngdc,sotienbh,sonamhd,sonamdp,cachtraphi,it.company.id_ten_cong_ty,loai_tra_phi,spchinh))
            sub_item['money_real'] = convert_price_to_string(money)
            sub_item['cty'] = it.company.id_ten_cong_ty
            list_term_life.append(sub_item)
        data={"list_term_life":list_term_life}
        return Response(data=data, status=status.HTTP_200_OK)


class ApiPushProductTermlife(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request, format=None):
        valid_data = validate_data(termlife_serializers.ApiPushProductTermlifeSer, request.data)
        sotienbh = valid_data.get('stbh')
        sonamhd = valid_data.get('snhd')
        sonamdp = valid_data.get('sndphi')
        cachtraphi = valid_data.get('tra_phi')
        spchinh = valid_data.get('loaispc')
        loai_tra_phi =valid_data.get('ht_tra_phi')
        smoking = valid_data.get('smoking')
        cty = valid_data.get('cty')
        age_ngdc=request.session.get('age_ngdc_termlife')
        sex_ngdc=request.session.get('sex_ngdc_termlife')

        money=int(termlife_utils.get_money_spc_term_life(1,sex_ngdc,age_ngdc,sotienbh,sonamhd,sonamdp,cachtraphi,cty,loai_tra_phi,spchinh))

        request.session['sotienbh_termlife']=sotienbh
        request.session['sonamhd_termlife']=sonamhd
        request.session['sonamdp_termlife']=sonamdp
        request.session['cachtraphi_termlife']=cachtraphi
        request.session['spchinh_termlife']=spchinh
        request.session['loai_tra_phi_termlife']=loai_tra_phi
        request.session['smoking_ngdc_termlife']=smoking
        request.session['cty_termlife']=cty
        request.session['sophichinh_termlife']=money

        return Response(1, status=status.HTTP_200_OK)


class ApiChangeSppTermLife(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request, format=None):
        valid_data = validate_data(termlife_serializers.ApiChangeSppTLSer, request.data)
        namvien=json.loads(valid_data.get('pbbtnv'))
        hiemngheo=json.loads(valid_data.get('pbbthn'))
        spc=valid_data.get('spc')
        nv=namvien['arr_spp1']
        hn=hiemngheo['arr_spp2']
        sex_ngdc=request.session.get('sex_ngdc_termlife')
        age_ngdc=request.session.get('age_ngdc_termlife')
        cty_termlife=request.session.get('cty_termlife')
        sophichinh_termlife=request.session.get('sophichinh_termlife')
        money_spp=int(termlife_utils.get_money_spp_term_life(nv,hn,sex_ngdc,age_ngdc,cty_termlife,spc))
        phiVat=int((sophichinh_termlife+money_spp)*0.1)
        total_tl=int((sophichinh_termlife+money_spp)*1.1)

        data={'money_spp':convert_price_to_string(money_spp),'phiVat':convert_price_to_string(phiVat),'total_tl':convert_price_to_string(total_tl)}
        return Response(data=data, status=status.HTTP_200_OK)

