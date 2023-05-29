from django.shortcuts import render, redirect
from django.views import View
import json
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import permissions
from rest_framework import status
from rest_framework.renderers import TemplateHTMLRenderer, JSONRenderer
from apps.article.models import GioiThieuLoaiHinhBH
from . import serializers as core_serializers
from . import utils as api_utils
from apps.core.utils import validate_data, validate_response, convert_price_to_string, convert_sex, loai_hop_dong
from apps.investment import models as invest_models
from apps.investment import serializers as investment_serializers
from apps.robot import utils as robot_utils
from apps.core.models import Company,NguoiMuaBaoHiemTam,NguoiMuaBaoHiem,Provincial,District, LinhVuNgheNghiep
from django.utils import timezone
import datetime
from apps.users.models import User
from  apps.payment import models as payment_model
from apps.payment.views import unique_order_id_generator
from django.contrib.auth.mixins import LoginRequiredMixin


class AddDataLaiSuatApi(APIView):
    permission_classes = (permissions.AllowAny,)
    def post(self, request):
        valid_data = validate_data(core_serializers.AddDataLaiSuatApiSer, request.data)
        nam = valid_data.get('nam')
        laisuat = valid_data.get('laisuat')

        if invest_models.LaiSuatThiTruong.objects.filter(nam=nam,phantram=laisuat).exists():
            return Response(1, status=status.HTTP_400_BAD_REQUEST)
        else:
            invest_models.LaiSuatThiTruong.objects.create(nam=nam,phantram=laisuat)
            return Response(1, status=status.HTTP_200_OK)


class InfoInvestmentView(View):
    def get(self, request):
        return render(request, 'investment/investment.html')

    def post(self, request):
        sex_ngdc=request.POST.get('sex_ngdc')
        name_ngdc=request.POST.get('name_ngdc')
        ngays_ngdc=request.POST.get('ngays_ngdc')
        thangs_ngdc=request.POST.get('thangs_ngdc')
        nams_ngdc=request.POST.get('nams_ngdc')
        phone_ngdc=request.POST.get('phone_ngdc')
        age_ngdc=request.POST.get('age_ngdc')

        request.session['sex_ngdc_investment']=int(sex_ngdc)
        request.session['name_ngdc_investment'] = name_ngdc
        request.session['ngays_ngdc_investment']=int(ngays_ngdc)
        request.session['thangs_ngdc_investment']=int(thangs_ngdc)
        request.session['nams_ngdc_investment']=int(nams_ngdc)
        request.session['phone_ngdc_investment'] = phone_ngdc
        request.session['age_ngdc_investment']=int(age_ngdc)

        return redirect('investment:investment-compare')


class InvestmentCompare(View):

    def get(self, request):
        gioitinh=request.session.get('sex_ngdc_investment')
        tuoi=request.session.get('age_ngdc_investment')
        name=request.session.get('name_ngdc_investment')

        thong_tin = api_utils.minh_hoa_hop_dong(tuoi,gioitinh,3000000,3,100000000,0.065)
        laixuatthitruong = invest_models.LaiSuatThiTruong.objects.all().order_by('nam')
        data_nam_lsthitruong = []
        data_laisuat_lsthitruong = []
        sex=convert_sex(gioitinh)
        for ls in laixuatthitruong:
            data_nam_lsthitruong.append(ls.nam)
            data_laisuat_lsthitruong.append(ls.phantram*100)
        context = {
            'money_dongphi':convert_price_to_string(int(thong_tin['gia_tri_tai_khoan_hop_dong'][-1])),
            'data_namtt':data_nam_lsthitruong,
            'data_lstt':data_laisuat_lsthitruong,
            'sex':sex,
            'tuoi':tuoi,
            'name':name,
            'gia_tri_tai_khoan_co_ban':thong_tin['gia_tri_tai_khoan_co_ban'],
            'gia_tri_tai_khoan_dong_them':thong_tin['gia_tri_tai_khoan_dong_them'],
            'gia_tri_tai_khoan_hop_dong':thong_tin['gia_tri_tai_khoan_hop_dong'],
            'gia_tri_hoan_lai':thong_tin['gia_tri_hoan_lai'],
            'quyen_loi_bao_hiem':thong_tin['quyen_loi_bao_hiem'],
            'phi_dong_hang_nam':thong_tin['phi_dong_hang_nam'],
            'namhopdong':thong_tin['namhopdong']

        }
        
        return render(request, 'investment/investment_compare.html',context=context)


class InvestmentApiViewRobot(APIView):
    permission_classes = (permissions.AllowAny,)

    def post(self, request):
        valid_data = validate_data(investment_serializers.InfoProductInvestSerRobot, request.data)
        robot_dautu_gioitinh = valid_data.get('robot_dautu_gioitinh')
        robot_dautu_tuoi = valid_data.get('robot_dautu_tuoi')
        robot_dautu_luong = valid_data.get('robot_dautu_luong')
        robot_dautu_tamnhin = valid_data.get('robot_dautu_tamnhin')
        robot_dautu_mongmuon = valid_data.get('robot_dautu_mongmuon')
        robot_dautu_ruiro = valid_data.get('robot_dautu_ruiro')
        robot_dautu_dudinh = valid_data.get('robot_dautu_dudinh')
        robot_dautu_loaibaohiem = valid_data.get('robot_dautu_loaibaohiem')

        request.session['robot_dautu_gioitinh'] = robot_dautu_gioitinh
        request.session['robot_dautu_tuoi'] = robot_dautu_tuoi
        request.session['robot_dautu_luong'] = robot_dautu_luong
        request.session['robot_dautu_tamnhin'] = robot_dautu_tamnhin
        request.session['robot_dautu_mongmuon'] = robot_dautu_mongmuon
        request.session['robot_dautu_ruiro'] = robot_dautu_ruiro
        request.session['robot_dautu_dudinh'] = robot_dautu_dudinh
        request.session['robot_dautu_loaibaohiem'] = robot_dautu_loaibaohiem


        kqHomeRobotRiskTotal=robot_utils.get_risk_total(robot_dautu_tamnhin,robot_dautu_mongmuon,robot_dautu_ruiro,robot_dautu_dudinh,robot_dautu_loaibaohiem)
        data={
            'kqHomeRobotRiskTotal':kqHomeRobotRiskTotal
        }
        return Response(data=data, status=status.HTTP_200_OK)


