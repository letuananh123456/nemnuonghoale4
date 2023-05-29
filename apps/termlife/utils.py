from . import models as termlife_models
from apps.core import models as core_models
from apps.payment import models as pm_models
from datetime import datetime
def get_money_spc_term_life(lhbh,sex,age,stbh,snhd,sndp,ctp,cty,ltp,spc):
    # cty=core_models.Company.objects.get(id_ten_cong_ty=cty)
    if spc == 1: 
        tl=termlife_models.GoiSanPhamChinh.objects.get(company__id_ten_cong_ty=cty,id_loai_hinh_bao_hiem=lhbh,tuoi=age,so_nam_hop_dong=snhd,so_nam_dong_phi=sndp,cach_tra_phi=ctp,id_goi_san_pham_chinh=spc)
    elif spc == 2 or spc == 3:
        tl=termlife_models.GoiSanPhamChinh.objects.get(company__id_ten_cong_ty=cty,id_loai_hinh_bao_hiem=lhbh,gioi_tinh=sex,tuoi=age,so_nam_hop_dong=snhd,so_nam_dong_phi=sndp,cach_tra_phi=ctp,id_goi_san_pham_chinh=spc)

    if ltp==1 or ctp==1:
        money= tl.so_phi_chinh_hang_nam
    elif ltp==2 and ctp==2:
        money= tl.so_phi_chinh_hang_nua_nam
    elif ltp==3 and ctp==2:
        money= tl.so_phi_chinh_hang_quy
    elif ltp==4 and ctp==2:
        money= tl.so_phi_chinh_hang_thang
    return money*stbh

def get_money_spp_term_life(namvien,hiemngheo,sex,age,cty,spc):
    money1=0
    money2=0
    if len(namvien) != 0:
        spp=termlife_models.GoiSanPhamPhu.objects.get(company__id_ten_cong_ty=cty,id_goi_san_pham_phu=1,tuoi=age,so_nam_hop_dong=namvien['snhd'],so_nam_dong_phi=namvien['sndp'],cach_tra_phi=namvien['ctp'],so_tien_bao_hiem=int(namvien['stbh']),id_goi_san_pham_chinh=spc)
        money1=spp.so_phi_phu_nam
    if len(hiemngheo) != 0:
        if spc == 3:
            spp2=termlife_models.GoiSanPhamPhu.objects.get(company__id_ten_cong_ty=cty,id_goi_san_pham_phu=2,gioi_tinh=1,tuoi=age,so_nam_hop_dong=hiemngheo['snhd'],so_nam_dong_phi=hiemngheo['sndp'],cach_tra_phi=hiemngheo['ctp'],so_tien_bao_hiem=int(hiemngheo['stbh']),id_goi_san_pham_chinh=spc)
            money2=spp2.so_phi_phu_nam
        else:
            spp2=termlife_models.GoiSanPhamPhu.objects.get(company__id_ten_cong_ty=cty,id_goi_san_pham_phu=2,gioi_tinh=sex,tuoi=age,so_nam_hop_dong=hiemngheo['snhd'],so_nam_dong_phi=hiemngheo['sndp'],cach_tra_phi=hiemngheo['ctp'],so_tien_bao_hiem=int(hiemngheo['stbh']),id_goi_san_pham_chinh=spc)
            money2=spp2.so_phi_phu_nam
    return money1+money2


