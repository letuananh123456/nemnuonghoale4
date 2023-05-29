from django.shortcuts import render,redirect
from django.views import View
from .models import District
from rest_framework.response import Response
from . import serializers as core_serializers
import json
from rest_framework.views import APIView
from rest_framework import permissions
from rest_framework import status
from apps.core.utils import validate_data, validate_response ,convert_price_to_string , check_ma_giam_gia, post_data, filterCharacter, refresh_token, check_sotien
from rest_framework.renderers import TemplateHTMLRenderer, JSONRenderer
from rest_framework.views import exception_handler as drf_exception_handler
from apps.core import models as core_models
from apps.users import models as user_models
from django.conf import settings
from apps.users.models import User
from apps.payment.models import MaGiamGia , DonDatHang
from apps.robot import utils as robot_utils
from apps.personalhealth import models as person_models
from apps.homeinsurance import models as home_models
from apps.payment import models as payment_model
from apps.homeinsurance.tasks import send_info_dhhome
from apps.tndsoto.tasks import gui_thong_tin_dh_tndsoto
from datetime import datetime
# from apps.users.tasks import refresh_token
from apps.users import utils as user_utils


# Create your views here.
class AddDataCtyApi(APIView):
    permission_classes = (permissions.AllowAny,)
    def post(self, request):
        valid_data = validate_data(core_serializers.AddDataCtyApiSer, request.data)
        logo = valid_data.get('logo')
        ten_cong_ty = valid_data.get('ten_cong_ty')
        id_ten_cong_ty = valid_data.get('id_ten_cong_ty')
        bai_gioi_thieu_cong_ty = valid_data.get('bai_gioi_thieu_cong_ty')
        nam_thanh_lap = valid_data.get('nam_thanh_lap')
        bien_thanh_toan = valid_data.get('bien_thanh_toan')
        so_chi_nhanh = valid_data.get('so_chi_nhanh')

        if core_models.Company.objects.filter(logo=logo,ten_cong_ty=ten_cong_ty,id_ten_cong_ty=id_ten_cong_ty,bai_gioi_thieu_cong_ty=bai_gioi_thieu_cong_ty,
                                                nam_thanh_lap=nam_thanh_lap,bien_thanh_toan=bien_thanh_toan,so_chi_nhanh=so_chi_nhanh).exists():
            return Response(1, status=status.HTTP_400_BAD_REQUEST)  
        else:
            core_models.Company.objects.create(logo=logo,ten_cong_ty=ten_cong_ty,id_ten_cong_ty=id_ten_cong_ty,bai_gioi_thieu_cong_ty=bai_gioi_thieu_cong_ty,
                                                nam_thanh_lap=nam_thanh_lap,bien_thanh_toan=bien_thanh_toan,so_chi_nhanh=so_chi_nhanh)
            return Response(1, status=status.HTTP_200_OK)  


def exception_handler(exc, context):
    response = drf_exception_handler(exc, context)
    return response


class TestView(View):
     def get(self, request):
        return render(request, 'core/test.html')


class ContactView(View):
     def get(self, request):
         
        return render(request, 'core/contact.html')


class IndexView(View):
    def get(self, request):
        string = "s"
        # refresh_token()
        return render(request, 'core/index-ver2.html')


class PolicyView(View):
     def get(self, request):
        return render(request, 'privacy_Policy/privacy_policy_bihama.html')


class GetListItemProvincial(APIView):   
    permission_classes = (permissions.AllowAny,)
    def post(self, request): 
        valid_data = validate_data(core_serializers.ListItemProvincial, request.data)
        thanhpho = valid_data.get('thanhpho')
        
        x = District.objects.filter(parent_code=thanhpho).order_by("name")
        list_item=[]
        for item in x:
            sub_item = {}
            sub_item['id'] = item.id
            sub_item['name'] = item.name
            sub_item['code'] = item.parent_code
            list_item.append(sub_item)
    
        data = {
            'district' : list_item
        }
        # print("fdsaf",x)
        return Response(data, status=status.HTTP_200_OK)  


