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
from . import models as tndsxemay_models
from . import serializers as tndsxemay_serializers
from . import utils as tndsxemay_utils
from apps.core import models as core_model
from datetime import datetime
from django.contrib.auth.mixins import LoginRequiredMixin
from apps.users.models import User
from apps.payment.views import unique_order_id_generator
from apps.payment import models as payment_model


class AddDataTndsXeMay(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request):
        valid_data = validate_data(tndsxemay_serializers.AddDataTndsXeMaySer, request.data)
        company = valid_data.get('company')
        ten_loai_hinh_bao_hiem = valid_data.get('ten_loai_hinh_bao_hiem')
        id_loai_hinh_bao_hiem = valid_data.get('id_loai_hinh_bao_hiem')
        ten_loai_xe = valid_data.get('ten_loai_xe')
        id_loai_xe = valid_data.get('id_loai_xe')
        so_phi_chinh = valid_data.get('so_phi_chinh')
        if not core_model.Company.objects.filter(id_ten_cong_ty=company).exists():
            return Response(0, status=status.HTTP_400_BAD_REQUEST)
        else:
            cty=core_model.Company.objects.get(id_ten_cong_ty=company)
            if tndsxemay_models.GoiSanPhamChinh.objects.filter(company=cty , ten_loai_hinh_bao_hiem=ten_loai_hinh_bao_hiem, 
                                                            id_loai_hinh_bao_hiem=id_loai_hinh_bao_hiem, ten_loai_xe=ten_loai_xe,
                                                            id_loai_xe=id_loai_xe,so_phi_chinh=so_phi_chinh).exists():
                return Response(0, status=status.HTTP_400_BAD_REQUEST)
            else:
                gsp = tndsxemay_models.GoiSanPhamChinh.objects.create(company=cty,ten_loai_hinh_bao_hiem=ten_loai_hinh_bao_hiem, 
                                                        id_loai_hinh_bao_hiem=id_loai_hinh_bao_hiem, ten_loai_xe=ten_loai_xe, 
                                                        id_loai_xe=id_loai_xe,so_phi_chinh=so_phi_chinh)
                return Response(1, status=status.HTTP_200_OK)


class TNDSXeMayQuest1(View):
    def get(self, request): 
        return render(request, 'tndsxemay/quest1.html')
    def post(self, request):
        so_dien_thoai_ngmua=request.POST.get('so_dien_thoai_ngmua')
        loai_xe_may=request.POST.get('loai_xe_may')
        bien_so_xe_may=request.POST.get('bien_so_xe_may')
        print(so_dien_thoai_ngmua,"khanh-------")
        request.session['sdt_ngmua_tndsxemay'] = so_dien_thoai_ngmua
        request.session['loai_xe_may_tndsxemay'] = int(loai_xe_may)
        request.session['bien_so_xe_may_tndsxemay'] = bien_so_xe_may

        return redirect('tndsxemay:san-pham-bao-hiem-tndsxemay')


class TNDSXeMayCompareProduct(View):
    def get(self, request):
        so_dien_thoai=request.session.get('sdt_ngmua_tndsxemay')
        loai_xe_may=request.session.get('loai_xe_may_tndsxemay')
        bien_so_xe_may=request.session.get('bien_so_xe_may_tndsxemay')

        tnds_xemay=tndsxemay_models.GoiSanPhamChinh.objects.filter(id_loai_hinh_bao_hiem=15,id_loai_xe=loai_xe_may)
        list_item_tnds_xemay = []
        for it in tnds_xemay:
            sub_item = {}
            money=int(tndsxemay_utils.get_spc_tnds_xemay(15,it.company.id_ten_cong_ty,loai_xe_may))
            sub_item['money_real'] = convert_price_to_string(money)
            sub_item['money'] = money
            sub_item['ten_loai_xe'] = it.ten_loai_xe
            sub_item['cty'] = it.company.id_ten_cong_ty
            list_item_tnds_xemay.append(sub_item)

        context={'sdt':so_dien_thoai,'loai_xm':loai_xe_may,'bien_so':bien_so_xe_may,"list_item_tnds_xemay":list_item_tnds_xemay}
        return render(request, 'tndsxemay/compare-xemay.html',context)


