from django.db import models
from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField

# Create your models here.

class NguoiMuaBaoHiemTam(models.Model):
    username = models.CharField(max_length=200, default=None, null=True) # so dien thoai
    fullname = models.CharField(max_length=200, default=None, null=True)
    birth_day = models.IntegerField(default=0)
    birth_month = models.IntegerField(default=0)
    birth_year = models.IntegerField(default=0)
    gioi_tinh = models.IntegerField(default=0)
    email = models.CharField(max_length=200, default=None, null=True)
    dia_chi_tinh_thanh_pho = models.CharField(max_length=200, default=None, null=True)
    dia_chi_quan_huyen = models.CharField(max_length=200, default=None, null=True)
    dia_chi_chi_tiet = models.CharField(max_length=200, default=None, null=True)
    so_cmnd = models.CharField(max_length=200, default=None, null=True)
    images_cmt_mattruoc = models.TextField(null=True, default=None)
    images_cmt_matsau = models.TextField(null=True, default=None)
    cmt_ngay_cap = models.DateField(null=True)
    cmt_noi_cap = models.CharField(max_length=200, default=None, null=True)
    ngay_hieu_luc = models.DateTimeField(null=True)
    ngay_ket_thuc = models.DateTimeField(null=True)
    ho_ten_nhan = models.CharField(max_length=200, default=None, null=True)
    email_nhan = models.CharField(max_length=200, default=None, null=True)
    so_dien_thoai_nhan = models.CharField(max_length=200, default=None, null=True)
    dia_chi_tinh_thanh_pho_nhan = models.CharField(max_length=200, default=None, null=True)
    dia_chi_quan_huyen_nhan = models.CharField(max_length=200, default=None, null=True)
    dia_chi_chi_tiet_nhan = models.CharField(max_length=200, default=None, null=True)
    status_marriage = models.IntegerField(default=0)
    job = models.IntegerField(default=0)
    weight = models.IntegerField(default=0)
    height = models.IntegerField(default=0)
    nationality = models.IntegerField(default=0)
    nationality_paper = models.IntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Người mua bảo hiểm tạm'
        verbose_name_plural = 'Người mua bảo hiểm tạm'


class NguoiMuaBaoHiem(models.Model):
    username = models.CharField(max_length=200, default=None, null=True) # so dien thoai
    fullname = models.CharField(max_length=200, default=None, null=True)
    birth_day = models.IntegerField(default=0)
    birth_month = models.IntegerField(default=0)
    birth_year = models.IntegerField(default=0)
    gioi_tinh = models.IntegerField(default=0) #
    email = models.CharField(max_length=200, default=None, null=True)
    dia_chi_tinh_thanh_pho = models.CharField(max_length=200, default=None, null=True)
    dia_chi_quan_huyen = models.CharField(max_length=200, default=None, null=True)
    dia_chi_chi_tiet = models.CharField(max_length=200, default=None, null=True)
    so_cmnd = models.CharField(max_length=200, default=None, null=True)
    images_cmt_mattruoc = models.TextField(null=True, default=None)
    images_cmt_matsau = models.TextField(null=True, default=None)
    cmt_ngay_cap = models.DateField(null=True)
    cmt_noi_cap = models.CharField(max_length=200, default=None, null=True)
    ngay_hieu_luc = models.DateTimeField(null=True)
    ngay_ket_thuc = models.DateTimeField(null=True)
    ho_ten_nhan = models.CharField(max_length=200, default=None, null=True)
    email_nhan = models.CharField(max_length=200, default=None, null=True)
    so_dien_thoai_nhan = models.CharField(max_length=200, default=None, null=True)
    dia_chi_tinh_thanh_pho_nhan = models.CharField(max_length=200, default=None, null=True)
    dia_chi_quan_huyen_nhan = models.CharField(max_length=200, default=None, null=True)
    dia_chi_chi_tiet_nhan = models.CharField(max_length=200, default=None, null=True)
    status_marriage = models.IntegerField(default=0)
    job = models.IntegerField(default=0)
    weight = models.IntegerField(default=0)
    height = models.IntegerField(default=0)
    nationality = models.IntegerField(default=0)
    nationality_paper = models.IntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Người mua bảo hiểm'
        verbose_name_plural = 'Người mua bảo hiểm'


class Provincial(models.Model):

    name = models.CharField(max_length=255)
    code = models.IntegerField(default=0)
    group = models.IntegerField(default=0)
    longitude = models.FloatField()
    latitude = models.FloatField()

    def __str__(self):
        return str(self.name)

    class Meta:
        verbose_name = 'Tỉnh thành phố '
        verbose_name_plural = 'Tỉnh thành phố'


class District(models.Model):
    name = models.CharField(max_length=255)
    parent_code = models.IntegerField(default=0)  
    longitude = models.FloatField()
    latitude = models.FloatField()

    def __str__(self):
        return str(self.name)

    class Meta:
        verbose_name = 'Quận huyện '
        verbose_name_plural = 'Quận huyện'


class Company(models.Model):
    logo = models.TextField(blank=True, null=True)
    ten_cong_ty = models.CharField(max_length=255, null=True)
    id_ten_cong_ty = models.IntegerField(default=0) # xem payment
    bai_gioi_thieu_cong_ty = RichTextUploadingField(default='')
    nam_thanh_lap = models.CharField(max_length=200, default=None, null=True)
    bien_thanh_toan = models.FloatField(default=0.0)
    so_chi_nhanh = models.IntegerField(default=0)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Công ty'
        verbose_name_plural = 'Công ty'


class LinhVuNgheNghiep(models.Model):
    linhvuc=models.CharField(max_length=200, default=None, null=True)
    code_linhvuc=models.IntegerField(default=0)
    def __str__(self):
            return str(self.id)

    class Meta:
        verbose_name = 'Lĩnh vực nghề nghiệp'
        verbose_name_plural = 'Lĩnh vực nghề nghiệp'


class ChiTietCongViec(models.Model):
    chitiet=models.CharField(max_length=200, default=None, null=True)
    code_chitiet=models.IntegerField(default=0)
    code_linhvuc=models.IntegerField(default=0)
    def __str__(self):
            return str(self.id)

    class Meta:
        verbose_name = 'Chi tiết công việc'
        verbose_name_plural = 'Chi tiết công việc'


class NoiDungNgheNghiep(models.Model):
    noidungcongviec=models.TextField(default=None, null=True)
    code_chitiet=models.IntegerField(default=0)
    capnghenghiep=models.IntegerField(default=0)
    hanchetichluy=models.BigIntegerField(default=0)
    def __str__(self):
            return str(self.id)

    class Meta:
        verbose_name = 'Nội dung công việc'
        verbose_name_plural = 'Nội dung công việc'


class GoogleVision(models.Model):
    access_token = models.CharField(max_length=200, blank=True , null= True)
    expires_in = models.DateTimeField(blank=True, null=True)
    refresh_token = models.CharField(max_length=200, blank=True, null=True)
    scope = models.URLField(blank=True, null=True)
    token_type = models.CharField(null=True, max_length = 100)

    def __str__(self):
            return str(self.id)

    class Meta:
        verbose_name = 'AI GoogleCloud'
        verbose_name_plural = 'AI GoogleCloud'