from django.db import models

class YeuCauChung(models.Model):
    chon_phuong_thuc_nhan_tien = models.IntegerField(default=0)
    so_giay_chung_nhan_bao_hiem = models.CharField(max_length=255, unique=True)
    nguoi_khai_bao = models.CharField(max_length=255, unique=True)
    so_dien_thoai = models.CharField(max_length=255, unique=True) 
    chi_tiet_xay_ra = models.TextField(default=None, max_length=255, null=True)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Yêu cầu chung'
        verbose_name_plural = 'Yêu cầu chung'


class YeuCauTuKy(models.Model):
    ho_ten_nguoi_khai_bao = models.CharField(max_length=255, unique=True)
    so_dien_thoai = models.CharField(max_length=255, unique=True)
    dia_chi = models.CharField(max_length=255, unique=True)
    chon_phuong_thuc_nhan_tien = models.IntegerField(default=0) 
    so_hop_dong = models.CharField(max_length=255, unique=True)
    ngay_chet = models.DateTimeField(null=True)
    nguyen_nhan = models.TextField(default=None, max_length=255, null=True)
    anh_thuong_tat = models.TextField(null=True, default=None)
    anh_giay_chung_tu = models.TextField(null=True, default=None)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Yêu cầu tử kỳ'
        verbose_name_plural = 'Yêu cầu tử kỳ'


class YeuCauOTo(models.Model):
    ho_ten_nguoi_khai_bao = models.CharField(max_length=255, unique=True)
    so_hop_dong = models.CharField(max_length=255, unique=True)
    so_dien_thoai = models.CharField(max_length=255, unique=True)
    ngay_ton_that = models.DateTimeField(null=True)
    dia_chi_tinh_thanh_pho = models.CharField(max_length=200, default=None, null=True)
    dia_chi_quan_huyen = models.CharField(max_length=200, default=None, null=True)
    nhom_nguyen_nhan = models.IntegerField(default=0)
    nguyen_nhan_ton_that_chi_tiet = models.CharField(max_length=200, default=None, null=True)
    hau_qua_ton_that_chi_tiet = models.CharField(max_length=200, default=None, null=True)
    dia_chi = models.CharField(max_length=255, unique=True)
    chon_phuong_thuc = models.IntegerField(default=0) 
    chon_garage_sua_chua = models.IntegerField(default=0)
    anh_ton_that = models.TextField(null=True, default=None)
    anh_xac_nhan_co_quan = models.TextField(null=True, default=None)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Yêu cầu ô tô'
        verbose_name_plural = 'Yêu cầu ô tô'


class YeuCauSucKhoe(models.Model):
    ho_ten_nguoi_khai_bao = models.CharField(max_length=255, unique=True)
    so_hop_dong = models.CharField(max_length=255, unique=True)
    so_the_bao_hiem = models.CharField(max_length=255, unique=True)
    so_dien_thoai = models.CharField(max_length=255, unique=True)
    chon_phuong_thuc = models.IntegerField(default=0)
    co_so_y_te_bao_lanh = models.IntegerField(default=0)
    ngay_nhap_vien = models.DateTimeField(null=True)
    quyen_loi_chinh = models.IntegerField(default=0)
    quyen_loi_chi_tiet = models.IntegerField(default=0)
    anh_chung_tu_benh = models.TextField(null=True, default=None)
    anh_chung_tu_thuoc = models.TextField(null=True, default=None)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Yêu cầu sức khỏe'
        verbose_name_plural = 'Yêu cầu sức khỏe'


class YeuCauNhaTuNhan(models.Model):
    ho_ten_nguoi_khai_bao = models.CharField(max_length=255, unique=True)
    so_dien_thoai = models.CharField(max_length=255, unique=True)
    dia_chi = models.CharField(max_length=255, unique=True)
    chon_phuong_thuc_nhan_tien = models.CharField(max_length=255, unique=True)
    so_hop_dong = models.CharField(max_length=255, unique=True)
    ngay_xay_ra = models.DateTimeField(null=True)
    dia_chi_ton_that = models.CharField(max_length=255, unique=True)
    loai_ton_that = models.IntegerField(default=0)
    nguyen_nhan = models.TextField(null=True, default=None)
    anh_hien_truong = models.TextField(null=True, default=None)
    anh_xac_nhan = models.TextField(null=True, default=None)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Yêu cầu nhà tư nhân'
        verbose_name_plural = 'Yêu cầu nhà tư nhân'


class YeuCauBaoLanhVienPhi(models.Model):
    ho_ten_nguoi_khai_bao = models.CharField(max_length=255, unique=True)
    so_hop_dong = models.CharField(max_length=255, unique=True)
    so_the_bao_hiem = models.CharField(max_length=255, unique=True)
    so_dien_thoai = models.CharField(max_length=255, unique=True)
    chon_phuong_thuc = models.IntegerField(default=0)
    co_so_y_te_bao_lanh = models.IntegerField(default=0)
    ngay_nhap_vien = models.DateTimeField(null=True)
    quyen_loi_chinh = models.IntegerField(default=0)
    quyen_loi_chi_tiet = models.IntegerField(default=0)
    anh_chung_tu_benh = models.TextField(null=True, default=None)
    anh_chung_tu_thuoc = models.TextField(null=True, default=None)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Yêu cầu bảo lãnh viện phí'
        verbose_name_plural = 'Yêu cầu bảo lãnh viện phí'


class YeuCauTaiNanCaNhan(models.Model):
    ho_ten_nguoi_khai_bao = models.CharField(max_length=255, unique=True)
    so_hop_dong = models.CharField(max_length=255, unique=True)
    so_the_bao_hiem = models.CharField(max_length=255, unique=True)
    so_dien_thoai = models.CharField(max_length=255, unique=True)
    chon_phuong_thuc = models.IntegerField(default=0)
    co_so_y_te_bao_lanh = models.IntegerField(default=0)
    ngay_nhap_vien = models.DateTimeField(null=True)
    thuong_tat_chinh = models.IntegerField(default=0)
    quyen_loi_chi_tiet = models.IntegerField(default=0)
    anh_thuong_tat = models.TextField(null=True, default=None)
    anh_giay_chung_tu = models.TextField(null=True, default=None)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Yêu cầu tai nạn cá nhân'
        verbose_name_plural = 'Yêu cầu tai nạn cá nhân'