class TNDSXeMayPrepayment(LoginRequiredMixin,View):
    login_url = '/dang-nhap/'

    def get(self, request):
        list_provincial=core_model.Provincial.objects.all().order_by("name")
        loai_xe=request.session.get('loai_xe_may_tndsxemay')
        id_cty_tndsxemay=request.session.get('id_cty_tndsxemay')
        ten_lx=tndsxemay_models.GoiSanPhamChinh.objects.get(id_loai_xe=loai_xe,id_loai_hinh_bao_hiem=15,company__id_ten_cong_ty=id_cty_tndsxemay)
        bien_so_xe=request.session.get('bien_so_xe_may_tndsxemay')
        cty=core_model.Company.objects.get(id_ten_cong_ty=id_cty_tndsxemay)
        sophi_chinh_tndsxemay=request.session.get('sophi_chinh_tndsxemay')
        spp_tndsxemay=0
        money_VAT=int((sophi_chinh_tndsxemay+spp_tndsxemay)*0.1)
        total_money_hasVAT=int((sophi_chinh_tndsxemay+spp_tndsxemay)*1.1)

        request.session['sophiphu_tndsxemay'] = spp_tndsxemay
        request.session['money_VAT_tndsxemay'] = money_VAT
        request.session['total_money_hasVAT_tndsxemay'] = total_money_hasVAT

        ngay_hieu_luc_tndsxemay=request.session.get('ngay_hieu_luc_tndsxemay')
        ngay_ket_thuc_tndsxemay=request.session.get('ngay_ket_thuc_tndsxemay')
        ngayhl= datetime.strptime(ngay_hieu_luc_tndsxemay, "%Y-%M-%d").strftime("%d-%M-%Y")
        ngaykt= datetime.strptime(ngay_ket_thuc_tndsxemay, "%Y-%M-%d").strftime("%d-%M-%Y")
        so_dien_thoai_ngmua=request.session.get('sdt_ngmua_tndsxemay') 

        context = {
            "list_data":list_provincial,
            "loai_xe":ten_lx.ten_loai_xe,
            "bien_so_xe":bien_so_xe,
            "cty":cty.ten_cong_ty,
            "sopc_real":convert_price_to_string(sophi_chinh_tndsxemay),
            "sopp_real":convert_price_to_string(spp_tndsxemay),
            "money_VAT":convert_price_to_string(money_VAT),
            "total_money_hasVAT":convert_price_to_string(total_money_hasVAT),
            "ngayhl":ngayhl,
            "ngaykt":ngaykt,
            "sdt":so_dien_thoai_ngmua

        }
        return render(request, 'tndsxemay/prepayment.html',context)
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

        ngay_hieu_luc_tndsxemay=request.session.get('ngay_hieu_luc_tndsxemay')
        ngay_ket_thuc_tndsxemay=request.session.get('ngay_ket_thuc_tndsxemay')

        so_dien_thoai_ngmua=request.session.get('sdt_ngmua_tndsxemay') 
        bien_so_xe_may=request.session.get('bien_so_xe_may_tndsxemay')
        loai_xe_may=request.session.get('loai_xe_may_tndsxemay')
        sophichinh=request.session.get('sophi_chinh_tndsxemay')
        sophiphu=request.session.get('sophiphu_tndsxemay')
        id_cty_tndsxemay=request.session.get('id_cty_tndsxemay')

        money_VAT_tndsxemay=request.session.get('money_VAT_tndsxemay')
        total_money_hasVAT_tndsxemay=request.session.get('total_money_hasVAT_tndsxemay')

        user=User.objects.get(id=request.user.id)
        order_id = unique_order_id_generator(request.user.username)
        mua_chinh=core_model.NguoiMuaBaoHiem.objects.create(username=so_dien_thoai_ngmua,ngay_hieu_luc=ngay_hieu_luc_tndsxemay,ngay_ket_thuc=ngay_ket_thuc_tndsxemay,
                                                            ho_ten_nhan=name_ng_nhan,email_nhan=email_ng_nhan,so_dien_thoai_nhan=phone_ng_nhan,
                                                            dia_chi_tinh_thanh_pho_nhan=tinh_ng_nhan,
                                                            dia_chi_quan_huyen_nhan=huyen_ng_nhan,dia_chi_chi_tiet_nhan=address_ng_nhan)
                                                            
        tk1=tndsxemay_models.NguoiDuocBaoHiem.objects.create(nguoimuabaohiem=mua_chinh,ma_don_hang_bihama=order_id,bien_so_xe=bien_so_xe_may,loai_xe=loai_xe_may,
                                                            ngay_hieu_luc=ngay_hieu_luc_tndsxemay,ngay_ket_thuc=ngay_ket_thuc_tndsxemay,
                                                            images_dangky_mattruoc=dkxe_mat_truoc,images_dangky_matsau=dkxe_mat_sau)
        # tao ma don hang
     
        total_money_final_no_VAT=sophichinh+sophiphu
        pay_loai_hop_dong=loai_hop_dong(user,total_money_final_no_VAT,15)        #15 - BH tndsxemay
        if mgg is None or mgg == "":
            code_giam_gia=None
            total_money_hasDiscount=total_money_hasVAT_tndsxemay
        else:
            code_giam_gia=mgg
            tk= payment_model.MaGiamGia.objects.get(code_ma_giam_gia=code_giam_gia)
            discount=tk.discount
            total_money_hasDiscount=int(total_money_hasVAT_tndsxemay*(1-discount))

        request.session['id_ngmua_chinh']=mua_chinh.id
        request.session['ma_don_hang_bihama'] = order_id
        request.session['pay_so_dien_thoai'] = request.user.username
        request.session['pay_cong_ty'] = id_cty_tndsxemay                               #cty Opes
        request.session['pay_loai_hinh_bao_hiem'] = 15                           #15 - BH tndsxemay
        request.session['pay_goi_san_pham_phu'] = []
        request.session['pay_so_phi_chinh'] = sophichinh
        request.session['pay_so_phi_phu'] = sophiphu
        request.session['pay_so_phi_VAT'] = money_VAT_tndsxemay
        request.session['pay_tong_phi_thanh_toan_has_VAT'] = total_money_hasVAT_tndsxemay
        request.session['pay_loai_hop_dong'] = pay_loai_hop_dong
        request.session['pay_ma_giam_gia'] = code_giam_gia
        request.session['pay_tong_phi_thanh_toan_sau_giam_gia'] = total_money_hasDiscount

        return redirect('payment')