class LienKetChungView(View):
    def get(self, request):
        list_provincial=Provincial.objects.all().order_by("name")
        list_job=LinhVuNgheNghiep.objects.all().order_by("code_linhvuc")
        sex_ngdc=request.session['sex_ngdc_investment']
        name_ngdc=request.session['name_ngdc_investment']
        ngays_ngdc=request.session['ngays_ngdc_investment']
        thangs_ngdc=request.session['thangs_ngdc_investment']
        nams_ngdc=request.session['nams_ngdc_investment']
        phone_ngdc=request.session['phone_ngdc_investment']
        age_ngdc=request.session['age_ngdc_investment']
        stdautuhangnam=request.session.get('stdautuhangnam_investment')
        sonamdongphi=request.session.get('sonamdongphi_investment')
        sonamhopdong=request.session.get('sonamhopdong_investment')
        stbaohiem=request.session.get('stbaohiem_investment')
        laisuatminhhoa=request.session.get('laisuatminhhoa_investment')
        cty=request.session.get('cty_investment')
        phi_VAT=int(stdautuhangnam*0.1)
        money_hasVAT=int(stdautuhangnam*1.1)
        context={
            "list_data": list_provincial,
            'list_job':list_job,
            'stdautuhangnam':convert_price_to_string(stdautuhangnam),
            'sonamdongphi':sonamdongphi,
            'sonamhopdong':sonamhopdong,
            'stbaohiem':convert_price_to_string(stbaohiem),
            'laisuatminhhoa':laisuatminhhoa,
            'cty':cty,
            'phi_VAT':convert_price_to_string(phi_VAT),
            'money_hasVAT':convert_price_to_string(money_hasVAT),
            'name_ngdc':name_ngdc,
            'sex_ngdc':sex_ngdc,
            'ngays_ngdc':ngays_ngdc,
            'thangs_ngdc':thangs_ngdc,
            'nams_ngdc':nams_ngdc,
            'phone_ngdc':phone_ngdc

        }
        return render(request, 'investment/lienketchung.html',context)
    
    def post(self, request):
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
        # base64cmttruoc_nm= request.session.get('base64cmttruoc_nm_investment')
        # base64cmtsau_nm=  request.session.get('base64cmtsau_nm_investment')
        base64cmttruoc_nm=None
        base64cmtsau_nm=None

        tk=NguoiMuaBaoHiemTam.objects.create(username=phone_ngmua,fullname=name_nm,birth_day=daybirth_nm,birth_month=monthbirth_nm,
                                            birth_year=yearbirth_nm, gioi_tinh=sex_nm,email=email_nm,dia_chi_tinh_thanh_pho=thanhpho_nm,
                                            dia_chi_quan_huyen=huyen_nm,dia_chi_chi_tiet=diachi_nm,so_cmnd=cmt_nm,
                                            cmt_ngay_cap=ngaycap_nm,cmt_noi_cap=noicapcmt_nm,images_cmt_mattruoc=base64cmttruoc_nm,
                                            images_cmt_matsau=base64cmtsau_nm,status_marriage=tthon_nm,job=detailjob_nm,weight=cannang_nm,
                                            height=chieucao_nm,nationality=quoctich_nm,nationality_paper=congdanmy_nm)

        request.session['name_nm_investment']=name_nm
        request.session['sex_nm_investment']=sex_nm
        request.session['daybirth_nm_investment']=daybirth_nm
        request.session['monthbirth_nm_investment']=monthbirth_nm
        request.session['yearbirth_nm_investment']= yearbirth_nm
        request.session['sdt_nm_investment']=phone_ngmua
        request.session['email_nm_investment']=email_nm
        request.session['cmt_nm_investment']=cmt_nm
        request.session['ngaycap_nm_investment']= ngaycap_nm
        request.session['noicapcmt_nm_investment']=noicapcmt_nm
        request.session['thanhpho_nm_investment']=thanhpho_nm
        request.session['huyen_nm_investment']=huyen_nm
        request.session['diachi_nm_investment']=diachi_nm
        request.session['tthon_nm_investment']=tthon_nm
        request.session['detailjob_nm_investment']=detailjob_nm
        request.session['cannang_nm_investment']=cannang_nm
        request.session['chieucao_nm_investment']=chieucao_nm
        request.session['quoctich_nm_investment']=quoctich_nm
        request.session['congdanmy_nm_investment']=congdanmy_nm


        #ngdc
        name_ngdc=request.POST.get('name_ngdc')
        sex_ngdc=request.POST.get('sex_ngdc')
        daybirth_ngdc=request.POST.get('daybirth_ngdc')
        monthbirth_ngdc=request.POST.get('monthbirth_ngdc')
        yearbirth_ngdc=request.POST.get('yearbirth_ngdc')
        sdt_ngdc=request.session.get('phone_ngdc_investment')
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
        # base64cmttruoc_ngdc=request.session.get('base64cmttruoc_ngdc_investment')
        # base64cmtsau_ngdc=request.session.get('base64cmtsau_ngdc_investment')

        base64cmttruoc_ngdc=None
        base64cmtsau_ngdc=None

        sotienbh_investment=request.session.get('stbaohiem_investment')
        sonamhd_investment=request.session.get('sonamhopdong_investment')
        sonamdp_investment=request.session.get('sonamdongphi_investment')

        tk1=invest_models.NguoiDuocBaoHiemTam.objects.create(nguoimuabaohiemtam=tk,username=sdt_ngdc,fullname=name_ngdc,birth_day=daybirth_ngdc,
                                            birth_month=monthbirth_ngdc,
                                            birth_year=yearbirth_ngdc, gioi_tinh=sex_ngdc,email=email_ngdc,dia_chi_tinh_thanh_pho=thanhpho_ngdc,
                                            dia_chi_quan_huyen=huyen_ngdc,dia_chi_chi_tiet=diachi_ngdc,so_cmnd=cmt_ngdc,
                                            cmt_ngay_cap=ngaycap_ngdc,cmt_noi_cap=noicapcmt_ngdc,images_cmt_mattruoc=base64cmttruoc_ngdc,
                                            images_cmt_matsau=base64cmtsau_ngdc,status_marriage=tthon_ngdc,job=detailjob_ngdc,weight=cannang_ngdc,
                                            height=chieucao_ngdc,nationality=quoctich_ngdc,nationality_paper=congdanmy_ngdc,relationship=quanhenm,
                                            is_smoke=hutthuoc_ngdc,so_tien_bao_hiem=sotienbh_investment,so_nam_hop_dong=sonamhd_investment,
                                            so_nam_dong_phi=sonamdp_investment)

        request.session['name_ngdc_investment']=name_ngdc
        request.session['sex_ngdc_investment']=sex_ngdc
        request.session['daybirth_ngdc_investment']=daybirth_ngdc
        request.session['monthbirth_ngdc_investment']=monthbirth_ngdc
        request.session['yearbirth_ngdc_investment']= yearbirth_ngdc
        request.session['email_ngdc_investment']=email_ngdc
        request.session['cmt_ngdc_investment']=cmt_ngdc
        request.session['ngaycap_ngdc_investment']= ngaycap_ngdc
        request.session['noicapcmt_ngdc_investment']=noicapcmt_ngdc
        request.session['thanhpho_ngdc_investment']=thanhpho_ngdc
        request.session['huyen_ngdc_investment']=huyen_ngdc
        request.session['diachi_ngdc_investment']=diachi_ngdc
        request.session['tthon_ngdc_investment']=tthon_ngdc
        request.session['detailjob_ngdc_investment']=detailjob_ngdc
        request.session['cannang_ngdc_investment']=cannang_ngdc
        request.session['chieucao_ngdc_investment']=chieucao_ngdc
        request.session['quoctich_ngdc_investment']=quoctich_ngdc
        request.session['congdanmy_ngdc_investment']=congdanmy_ngdc
        request.session['quanhenm_investment']=quanhenm
        request.session['hutthuoc_ngdc_investment']=hutthuoc_ngdc


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
        # base64cmttruoc_nth1=request.session.get('base64cmttruoc_nth1_investment')
        # base64cmtsau_nth1=request.session.get('base64cmtsau_nth1_investment')

        base64cmttruoc_nth1=None
        base64cmtsau_nth1=None

        tk2=invest_models.NguoiThuHuongTam.objects.create(nguoiduocbaohiemtam=tk1,fullname=ten_nth1,birth_day=ngaysinh_nth1,
                                                            birth_month=thangsinh_nth1,birth_year=namsinh_nth1,gioi_tinh=gender_nth1,
                                                            so_cmnd=cmt_nth1,cmt_ngay_cap=ngaycap_nth1,cmt_noi_cap=noicapcmt_nth1,
                                                            relationship=quanhe_nth1,ty_le_thu_huong=tile_nth1,images_cmt_mattruoc=base64cmttruoc_nth1,
                                                            images_cmt_matsau=base64cmtsau_nth1)

        request.session['ten_nth1_investment']=ten_nth1
        request.session['gender_nth1_investment']=gender_nth1
        request.session['ngaysinh_nth1_investment']=ngaysinh_nth1
        request.session['thangsinh_nth1_investment']=thangsinh_nth1
        request.session['namsinh_nth1_investment']=namsinh_nth1
        request.session['cmt_nth1_investment']=cmt_nth1
        request.session['ngaycap_nth1_investment']=ngaycap_nth1
        request.session['noicapcmt_nth1_investment']=noicapcmt_nth1
        request.session['quanhe_nth1_investment']=quanhe_nth1
        request.session['tile_nth1_investment']=tile_nth1

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
        # base64cmttruoc_nth2=request.session.get('base64cmttruoc_nth2')
        # base64cmtsau_nth2=request.session.get('base64cmtsau_nth2')
        base64cmttruoc_nth2=None
        base64cmtsau_nth2=None
        if ten_nth2 != None and gender_nth2 != None and ngaysinh_nth2 != None and thangsinh_nth2 != None and namsinh_nth2 != None and cmt_nth2 != None and ngaycap_nth2 != None and noicapcmt_nth2 != None and quanhe_nth2 != None and tile_nth2 != None and base64cmttruoc_nth2 != None and base64cmtsau_nth2 != None:
            tk3=invest_models.NguoiThuHuongTam.objects.create(nguoiduocbaohiemtam=tk1,fullname=ten_nth2,birth_day=ngaysinh_nth2,
                                                            birth_month=thangsinh_nth2,birth_year=namsinh_nth2,gioi_tinh=gender_nth2,
                                                            so_cmnd=cmt_nth2,cmt_ngay_cap=ngaycap_nth2,cmt_noi_cap=noicapcmt_nth2,
                                                            relationship=quanhe_nth2,ty_le_thu_huong=tile_nth2,images_cmt_mattruoc=base64cmttruoc_nth2,
                                                            images_cmt_matsau=base64cmtsau_nth2)
            request.session['ten_nth2_investment']=ten_nth2
            request.session['gender_nth2_investment']=gender_nth2
            request.session['ngaysinh_nth2_investment']=ngaysinh_nth2
            request.session['thangsinh_nth2_investment']=thangsinh_nth2
            request.session['namsinh_nth2_investment']=namsinh_nth2
            request.session['cmt_nth2_investment']=cmt_nth2
            request.session['ngaycap_nth2_investment']=ngaycap_nth2
            request.session['noicapcmt_nth2_investment']=noicapcmt_nth2
            request.session['quanhe_nth2_investment']=quanhe_nth2
            request.session['tile_nth2_investment']=tile_nth2
            request.session['base64cmttruoc_nth2_investment']=base64cmttruoc_nth2
            request.session['base64cmtsau_nth2_investment']=base64cmtsau_nth2
        return redirect('investment:prepayment')


