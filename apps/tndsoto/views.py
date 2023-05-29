from django.shortcuts import render, redirect
from django.views import View
# Create your views here.
from rest_framework.response import Response
from rest_framework import permissions
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.renderers import TemplateHTMLRenderer, JSONRenderer
from apps.core.utils import validate_data,convert_price_to_string,loai_hop_dong
import datetime
from django.db.models import Q
from . import models as tndsoto_models
from . import serializers as tndsoto_serializers
from . import utils as tndsoto_utils
from apps.core import models as core_model
from datetime import datetime
from django.contrib.auth.mixins import LoginRequiredMixin
from apps.users.models import User
from apps.payment.views import unique_order_id_generator
from apps.payment import models as payment_model
from apps.tndsoto.tasks import gui_thong_tin_dh_tndsoto


class AddDataTndsOto(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request):
        valid_data = validate_data(tndsoto_serializers.AddDataTndsOtoSer, request.data)
        company = valid_data.get('company')
        ten_loai_hinh_bao_hiem = valid_data.get('ten_loai_hinh_bao_hiem')
        id_loai_hinh_bao_hiem = valid_data.get('id_loai_hinh_bao_hiem')
        ten_trong_tai = valid_data.get('ten_trong_tai')
        id_trong_tai = valid_data.get('id_trong_tai')
        so_phi_chinh = valid_data.get('so_phi_chinh')
        if not core_model.Company.objects.filter(id_ten_cong_ty=company).exists():
            return Response(0, status=status.HTTP_400_BAD_REQUEST)
        else:
            cty=core_model.Company.objects.get(id_ten_cong_ty=company)
            if tndsoto_models.GoiSanPhamChinh.objects.filter(company=cty , ten_loai_hinh_bao_hiem=ten_loai_hinh_bao_hiem, 
                                                            id_loai_hinh_bao_hiem=id_loai_hinh_bao_hiem, ten_trong_tai=ten_trong_tai,
                                                            id_trong_tai=id_trong_tai,so_phi_chinh=so_phi_chinh).exists():
                return Response(0, status=status.HTTP_400_BAD_REQUEST)
            else:
                gsp = tndsoto_models.GoiSanPhamChinh.objects.create(company=cty,ten_loai_hinh_bao_hiem=ten_loai_hinh_bao_hiem, 
                                                        id_loai_hinh_bao_hiem=id_loai_hinh_bao_hiem, ten_trong_tai=ten_trong_tai, 
                                                        id_trong_tai=id_trong_tai,so_phi_chinh=so_phi_chinh)
                return Response(1, status=status.HTTP_200_OK)


class TNDSOtoQuest1(View):
    def get(self, request):
        # gui_thong_tin_dh_tndsoto(40)
        return render(request, 'tndsoto/quest1.html')
    def post(self, request):
        so_dien_thoai_ngmua=request.POST.get('so_dien_thoai_ngmua')
        mua_cho=request.POST.get('mua_cho')
        muc_dich_xe=request.POST.get('muc_dich_xe')
        trong_tai=request.POST.get('trong_tai')
        bien_so_xe_oto=request.POST.get('bien_so_xe_oto')


        request.session['sdt_ngmua_tndsoto'] = so_dien_thoai_ngmua
        request.session['mua_cho_tndsoto'] = int(mua_cho)
        request.session['muc_dich_xe_tndsoto'] = int(muc_dich_xe)
        request.session['trong_tai_tndsoto'] = int(trong_tai)
        request.session['bien_so_xe_tndsoto'] = bien_so_xe_oto

        return redirect('tndsoto:san-pham-bao-hiem-tndsoto')


