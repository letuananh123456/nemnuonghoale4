from django.db import models

class RobotChung(models.Model):
    user = models.CharField(max_length=255, null=True)
    ma_don_hang_bihama = models.CharField(max_length=255, unique=True)
    cong_ty = models.IntegerField(default=0)
    loai_hinh_bao_hiem = models.IntegerField(default=0) 
    goi_san_pham_chinh = models.IntegerField(default=0)
    goi_san_pham_phu = models.TextField(default=None, null=True)
    so_phi_chinh = models.BigIntegerField(default=0)
    tong_so_phi_phu = models.BigIntegerField(default=0)
    tong_phi_thanh_toan = models.BigIntegerField(default=0)
    gender = models.IntegerField(default=0)
    tuoi = models.IntegerField(default=0)
    tham_gia_bao_hiem_xa_hoi = models.IntegerField(default=0) # 1 là có 2 là không
    tham_gia_bao_hiem_y_te = models.IntegerField(default=0) # 1 là có 2 là không
    thu_nhap_hang_nam = models.IntegerField(default=0)
    muc_dich_tham_gia_bao_hiem = models.IntegerField(default=0)
    tinh_trang_hon_nhan = models.IntegerField(default=0)
    ban_dang_la = models.IntegerField(default=0) # 1 la nhan vien 2 la ong chu

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Robot chung'
        verbose_name_plural = 'Robot chung'


class Robot1DauTu(models.Model):
    user = models.CharField(max_length=255, null=True)
    ma_don_hang_bihama = models.CharField(max_length=255, unique=True)
    cong_ty = models.IntegerField(default=0)
    loai_hinh_bao_hiem = models.IntegerField(default=0) 
    goi_san_pham_chinh = models.IntegerField(default=0)
    goi_san_pham_phu = models.TextField(default=None, null=True)
    so_phi_chinh = models.BigIntegerField(default=0)
    tong_so_phi_phu = models.BigIntegerField(default=0)
    tong_phi_thanh_toan = models.BigIntegerField(default=0)
    gender = models.IntegerField(default=0)
    tuoi = models.IntegerField(default=0)
    thu_nhap_hang_nam = models.IntegerField(default=0)
    khi_dau_tu_ban_quan_tam_gi_nhat = models.IntegerField(default=0) 
    co_hoi_nhan_thuong_chuong_trinh_truyen_hinh = models.IntegerField(default=0)
    y_tuong_rui_ro_trong_dau_tu = models.IntegerField(default=0)
    du_bao_gia_vang = models.IntegerField(default=0)
    tim_quy_dau_tu = models.IntegerField(default=0)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Robot1 đầu tư'
        verbose_name_plural = 'Robot1 đầu tư'