class LienKetDonViView(View):
    def get(self, request):
        # list_provincial=Provincial.objects.all().order_by("name")
        # list_job=LinhVuNgheNghiep.objects.all().order_by("code_linhvuc")
        # sex_ngdc=request.session['sex_ngdc_investment']
        # name_ngdc=request.session['name_ngdc_investment']
        # ngays_ngdc=request.session['ngays_ngdc_investment']
        # thangs_ngdc=request.session['thangs_ngdc_investment']
        # nams_ngdc=request.session['nams_ngdc_investment']
        # phone_ngdc=request.session['phone_ngdc_investment']
        # age_ngdc=request.session['age_ngdc_investment']

        # stdautuhangnam=request.session.get('stdautuhangnam_investment')
        # sonamdongphi=request.session.get('sonamdongphi_investment')
        # sonamhopdong=request.session.get('sonamhopdong_investment')
        # stbaohiem=request.session.get('stbaohiem_investment')
        # laisuatminhhoa=request.session.get('laisuatminhhoa_investment')
        # cty=request.session.get('cty_investment')
        # phi_VAT=int(stdautuhangnam*0.1)
        # money_hasVAT=int(stdautuhangnam*1.1)
        # context={
        #     "list_data": list_provincial,
        #     'list_job':list_job,
        #     'stdautuhangnam':convert_price_to_string(stdautuhangnam),
        #     'sonamdongphi':sonamdongphi,
        #     'sonamhopdong':sonamhopdong,
        #     'stbaohiem':stbaohiem,
        #     'laisuatminhhoa':laisuatminhhoa,
        #     'cty':cty,
        #     'phi_VAT':convert_price_to_string(phi_VAT),
        #     'money_hasVAT':convert_price_to_string(money_hasVAT),
        #     'name_ngdc':name_ngdc,
        #     'sex_ngdc':sex_ngdc,
        #     'ngays_ngdc':ngays_ngdc,
        #     'thangs_ngdc':thangs_ngdc,
        #     'nams_ngdc':nams_ngdc,
        #     'phone_ngdc':phone_ngdc

        # }
        return render(request, 'investment/lienketdonvi.html')
    
    # def post(self, request):
    #     #ngmua
    #     phone_ngmua=request.user.username
    #     name_nm=request.POST.get('name_nm')
    #     sex_nm=request.POST.get('sex_nm')
    #     daybirth_nm=request.POST.get('daybirth_nm')
    #     monthbirth_nm=request.POST.get('monthbirth_nm')
    #     yearbirth_nm=request.POST.get('yearbirth_nm')
    #     email_nm=request.POST.get('email_nm')
    #     cmt_nm=request.POST.get('cmt_nm')
    #     ngaycap_nm=request.POST.get('ngaycap_nm')
    #     noicapcmt_nm=request.POST.get('noicapcmt_nm')
    #     thanhpho_nm=request.POST.get('thanhpho_nm')
    #     huyen_nm=request.POST.get('huyen_nm')
    #     diachi_nm=request.POST.get('diachi_nm')

    #     tthon_nm=request.POST.get('tthon_nm')
    #     linhvuc_nm=request.POST.get('linhvuc_nm')
    #     job_nm=request.POST.get('job_nm')
    #     detailjob_nm=request.POST.get('detailjob_nm')
    #     cannang_nm=request.POST.get('cannang_nm')
    #     chieucao_nm=request.POST.get('chieucao_nm')
    #     quoctich_nm=request.POST.get('quoctich_nm')
    #     congdanmy_nm=request.POST.get('congdanmy_nm')
    #     base64cmttruoc_nm=request.POST.get('base64cmttruoc_nm')
    #     base64cmtsau_nm=request.POST.get('base64cmtsau_nm') 

    #     tk=NguoiMuaBaoHiemTam.objects.create(username=phone_ngmua,fullname=name_nm,birth_day=daybirth_nm,birth_month=monthbirth_nm,
    #                                         birth_year=yearbirth_nm, gioi_tinh=sex_nm,email=email_nm,dia_chi_tinh_thanh_pho=thanhpho_nm,
    #                                         dia_chi_quan_huyen=huyen_nm,dia_chi_chi_tiet=diachi_nm,so_cmnd=cmt_nm,
    #                                         cmt_ngay_cap=ngaycap_nm,cmt_noi_cap=noicapcmt_nm,images_cmt_mattruoc=base64cmttruoc_nm,
    #                                         images_cmt_matsau=base64cmtsau_nm,status_marriage=tthon_nm,job=detailjob_nm,weight=cannang_nm,
    #                                         height=chieucao_nm,nationality=quoctich_nm,nationality_paper=congdanmy_nm)

    #     request.session['name_nm_investment']=name_nm
    #     request.session['sex_nm_investment']=sex_nm
    #     request.session['daybirth_nm_investment']=daybirth_nm
    #     request.session['monthbirth_nm_investment']=monthbirth_nm
    #     request.session['yearbirth_nm_investment']= yearbirth_nm
    #     request.session['sdt_nm_investment']=phone_ngmua
    #     request.session['email_nm_investment']=email_nm
    #     request.session['cmt_nm_investment']=cmt_nm
    #     request.session['ngaycap_nm_investment']= ngaycap_nm
    #     request.session['noicapcmt_nm_investment']=noicapcmt_nm
    #     request.session['thanhpho_nm_investment']=thanhpho_nm
    #     request.session['huyen_nm_investment']=huyen_nm
    #     request.session['diachi_nm_investment']=diachi_nm
    #     request.session['tthon_nm_investment']=tthon_nm
    #     request.session['detailjob_nm_investment']=detailjob_nm
    #     request.session['cannang_nm_investment']=cannang_nm
    #     request.session['chieucao_nm_investment']=chieucao_nm
    #     request.session['quoctich_nm_investment']=quoctich_nm
    #     request.session['congdanmy_nm_investment']=congdanmy_nm
    #     request.session['base64cmttruoc_nm_investment']=base64cmttruoc_nm
    #     request.session['base64cmtsau_nm_investment']=base64cmtsau_nm

    #     #ngdc
    #     name_ngdc=request.POST.get('name_ngdc')
    #     sex_ngdc=request.POST.get('sex_ngdc')
    #     daybirth_ngdc=request.POST.get('daybirth_ngdc')
    #     monthbirth_ngdc=request.POST.get('monthbirth_ngdc')
    #     yearbirth_ngdc=request.POST.get('yearbirth_ngdc')
    #     sdt_ngdc=request.session.get('phone_ngdc_investment')
    #     email_ngdc=request.POST.get('email_ngdc')
    #     cmt_ngdc=request.POST.get('cmt_ngdc')
    #     ngaycap_ngdc=request.POST.get('ngaycap_ngdc')
    #     noicapcmt_ngdc=request.POST.get('noicapcmt_ngdc')
    #     thanhpho_ngdc=request.POST.get('thanhpho_ngdc')
    #     huyen_ngdc=request.POST.get('huyen_ngdc')
    #     diachi_ngdc=request.POST.get('diachi_ngdc')
    #     tthon_ngdc=request.POST.get('tthon_ngdc')
    #     linhvuc_ngdc=request.POST.get('linhvuc_ngdc')
    #     job_ngdc=request.POST.get('job_ngdc')
    #     detailjob_ngdc=request.POST.get('detailjob_ngdc')
    #     cannang_ngdc=request.POST.get('cannang_ngdc')
    #     chieucao_ngdc=request.POST.get('chieucao_ngdc')
    #     quoctich_ngdc=request.POST.get('quoctich_ngdc')
    #     congdanmy_ngdc=request.POST.get('congdanmy_ngdc')
    #     quanhenm=request.POST.get('quanhenm')
    #     hutthuoc_ngdc=request.POST.get('hutthuoc_ngdc')
    #     base64cmttruoc_ngdc=request.POST.get('base64cmttruoc_ngdc')
    #     base64cmtsau_ngdc=request.POST.get('base64cmtsau_ngdc')

    #     sotienbh_investment=request.session.get('stbaohiem_investment')
    #     sonamhd_investment=request.session.get('sonamhopdong_investment')
    #     sonamdp_investment=request.session.get('sonamdongphi_investment')

    #     tk1=invest_models.NguoiDuocBaoHiemTam.objects.create(nguoimuabaohiemtam=tk,username=sdt_ngdc,fullname=name_ngdc,birth_day=daybirth_ngdc,
    #                                         birth_month=monthbirth_ngdc,
    #                                         birth_year=yearbirth_ngdc, gioi_tinh=sex_ngdc,email=email_ngdc,dia_chi_tinh_thanh_pho=thanhpho_ngdc,
    #                                         dia_chi_quan_huyen=huyen_ngdc,dia_chi_chi_tiet=diachi_ngdc,so_cmnd=cmt_ngdc,
    #                                         cmt_ngay_cap=ngaycap_ngdc,cmt_noi_cap=noicapcmt_ngdc,images_cmt_mattruoc=base64cmttruoc_ngdc,
    #                                         images_cmt_matsau=base64cmtsau_ngdc,status_marriage=tthon_ngdc,job=detailjob_ngdc,weight=cannang_ngdc,
    #                                         height=chieucao_ngdc,nationality=quoctich_ngdc,nationality_paper=congdanmy_ngdc,relationship=quanhenm,
    #                                         is_smoke=hutthuoc_ngdc,so_tien_bao_hiem=sotienbh_investment,so_nam_hop_dong=sonamhd_investment,
    #                                         so_nam_dong_phi=sonamdp_investment)

    #     request.session['name_ngdc_investment']=name_ngdc
    #     request.session['sex_ngdc_investment']=sex_ngdc
    #     request.session['daybirth_ngdc_investment']=daybirth_ngdc
    #     request.session['monthbirth_ngdc_investment']=monthbirth_ngdc
    #     request.session['yearbirth_ngdc_investment']= yearbirth_ngdc
    #     request.session['email_ngdc_investment']=email_ngdc
    #     request.session['cmt_ngdc_investment']=cmt_ngdc
    #     request.session['ngaycap_ngdc_investment']= ngaycap_ngdc
    #     request.session['noicapcmt_ngdc_investment']=noicapcmt_ngdc
    #     request.session['thanhpho_ngdc_investment']=thanhpho_ngdc
    #     request.session['huyen_ngdc_investment']=huyen_ngdc
    #     request.session['diachi_ngdc_investment']=diachi_ngdc
    #     request.session['tthon_ngdc_investment']=tthon_ngdc
    #     request.session['detailjob_ngdc_investment']=detailjob_ngdc
    #     request.session['cannang_ngdc_investment']=cannang_ngdc
    #     request.session['chieucao_ngdc_investment']=chieucao_ngdc
    #     request.session['quoctich_ngdc_investment']=quoctich_ngdc
    #     request.session['congdanmy_ngdc_investment']=congdanmy_ngdc
    #     request.session['quanhenm_investment']=quanhenm
    #     request.session['hutthuoc_ngdc_investment']=hutthuoc_ngdc
    #     request.session['base64cmttruoc_ngdc_investment']=base64cmttruoc_ngdc
    #     request.session['base64cmtsau_ngdc_investment']=base64cmtsau_ngdc

    #     #ngthuhuong1
    #     ten_nth1=request.POST.get('ten_nth1')
    #     gender_nth1=request.POST.get('gender_nth1')
    #     ngaysinh_nth1=request.POST.get('ngaysinh_nth1')
    #     thangsinh_nth1=request.POST.get('thangsinh_nth1')
    #     namsinh_nth1=request.POST.get('namsinh_nth1')
    #     cmt_nth1=request.POST.get('cmt_nth1')
    #     ngaycap_nth1=request.POST.get('ngaycap_nth1')
    #     noicapcmt_nth1=request.POST.get('noicapcmt_nth1')
    #     quanhe_nth1=request.POST.get('quanhe_nth1')
    #     tile_nth1=request.POST.get('tile_nth1')
    #     base64cmttruoc_nth1=request.POST.get('base64cmttruoc_nth1')
    #     base64cmtsau_nth1=request.POST.get('base64cmtsau_nth1')

    #     tk2=invest_models.NguoiThuHuongTam.objects.create(nguoiduocbaohiemtam=tk1,fullname=ten_nth1,birth_day=ngaysinh_nth1,
    #                                                         birth_month=thangsinh_nth1,birth_year=namsinh_nth1,gioi_tinh=gender_nth1,
    #                                                         so_cmnd=cmt_nth1,cmt_ngay_cap=ngaycap_nth1,cmt_noi_cap=noicapcmt_nth1,
    #                                                         relationship=quanhe_nth1,ty_le_thu_huong=tile_nth1,images_cmt_mattruoc=base64cmttruoc_nth1,
    #                                                         images_cmt_matsau=base64cmtsau_nth1)

    #     request.session['ten_nth1_investment']=ten_nth1
    #     request.session['gender_nth1_investment']=gender_nth1
    #     request.session['ngaysinh_nth1_investment']=ngaysinh_nth1
    #     request.session['thangsinh_nth1_investment']=thangsinh_nth1
    #     request.session['namsinh_nth1_investment']=namsinh_nth1
    #     request.session['cmt_nth1_investment']=cmt_nth1
    #     request.session['ngaycap_nth1_investment']=ngaycap_nth1
    #     request.session['noicapcmt_nth1_investment']=noicapcmt_nth1
    #     request.session['quanhe_nth1_investment']=quanhe_nth1
    #     request.session['tile_nth1_investment']=tile_nth1
    #     request.session['base64cmttruoc_nth1_investment']=base64cmttruoc_nth1
    #     request.session['base64cmtsau_nth1_investment']=base64cmtsau_nth1

    #     #ngthuhuong2
    #     ten_nth2=request.POST.get('ten_nth2')
    #     gender_nth2=request.POST.get('gender_nth2')
    #     ngaysinh_nth2=request.POST.get('ngaysinh_nth2')
    #     thangsinh_nth2=request.POST.get('thangsinh_nth2')
    #     namsinh_nth2=request.POST.get('namsinh_nth2')
    #     cmt_nth2=request.POST.get('cmt_nth2')
    #     ngaycap_nth2=request.POST.get('ngaycap_nth2')
    #     noicapcmt_nth2=request.POST.get('noicapcmt_nth2')
    #     quanhe_nth2=request.POST.get('quanhe_nth2')
    #     tile_nth2=request.POST.get('tile_nth2')
    #     base64cmttruoc_nth2=request.POST.get('base64cmttruoc_nth2')
    #     base64cmtsau_nth2=request.POST.get('base64cmtsau_nth2')
    #     if ten_nth2 != None and gender_nth2 != None and ngaysinh_nth2 != None and thangsinh_nth2 != None and namsinh_nth2 != None and cmt_nth2 != None and ngaycap_nth2 != None and noicapcmt_nth2 != None and quanhe_nth2 != None and tile_nth2 != None and base64cmttruoc_nth2 != None and base64cmtsau_nth2 != None:
    #         tk3=invest_models.NguoiThuHuongTam.objects.create(nguoiduocbaohiemtam=tk1,fullname=ten_nth2,birth_day=ngaysinh_nth2,
    #                                                         birth_month=thangsinh_nth2,birth_year=namsinh_nth2,gioi_tinh=gender_nth2,
    #                                                         so_cmnd=cmt_nth2,cmt_ngay_cap=ngaycap_nth2,cmt_noi_cap=noicapcmt_nth2,
    #                                                         relationship=quanhe_nth2,ty_le_thu_huong=tile_nth2,images_cmt_mattruoc=base64cmttruoc_nth2,
    #                                                         images_cmt_matsau=base64cmtsau_nth2)
    #         request.session['ten_nth2_investment']=ten_nth2
    #         request.session['gender_nth2_investment']=gender_nth2
    #         request.session['ngaysinh_nth2_investment']=ngaysinh_nth2
    #         request.session['thangsinh_nth2_investment']=thangsinh_nth2
    #         request.session['namsinh_nth2_investment']=namsinh_nth2
    #         request.session['cmt_nth2_investment']=cmt_nth2
    #         request.session['ngaycap_nth2_investment']=ngaycap_nth2
    #         request.session['noicapcmt_nth2_investment']=noicapcmt_nth2
    #         request.session['quanhe_nth2_investment']=quanhe_nth2
    #         request.session['tile_nth2_investment']=tile_nth2
    #         request.session['base64cmttruoc_nth2_investment']=base64cmttruoc_nth2
    #         request.session['base64cmtsau_nth2_investment']=base64cmtsau_nth2
    #     return redirect('investment:prepayment')