class TNDSOtoCompareProduct(View):
    def get(self, request):
        so_dien_thoai=request.session.get('sdt_ngmua_tndsoto')

        trong_tai=request.session.get('trong_tai_tndsoto')
        bien_so_xe_oto=request.session.get('bien_so_xe_tndsoto')

        tnds_oto=tndsoto_models.GoiSanPhamChinh.objects.filter(id_loai_hinh_bao_hiem=13,id_trong_tai=trong_tai)
        list_item_tnds_oto = []
        for it in tnds_oto:
            sub_item = {}
            money=int(tndsoto_utils.get_spc_tnds_oto(13,it.company.id_ten_cong_ty,trong_tai))
            sub_item['money_real'] = convert_price_to_string(money)
            sub_item['money'] = money
            sub_item['ten_trong_tai'] = it.ten_trong_tai
            sub_item['cty'] = it.company.id_ten_cong_ty
            list_item_tnds_oto.append(sub_item)

        context={'sdt':so_dien_thoai,'trong_tai':trong_tai,'bien_so':bien_so_xe_oto,"list_item_tnds_oto":list_item_tnds_oto}
        return render(request, 'tndsoto/compare-oto.html',context)


class TNDSOtoPrepayment(LoginRequiredMixin,View):
    login_url = '/dang-nhap/'

    def get(self, request):
        list_provincial=core_model.Provincial.objects.all().order_by("name")
        trong_tai=request.session.get('trong_tai_tndsoto')
        id_cty_tndsoto=request.session.get('id_cty_tndsoto')

        ten_lx=tndsoto_models.GoiSanPhamChinh.objects.get(id_trong_tai=trong_tai,id_loai_hinh_bao_hiem=13,company__id_ten_cong_ty=id_cty_tndsoto)
        bien_so_xe=request.session.get('bien_so_xe_tndsoto')
        cty=core_model.Company.objects.get(id_ten_cong_ty=id_cty_tndsoto)
        sophi_chinh_tndsoto=request.session.get('sophi_chinh_tndsoto')
        spp_tndsoto=0
        money_VAT=int((sophi_chinh_tndsoto+spp_tndsoto)*0.1)
        total_money_hasVAT=int((sophi_chinh_tndsoto+spp_tndsoto)*1.1)

        request.session['sophiphu_tndsoto'] = spp_tndsoto
        request.session['money_VAT_tndsoto'] = money_VAT
        request.session['total_money_hasVAT_tndsoto'] = total_money_hasVAT

        ngay_hieu_luc_tndsoto=request.session.get('ngay_hieu_luc_tndsoto')
        ngay_ket_thuc_tndsoto=request.session.get('ngay_ket_thuc_tndsoto')

        mua_cho_tndsoto=request.session.get('mua_cho_tndsoto')
        if mua_cho_tndsoto == 1:
            mua_cho = "Cá nhân"
        elif mua_cho_tndsoto == 2:
            mua_cho = "Tổ chức"
        
        muc_dich_xe_tndsoto=request.session.get('muc_dich_xe_tndsoto')
        if muc_dich_xe_tndsoto == 1:
            mucdich = "không kinh doanh vận tải"
    
        so_dien_thoai_ngmua=request.session.get('sdt_ngmua_tndsoto') 
        ngayhl= datetime.strptime(ngay_hieu_luc_tndsoto, "%Y-%M-%d").strftime("%d-%M-%Y")
        ngaykt= datetime.strptime(ngay_ket_thuc_tndsoto, "%Y-%M-%d").strftime("%d-%M-%Y")
        context = {
            "list_data":list_provincial,
            "trong_tai":ten_lx.ten_trong_tai,
            "bien_so_xe":bien_so_xe,
            "cty":cty.ten_cong_ty,
            "sopc_real":convert_price_to_string(sophi_chinh_tndsoto),
            "sopp_real":convert_price_to_string(spp_tndsoto),
            "money_VAT":convert_price_to_string(money_VAT),
            "total_money_hasVAT":convert_price_to_string(total_money_hasVAT),
            "ngayhl":ngayhl,
            "ngaykt":ngaykt,
            "mua_cho":mua_cho,
            "muc_dich":mucdich,
            "sdt":so_dien_thoai_ngmua


        }
        return render(request, 'tndsoto/prepayment.html',context)
    def post(self, request):
        dkxe_mat_truoc=request.POST.get('dkxe_mat_truoc')
        dkxe_mat_sau=request.POST.get('dkxe_mat_sau')

        name_ng_nhan=request.POST.get('name_ng_nhan')
        email_ng_nhan=request.POST.get('email_ng_nhan')
        phone_ng_nhan=request.POST.get('phone_ng_nhan')
        tinh_ng_nhan=request.POST.get('tinh_ng_nhan')
        huyen_ng_nhan=request.POST.get('huyen_ng_nhan')
        address_ng_nhan=request.POST.get('address_ng_nhan')
        mgg=request.POST.get('mgg')

        ngay_hieu_luc_tndsoto=request.session.get('ngay_hieu_luc_tndsoto')
        ngay_ket_thuc_tndsoto=request.session.get('ngay_ket_thuc_tndsoto')

        so_dien_thoai_ngmua=request.session.get('sdt_ngmua_tndsoto') 
        bien_so_oto=request.session.get('bien_so_xe_tndsoto')
        loai_nguoi_mua=request.session.get('mua_cho_tndsoto')
        muc_dich_su_dung=request.session.get('muc_dich_xe_tndsoto')
        trong_tai=request.session.get('trong_tai_tndsoto')


        id_cty_tndsoto=request.session.get('id_cty_tndsoto')

        sophichinh=request.session.get('sophi_chinh_tndsoto')
        sophiphu=request.session.get('sophiphu_tndsoto')

        money_VAT_tndsoto=request.session.get('money_VAT_tndsoto')
        total_money_hasVAT_tndsoto=request.session.get('total_money_hasVAT_tndsoto')

        user=User.objects.get(id=request.user.id)
        order_id = unique_order_id_generator(request.user.username)
        mua_chinh=core_model.NguoiMuaBaoHiem.objects.create(username=so_dien_thoai_ngmua,ngay_hieu_luc=ngay_hieu_luc_tndsoto,ngay_ket_thuc=ngay_ket_thuc_tndsoto,
                                                            ho_ten_nhan=name_ng_nhan,email_nhan=email_ng_nhan,so_dien_thoai_nhan=phone_ng_nhan,
                                                            dia_chi_tinh_thanh_pho_nhan=tinh_ng_nhan,
                                                            dia_chi_quan_huyen_nhan=huyen_ng_nhan,dia_chi_chi_tiet_nhan=address_ng_nhan)
                                                            
        tk1=tndsoto_models.NguoiDuocBaoHiem.objects.create(nguoimuabaohiem=mua_chinh,ma_don_hang_bihama=order_id,bien_so_xe=bien_so_oto,loai_nguoi_mua=loai_nguoi_mua,
                                                            muc_dich_su_dung=muc_dich_su_dung,trong_tai=trong_tai,ngay_hieu_luc=ngay_hieu_luc_tndsoto,ngay_ket_thuc=ngay_ket_thuc_tndsoto,
                                                            images_dangky_mattruoc=dkxe_mat_truoc,images_dangky_matsau=dkxe_mat_sau)
        # tao ma don hang
     
        total_money_final_no_VAT=sophichinh+sophiphu
        pay_loai_hop_dong=loai_hop_dong(user,total_money_final_no_VAT,13)        #13 - BH tndsoto
        if mgg is None or mgg == "":
            code_giam_gia=None
            total_money_hasDiscount=total_money_hasVAT_tndsoto
        else:
            code_giam_gia=mgg
            tk= payment_model.MaGiamGia.objects.get(code_ma_giam_gia=code_giam_gia)
            discount=tk.discount
            total_money_hasDiscount=int(total_money_hasVAT_tndsoto*(1-discount))

        request.session['id_ngmua_chinh']=mua_chinh.id
        request.session['ma_don_hang_bihama'] = order_id
        request.session['pay_so_dien_thoai'] = request.user.username
        request.session['pay_cong_ty'] = id_cty_tndsoto                               #cty Opes
        request.session['pay_loai_hinh_bao_hiem'] = 13                           #13 - BH tndsoto
        request.session['pay_goi_san_pham_phu'] = []
        request.session['pay_so_phi_chinh'] = sophichinh
        request.session['pay_so_phi_phu'] = sophiphu
        request.session['pay_so_phi_VAT'] = money_VAT_tndsoto
        request.session['pay_tong_phi_thanh_toan_has_VAT'] = total_money_hasVAT_tndsoto
        request.session['pay_loai_hop_dong'] = pay_loai_hop_dong
        request.session['pay_ma_giam_gia'] = code_giam_gia
        request.session['pay_tong_phi_thanh_toan_sau_giam_gia'] = total_money_hasDiscount

        return redirect('payment')


