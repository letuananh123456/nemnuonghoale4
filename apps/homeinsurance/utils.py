from apps.homeinsurance import models as home_models
from apps.homeinsurance import serializers as home_serializers
from apps.homeinsurance import utils as home_utils
from apps.core import models as core_models
from apps.payment import models as payment_models
from apps.users import models as user_models 

def get_spc_money_home(home_value,in_home_value,loai_hinh_bh,id_congty):
    cty=core_models.Company.objects.get(id_ten_cong_ty=id_congty)
    home=home_models.GoiSanPhamChinh.objects.get(id_loai_hinh_bao_hiem=loai_hinh_bh,company=cty,id_goi_san_pham_chinh=1)
    in_home=home_models.GoiSanPhamChinh.objects.get(id_loai_hinh_bao_hiem=loai_hinh_bh,company=cty,id_goi_san_pham_chinh=2)
    money_home = home.so_phi_chinh*home_value
    money_in_home = in_home.so_phi_chinh*in_home_value
    return int(money_home + money_in_home)


def get_spp_money_home(home_value,gia_tri_bentrong,loai_hinh_bh,id_congty,arr_list_spp):
    cty=core_models.Company.objects.get(id_ten_cong_ty=id_congty)
    total_money_spp=0
    for item in arr_list_spp:
        if item == 8:
            home=home_models.GoiSanPhamPhu.objects.get(id_loai_hinh_bao_hiem=loai_hinh_bh,company=cty,id_goi_san_pham_chinh=1,id_goi_san_pham_phu=8)
            money = 15000000*home.so_phi_phu
        if item==1 or item==2 or item==3 or item==4 or item==5:
            home=home_models.GoiSanPhamPhu.objects.get(id_loai_hinh_bao_hiem=loai_hinh_bh,company=cty,id_goi_san_pham_chinh=1,id_goi_san_pham_phu=item)
            money=home_value*home.so_phi_phu
        if item==6 or item==7 :
            home=home_models.GoiSanPhamPhu.objects.get(id_loai_hinh_bao_hiem=loai_hinh_bh,company=cty,id_goi_san_pham_chinh=1,id_goi_san_pham_phu=item)
            money=0.1*home_value*home.so_phi_phu
        total_money_spp = total_money_spp + money
    return int(total_money_spp)


def get_home_type(home_type):
    if home_type is 1:
        home_type_real="Nhà đất"
    elif home_type is 2:
        home_type_real="Chung cư"
    else:
        home_type_real="Không xác định"
    return home_type_real