class PrePaymentInvest(LoginRequiredMixin,View):
    login_url = '/dang-nhap/'
    def get(self, request):
        name_nm=request.session.get('name_nm_investment')
        phone_nm=request.session.get('sdt_nm_investment')
        email_nm=request.session.get('email_nm_investment')
        thanhpho_nm=request.session.get('thanhpho_nm_investment')
        huyen_nm=request.session.get('huyen_nm_investment')
        diachi_nm=request.session.get('diachi_nm_investment')
        list_provincial=Provincial.objects.all().order_by("name")
        name_ngdc=request.session.get('name_ngdc_investment')
        sdt_ngdc=request.session.get('phone_ngdc_investment')
        email_ngdc=request.session.get('email_ngdc_investment')
        diachi_ngdc=request.session.get('diachi_ngdc_investment')
        thanhpho=Provincial.objects.get(code=request.session.get('thanhpho_ngdc_investment'))
        huyen=District.objects.get(id=request.session.get('huyen_ngdc_investment'))
        cty_tl=Company.objects.get(id_ten_cong_ty=request.session.get('cty_investment'))
        moneyc=request.session.get('stdautuhangnam_investment')
        spchinh=request.session.get('goispc_investment')
        spp_tl=0 
        phiVATtl=(moneyc+spp_tl)*0.1
        total_moneytl=(moneyc+spp_tl)*1.1
        request.session['sophiphu_investment']=spp_tl
        request.session['phiVAT_investment']=phiVATtl
        request.session['total_moneyhasVAT_investment']=total_moneytl

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
        return render(request, 'investment/prepayment.html',context)
    def post(self, request):
        name_ng_nhan=request.POST.get('name_ng_nhan')
        email_ng_nhan=request.POST.get('email_ng_nhan')
        phone_ng_nhan=request.POST.get('phone_ng_nhan')
        tinh_ng_nhan=request.POST.get('tinh_ng_nhan')
        huyen_ng_nhan=request.POST.get('huyen_ng_nhan')
        address_ng_nhan=request.POST.get('address_ng_nhan')
        mgg=request.POST.get('mgg')

        name_nm= request.session.get('name_nm_investment')
        sex_nm=request.session.get('sex_nm_investment')
        daybirth_nm=  request.session.get('daybirth_nm_investment')
        monthbirth_nm= request.session.get('monthbirth_nm_investment')
        yearbirth_nm=request.session.get('yearbirth_nm_investment')
        phone_ngmua=  request.session.get('sdt_ngdc_investment')
        email_nm=request.session.get('email_nm_investment')
        cmt_nm=request.session.get('cmt_nm_investment')
        ngaycap_nm=request.session.get('ngaycap_nm_investment')
        noicapcmt_nm= request.session.get('noicapcmt_nm_investment')
        thanhpho_nm= request.session.get('thanhpho_nm_investment')
        huyen_nm= request.session.get('huyen_nm_investment')
        diachi_nm= request.session.get('diachi_nm_investment')
        tthon_nm= request.session.get('tthon_nm_investment')
        detailjob_nm= request.session.get('detailjob_nm_investment')
        cannang_nm= request.session.get('cannang_nm_investment')
        chieucao_nm= request.session.get('chieucao_nm_investment')
        quoctich_nm=    request.session.get('quoctich_nm_investment')
        congdanmy_nm= request.session.get('congdanmy_nm_investment')
        base64cmttruoc_nm= request.session.get('base64cmttruoc_nm_investment')
        base64cmtsau_nm=  request.session.get('base64cmtsau_nm_investment')

        muachinh=NguoiMuaBaoHiem.objects.create(username=phone_ngmua,fullname=name_nm,birth_day=daybirth_nm,birth_month=monthbirth_nm,
                                            birth_year=yearbirth_nm, gioi_tinh=sex_nm,email=email_nm,dia_chi_tinh_thanh_pho=thanhpho_nm,
                                            dia_chi_quan_huyen=huyen_nm,dia_chi_chi_tiet=diachi_nm,so_cmnd=cmt_nm,
                                            cmt_ngay_cap=ngaycap_nm,cmt_noi_cap=noicapcmt_nm,images_cmt_mattruoc=base64cmttruoc_nm,
                                            images_cmt_matsau=base64cmtsau_nm,status_marriage=tthon_nm,job=detailjob_nm,weight=cannang_nm,
                                            height=chieucao_nm,nationality=quoctich_nm,nationality_paper=congdanmy_nm,ho_ten_nhan=name_ng_nhan,
                                            email_nhan=email_ng_nhan,so_dien_thoai_nhan=phone_ng_nhan,dia_chi_tinh_thanh_pho_nhan=tinh_ng_nhan,
                                            dia_chi_quan_huyen_nhan=huyen_ng_nhan,dia_chi_chi_tiet_nhan=address_ng_nhan)

        sdt_ngdc=request.session.get('phone_ngdc_investment')
        name_ngdc=request.session.get('name_ngdc_investment')
        sex_ngdc=request.session.get('sex_ngdc_investment')
        daybirth_ngdc=request.session.get('daybirth_ngdc_investment')
        monthbirth_ngdc=request.session.get('monthbirth_ngdc_investment')
        yearbirth_ngdc=request.session.get('yearbirth_ngdc_investment') 
        email_ngdc=request.session.get('email_ngdc_investment')
        cmt_ngdc=request.session.get('cmt_ngdc_investment')
        ngaycap_ngdc=request.session.get('ngaycap_ngdc_investment') 
        noicapcmt_ngdc=request.session.get('noicapcmt_ngdc_investment')
        thanhpho_ngdc=request.session.get('thanhpho_ngdc_investment')
        huyen_ngdc=request.session.get('huyen_ngdc_investment')
        diachi_ngdc=request.session.get('diachi_ngdc_investment')
        tthon_ngdc=request.session.get('tthon_ngdc_investment')
        detailjob_ngdc=request.session.get('detailjob_ngdc_investment')
        cannang_ngdc=request.session.get('cannang_ngdc_investment')
        chieucao_ngdc=request.session.get('chieucao_ngdc_investment')
        quoctich_ngdc=request.session.get('quoctich_ngdc_investment')
        congdanmy_ngdc=request.session.get('congdanmy_ngdc_investment')
        quanhenm=request.session.get('quanhenm_investment')
        hutthuoc_ngdc=request.session.get('hutthuoc_ngdc_investment')
        base64cmttruoc_ngdc=request.session.get('base64cmttruoc_ngdc_investment')
        base64cmtsau_ngdc=request.session.get('base64cmtsau_ngdc_investment')
        sotienbh_investment=request.session.get('stbaohiem_investment')
        sonamhd_investment=request.session.get('sonamhopdong_investment')
        sonamdp_investment=request.session.get('sonamdongphi_investment')

        ngdc=invest_models.NguoiDuocBaoHiem.objects.create(nguoimuabaohiem=muachinh,username=sdt_ngdc,fullname=name_ngdc,birth_day=daybirth_ngdc,
                                            birth_month=monthbirth_ngdc,
                                            birth_year=yearbirth_ngdc, gioi_tinh=sex_ngdc,email=email_ngdc,dia_chi_tinh_thanh_pho=thanhpho_ngdc,
                                            dia_chi_quan_huyen=huyen_ngdc,dia_chi_chi_tiet=diachi_ngdc,so_cmnd=cmt_ngdc,
                                            cmt_ngay_cap=ngaycap_ngdc,cmt_noi_cap=noicapcmt_ngdc,images_cmt_mattruoc=base64cmttruoc_ngdc,
                                            images_cmt_matsau=base64cmtsau_ngdc,status_marriage=tthon_ngdc,job=detailjob_ngdc,weight=cannang_ngdc,
                                            height=chieucao_ngdc,nationality=quoctich_ngdc,nationality_paper=congdanmy_ngdc,relationship=quanhenm,
                                            is_smoke=hutthuoc_ngdc,so_tien_bao_hiem=sotienbh_investment,so_nam_hop_dong=sonamhd_investment,
                                            so_nam_dong_phi=sonamdp_investment)
        
        ten_nth1=request.session.get('ten_nth1_investment')
        gender_nth1=request.session.get('gender_nth1_investment')
        ngaysinh_nth1=request.session.get('ngaysinh_nth1_investment')
        thangsinh_nth1=request.session.get('thangsinh_nth1_investment')
        namsinh_nth1=request.session.get('namsinh_nth1_investment')
        cmt_nth1=request.session.get('cmt_nth1_investment')
        ngaycap_nth1=request.session.get('ngaycap_nth1_investment')
        noicapcmt_nth1=request.session.get('noicapcmt_nth1_investment')
        quanhe_nth1=request.session.get('quanhe_nth1_investment')
        tile_nth1=request.session.get('tile_nth1_investment')
        base64cmttruoc_nth1=request.session.get('base64cmttruoc_nth1_investment')
        base64cmtsau_nth1=request.session.get('base64cmtsau_nth1_investment')

        th1=invest_models.NguoiThuHuong.objects.create(nguoiduocbaohiem=ngdc,fullname=ten_nth1,birth_day=ngaysinh_nth1,
                                                            birth_month=thangsinh_nth1,birth_year=namsinh_nth1,gioi_tinh=gender_nth1,
                                                            so_cmnd=cmt_nth1,cmt_ngay_cap=ngaycap_nth1,cmt_noi_cap=noicapcmt_nth1,
                                                            relationship=quanhe_nth1,ty_le_thu_huong=tile_nth1,images_cmt_mattruoc=base64cmttruoc_nth1,
                                                            images_cmt_matsau=base64cmtsau_nth1)
        ten_nth2=request.session.get('ten_nth2_investment')
        gender_nth2=request.session.get('gender_nth2_investment')
        ngaysinh_nth2=request.session.get('ngaysinh_nth2_investment')
        thangsinh_nth2=request.session.get('thangsinh_nth2_investment')
        namsinh_nth2=request.session.get('namsinh_nth2_investment')
        cmt_nth2=request.session.get('cmt_nth2_investment')
        ngaycap_nth2=request.session.get('ngaycap_nth2_investment')
        noicapcmt_nth2=request.session.get('noicapcmt_nth2_investment')
        quanhe_nth2=request.session.get('quanhe_nth2_investment')
        tile_nth2=request.session.get('tile_nth2_investment')
        base64cmttruoc_nth2=request.session.get('base64cmttruoc_nth2_investment')
        base64cmtsau_nth2=request.session.get('base64cmtsau_nth2_investment')
        if ten_nth2 != None and gender_nth2 != None and ngaysinh_nth2 != None and thangsinh_nth2 != None and namsinh_nth2 != None and cmt_nth2 != None and ngaycap_nth2 != None and noicapcmt_nth2 != None and quanhe_nth2 != None and tile_nth2 != None and base64cmttruoc_nth2 != None and base64cmtsau_nth2 != None:
            th2=invest_models.NguoiThuHuong.objects.create(nguoiduocbaohiem=ngdc,fullname=ten_nth2,birth_day=ngaysinh_nth2,
                                                            birth_month=thangsinh_nth2,birth_year=namsinh_nth2,gioi_tinh=gender_nth2,
                                                            so_cmnd=cmt_nth2,cmt_ngay_cap=ngaycap_nth2,cmt_noi_cap=noicapcmt_nth2,
                                                            relationship=quanhe_nth2,ty_le_thu_huong=tile_nth2,images_cmt_mattruoc=base64cmttruoc_nth2,
                                                            images_cmt_matsau=base64cmtsau_nth2)
        user=User.objects.get(id=request.user.id)
        sophichinh=request.session.get('stdautuhangnam_investment')
        sophiphu=request.session.get('sophiphu_investment')
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
        cty=request.session.get('cty_investment')
        goispchinh=request.session.get('goispc_investment')
        list_spp=request.session.get('list_spp_investment')

        order_id = unique_order_id_generator(request.user.username)
        pay_loai_hop_dong=loai_hop_dong(user,total_money_final_no_VAT,2)          #2 - BH đầu tư
        request.session['id_ngmua_chinh']= muachinh.id                             #mua_chinh.id
        request.session['ma_don_hang_bihama'] = order_id
        request.session['pay_so_dien_thoai'] = request.user.username
        request.session['pay_cong_ty'] = cty                               #cty fubon
        request.session['pay_loai_hinh_bao_hiem'] = 2                           #2 - BH đầu tư
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


