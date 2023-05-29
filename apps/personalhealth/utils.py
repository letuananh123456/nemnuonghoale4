import json
from . import models as person_models
from apps.core import models as core_models
from apps.payment import models as payment_models
from apps.users import models as users_models
from rest_framework.serializers import Serializer

"""
cong_ty
1 - BH VBI

goi_san_pham
Điều kiện: BH sức khoẻ cá nhân/BH VBI:
1 - Gói Đồng
2 - Gói Bạc 
3 - Gói TiTan
4 - Gói Vàng 
5 - Gói Bạch Kim
6 - Gói Kim Cương

goi_san_pham_phu
Điều kiện: BH sức khoẻ cá nhân/BH VBI:
1 - Điều trị ngoại trú
2 - Nha khoa
3 - Thai sản 
4 - Trợ cấp nằm viện do tai nạn

Quan he voi ben mua bao hiem
s = 0
    ban = 1
    vo_chong = 2
    con_trai = 3
    con_gai = 4
    anh_chi_em_ruot = 5
    cha = 6
    me = 7
    chavo_chachong = 8
    mevo_mechong = 9
    ong = 10
    ba = 11
"""

def get_data_dict_personalhealth(id):
    donhang = payment_models.DonDatHang.objects.get(id=id)
    nguoimuabaohiem = core_models.NguoiMuaBaoHiem.objects.get(id=donhang.nguoimuabaohiem.id)
    user = users_models.User.objects.get(id=donhang.user.id)
    nguoiduocbaohiem = person_models.NguoiDuocBaoHiem.objects.filter(ma_don_hang_bihama=donhang.ma_don_hang_bihama)
    data_dict = dict()

    data_dict["fullname"] = nguoimuabaohiem.fullname
    data_dict["username"] = nguoimuabaohiem.username
    data_dict["birth_day"] = nguoimuabaohiem.birth_day
    data_dict["birth_month"] = nguoimuabaohiem.birth_month
    data_dict["birth_year"] = nguoimuabaohiem.birth_year
    data_dict["gioi_tinh"] = nguoimuabaohiem.gioi_tinh
    data_dict["email"] = nguoimuabaohiem.email
    data_dict["dia_chi_tinh_thanh_pho"] = nguoimuabaohiem.dia_chi_tinh_thanh_pho
    data_dict["dia_chi_quan_huyen"] = nguoimuabaohiem.dia_chi_quan_huyen 
    data_dict["dia_chi_chi_tiet"] = nguoimuabaohiem.dia_chi_chi_tiet
    data_dict["so_cmnd"] = nguoimuabaohiem.so_cmnd
    data_dict["images_cmt_mattruoc"] = nguoimuabaohiem.images_cmt_mattruoc
    data_dict["images_cmt_matsau"] = nguoimuabaohiem.images_cmt_matsau

    data_dict["cmt_ngay_cap"] = nguoimuabaohiem.cmt_ngay_cap.strftime('%Y-%m-%d')
    data_dict["cmt_noi_cap"] = nguoimuabaohiem.cmt_noi_cap
    if nguoimuabaohiem.ngay_hieu_luc is not None:
        data_dict["ngay_hieu_luc_nguoimua"] = nguoimuabaohiem.ngay_hieu_luc.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    else:
        data_dict["ngay_hieu_luc_nguoimua"] = ""
    if nguoimuabaohiem.ngay_ket_thuc is not None:
        data_dict["ngay_ket_thuc_nguoimua"] = nguoimuabaohiem.ngay_ket_thuc.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    else:
        data_dict["ngay_ket_thuc_nguoimua"] = ""
    data_dict["ho_ten_nhan"] = nguoimuabaohiem.ho_ten_nhan
    data_dict["email_nhan"] = nguoimuabaohiem.email_nhan
    data_dict["so_dien_thoai_nhan"] = nguoimuabaohiem.so_dien_thoai_nhan
    data_dict["dia_chi_tinh_thanh_pho_nhan"] = nguoimuabaohiem.dia_chi_tinh_thanh_pho_nhan
    data_dict["dia_chi_quan_huyen_nhan"] = nguoimuabaohiem.dia_chi_quan_huyen_nhan
    data_dict["dia_chi_chi_tiet_nhan"] = nguoimuabaohiem.dia_chi_chi_tiet_nhan
    data_dict["status_marriage"] = nguoimuabaohiem.status_marriage
    data_dict["job"] = nguoimuabaohiem.job 
    data_dict["weight"] = nguoimuabaohiem.weight
    data_dict["height"] = nguoimuabaohiem.height
    data_dict["nationality"] = nguoimuabaohiem.nationality
    data_dict["nationality_paper"] = nguoimuabaohiem.nationality_paper 
    data_dict["create_at_nguoimua"] = nguoimuabaohiem.created_at.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
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

    list_nguoidcbh = list()
    for i in range(len(nguoiduocbaohiem)):
        data = dict()
        data["nguoimuabaohiem"] = str(nguoiduocbaohiem[i].nguoimuabaohiem.id)
        data["username"] =  nguoiduocbaohiem[i].username
        data["fullname"] = nguoiduocbaohiem[i].fullname
        data["birth_day"] = nguoiduocbaohiem[i].birth_day
        data["birth_month"] = nguoiduocbaohiem[i].birth_month
        data["birth_year"] = nguoiduocbaohiem[i].birth_year
        data["gioi_tinh"] = nguoiduocbaohiem[i].gioi_tinh
        data["email"] = nguoiduocbaohiem[i].email
        data["dia_chi_tinh_thanh_pho"] = nguoiduocbaohiem[i].dia_chi_tinh_thanh_pho
        data["dia_chi_quan_huyen"] = nguoiduocbaohiem[i].dia_chi_quan_huyen
        data["dia_chi_chi_tiet"] = nguoiduocbaohiem[i].dia_chi_chi_tiet
        data["so_cmnd"] = nguoiduocbaohiem[i].so_cmnd
        data["images_cmt_mattruoc"] = nguoiduocbaohiem[i].images_cmt_mattruoc
        data["images_cmt_matsau"] = nguoiduocbaohiem[i].images_cmt_matsau
        if nguoiduocbaohiem[i].cmt_ngay_cap is None:
            data["cmt_ngay_cap"] = None
        else:
            data["cmt_ngay_cap"] = nguoiduocbaohiem[i].cmt_ngay_cap.strftime('%Y-%m-%d')
        data["cmt_noi_cap"] = nguoiduocbaohiem[i].cmt_noi_cap
        data["ngay_hieu_luc_nguoiduocbaohiem"] = nguoiduocbaohiem[i].ngay_hieu_luc.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
        data["ngay_ket_thuc_nguoiduocbaohiem"] = nguoiduocbaohiem[i].ngay_ket_thuc.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
        data["cau_hoi_suc_khoe_1"] = nguoiduocbaohiem[i].cau_hoi_suc_khoe_1
        data["cau_hoi_suc_khoe_2"] = nguoiduocbaohiem[i].cau_hoi_suc_khoe_2
        data["chi_tiet_benh_tat"] = nguoiduocbaohiem[i].chi_tiet_benh_tat
        data["relationship"] = int(nguoiduocbaohiem[i].relationship)
        data["create_at_nguoidcbh"] = nguoiduocbaohiem[i].created_at.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
        list_nguoidcbh.append(data)

    data_dict["GCNS"] = list_nguoidcbh
    return data_dict


