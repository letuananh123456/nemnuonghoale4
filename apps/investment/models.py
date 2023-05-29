from django.db import models
from apps.core.models import NguoiMuaBaoHiemTam
from apps.core.models import NguoiMuaBaoHiem
from apps.core.models import Company
# Create your models here.

class NguoiDuocBaoHiemTam(models.Model):
    nguoimuabaohiemtam = models.ForeignKey(NguoiMuaBaoHiemTam, on_delete=models.CASCADE, related_name='investment')
    username = models.CharField(max_length=200, default=None, null=True) # so dien thoai
    fullname = models.CharField(max_length=200, default=None, null=True)
    birth_day = models.IntegerField(default=0)
    birth_month = models.IntegerField(default=0)
    birth_year = models.IntegerField(default=0)
    gioi_tinh = models.IntegerField(default=0)
    email = models.CharField(max_length=255, null=True)
    dia_chi_tinh_thanh_pho = models.CharField(max_length=255, null=True)
    dia_chi_quan_huyen = models.CharField(max_length=255, null=True)
    dia_chi_chi_tiet = models.CharField(max_length=255, null=True)
    so_cmnd = models.CharField(max_length=255, null=True)
    images_cmt_mattruoc = models.TextField(null=True, default=None)
    images_cmt_matsau = models.TextField( null=True, default=None)
    cmt_ngay_cap = models.DateField(null=True)
    cmt_noi_cap = models.CharField(max_length=255, null=True)
    ngay_hieu_luc = models.DateTimeField(null=True)
    ngay_ket_thuc = models.DateTimeField(null=True)
    cau_hoi_suc_khoe_1 = models.TextField(null=True)
    cau_hoi_suc_khoe_2 = models.TextField(null=True)
    cau_hoi_suc_khoe_3 = models.TextField(null=True)
    cau_hoi_suc_khoe_4 = models.TextField(null=True)
    cau_hoi_suc_khoe_5 = models.TextField(null=True)
    cau_hoi_suc_khoe_6 = models.TextField(null=True)
    cau_hoi_suc_khoe_7 = models.TextField(null=True)
    cau_hoi_suc_khoe_8 = models.TextField(null=True)
    status_marriage = models.IntegerField(default=0)
    so_tien_bao_hiem = models.BigIntegerField(default=0)
    so_nam_hop_dong = models.IntegerField(default=0)
    so_nam_dong_phi = models.IntegerField(default=0)
    cach_tra_phi = models.IntegerField(default=0) # 1 la mot lan 2 la hang nam
    dinh_ky_dong_phi = models.IntegerField(default=0) # 1 la mot lan 2 la hang nam 3 la hang nua nam 4 la hang quy 5 la hang thang 6 la hang ngay
    job = models.IntegerField(default=0)
    weight = models.IntegerField(default=0)
    height = models.IntegerField(default=0)
    nationality = models.IntegerField(default=0)
    nationality_paper = models.IntegerField(default=0)
    is_smoke = models.IntegerField(default=0) # mac dinh la 0 , 1 la co
    relationship = models.CharField(max_length=255, null=True) #relation voi nguoi mua bao hiem
    created_at = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Người được bảo hiểm tạm'
        verbose_name_plural = 'Người được bảo hiểm tạm'


class NguoiDuocBaoHiem(models.Model):
    nguoimuabaohiem = models.ForeignKey(NguoiMuaBaoHiem, on_delete=models.CASCADE, related_name='investment')
    ma_don_hang_bihama = models.CharField(max_length=255)               # ma don hang 
    username = models.CharField(max_length=200, default=None, null=True) # so dien thoai
    fullname = models.CharField(max_length=200, default=None, null=True)
    birth_day = models.IntegerField(default=0)
    birth_month = models.IntegerField(default=0)
    birth_year = models.IntegerField(default=0)
    gioi_tinh = models.IntegerField(default=0)
    email = models.CharField(max_length=255, null=True)
    dia_chi_tinh_thanh_pho = models.CharField(max_length=255, null=True)
    dia_chi_quan_huyen = models.CharField(max_length=255, null=True)
    dia_chi_chi_tiet = models.CharField(max_length=255, null=True)
    so_cmnd = models.CharField(max_length=255, null=True)
    images_cmt_mattruoc = models.TextField(null=True, default=None)
    images_cmt_matsau = models.TextField(null=True, default=None)
    cmt_ngay_cap = models.DateField(null=True)
    cmt_noi_cap = models.CharField(max_length=255, null=True)
    ngay_hieu_luc = models.DateTimeField(null=True)
    ngay_ket_thuc = models.DateTimeField(null=True)
    cau_hoi_suc_khoe_1 = models.TextField(null=True)
    cau_hoi_suc_khoe_2 = models.TextField(null=True)
    cau_hoi_suc_khoe_3 = models.TextField(null=True)
    cau_hoi_suc_khoe_4 = models.TextField(null=True)
    cau_hoi_suc_khoe_5 = models.TextField(null=True)
    cau_hoi_suc_khoe_6 = models.TextField(null=True)
    cau_hoi_suc_khoe_7 = models.TextField(null=True)
    cau_hoi_suc_khoe_8 = models.TextField(null=True)
    status_marriage = models.IntegerField(default=0)
    so_tien_bao_hiem = models.BigIntegerField(default=0)
    so_nam_hop_dong = models.IntegerField(default=0)
    so_nam_dong_phi = models.IntegerField(default=0)
    cach_tra_phi = models.IntegerField(default=0) # 1 la mot lan 2 la hang nam
    dinh_ky_dong_phi = models.IntegerField(default=0) # 1 la mot lan 2 la hang nam 3 la hang nua nam 4 la hang quy 5 la hang thang 6 la hang ngay
    job = models.IntegerField(default=0)
    weight = models.IntegerField(default=0)
    height = models.IntegerField(default=0)
    nationality = models.IntegerField(default=0)
    nationality_paper = models.IntegerField(default=0)
    is_smoke = models.IntegerField(default=0) # mac dinh la 0 , 1 la co
    relationship = models.CharField(max_length=255, null=True)
    created_at = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Người được bảo hiểm'
        verbose_name_plural = 'Người được bảo hiểm'