class UpdateCompareAPI(APIView):
    permission_classes = (permissions.AllowAny,)
    renderer_classes = (TemplateHTMLRenderer, )

    def post(self, request):
        return Response(template_name='investment/investment_compare_product.html')


class MobileUpdateCompareAPI(APIView):
    permission_classes = (permissions.AllowAny,)
    renderer_classes = (TemplateHTMLRenderer, )

    def post(self, request):
        return Response(template_name='investment/investment_compare_product_mobile.html')


class SaveInvestmentCustomerInfo(APIView):
    permission_classes = (permissions.AllowAny,)

    def post(self, request):
        pass


class GoiSanPhamChinhApi(APIView):
    permission_classes = (permissions.AllowAny,)
    def post(self, request):
        valid_data = validate_data(investment_serializers.AddGoiSanPhamChinhAPI, request.data)
        company = valid_data.get('company')
        ten_loai_hinh_bao_hiem = valid_data.get('ten_loai_hinh_bao_hiem')
        id_loai_hinh_bao_hiem = valid_data.get('id_loai_hinh_bao_hiem')
        gioi_tinh = valid_data.get('gioi_tinh')
        tuoi = valid_data.get('tuoi')
        phi_quan_ly_hop_dong = valid_data.get('phi_quan_ly_hop_dong')
        phi_ban_dau_co_ban = valid_data.get('phi_ban_dau_co_ban')
        phi_ban_dau_dong_them = valid_data.get('phi_ban_dau_dong_them')
        phi_cham_dut_co_ban = valid_data.get('phi_cham_dut_co_ban')
        phi_cham_dut_dong_them = valid_data.get('phi_cham_dut_dong_them')
        ten_goi_san_pham_chinh = valid_data.get('ten_goi_san_pham_chinh')
        id_goi_san_pham_chinh = valid_data.get('id_goi_san_pham_chinh')
        so_phi_chinh_hang_nam = valid_data.get('so_phi_chinh_hang_nam')
        ty_le_phi_rui_ro_hang_nam = valid_data.get('ty_le_phi_rui_ro_hang_nam')

        compa=invest_models.Company.objects.get(id_ten_cong_ty=company)
        if invest_models.GoiSanPhamChinh.objects.filter(company=compa,ten_loai_hinh_bao_hiem=ten_loai_hinh_bao_hiem,id_loai_hinh_bao_hiem=id_loai_hinh_bao_hiem,gioi_tinh=gioi_tinh,
                                                tuoi=tuoi,phi_quan_ly_hop_dong=phi_quan_ly_hop_dong,phi_ban_dau_co_ban=phi_ban_dau_co_ban,phi_ban_dau_dong_them = phi_ban_dau_dong_them,
                                                phi_cham_dut_co_ban = phi_cham_dut_co_ban,phi_cham_dut_dong_them = phi_cham_dut_dong_them,ten_goi_san_pham_chinh = ten_goi_san_pham_chinh,id_goi_san_pham_chinh = id_goi_san_pham_chinh,so_phi_chinh_hang_nam = so_phi_chinh_hang_nam,ty_le_phi_rui_ro_hang_nam = ty_le_phi_rui_ro_hang_nam).exists():
            return Response(1, status=status.HTTP_400_BAD_REQUEST)  
        else:
            invest_models.GoiSanPhamChinh.objects.create(company=compa,ten_loai_hinh_bao_hiem=ten_loai_hinh_bao_hiem,id_loai_hinh_bao_hiem=id_loai_hinh_bao_hiem,gioi_tinh=gioi_tinh,
                                                tuoi=tuoi,phi_quan_ly_hop_dong=phi_quan_ly_hop_dong,phi_ban_dau_co_ban=phi_ban_dau_co_ban,phi_ban_dau_dong_them = phi_ban_dau_dong_them,
                                                phi_cham_dut_co_ban = phi_cham_dut_co_ban,phi_cham_dut_dong_them = phi_cham_dut_dong_them,ten_goi_san_pham_chinh = ten_goi_san_pham_chinh,id_goi_san_pham_chinh = id_goi_san_pham_chinh,so_phi_chinh_hang_nam = so_phi_chinh_hang_nam,ty_le_phi_rui_ro_hang_nam = ty_le_phi_rui_ro_hang_nam)
            return Response(1, status=status.HTTP_200_OK) 