def get_total_money_personhealth(arr_family,goi_perhealth,id_ten_cong_ty):
    total_money=0
    for item in arr_family:
        name_member = item['name_member']
        age_member = json.loads(item['age_member'])
        cty=core_models.Company.objects.get(id_ten_cong_ty=id_ten_cong_ty)
        goispdong = person_models.GoiSanPhamChinh.objects.get(company=cty,id_goi_san_pham_chinh=goi_perhealth,tuoi=age_member)
        pay_age = goispdong.so_phi_chinh
        if len(arr_family)<2 and age_member<6:
            total_money=pay_age*1.3
        else:
            total_money= total_money + pay_age
    return int(total_money)


def get_price_spp_personhealth(arr_family,goi_perhealth,name_quyen_loi,id_ten_cong_ty):

    total_money_spp=0
    for item in arr_family:
        age_member1 = json.loads(item['age_member'])
        cty=core_models.Company.objects.get(id_ten_cong_ty=id_ten_cong_ty)
        goispdong = person_models.GoiSanPhamPhu.objects.get(id_goi_san_pham_chinh=goi_perhealth,tuoi=age_member1,id_goi_san_pham_phu=name_quyen_loi,company=cty)
        total_money_spp= total_money_spp + goispdong.so_phi_phu
    return int(total_money_spp)


def convert_spp(name_quyen_loi):
    if name_quyen_loi == 1:
        name_quyen_loi="Điều Trị Ngoại Trú"
    elif name_quyen_loi == 2:
        name_quyen_loi = "Nha Khoa"
    elif name_quyen_loi == 3:
        name_quyen_loi = "Thai Sản"
    elif name_quyen_loi == 4:
        name_quyen_loi="Trợ Cấp Nằm Viện Do Tai Nạn"
    else:
        name_quyen_loi=""
    return name_quyen_loi


def relative_ngmua(name_rel):
    if name_rel == "Self":
        name= 1
    elif name_rel == "Spouse":
        name = 2
    elif name_rel == "sonson1" or name_rel == "sonson2" or name_rel == "sonson3" or name_rel == "sonson4" :
        name = 3
    elif name_rel == "daudauter1" or name_rel == "daudauter2" or name_rel == "daudauter3" or name_rel == "daudauter4":
        name = 4
    elif name_rel == "mtace":
        name = 5
    elif name_rel == "mtcha":
        name = 6
    elif name_rel == "mtme":
        name = 7
    elif name_rel == "mtchack":
        name = 8
    elif name_rel == "mtmeck":
        name = 9
    elif name_rel == "mtong":
        name = 10
    elif name_rel == "mtba":
        name = 11
    return name
# def check_exist_ngdc():

