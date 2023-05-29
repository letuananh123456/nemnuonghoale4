from django.db import models
from apps.core.models import NguoiMuaBaoHiemTam
from apps.core.models import NguoiMuaBaoHiem
from apps.core.models import Company
# Create your models here.


class NguoiDuocBaoHiemTam(models.Model):
    nguoimuabaohiemtam = models.ForeignKey(NguoiMuaBaoHiemTam, on_delete=models.CASCADE, related_name='personalhealth')
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
    cau_hoi_suc_khoe_1 = models.IntegerField(default=0)# 0-không 1-có
    cau_hoi_suc_khoe_2 = models.IntegerField(default=0)# 0-không 1-có
    chi_tiet_benh_tat = models.TextField(null=True)
    relationship = models.CharField(max_length=255, null=True)
    created_at = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Người được bảo hiểm tạm'
        verbose_name_plural = 'Người được bảo hiểm tạm'


class NguoiDuocBaoHiem(models.Model):
    nguoimuabaohiem = models.ForeignKey(NguoiMuaBaoHiem, on_delete=models.CASCADE, related_name='personalhealth')
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
    cau_hoi_suc_khoe_1 = models.IntegerField(default=0)# 0-có 1-không
    cau_hoi_suc_khoe_2 = models.IntegerField(default=0)# 0-có 1-không
    chi_tiet_benh_tat = models.TextField(blank=True, null=True)
    relationship = models.CharField(max_length=255, null=True)
    created_at = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Người được bảo hiểm'
        verbose_name_plural = 'Người được bảo hiểm'


class GoiSanPhamChinh(models.Model):
    company = models.ForeignKey(Company, on_delete=models.CASCADE, related_name='personalhealth1')
    ten_loai_hinh_bao_hiem = models.CharField(max_length=255, null=True) 
    id_loai_hinh_bao_hiem = models.IntegerField(default=0) # xem payment
    gioi_tinh = models.IntegerField(default=0) # 0 la tat ca 1: nam,  2:nu
    tuoi = models.IntegerField(default=0) # cho tat ca so tuoi la 1000
    ten_goi_san_pham_chinh = models.CharField(max_length=255, null=True)
    id_goi_san_pham_chinh = models.IntegerField(default=0) # xem payment
    so_phi_chinh = models.FloatField(default=0.0)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Gói sản phẩm chính'
        verbose_name_plural = 'Gói sản phẩm chính'


class GoiSanPhamPhu(models.Model):
    company = models.ForeignKey(Company, on_delete=models.CASCADE, related_name='personalhealth2')
    ten_loai_hinh_bao_hiem = models.CharField(max_length=255, null=True) 
    id_loai_hinh_bao_hiem = models.IntegerField(default=0) # xem payment
    gioi_tinh = models.IntegerField(default=0) # 0 la tat ca 1: nam,  2:nu
    tuoi = models.IntegerField(default=0) # cho tat ca so tuoi la 1000
    ten_goi_san_pham_chinh = models.CharField(max_length=255, null=True)
    id_goi_san_pham_chinh = models.IntegerField(default=0) # xem payment
    ten_goi_san_pham_phu = models.CharField(max_length=255, null=True)
    id_goi_san_pham_phu = models.IntegerField(default=0)
    so_phi_phu = models.FloatField(default=0.0)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Gói sản phẩm phụ'
        verbose_name_plural = 'Gói sản phẩm phụ'