class GoiSanPhamPhuApi(APIView):
    permission_classes = (permissions.AllowAny,)
    def post(self, request):
        valid_data = validate_data(investment_serializers.AddGoiSanPhamPhuAPI, request.data)
        company = valid_data.get('company')
        ten_loai_hinh_bao_hiem = valid_data.get('ten_loai_hinh_bao_hiem')
        id_loai_hinh_bao_hiem = valid_data.get('id_loai_hinh_bao_hiem')
        ten_goi_san_pham_chinh = valid_data.get('ten_goi_san_pham_chinh')
        id_goi_san_pham_chinh = valid_data.get('id_goi_san_pham_chinh')
        ten_goi_san_pham_phu = valid_data.get('ten_goi_san_pham_phu')
        id_goi_san_pham_phu = valid_data.get('id_goi_san_pham_phu')
        loai_nghe_nghiep = valid_data.get('loai_nghe_nghiep')
        so_tien_bao_hiem = valid_data.get('so_tien_bao_hiem')
        so_phi_phu_nam = valid_data.get('so_phi_phu_nam')
    
        compa=invest_models.Company.objects.get(id_ten_cong_ty=company)
        if invest_models.GoiSanPhamPhu.objects.filter(company=compa,ten_loai_hinh_bao_hiem = ten_loai_hinh_bao_hiem,id_loai_hinh_bao_hiem = id_loai_hinh_bao_hiem, ten_goi_san_pham_chinh = ten_goi_san_pham_chinh, id_goi_san_pham_chinh = id_goi_san_pham_chinh,
        ten_goi_san_pham_phu = ten_goi_san_pham_phu, id_goi_san_pham_phu =id_goi_san_pham_phu, loai_nghe_nghiep = loai_nghe_nghiep, so_tien_bao_hiem = so_tien_bao_hiem, so_phi_phu_nam = so_phi_phu_nam).exists():
            return Response(1, status=status.HTTP_400_BAD_REQUEST)  
        else:
            invest_models.GoiSanPhamPhu.objects.create(company=compa,ten_loai_hinh_bao_hiem = ten_loai_hinh_bao_hiem,id_loai_hinh_bao_hiem = id_loai_hinh_bao_hiem, ten_goi_san_pham_chinh = ten_goi_san_pham_chinh, id_goi_san_pham_chinh = id_goi_san_pham_chinh,
        ten_goi_san_pham_phu = ten_goi_san_pham_phu, id_goi_san_pham_phu =id_goi_san_pham_phu, loai_nghe_nghiep = loai_nghe_nghiep, so_tien_bao_hiem = so_tien_bao_hiem, so_phi_phu_nam = so_phi_phu_nam)
            return Response(1, status=status.HTTP_200_OK) 