class ThanhPhoAPIView(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request, format=None):
        valid_data = validate_data(core_serializers.APIthanhpho, request.data)

        name = valid_data.get('name')
        code = valid_data.get('code')
        group = valid_data.get('group')
        longitude = valid_data.get('longitude')
        latitude = valid_data.get('latitude')
        if core_models.Provincial.objects.filter(name=name,code=code, group = group,longitude=longitude,latitude=latitude).exists():
            return Response(1, status=status.HTTP_400_BAD_REQUEST)
        else:
            gsp = core_models.Provincial.objects.create(name=name,code=code, group = group,longitude=longitude,latitude=latitude)
            return Response(1, status=status.HTTP_200_OK)  


class HuyenAPIView(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request, format=None):
        valid_data = validate_data(core_serializers.APIhuyen, request.data)

        name = valid_data.get('name')
        parent_code = valid_data.get('parent_code')
        longitude = valid_data.get('longitude')
        latitude = valid_data.get('latitude')
        
        if core_models.District.objects.filter(name=name,parent_code=parent_code,longitude=longitude,latitude=latitude).exists():
            return Response(1, status=status.HTTP_400_BAD_REQUEST)
        else: 
            gsp = core_models.District.objects.create(name=name,parent_code=parent_code,longitude=longitude,latitude=latitude)
            return Response(1, status=status.HTTP_200_OK)        


class ComingSoon(View):
    def get(self, request):
        return render(request, 'core/coming_soon.html')