class ChangeTrongTaiAPI(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request):
        valid_data = validate_data(tndsoto_serializers.ChangeTrongTaiAPISer, request.data)
        trong_tai=int(valid_data.get('trong_tai'))

        tnds_oto=tndsoto_models.GoiSanPhamChinh.objects.filter(id_loai_hinh_bao_hiem=13,id_trong_tai=trong_tai)
        list_item_tnds_oto = []
        for it in tnds_oto:
            sub_item = {}
            money=int(tndsoto_utils.get_spc_tnds_oto(13,it.company.id_ten_cong_ty,trong_tai))
            sub_item['money_real'] = convert_price_to_string(money)
            sub_item['money'] = money
            sub_item['ten_trong_tai'] = it.ten_trong_tai
            sub_item['cty'] = it.company.id_ten_cong_ty
            list_item_tnds_oto.append(sub_item)

        data={'list_item_tnds_oto':list_item_tnds_oto}
        return Response(data=data,status=status.HTTP_200_OK)


class PushSpcTNDSOto(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request):
        valid_data = validate_data(tndsoto_serializers.PushSpcTNDSOtoSer, request.data)

        trong_tai=int(valid_data.get('trong_tai'))
        ngay_hieu_luc=valid_data.get('ngay_hieu_luc')
        ngay_ket_thuc=valid_data.get('ngay_ket_thuc')
        id_cty=int(valid_data.get('id_cty'))

        money=int(tndsoto_utils.get_spc_tnds_oto(13,id_cty,trong_tai))
        ngay_hieu_luc_hd= datetime.strptime(ngay_hieu_luc, "%d-%m-%Y").strftime("%Y-%m-%d")
        ngay_ket_thuc_hd= datetime.strptime(ngay_ket_thuc, "%d-%m-%Y").strftime("%Y-%m-%d")

        request.session['trong_tai_tndsoto'] = trong_tai
        request.session['ngay_hieu_luc_tndsoto'] = ngay_hieu_luc_hd
        request.session['ngay_ket_thuc_tndsoto'] = ngay_ket_thuc_hd
        request.session['id_cty_tndsoto'] = id_cty
        request.session['sophi_chinh_tndsoto'] = money

        so_dien_thoai_ngmua=request.session.get('sdt_ngmua_tndsoto') 
        bien_so_oto=request.session.get('bien_so_xe_tndsoto')
        loai_nguoi_mua=request.session.get('mua_cho_tndsoto')
        muc_dich_su_dung=request.session.get('muc_dich_xe_tndsoto')



        tk=core_model.NguoiMuaBaoHiemTam.objects.create(username=so_dien_thoai_ngmua,ngay_hieu_luc=ngay_hieu_luc_hd,ngay_ket_thuc=ngay_ket_thuc_hd)
        tk1=tndsoto_models.NguoiDuocBaoHiemTam.objects.create(nguoimuabaohiemtam=tk,bien_so_xe=bien_so_oto,loai_nguoi_mua=loai_nguoi_mua,muc_dich_su_dung=muc_dich_su_dung,trong_tai=trong_tai,ngay_hieu_luc=ngay_hieu_luc_hd,ngay_ket_thuc=ngay_ket_thuc_hd)

        return Response(1,status=status.HTTP_200_OK)