def get_info_dh_home(id):
    donhang = payment_models.DonDatHang.objects.get(id=id)
    ngoinha = home_models.NguoiDuocBaoHiem.objects.get(ma_don_hang_bihama=donhang.ma_don_hang_bihama)
    nguoithuhuong = home_models.NguoiThuHuong.objects.get(nguoiduocbaohiem=ngoinha)
    
    data = dict()
    data["fullname"] = donhang.nguoimuabaohiem.fullname
    data["username"] = donhang.nguoimuabaohiem.username
    data["birth_day"] = donhang.nguoimuabaohiem.birth_day
    data["birth_month"] = donhang.nguoimuabaohiem.birth_month
    data["birth_year"] = donhang.nguoimuabaohiem.birth_year
    data["gioi_tinh"] = donhang.nguoimuabaohiem.gioi_tinh
    data["email"] = donhang.nguoimuabaohiem.email
    data["dia_chi_tinh_thanh_pho"] = donhang.nguoimuabaohiem.dia_chi_tinh_thanh_pho
    data["dia_chi_quan_huyen"] = donhang.nguoimuabaohiem.dia_chi_quan_huyen 
    data["dia_chi_chi_tiet"] = donhang.nguoimuabaohiem.dia_chi_chi_tiet
    data["so_cmnd"] = donhang.nguoimuabaohiem.so_cmnd
    data["images_cmt_mattruoc"] = donhang.nguoimuabaohiem.images_cmt_mattruoc
    data["images_cmt_matsau"] = donhang.nguoimuabaohiem.images_cmt_matsau
    if donhang.nguoimuabaohiem.cmt_ngay_cap is not None:
        data["cmt_ngay_cap"] = donhang.nguoimuabaohiem.cmt_ngay_cap.strftime('%Y-%m-%d')
    else:
        data["cmt_ngay_cap"] = None
    data["cmt_noi_cap"] = donhang.nguoimuabaohiem.cmt_noi_cap
    if donhang.nguoimuabaohiem.ngay_hieu_luc is not None:
        data["ngay_hieu_luc_nguoimua"] = donhang.nguoimuabaohiem.ngay_hieu_luc.strftime('%Y-%m-%d %H:%M:%S')
    else:
        data["ngay_hieu_luc_nguoimua"] = None
    if donhang.nguoimuabaohiem.ngay_ket_thuc is not None:
        data["ngay_ket_thuc_nguoimua"] = donhang.nguoimuabaohiem.ngay_ket_thuc.strftime('%Y-%m-%d %H:%M:%S')
    else:
        data["ngay_ket_thuc_nguoimua"] = None
    data["ho_ten_nhan"] = donhang.nguoimuabaohiem.ho_ten_nhan
    data["email_nhan"] = donhang.nguoimuabaohiem.email_nhan
    data["so_dien_thoai_nhan"] = donhang.nguoimuabaohiem.so_dien_thoai_nhan
    data["dia_chi_tinh_thanh_pho_nhan"] = donhang.nguoimuabaohiem.dia_chi_tinh_thanh_pho_nhan
    data["dia_chi_quan_huyen_nhan"] = donhang.nguoimuabaohiem.dia_chi_quan_huyen_nhan
    data["dia_chi_chi_tiet_nhan"] = donhang.nguoimuabaohiem.dia_chi_chi_tiet_nhan
    data["status_marriage"] = donhang.nguoimuabaohiem.status_marriage
    data["job"] = donhang.nguoimuabaohiem.job 
    data["weight"] = donhang.nguoimuabaohiem.weight
    data["height"] = donhang.nguoimuabaohiem.height
    data["nationality"] = donhang.nguoimuabaohiem.nationality
    data["nationality_paper"] = donhang.nguoimuabaohiem.nationality_paper 
    data["create_at_nguoimua"] = donhang.nguoimuabaohiem.created_at.strftime('%Y-%m-%d %H:%M:%S')
    if donhang.loai_hop_dong ==0:
        data["code_hoahong"] = None
    elif donhang.loai_hop_dong ==1:
        data["code_hoahong"] = donhang.user.code_invite
    elif donhang.loai_hop_dong ==2:
        data["code_hoahong"] = donhang.user.link_info[-10:]

    data["register_ctv"] = donhang.user.register_ctv
    data["loai_hinh_bao_hiem"] = donhang.loai_hinh_bao_hiem
    data["cong_ty"] = donhang.cong_ty
    data["goi_san_pham"] = donhang.goi_san_pham_chinh
    data["goi_san_pham_phu"] = donhang.goi_san_pham_phu
    data["so_phi_chinh"] = str(donhang.so_phi_chinh)
    data["so_phi_phu"] = str(donhang.tong_so_phi_phu )
    data["so_phi_VAT"] = str(donhang.so_phi_VAT )
    data["tong_phi_thanh_toan"] = str(donhang.tong_phi_thanh_toan)
    data["tong_phi_thanh_toan_sau_giam_gia"] = str(donhang.tong_phi_thanh_toan_sau_giam_gia)
    data["loai_thanh_toan"] = donhang.loai_thanh_toan 
    data["ma_don_hang_bihama"] = donhang.ma_don_hang_bihama
    data["tinh_trang_don_dat_hang"] = donhang.tinh_trang_don_dat_hang  
    data["ma_giao_dich_cong_thanh_toan"] = donhang.ma_giao_dich_cong_thanh_toan
    data["tinh_trang_thanh_toan_cong_thanh_toan"] = donhang.tinh_trang_thanh_toan_cong_thanh_toan  
    data["magiamgia"] = donhang.code_ma_giam_gia
    data["create_at_donhang"] = donhang.created_at.strftime('%Y-%m-%d %H:%M:%S')
    data["loaihopdong"] = donhang.loai_hop_dong
    data["is_tai_tuc"] = donhang.is_tai_tuc

    data["loai_nha"] = ngoinha.loai_nha 
    data["muc_dich_nha"] = ngoinha.muc_dich_nha  
    data["tuoi_tho_ngoi_nha"] = ngoinha.tuoi_tho_ngoi_nha 
    data["dia_chi_tinh_thanh_pho_ngoi_nha"] = ngoinha.dia_chi_tinh_thanh_pho 
    data["dia_chi_quan_huyen_ngoi_nha"] = ngoinha.dia_chi_quan_huyen 
    data["dia_chi_chi_tiet_ngoi_nha"] = ngoinha.dia_chi_chi_tiet
    data["gia_tri_can_nha"] = str(ngoinha.gia_tri_can_nha)
    data["gia_tri_tai_san_ben_trong"] = str(ngoinha.gia_tri_tai_san_ben_trong)
    data["so_tien_bh"] = str(ngoinha.so_tien_bh)
    data["ngay_hieu_luc_ngoinha"] = ngoinha.ngay_hieu_luc.strftime('%Y-%m-%d %H:%M:%S')
    data["ngay_ket_thuc_ngoinha"] = ngoinha.ngay_ket_thuc.strftime('%Y-%m-%d %H:%M:%S')
    data["relationship"] = ngoinha.relationship 
    data["created_at_ngoinha"] = ngoinha.created_at.strftime('%Y-%m-%d %H:%M:%S')
    data["is_fire_ngoinha"] = ngoinha.is_fire

    data["fullname_nguoithuhuong"] = nguoithuhuong.fullname
    data["birth_day_nguoithuhuong"] = nguoithuhuong.birth_day
    data["birth_month_nguoithuhuong"] = nguoithuhuong.birth_month
    data["birth_year_nguoithuhuong"] = nguoithuhuong.birth_year
    data["gioi_tinh_nguoithuhuong"] = nguoithuhuong.gioi_tinh
    data["so_cmnd_nguoithuhuong"] = nguoithuhuong.so_cmnd
    return data