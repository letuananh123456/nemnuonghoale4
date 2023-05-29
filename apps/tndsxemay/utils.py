from apps.core import models as core_models
from apps.tndsxemay import models as tnds_xemay_models
from .models import NguoiDuocBaoHiem
from .models import NguoiDuocBaoHiem,GoiSanPhamPhu,GoiSanPhamChinh
from apps.core.models import NguoiMuaBaoHiem,Company
from apps.payment.models import DonDatHang
from datetime import datetime
from apps.users import models as users_models


def get_spc_tnds_xemay(id_loai_hinh_bh,id_cty,loai_xe):
    cty=Company.objects.get(id_ten_cong_ty=id_cty)
    spc=GoiSanPhamChinh.objects.get(company=cty,id_loai_hinh_bao_hiem=id_loai_hinh_bh,id_loai_xe=loai_xe)
    return spc.so_phi_chinh

def get_spp_tnds_xemay(id_loai_hinh_bh,id_cty,loai_xe,id_spp):
    cty=Company.objects.get(id_ten_cong_ty=id_cty)
    spp=GoiSanPhamPhu.objects.get(company=cty,id_loai_hinh_bao_hiem=id_loai_hinh_bh,id_goi_san_pham_phu=id_spp)
    return spp.so_phi_phu


def get_thong_tin_don_hang_tnxemay(id):
    donhang = DonDatHang.objects.get(id=id)
    xebaohiem = NguoiDuocBaoHiem.objects.get(ma_don_hang_bihama=donhang.ma_don_hang_bihama)
    user = users_models.User.objects.get(id=donhang.user.id)
    data_dict = dict()

    data_dict["fullname"] = donhang.nguoimuabaohiem.fullname
    data_dict["username"] = donhang.nguoimuabaohiem.username
    data_dict["birth_day"] = donhang.nguoimuabaohiem.birth_day
    data_dict["birth_month"] = donhang.nguoimuabaohiem.birth_month
    data_dict["birth_year"] = donhang.nguoimuabaohiem.birth_year
    data_dict["gioi_tinh"] = donhang.nguoimuabaohiem.gioi_tinh
    data_dict["email"] = donhang.nguoimuabaohiem.email
    data_dict["dia_chi_tinh_thanh_pho"] = donhang.nguoimuabaohiem.dia_chi_tinh_thanh_pho
    data_dict["dia_chi_quan_huyen"] = donhang.nguoimuabaohiem.dia_chi_quan_huyen 
    data_dict["dia_chi_chi_tiet"] = donhang.nguoimuabaohiem.dia_chi_chi_tiet
    data_dict["so_cmnd"] = donhang.nguoimuabaohiem.so_cmnd
    data_dict["images_cmt_mattruoc"] = donhang.nguoimuabaohiem.images_cmt_mattruoc
    data_dict["images_cmt_matsau"] = donhang.nguoimuabaohiem.images_cmt_matsau
    if donhang.nguoimuabaohiem.cmt_ngay_cap is not None:
        data_dict["cmt_ngay_cap"] = donhang.nguoimuabaohiem.cmt_ngay_cap.strftime('%Y-%m-%d')
    else:
        data_dict["cmt_ngay_cap"] = None
    data_dict["cmt_noi_cap"] = donhang.nguoimuabaohiem.cmt_noi_cap

    if donhang.nguoimuabaohiem.ngay_hieu_luc is not None:
        data_dict["ngay_hieu_luc_nguoimua"] = donhang.nguoimuabaohiem.ngay_hieu_luc.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    else:
        data_dict["ngay_hieu_luc_nguoimua"] = None

    if donhang.nguoimuabaohiem.ngay_ket_thuc:
        data_dict["ngay_ket_thuc_nguoimua"] = donhang.nguoimuabaohiem.ngay_ket_thuc.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    else:
        data_dict["ngay_ket_thuc_nguoimua"] = None

    data_dict["ho_ten_nhan"] = donhang.nguoimuabaohiem.ho_ten_nhan
    data_dict["email_nhan"] = donhang.nguoimuabaohiem.email_nhan
    data_dict["so_dien_thoai_nhan"] = donhang.nguoimuabaohiem.so_dien_thoai_nhan
    data_dict["dia_chi_tinh_thanh_pho_nhan"] = donhang.nguoimuabaohiem.dia_chi_tinh_thanh_pho_nhan
    data_dict["dia_chi_quan_huyen_nhan"] = donhang.nguoimuabaohiem.dia_chi_quan_huyen_nhan
    data_dict["dia_chi_chi_tiet_nhan"] = donhang.nguoimuabaohiem.dia_chi_chi_tiet_nhan
    data_dict["status_marriage"] = donhang.nguoimuabaohiem.status_marriage
    data_dict["job"] = donhang.nguoimuabaohiem.job 
    data_dict["weight"] = donhang.nguoimuabaohiem.weight
    data_dict["height"] = donhang.nguoimuabaohiem.height
    data_dict["nationality"] = donhang.nguoimuabaohiem.nationality
    data_dict["nationality_paper"] = donhang.nguoimuabaohiem.nationality_paper 
    data_dict["create_at_nguoimua"] = donhang.nguoimuabaohiem.created_at.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    data_dict["code_invite"] = user.code_invite
    data_dict["register_ctv"] = donhang.user.register_ctv

    data_dict["loai_hinh_bao_hiem"] = donhang.loai_hinh_bao_hiem
    data_dict["cong_ty"] = donhang.cong_ty
    data_dict["goi_san_pham"] = donhang.goi_san_pham_chinh
    data_dict["goi_san_pham_phu"] = donhang.goi_san_pham_phu
    data_dict["so_phi_chinh"] = str(donhang.so_phi_chinh)
    data_dict["so_phi_phu"] = str(donhang.tong_so_phi_phu )
    data_dict["so_phi_VAT"] = str(donhang.so_phi_VAT )
    data_dict["tong_phi_thanh_toan"] = str(donhang.tong_phi_thanh_toan)
    data_dict["tong_phi_thanh_toan_sau_giam_gia"] = str(donhang.tong_phi_thanh_toan_sau_giam_gia)
    data_dict["loai_thanh_toan"] = donhang.loai_thanh_toan 
    data_dict["ma_don_hang_bihama"] = donhang.ma_don_hang_bihama
    data_dict["tinh_trang_don_dat_hang"] = donhang.tinh_trang_don_dat_hang  
    data_dict["ma_giao_dich_cong_thanh_toan"] = str(donhang.ma_giao_dich_cong_thanh_toan)
    data_dict["tinh_trang_thanh_toan_cong_thanh_toan"] = donhang.tinh_trang_thanh_toan_cong_thanh_toan  
    data_dict["magiamgia"] = donhang.code_ma_giam_gia
    data_dict["create_at_donhang"] = donhang.created_at.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    data_dict["loaihopdong"] = donhang.loai_hop_dong
    data_dict["is_tai_tuc"] = donhang.is_tai_tuc

    data_dict["bien_so_xe"] = xebaohiem.bien_so_xe   
    data_dict["loai_xe"] = xebaohiem.loai_xe   
    data_dict["so_tien_bao_hiem_tnds_tu_nguyen"] = xebaohiem.so_tien_bao_hiem_tnds_tu_nguyen   
    data_dict["so_cho_tai_nan_nguoi_tren_xe"] = xebaohiem.so_cho_tai_nan_nguoi_tren_xe   
    data_dict["so_tien_bao_hiem_tai_nan_nguoi_tren_xe"] = str(xebaohiem.so_tien_bao_hiem_tai_nan_nguoi_tren_xe)   
    data_dict["so_tien_bao_hiem_chay_no"] = str(xebaohiem.so_tien_bao_hiem_chay_no)  
    data_dict["images_dangky_mattruoc"] = xebaohiem.images_dangky_mattruoc   
    data_dict["images_dangky_matsau"] = xebaohiem.images_dangky_matsau
    if xebaohiem.ngay_hieu_luc is not None:
        data_dict["ngay_hieu_luc"] = xebaohiem.ngay_hieu_luc.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    else:
        data_dict["ngay_hieu_luc"] = None
    
    if xebaohiem.ngay_ket_thuc is not None:
        data_dict["ngay_ket_thuc"] = xebaohiem.ngay_ket_thuc.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    else:
        data_dict["ngay_ket_thuc"] = None
    data_dict["created_at"] = xebaohiem.created_at.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    return data_dict

   
