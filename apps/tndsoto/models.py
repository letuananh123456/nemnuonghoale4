from django.db import models
from apps.core.models import NguoiMuaBaoHiemTam
from apps.core.models import NguoiMuaBaoHiem
from apps.core.models import Company
# Create your models here.


class NguoiDuocBaoHiemTam(models.Model):
    nguoimuabaohiemtam = models.ForeignKey(NguoiMuaBaoHiemTam, on_delete=models.CASCADE, related_name='tndsoto')
    bien_so_xe = models.CharField(max_length=255, null=True)
    loai_nguoi_mua = models.IntegerField(default=0) # 1 la ca nha, 2 la to chuc
    muc_dich_su_dung = models.IntegerField(default=0) # 1 la xe cho nguoi khong kinh doanh van tai
    trong_tai = models.IntegerField(default=0) # 1 la duoi 6 cho, 2 la 6 den 9 cho, 3 la 10 den 11, 4 la 12 den 24, 5 la tren 24
    so_tien_bao_hiem_tnds_tu_nguyen = models.IntegerField(default=0) #1 la 50 trieu, 2 la 100 trieu , 3 la 150
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
    nguoimuabaohiem = models.ForeignKey(NguoiMuaBaoHiem, on_delete=models.CASCADE, related_name='tndsoto')
    ma_don_hang_bihama = models.CharField(max_length=255)
    bien_so_xe = models.CharField(max_length=255, null=True)
    loai_nguoi_mua = models.IntegerField(default=0) # 1 la ca nhan, 2 la to chuc
    muc_dich_su_dung = models.IntegerField(default=0) # 1 la xe cho nguoi khong kinh doanh van tai
    trong_tai = models.IntegerField(default=0) # 1 la duoi 6 cho, 2 la 6 den 9 cho, 3 la 10 den 11, 4 la 12 den 24, 5 la tren 24
    so_tien_bao_hiem_tnds_tu_nguyen = models.IntegerField(default=0) #1 la 50 trieu, 2 la 100 trieu , 3 la 150
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
    company = models.ForeignKey(Company, on_delete=models.CASCADE, related_name='tndsoto1')
    ten_loai_hinh_bao_hiem = models.CharField(max_length=255, null=True) 
    id_loai_hinh_bao_hiem = models.IntegerField(default=0) # xem payment
    ten_trong_tai = models.CharField(max_length=255, null=True)
    id_trong_tai = models.IntegerField(default=0)
    so_phi_chinh = models.FloatField(default=0.0)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Gói sản phẩm chính'
        verbose_name_plural = 'Gói sản phẩm chính'


class GoiSanPhamPhu(models.Model):
    company = models.ForeignKey(Company, on_delete=models.CASCADE, related_name='tndsoto2')
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