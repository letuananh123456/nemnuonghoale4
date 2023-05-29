from django.db import models
from apps.core.models import NguoiMuaBaoHiemTam
from apps.core.models import NguoiMuaBaoHiem
from apps.core.models import Company
# Create your models here.


class NguoiDuocBaoHiemTam(models.Model):
    nguoimuabaohiemtam = models.ForeignKey(NguoiMuaBaoHiemTam, on_delete=models.CASCADE, related_name='tndsxemay')
    bien_so_xe = models.CharField(max_length=255, null=True)
    loai_xe = models.IntegerField(default=0) # 1 la dung tich tren 50cc, 2 la dung tich thap hon 50 cc
    so_tien_bao_hiem_tnds_tu_nguyen = models.IntegerField(default=0) #1 la 50 trieu, 2 la 100 trieu 
    so_cho_tai_nan_nguoi_tren_xe = models.IntegerField(default=0)
    so_tien_bao_hiem_tai_nan_nguoi_tren_xe = models.BigIntegerField(default=0)
    so_tien_bao_hiem_chay_no = models.BigIntegerField(default=0)
    images_dangky_mattruoc = models.TextField(null=True, default=None)
    images_dangky_matsau = models.TextField(null=True, default=None)
    ngay_hieu_luc = models.DateTimeField(null=True)
    ngay_ket_thuc = models.DateTimeField(null=True)
    created_at = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Người được bảo hiểm tạm'
        verbose_name_plural = 'Người được bảo hiểm tạm'


class NguoiDuocBaoHiem(models.Model):
    nguoimuabaohiem = models.ForeignKey(NguoiMuaBaoHiem, on_delete=models.CASCADE, related_name='tndsxemay')
    ma_don_hang_bihama = models.CharField(max_length=255)
    bien_so_xe = models.CharField(max_length=255, null=True)
    loai_xe = models.IntegerField(default=0) # 1 la dung tich tren 50cc, 2 la dung tich thap hon 50 cc
    so_tien_bao_hiem_tnds_tu_nguyen = models.IntegerField(default=0) #1 la 50 trieu, 2 la 100 trieu 
    so_cho_tai_nan_nguoi_tren_xe = models.IntegerField(default=0)
    so_tien_bao_hiem_tai_nan_nguoi_tren_xe = models.BigIntegerField(default=0)
    so_tien_bao_hiem_chay_no = models.BigIntegerField(default=0)
    images_dangky_mattruoc = models.TextField(null=True, default=None)
    images_dangky_matsau = models.TextField(null=True, default=None)
    ngay_hieu_luc = models.DateTimeField(null=True)
    ngay_ket_thuc = models.DateTimeField(null=True)
    created_at = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Người được bảo hiểm'
        verbose_name_plural = 'Người được bảo hiểm'


class GoiSanPhamChinh(models.Model):
    company = models.ForeignKey(Company, on_delete=models.CASCADE, related_name='tndsxemay1')
    ten_loai_hinh_bao_hiem = models.CharField(max_length=255, null=True) 
    id_loai_hinh_bao_hiem = models.IntegerField(default=0) # xem payment
    ten_loai_xe = models.CharField(max_length=255, null=True)
    id_loai_xe = models.IntegerField(default=0)
    so_phi_chinh = models.FloatField(default=0.0)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Gói sản phẩm chính'
        verbose_name_plural = 'Gói sản phẩm chính'


class GoiSanPhamPhu(models.Model):
    company = models.ForeignKey(Company, on_delete=models.CASCADE, related_name='tndsxemay2')
    ten_loai_hinh_bao_hiem = models.CharField(max_length=255, null=True) 
    id_loai_hinh_bao_hiem = models.IntegerField(default=0) # xem payment
    ten_goi_san_pham_phu = models.CharField(max_length=255, null=True)
    id_goi_san_pham_phu = models.IntegerField(default=0)
    so_phi_phu = models.FloatField(default=0.0)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Gói sản phẩm phụ'
        verbose_name_plural = 'Gói sản phẩm phụ'