class NhapThongTinDauTuChinhAPI(APIView):
    permission_classes = (permissions.AllowAny,)
    def post(self, request):
        valid_data = validate_data(investment_serializers.NhapThongTinDauTuChinhAPI, request.data)
        stdautuhangnam = valid_data.get('stdautuhangnam')
        sonamdongphi = int(valid_data.get('sonamdongphi'))
        sonamhopdong= int(valid_data.get('sonamhopdong'))
        stbaohiem = valid_data.get('stbaohiem')                 
        laisuatminhhoa = valid_data.get('laisuatminhhoa')
        gioitinh=request.session.get('sex_ngdc_investment')
        tuoi=request.session.get('age_ngdc_investment')
        thong_tin = api_utils.minh_hoa_hop_dong(tuoi,gioitinh,stdautuhangnam,sonamdongphi,stbaohiem,laisuatminhhoa)
        current_year = datetime.datetime.now()
        data_nam=[]
        for i in range(1, int(sonamhopdong)+1):
            data_nam.append(int(current_year.year)+i)
        if sonamhopdong == 99:
            data=thong_tin
        else:
            data={
                'tuoibaohiem': thong_tin['tuoibaohiem'][0:sonamhopdong],
                'namhopdong': thong_tin['namhopdong'][0:sonamhopdong],
                'phi_dong_hang_nam': thong_tin['phi_dong_hang_nam'][0:sonamhopdong],
                'phi_bao_hiem_co_ban': thong_tin['phi_bao_hiem_co_ban'][0:sonamhopdong],
                'phi_bao_hiem_dong_them': thong_tin['phi_bao_hiem_dong_them'][0:sonamhopdong],
                'phi_ban_dau': thong_tin['phi_ban_dau'][0:sonamhopdong],
                'tai_khoan_co_ban_duoc_phan_bo': thong_tin['tai_khoan_co_ban_duoc_phan_bo'][0:sonamhopdong],
                'tai_khoan_dong_them_duoc_phan_bo': thong_tin['tai_khoan_dong_them_duoc_phan_bo'][0:sonamhopdong],
                'phi_quan_ly_hop_dong': thong_tin['phi_quan_ly_hop_dong'][0:sonamhopdong],
                'phi_BH_rui_ro': thong_tin['phi_BH_rui_ro'][0:sonamhopdong],
                'gia_tri_tai_khoan_co_ban': thong_tin['gia_tri_tai_khoan_co_ban'][0:sonamhopdong],
                'thuong_duy_tri_hop_dong': thong_tin['thuong_duy_tri_hop_dong'][0:sonamhopdong],
                'gia_tri_tai_khoan_dong_them': thong_tin['gia_tri_tai_khoan_dong_them'][0:sonamhopdong],
                'gia_tri_tai_khoan_hop_dong': thong_tin['gia_tri_tai_khoan_hop_dong'][0:sonamhopdong],
                'gia_tri_hoan_lai': thong_tin['gia_tri_hoan_lai'][0:sonamhopdong],
                'quyen_loi_bao_hiem': thong_tin['quyen_loi_bao_hiem'][0:sonamhopdong],
            }
        data['data_nam']=data_nam

        return Response(data,status=status.HTTP_200_OK)


class PushSpcInvestment(APIView):
    permission_classes = (permissions.AllowAny,)
    def post(self, request):
        valid_data = validate_data(investment_serializers.PushSpcInvestmentSer, request.data)
        stdautuhangnam = valid_data.get('stdautuhangnam')
        sonamdongphi = int(valid_data.get('sonamdongphi'))
        sonamhopdong= int(valid_data.get('sonamhopdong'))
        stbaohiem = valid_data.get('stbaohiem')                 
        laisuatminhhoa = valid_data.get('laisuatminhhoa')
        cty=valid_data.get('cty')

        request.session['stdautuhangnam_investment'] = stdautuhangnam
        request.session['sonamdongphi_investment'] = sonamdongphi
        request.session['sonamhopdong_investment'] = sonamhopdong
        request.session['stbaohiem_investment'] = stbaohiem
        request.session['laisuatminhhoa_investment'] = laisuatminhhoa
        request.session['cty_investment'] = cty
        request.session['goispc_investment'] = 1

        return Response(1,status=status.HTTP_200_OK)
 