class MaGiamGiaManagerAPI(APIView):
    permission_classes = {permissions.AllowAny}
    def post(self, request):
        valid_data = validate_data(core_serializers.MaGiamGiaManagerAPISer,request.data)

        loai_hinh_bao_hiem = valid_data.get("loai_hinh_bao_hiem")
        cong_ty = valid_data.get("cong_ty")
        goi_san_pham = valid_data.get("goi_san_pham")
        ngay_hieu_luc = valid_data.get("ngay_hieu_luc")
        ngay_ket_thuc = valid_data.get("ngay_ket_thuc")
        chi_tieu = valid_data.get("chi_tieu")
        ten_chien_luoc = valid_data.get("ten_chien_luoc")
        discount = valid_data.get("discount")
        code_ma_giam_gia=valid_data.get("code_ma_giam_gia")
        is_su_dung = valid_data.get("is_su_dung")

        secret = valid_data.get("secret")

        dict_check = dict()
        dict_check["loai_hinh_bao_hiem"] = loai_hinh_bao_hiem
        dict_check["cong_ty"] = cong_ty
        dict_check["goi_san_pham"] = goi_san_pham
        dict_check["ngay_hieu_luc"] = ngay_hieu_luc.strftime('%Y-%m-%d')
        dict_check["ngay_ket_thuc"] = ngay_ket_thuc.strftime('%Y-%m-%d')
        dict_check["chi_tieu"] = chi_tieu
        dict_check["ten_chien_luoc"] = ten_chien_luoc
        dict_check["discount"] = discount
        dict_check["code_ma_giam_gia"] = code_ma_giam_gia
        dict_check["is_su_dung"] = is_su_dung
        dict_check["secret"] = secret


        if validate_response(dict_check, settings.SECURITY_KEY_MANA_SAN):
            if not MaGiamGia.objects.filter(code_ma_giam_gia=code_ma_giam_gia).exists():
                MaGiamGia.objects.create(loai_hinh_bao_hiem=dict_check["loai_hinh_bao_hiem"],cong_ty=dict_check["cong_ty"],
                                        goi_san_pham=dict_check["goi_san_pham"],ngay_hieu_luc=dict_check["ngay_hieu_luc"],
                                        ngay_ket_thuc=dict_check["ngay_ket_thuc"], chi_tieu=dict_check["chi_tieu"],
                                        ten_chien_luoc=dict_check["ten_chien_luoc"],discount=dict_check["discount"],
                                        code_ma_giam_gia=dict_check["code_ma_giam_gia"],is_su_dung=dict_check["is_su_dung"])
                return Response('done',status=status.HTTP_200_OK)
            else:
                return Response('exists',status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response('fail',status=status.HTTP_401_UNAUTHORIZED)


class UpdateOrderManagerAPI(APIView):
    permission_classes = {permissions.AllowAny, }

    def  post(self, request):
        valid_data = validate_data(core_serializers.UpdateOrderManagerAPISer,request.data)

        ma_don_hang_bihama = valid_data.get("ma_don_hang_bihama")
        loai_hinh_bao_hiem = valid_data.get("loai_hinh_bao_hiem") 
        ma_hop_dong = valid_data.get("ma_hop_dong")
        link_giay_chung_nhan = valid_data.get("link_giay_chung_nhan")                #list
        tinh_trang_don_dat_hang = valid_data.get("tinh_trang_don_dat_hang")
        code_ma_giam_gia = valid_data.get("code_ma_giam_gia")
        is_su_dung = valid_data.get("is_su_dung") 
        ngay_ket_thuc = valid_data.get("ngay_ket_thuc")
        ngay_hieu_luc = valid_data.get("ngay_hieu_luc")
        ngay_phat_hanh_hoac_ack = valid_data.get("ngay_phat_hanh_hoac_ack")
        secret = valid_data.get("secret")

        dict_check = dict()

        dict_check["ma_don_hang_bihama"] = ma_don_hang_bihama
        dict_check["loai_hinh_bao_hiem"] = loai_hinh_bao_hiem
        dict_check["ma_hop_dong"] = ma_hop_dong
        dict_check["link_giay_chung_nhan"] = link_giay_chung_nhan
        dict_check["tinh_trang_don_dat_hang"] = tinh_trang_don_dat_hang
        dict_check["code_ma_giam_gia"] = code_ma_giam_gia
        dict_check["is_su_dung"] = is_su_dung
        dict_check["ngay_hieu_luc"] = ngay_hieu_luc
        dict_check["ngay_ket_thuc"] = ngay_ket_thuc
        dict_check["ngay_phat_hanh_hoac_ack"] = ngay_phat_hanh_hoac_ack
        dict_check["secret"] = secret

        if validate_response(dict_check, settings.SECURITY_KEY_MANA_SAN):
            if not DonDatHang.objects.filter(ma_don_hang_bihama=ma_don_hang_bihama).exists():
                return Response("order_id exists",status=status.HTTP_400_BAD_REQUEST)
            else:
                dh=DonDatHang.objects.get(ma_don_hang_bihama=ma_don_hang_bihama,loai_hinh_bao_hiem=loai_hinh_bao_hiem)
                dh.ma_hop_dong=ma_hop_dong
                dh.link_giay_chung_nhan=link_giay_chung_nhan
                dh.tinh_trang_don_dat_hang=tinh_trang_don_dat_hang
                if ngay_phat_hanh_hoac_ack is None:
                    dh.ngay_phat_hanh_hop_dong_hoac_ack= None
                    dh.save()
                else:
                    dh.ngay_phat_hanh_hop_dong_hoac_ack=ngay_phat_hanh_hoac_ack
                    dh.save()
                mgg=MaGiamGia.objects.get(code_ma_giam_gia=code_ma_giam_gia)

                if tinh_trang_don_dat_hang == 4 and mgg.is_su_dung<is_su_dung:
                    mgg.is_su_dung = mgg.is_su_dung + 1
                    mgg.save()
                else:
                    mgg.is_su_dung = is_su_dung
                    mgg.save()

                if dh.loai_hinh_bao_hiem == 6:
                    ngdc_personhealth=person_models.NguoiDuocBaoHiem.objects.filter(ma_don_hang_bihama=ma_don_hang_bihama).update(ngay_hieu_luc=ngay_hieu_luc,ngay_ket_thuc=ngay_ket_thuc)
                elif dh.loai_hinh_bao_hiem == 19:
                    ngdc_home=home_models.NguoiDuocBaoHiem.objects.filter(ma_don_hang_bihama=ma_don_hang_bihama).update(ngay_hieu_luc=ngay_hieu_luc,ngay_ket_thuc=ngay_ket_thuc)

                return Response('done', status.HTTP_200_OK)
        else:
            return Response('fail', status.HTTP_401_UNAUTHORIZED)


class APICheckDiscountCore(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request):
        valid_data = validate_data(core_serializers.APICheckDiscountSer, request.data)
        ma_giam_gia = valid_data.get('ma_giam_gia')
        loai_hinh_bao_hiem = valid_data.get('loai_hinh_bao_hiem')

        tk= payment_model.MaGiamGia.objects.get(code_ma_giam_gia=ma_giam_gia)

        if loai_hinh_bao_hiem == 19:
            name_cty=int(request.session.get('id_cty_home'))
            tong_phi_hasVAT=request.session.get('money_total_hasVAT_home')
            goi_san_pham = 1

        elif loai_hinh_bao_hiem == 6:
            name_cty=int(request.session.get('personhealth_name_congty'))
            goi_san_pham=int(request.session.get('ten_goi_spc_VBI'))
            tong_phi_hasVAT=request.session.get('tong_phi_hasVAT_VBI')

        elif loai_hinh_bao_hiem == 15:
            name_cty=int(request.session.get('id_cty_tndsxemay'))
            goi_san_pham=int(request.session.get('loai_xe_may_tndsxemay'))
            tong_phi_hasVAT=request.session.get('total_money_hasVAT_tndsxemay')
        
        elif loai_hinh_bao_hiem == 13:
            name_cty=int(request.session.get('id_cty_tndsoto'))
            goi_san_pham=int(request.session.get('trong_tai_tndsoto'))
            tong_phi_hasVAT=request.session.get('total_money_hasVAT_tndsoto')

        elif loai_hinh_bao_hiem == 1:
            name_cty=int(request.session.get('cty_termlife'))
            goi_san_pham=int(request.session.get('spchinh_termlife'))
            tong_phi_hasVAT=request.session.get('total_moneyhasVAT_termlife')

        elif loai_hinh_bao_hiem == 2:
            name_cty=int(request.session.get('cty_investment'))
            goi_san_pham=int(request.session.get('goispc_investment'))
            tong_phi_hasVAT=request.session.get('total_moneyhasVAT_investment')

        if check_ma_giam_gia(tk,loai_hinh_bao_hiem,name_cty,goi_san_pham):
            discount=tk.discount
            tong_phi_hasDiscount=int(tong_phi_hasVAT*(1-discount))
            data={"tong_phi_hasDiscount":convert_price_to_string(tong_phi_hasDiscount),"phi_hasDiscount":tong_phi_hasDiscount,"ma_giam_gia":ma_giam_gia}
            return Response(data,status=status.HTTP_200_OK)
        else:
            return Response(1,status=status.HTTP_400_BAD_REQUEST)


def Error404Page(request, exception):
    return render(request, 'error_pages/page_404.html')


def Error500Page(request):
    return render(request, 'error_pages/page_500.html')


def Error403Page(request, exception):
    return render(request, 'error_pages/page_403.html')


class ApiAddDataLinhvuc(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request):
        valid_data = validate_data(core_serializers.ApiAddDataLinhvucSer, request.data)
        linhvuc= valid_data.get('linhvuc')
        code_linhvuc= valid_data.get('code_linhvuc')
        if core_models.LinhVuNgheNghiep.objects.filter(linhvuc=linhvuc,code_linhvuc=code_linhvuc).exists():
            return Response(1, status=status.HTTP_400_BAD_REQUEST)  
        else:
            core_models.LinhVuNgheNghiep.objects.create(linhvuc=linhvuc,code_linhvuc=code_linhvuc)
            return Response(1, status=status.HTTP_200_OK) 


class ApiAddDataChiTietCongViec(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request):
        valid_data = validate_data(core_serializers.ApiAddDataChiTietCongViecSer, request.data)
        chitiet= valid_data.get('chitiet')
        code_linhvuc= valid_data.get('code_linhvuc')
        code_chitiet= valid_data.get('code_chitiet')
        if core_models.ChiTietCongViec.objects.filter(chitiet=chitiet,code_chitiet=code_chitiet,code_linhvuc=code_linhvuc).exists():
            return Response(1, status=status.HTTP_400_BAD_REQUEST)  
        else:
            core_models.ChiTietCongViec.objects.create(chitiet=chitiet,code_chitiet=code_chitiet,code_linhvuc=code_linhvuc)
            return Response(1, status=status.HTTP_200_OK)


class ApiAddDataNoiDungNgheNghiep(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request):
        valid_data = validate_data(core_serializers.ApiAddDataNoiDungNgheNghiepSer, request.data)
        noidungcongviec= valid_data.get('noidungcongviec')
        code_chitiet= valid_data.get('code_chitiet')
        capnghenghiep= valid_data.get('capnghenghiep')
        hanchetichluy= valid_data.get('hanchetichluy')
        if core_models.NoiDungNgheNghiep.objects.filter(noidungcongviec=noidungcongviec,code_chitiet=code_chitiet,capnghenghiep=capnghenghiep,hanchetichluy=hanchetichluy).exists():
            return Response(1, status=status.HTTP_400_BAD_REQUEST)  
        else:
            core_models.NoiDungNgheNghiep.objects.create(noidungcongviec=noidungcongviec,code_chitiet=code_chitiet,capnghenghiep=capnghenghiep,hanchetichluy=hanchetichluy)
            return Response(1, status=status.HTTP_200_OK)


class ApiChangeLinhVucNN(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request):
        valid_data = validate_data(core_serializers.ApiChangeLinhVucNNSer, request.data)
        code_linhvuc= valid_data.get('code_linhvuc')
        chitiet=core_models.ChiTietCongViec.objects.filter(code_linhvuc=code_linhvuc)
        list_chitietcv=[]
        for item in chitiet:
            sub_item = {}
            sub_item['id'] = item.id
            sub_item['chitiet'] = item.chitiet
            sub_item['code_chitiet'] = item.code_chitiet
            list_chitietcv.append(sub_item)        
        data = {'list_chitietcv' : list_chitietcv}
        return Response(data=data, status=status.HTTP_200_OK)


class ApiChangeNgheNghiep(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request):
        valid_data = validate_data(core_serializers.ApiChangeNgheNghiepSer, request.data)
        code_chitiet= valid_data.get('code_chitiet')
        chitiet=core_models.NoiDungNgheNghiep.objects.filter(code_chitiet=code_chitiet)
        list_ndcongviec=[]
        for item in chitiet:
            sub_item = {}
            sub_item['id'] = item.id
            sub_item['noidungcongviec'] = item.noidungcongviec
            sub_item['hanchetichluy'] = convert_price_to_string(item.hanchetichluy)
            list_ndcongviec.append(sub_item)        
        data = {'list_ndcongviec' : list_ndcongviec}
        return Response(data=data, status=status.HTTP_200_OK)


class ThankYouFromBihamaView(View):
    def get(self, request):
        return render(request, 'core/thankyou.html')

class UpdateDH_Tu_Manager(APIView):
    permission_classes = [permissions.AllowAny,]
    def post(self, request):
        validate_data = request.data
        k = validate_response(validate_data, settings.SECURITY_KEY_MANA_SAN)
        if k:
            hd = payment_model.DonDatHang.objects.get(ma_don_hang_bihama=validate_data["ma_don_hang_bihama"])
            chuhopdong = hd.nguoimuabaohiem
            ngoinha=home_models.NguoiDuocBaoHiem.objects.get(ma_don_hang_bihama=validate_data["ma_don_hang_bihama"])
            nguoithuhuong = home_models.NguoiThuHuong.objects.get(nguoiduocbaohiem=ngoinha)
            list_spp =list()
            for k in list(validate_data.keys()):
                if k.startswith("sanphamphu"):
                    list_spp.append(int(validate_data[k]))
                    del validate_data[k]
                    continue
                if k.startswith("donhang"):
                    k_bien = k.split('-')[1]
                    if check_sotien(validate_data[k])[0]:
                        sotien = check_sotien(validate_data[k])[1]
                        hd.__dict__.update({k_bien:sotien})
                    else:
                        hd.__dict__.update({k_bien:validate_data[k]})
                    hd.save()
                    continue
                if k.startswith("nguoimuabaohiem"):
                    k_bien = k.split('-')[1]
                    chuhopdong.__dict__.update({k_bien:validate_data[k]})
                    chuhopdong.save()
                if k.startswith("ngoinha"):
                    k_bien = k.split('-')[1]
                    if check_sotien(validate_data[k])[0]:
                        sotien = check_sotien(validate_data[k])[1]
                        ngoinha.__dict__.update({k_bien:sotien})
                    else:
                        ngoinha.__dict__.update({k_bien:validate_data[k]})
                    ngoinha.save()
                    continue
                if k.startswith("nguoithuhuong"):
                    k_bien = k.split('-')[1]
                    nguoithuhuong.__dict__.update({k_bien:validate_data[k]})
                    nguoithuhuong.save()
                    continue
                if k == "ngay_hieu_luc":
                    chuhopdong.ngay_hieu_luc = datetime.strptime(validate_data[k],"%d-%m-%Y")
                    chuhopdong.ngay_ket_thuc = datetime.strptime(validate_data["ngay_ket_thuc"],"%d-%m-%Y")
                    chuhopdong.save()
                    ngoinha.ngay_hieu_luc = datetime.strptime(validate_data[k],"%d-%m-%Y")
                    ngoinha.ngay_ket_thuc = datetime.strptime(validate_data["ngay_ket_thuc"],"%d-%m-%Y")        
                    ngoinha.save()        
            if len(list_spp) > 0:
                hd.__dict__.update({"goi_san_pham_phu":list_spp})
                hd.save()

class PushImagesApi(APIView):
    permission_classes = (permissions.AllowAny,)
    def post(self, request):
        valid_data = validate_data(core_serializers.PushImagesApiSer, request.data)
        strBase64 = valid_data.get('strBase64')
        typeImage = valid_data.get('typeImage')
        typePer = valid_data.get('typePer')
        typeLhbh = valid_data.get('typeLhbh')
        strBase641=strBase64[23:]
        if typeLhbh == 2:
            if typePer ==1:
                if typeImage ==1:
                    request.session['base64cmttruoc_nm_investment']=strBase64
                    str_text=post_data(strBase641)['responses'][0]['textAnnotations'][0]['description']

                elif typeImage ==2:
                    request.session['base64cmtsau_nm_investment']=strBase64
            elif typePer == 2:
                if typeImage ==1:
                    request.session['base64cmttruoc_ngdc_investment']=strBase64
                    str_text=post_data(strBase641)['responses'][0]['textAnnotations'][0]['description']

                elif typeImage ==2:
                    request.session['base64cmtsau_ngdc_investment']=strBase64
            elif typePer == 3:
                if typeImage ==1:
                    request.session['base64cmttruoc_nth1_investment']=strBase64
                    str_text=post_data(strBase641)['responses'][0]['textAnnotations'][0]['description']

                elif typeImage ==2:
                    request.session['base64cmtsau_nth1_investment']=strBase64
        data=filterCharacter(str_text)
        return Response(data=data,status=status.HTTP_200_OK)


class RegisterBihamaPlatformAPI(APIView):
    permission_classes = (permissions.AllowAny,)
    def post(self, request):
        valid_data = validate_data(core_serializers.RegisterBihamaPlatformAPISer, request.data)
        username = valid_data.get('username')
        password = valid_data.get('password')
        status_code = valid_data.get('status_code')       # 0 la cho active, 1 da active, 2 huy
        otp_code = user_utils.generate_otp_code()
        data=dict()
        if status_code == 0:
            if User.objects.filter(username=username, is_active=True).exists():
                data['status']="02"     #user da ton tai
                data['otp_code']=None
                return Response(data=data,status=status.HTTP_200_OK)

            elif not User.objects.filter(username=username, is_active=False).exists():
                user =  User.objects.create_user(username=username, email=None, password=password, is_active=False)
                data['status']="03"     # user da ton tai nhung chua active
                data['otp_code']=None
            if User.objects.filter(username=username, is_active=False).exists():
                data['status']="01"     # user da duoc create
                data['otp_code']=otp_code   # ma opt

                # otp_status = user_utils.send_otp(phone_number=username, otp_code=otp_code) 
                otp_status=200
                otp_status2 = 0
                if otp_status != 200:
                    otp_status2 = user_utils.send_voic_call(phone_number=username, otp_code=otp_code)
                if otp_status == 200 or otp_status2 == 200:
                    return Response(data=data,status=status.HTTP_200_OK)
                else:
                    return Response(data=data,status=status.HTTP_400_BAD_REQUEST)       # ma opt khong duoc gui
        elif status_code == 1:
            if User.objects.filter(username=username, is_active=True).exists():
                data['status']="02"     #user da ton tai
                data['otp_code']=None
                return Response(data=data,status=status.HTTP_200_OK)
            elif User.objects.filter(username=username, is_active=False).exists():
                user =  User.objects.get(username=username, password=password, is_active=False)
                user.is_active=True
                user.save()
                data['status']="04"     # user da duoc active
                data['otp_code']=otp_code
                return Response(data=data,status=status.HTTP_200_OK)
            else:
                return Response(data=data,status=status.HTTP_400_BAD_REQUEST)

        else:
            return Response(1,status=status.HTTP_200_OK)