class NguoiThuHuongTam(models.Model):
    nguoiduocbaohiemtam = models.ForeignKey(NguoiDuocBaoHiemTam, on_delete=models.CASCADE, related_name='investment')
    fullname = models.CharField(max_length=200, default=None, null=True)
    birth_day = models.IntegerField(default=0)
    birth_month = models.IntegerField(default=0)
    birth_year = models.IntegerField(default=0)
    gioi_tinh = models.IntegerField(default=0)
    so_cmnd = models.CharField(max_length=255, null=True)
    images_cmt_mattruoc = models.TextField(null=True, default=None)
    images_cmt_matsau = models.TextField( null=True, default=None)
    cmt_ngay_cap = models.DateField(null=True)
    cmt_noi_cap = models.CharField(max_length=255, null=True)
    relationship = models.CharField(max_length=255, null=True) # relation voi nguoi duoc bao hiem
    ty_le_thu_huong = models.FloatField(default=0.0)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Người thụ hưởng tạm'
        verbose_name_plural = 'Người thụ hưởng tạm'


class NguoiThuHuong(models.Model):
    nguoiduocbaohiem = models.ForeignKey(NguoiDuocBaoHiem, on_delete=models.CASCADE, related_name='investment')
    fullname = models.CharField(max_length=200, default=None, null=True)
    birth_day = models.IntegerField(default=0)
    birth_month = models.IntegerField(default=0)
    birth_year = models.IntegerField(default=0)
    gioi_tinh = models.IntegerField(default=0)
    so_cmnd = models.CharField(max_length=255, null=True)
    images_cmt_mattruoc = models.TextField(null=True, default=None)
    images_cmt_matsau = models.TextField( null=True, default=None)
    cmt_ngay_cap = models.DateField(null=True)
    cmt_noi_cap = models.CharField(max_length=255, null=True)
    relationship = models.CharField(max_length=255, null=True) # relation voi nguoi duoc bao hiem
    ty_le_thu_huong = models.FloatField(default=0.0)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Người thụ hưởng'
        verbose_name_plural = 'Người thụ hưởng'


class GoiSanPhamChinh(models.Model):
    company = models.ForeignKey(Company, on_delete=models.CASCADE, related_name='investment1')
    ten_loai_hinh_bao_hiem = models.CharField(max_length=255, null=True) 
    id_loai_hinh_bao_hiem = models.IntegerField(default=0) # xem payment
    gioi_tinh = models.IntegerField(default=0) # 0 la tat ca 1: nam,  2:nu
    tuoi = models.IntegerField(default=0) # cho tat ca so tuoi la 1000
    phi_quan_ly_hop_dong = models.FloatField(default=0.0)
    phi_ban_dau_co_ban = models.FloatField(default=0.0)
    phi_ban_dau_dong_them = models.FloatField(default=0.0)
    phi_cham_dut_co_ban = models.FloatField(default=0.0)
    phi_cham_dut_dong_them = models.FloatField(default=0.0)
    ten_goi_san_pham_chinh = models.CharField(max_length=255, null=True)
    id_goi_san_pham_chinh = models.IntegerField(default=0) # xem payment
    so_phi_chinh_hang_nam = models.FloatField(default=0.0)
    ty_le_phi_rui_ro_hang_nam = models.FloatField(default=0.0) # tu 0 den 70 tuoi 

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Gói sản phẩm chính'
        verbose_name_plural = 'Gói sản phẩm chính'


class GoiSanPhamPhu(models.Model):
    company = models.ForeignKey(Company, on_delete=models.CASCADE, related_name='investment2')
    ten_loai_hinh_bao_hiem = models.CharField(max_length=255, null=True) 
    id_loai_hinh_bao_hiem = models.IntegerField(default=0) # xem payment
    ten_goi_san_pham_chinh = models.CharField(max_length=255, null=True)
    id_goi_san_pham_chinh = models.IntegerField(default=0) # xem payment
    ten_goi_san_pham_phu = models.CharField(max_length=255, null=True)
    id_goi_san_pham_phu = models.IntegerField(default=0)
    loai_nghe_nghiep = models.IntegerField(default=0)
    so_tien_bao_hiem = models.BigIntegerField(default=0)
    so_phi_phu_nam = models.FloatField(default=0.0)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Gói sản phẩm phụ'
        verbose_name_plural = 'Gói sản phẩm phụ'


class LaiSuatThiTruong(models.Model):
    phantram = models.FloatField(default=0.0)
    nam = models.IntegerField(default=0)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Lãi suất thị trường'
        verbose_name_plural = 'Lãi suất thị trường'


class GiaTriDauTu(models.Model):
    phantram = models.FloatField(default=0.0)
    nam = models.IntegerField(default=0)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Giá trị đầu tư'
        verbose_name_plural = 'Giá trị đầu tư'