class ChangeLoaiXeMayAPI(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request):
        valid_data = validate_data(tndsxemay_serializers.ChangeLoaiXeMayAPISer, request.data)
        loai_xe_may=int(valid_data.get('loai_xe_may'))

        tnds_xemay=tndsxemay_models.GoiSanPhamChinh.objects.filter(id_loai_hinh_bao_hiem=15,id_loai_xe=loai_xe_may)
        list_item_tnds_xemay = []
        for it in tnds_xemay:
            sub_item = {}
            money=int(tndsxemay_utils.get_spc_tnds_xemay(15,it.company.id_ten_cong_ty,loai_xe_may))
            sub_item['money_real'] = convert_price_to_string(money)
            sub_item['money'] = money
            sub_item['ten_loai_xe'] = it.ten_loai_xe
            sub_item['cty'] = it.company.id_ten_cong_ty
            list_item_tnds_xemay.append(sub_item)

        data={'list_item_tnds_xemay':list_item_tnds_xemay}
        return Response(data=data,status=status.HTTP_200_OK)


class PushSpcTNDSXeMay(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request):
        valid_data = validate_data(tndsxemay_serializers.PushSpcTNDSXeMaySer, request.data)

        loai_xe_may=int(valid_data.get('loai_xe_may'))
        ngay_hieu_luc=valid_data.get('ngay_hieu_luc')
        ngay_ket_thuc=valid_data.get('ngay_ket_thuc')
        id_cty=int(valid_data.get('id_cty'))

        money=int(tndsxemay_utils.get_spc_tnds_xemay(15,id_cty,loai_xe_may))
        ngay_hieu_luc_hd= datetime.strptime(ngay_hieu_luc, "%d-%m-%Y").strftime("%Y-%m-%d")
        ngay_ket_thuc_hd= datetime.strptime(ngay_ket_thuc, "%d-%m-%Y").strftime("%Y-%m-%d")

        request.session['loai_xe_may_tndsxemay'] = loai_xe_may
        request.session['ngay_hieu_luc_tndsxemay'] = ngay_hieu_luc_hd
        request.session['ngay_ket_thuc_tndsxemay'] = ngay_ket_thuc_hd
        request.session['id_cty_tndsxemay'] = id_cty
        request.session['sophi_chinh_tndsxemay'] = money

        so_dien_thoai_ngmua=request.session.get('sdt_ngmua_tndsxemay') 
        bien_so_xe_may=request.session.get('bien_so_xe_may_tndsxemay')

        tk=core_model.NguoiMuaBaoHiemTam.objects.create(username=so_dien_thoai_ngmua,ngay_hieu_luc=ngay_hieu_luc_hd,ngay_ket_thuc=ngay_ket_thuc_hd)
        tk1=tndsxemay_models.NguoiDuocBaoHiemTam.objects.create(nguoimuabaohiemtam=tk,bien_so_xe=bien_so_xe_may,loai_xe=loai_xe_may,ngay_hieu_luc=ngay_hieu_luc_hd,ngay_ket_thuc=ngay_ket_thuc_hd)

        return Response(1,status=status.HTTP_200_OK)