def get_data_ordertermilife(id):
    dh = pm_models.DonDatHang.objects.get(id=id)
    ndbh = termlife_models.NguoiDuocBaoHiem.objects.get(nguoimuabaohiem=dh.nguoimuabaohiem)
    nth = termlife_models.NguoiThuHuong.objects.filter(nguoiduocbaohiem=ndbh)
    data_dict = dict()


    data_dict["fullname"] = dh.nguoimuabaohiem.fullname
    data_dict["username"] = dh.nguoimuabaohiem.username
    data_dict["birth_day"] = dh.nguoimuabaohiem.birth_day
    data_dict["birth_month"] = dh.nguoimuabaohiem.birth_month
    data_dict["birth_year"] = dh.nguoimuabaohiem.birth_year
    data_dict["gioi_tinh"] = dh.nguoimuabaohiem.gioi_tinh
    data_dict["email"] = dh.nguoimuabaohiem.email
    data_dict["dia_chi_tinh_thanh_pho"] = dh.nguoimuabaohiem.dia_chi_tinh_thanh_pho
    data_dict["dia_chi_quan_huyen"] = dh.nguoimuabaohiem.dia_chi_quan_huyen 
    data_dict["dia_chi_chi_tiet"] = dh.nguoimuabaohiem.dia_chi_chi_tiet
    data_dict["so_cmnd"] = dh.nguoimuabaohiem.so_cmnd
    data_dict["images_cmt_mattruoc"] = dh.nguoimuabaohiem.images_cmt_mattruoc
    data_dict["images_cmt_matsau"] = dh.nguoimuabaohiem.images_cmt_matsau
    data_dict["cmt_ngay_cap"] = dh.nguoimuabaohiem.cmt_ngay_cap.strftime('%Y-%m-%d')
    data_dict["cmt_noi_cap"] = dh.nguoimuabaohiem.cmt_noi_cap
    if dh.nguoimuabaohiem.ngay_hieu_luc is not None:
        data_dict["ngay_hieu_luc_nguoimua"] = dh.nguoimuabaohiem.ngay_hieu_luc.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    else:
        data_dict["ngay_hieu_luc_nguoimua"] = None
    if dh.nguoimuabaohiem.ngay_ket_thuc is not None:
        data_dict["ngay_ket_thuc_nguoimua"] = dh.nguoimuabaohiem.ngay_ket_thuc.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    else:
        data_dict["ngay_ket_thuc_nguoimua"] = None
    data_dict["ho_ten_nhan"] = dh.nguoimuabaohiem.ho_ten_nhan
    data_dict["email_nhan"] = dh.nguoimuabaohiem.email_nhan
    data_dict["so_dien_thoai_nhan"] = dh.nguoimuabaohiem.so_dien_thoai_nhan
    data_dict["dia_chi_tinh_thanh_pho_nhan"] = dh.nguoimuabaohiem.dia_chi_tinh_thanh_pho_nhan
    data_dict["dia_chi_quan_huyen_nhan"] = dh.nguoimuabaohiem.dia_chi_quan_huyen_nhan
    data_dict["dia_chi_chi_tiet_nhan"] = dh.nguoimuabaohiem.dia_chi_chi_tiet_nhan
    data_dict["status_marriage"] = dh.nguoimuabaohiem.status_marriage
    data_dict["job"] = dh.nguoimuabaohiem.job 
    data_dict["weight"] = dh.nguoimuabaohiem.weight
    data_dict["height"] = dh.nguoimuabaohiem.height
    data_dict["nationality"] = dh.nguoimuabaohiem.nationality
    data_dict["nationality_paper"] = dh.nguoimuabaohiem.nationality_paper 
    data_dict["create_at_nguoimua"] = dh.nguoimuabaohiem.created_at.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    data_dict["code_invite"] = dh.user.code_invite  
    data_dict["register_ctv"] = dh.user.register_ctv

    data_dict["loai_hinh_bao_hiem"] = dh.loai_hinh_bao_hiem
    data_dict["cong_ty"] = dh.cong_ty
    data_dict["goi_san_pham"] = dh.goi_san_pham_chinh
    data_dict["goi_san_pham_phu"] = dh.goi_san_pham_phu
    data_dict["so_phi_chinh"] = str(dh.so_phi_chinh)
    data_dict["so_phi_phu"] = str(dh.tong_so_phi_phu )
    data_dict["so_phi_VAT"] = str(dh.so_phi_VAT )
    data_dict["tong_phi_thanh_toan"] = str(dh.tong_phi_thanh_toan)
    data_dict["tong_phi_thanh_toan_sau_giam_gia"] = str(dh.tong_phi_thanh_toan_sau_giam_gia)
    data_dict["loai_thanh_toan"] = dh.loai_thanh_toan 
    data_dict["ma_don_hang_bihama"] = dh.ma_don_hang_bihama
    data_dict["tinh_trang_don_dat_hang"] = dh.tinh_trang_don_dat_hang  
    data_dict["ma_giao_dich_cong_thanh_toan"] = dh.ma_giao_dich_cong_thanh_toan
    data_dict["tinh_trang_thanh_toan_cong_thanh_toan"] = dh.tinh_trang_thanh_toan_cong_thanh_toan  
    data_dict["magiamgia"] = dh.code_ma_giam_gia
    data_dict["create_at_dh"] = dh.created_at.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    data_dict["loaihopdong"] = dh.loai_hop_dong
    data_dict["is_tai_tuc"] = dh.is_tai_tuc

    data_dict["username_ndbh"] = ndbh.username
    data_dict["fullname_ndbh"] = ndbh.fullname
    data_dict["birth_day_ndbh"] = ndbh.birth_day
    data_dict["birth_month_ndbh"] = ndbh.birth_month
    data_dict["birth_year_ndbh"] = ndbh.birth_year
    data_dict["gioi_tinh_ndbh"] = ndbh.gioi_tinh
    data_dict["email_ndbh"] = ndbh.email
    data_dict["dia_chi_tinh_thanh_pho_ndbh"] = ndbh.dia_chi_tinh_thanh_pho
    data_dict["dia_chi_quan_huyen_ndbh"] = ndbh.dia_chi_quan_huyen
    data_dict["dia_chi_chi_tiet_ndbh"] = ndbh.dia_chi_chi_tiet
    data_dict["so_cmnd_ndbh"] = ndbh.so_cmnd
    data_dict["images_cmt_mattruoc_ndbh"] = ndbh.images_cmt_mattruoc
    data_dict["images_cmt_matsau_ndbh"] = ndbh.images_cmt_matsau
    data_dict["cmt_ngay_cap_ndbh"] = ndbh.cmt_ngay_cap.strftime('%Y-%m-%d')
    data_dict["cmt_noi_cap_ndbh"] = ndbh.cmt_noi_cap
    if ndbh.ngay_hieu_luc is not None:
        data_dict["ngay_hieu_luc_ndbh"] = ndbh.ngay_hieu_luc.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    else:
        data_dict["ngay_hieu_luc_ndbh"] = None
    if ndbh.ngay_ket_thuc is not None:
        data_dict["ngay_ket_thuc_ndbh"] = ndbh.ngay_ket_thuc.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    else:
        data_dict["ngay_ket_thuc_ndbh"] = None
    data_dict["cau_hoi_suc_khoe_1_ndbh"] = ndbh.cau_hoi_suc_khoe_1
    data_dict["cau_hoi_suc_khoe_2_ndbh"] = ndbh.cau_hoi_suc_khoe_2
    data_dict["cau_hoi_suc_khoe_3_ndbh"] = ndbh.cau_hoi_suc_khoe_3
    data_dict["cau_hoi_suc_khoe_4_ndbh"] = ndbh.cau_hoi_suc_khoe_4
    data_dict["cau_hoi_suc_khoe_5_ndbh"] = ndbh.cau_hoi_suc_khoe_5
    data_dict["cau_hoi_suc_khoe_6_ndbh"] = ndbh.cau_hoi_suc_khoe_6
    data_dict["cau_hoi_suc_khoe_7_ndbh"] = ndbh.cau_hoi_suc_khoe_7
    data_dict["cau_hoi_suc_khoe_8_ndbh"] = ndbh.cau_hoi_suc_khoe_8
    data_dict["status_marriage_ndbh"] = ndbh.status_marriage
    data_dict["so_tien_bao_hiem_ndbh"] = ndbh.so_tien_bao_hiem
    data_dict["so_nam_hop_dong_ndbh"] = ndbh.so_nam_hop_dong
    data_dict["so_nam_dong_phi_ndbh"] = ndbh.so_nam_dong_phi
    data_dict["cach_tra_phi_ndbh"] = ndbh.cach_tra_phi
    data_dict["dinh_ky_dong_phi_ndbh"] = ndbh.dinh_ky_dong_phi
    data_dict["job_ndbh"] = ndbh.job
    data_dict["weight_ndbh"] = ndbh.weight
    data_dict["height_ndbh"] = ndbh.height
    data_dict["nationality_ndbh"] = ndbh.nationality
    data_dict["nationality_paper_ndbh"] = ndbh.nationality_paper
    data_dict["is_smoke_ndbh"] = ndbh.is_smoke
    data_dict["relationship_ndbh"] = ndbh.relationship
    data_dict["created_at_ndbh"] = ndbh.created_at.strftime('%Y-%m-%dT%H:%M:%S.%fZ')

    list_nth = list()
    for obj in nth:
        dict_nth = dict()
        dict_nth["fullname"] = obj.fullname
        dict_nth["birth_day"] = obj.birth_day
        dict_nth["birth_month"] = obj.birth_month
        dict_nth["birth_year"] = obj.birth_year
        dict_nth["gioi_tinh"] = obj.gioi_tinh
        dict_nth["so_cmnd"] = obj.so_cmnd
        dict_nth["images_cmt_mattruoc"] = obj.images_cmt_mattruoc
        dict_nth["images_cmt_matsau"] = obj.images_cmt_matsau
        dict_nth["cmt_ngay_cap"] = obj.cmt_ngay_cap.strftime('%Y-%m-%d')
        dict_nth["cmt_noi_cap"] = obj.cmt_noi_cap
        dict_nth["relationship"] = obj.relationship
        dict_nth["ty_le_thu_huong"] = obj.ty_le_thu_huong
        list_nth.append(dict_nth)
    data_dict['dsnth'] = list_nth
    return data_dict

