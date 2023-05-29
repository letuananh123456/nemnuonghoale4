from django.db import models
from apps.core.models import NguoiMuaBaoHiemTam
from apps.core.models import NguoiMuaBaoHiem
from apps.core.models import Company
# Create your models here.
'''
Quan he voi ben mua bao hiem
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
'''

class NguoiDuocBaoHiemTam(models.Model):
    nguoimuabaohiemtam = models.ForeignKey(NguoiMuaBaoHiemTam, on_delete=models.CASCADE, related_name='home_insurance1')
    loai_nha = models.IntegerField(default=0) # 1 là nhà đất 2 là chung cư
    muc_dich_nha = models.IntegerField(default=0) # 1 là để ở ,2 đi thuê , 3 là cho thuê, 4 nhà có yếu tố kinh doanh
    tuoi_tho_ngoi_nha = models.IntegerField(default=0) # 1,2,...
    dia_chi_tinh_thanh_pho = models.CharField(max_length=255, null=True)
    dia_chi_quan_huyen = models.CharField(max_length=255, null=True)
    dia_chi_chi_tiet = models.CharField(max_length=255, null=True)
    gia_tri_can_nha = models.BigIntegerField(default=0)
    gia_tri_tai_san_ben_trong = models.BigIntegerField(default=0)
    so_tien_bh =  models.BigIntegerField(default=0)
    ngay_hieu_luc = models.DateTimeField(null=True)
    ngay_ket_thuc = models.DateTimeField(null=True)
    relationship = models.IntegerField(default=0) # 1 la chu so huu, 2 la nguoi thue, 3 nguoi duoc quan ly, trong coi
    is_fire=models.IntegerField(default=0)   #0 la khong 1 la co
    created_at = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Người được bảo hiểm tạm'
        verbose_name_plural = 'Người được bảo hiểm tạm'


class NguoiDuocBaoHiem(models.Model):
    nguoimuabaohiem = models.ForeignKey(NguoiMuaBaoHiem, on_delete=models.CASCADE, related_name='home_insurance2')
    ma_don_hang_bihama = models.CharField(max_length=255)
    loai_nha = models.IntegerField(default=0) # 1 là nhà đất, 2 là chung cư
    muc_dich_nha = models.IntegerField(default=0) # 1 là để ở ,2 đi thuê , 3 là cho thuê, 4 nhà có yếu tố kinh doanh
    tuoi_tho_ngoi_nha = models.IntegerField(default=0) # 1,2,...
    dia_chi_tinh_thanh_pho = models.CharField(max_length=255, null=True)
    dia_chi_quan_huyen = models.CharField(max_length=255, null=True)
    dia_chi_chi_tiet = models.CharField(max_length=255, null=True)
    gia_tri_can_nha = models.BigIntegerField(default=0)
    gia_tri_tai_san_ben_trong = models.BigIntegerField(default=0)
    so_tien_bh =  models.BigIntegerField(default=0)
    ngay_hieu_luc = models.DateTimeField(null=True)
    ngay_ket_thuc = models.DateTimeField(null=True)
    relationship = models.IntegerField(default=0) # 1 la chu so huu,2 chủ sở hữu nhà cho thuê, 3 la nguoi thue, 4 nguoi duoc quan ly, trong coi
    is_fire=models.IntegerField(default=0)   #0 la khong 1 la co
    created_at = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Người được bảo hiểm'
        verbose_name_plural = 'Người được bảo hiểm'


class NguoiThuHuong(models.Model):
    nguoiduocbaohiem = models.ForeignKey(NguoiDuocBaoHiem, on_delete=models.CASCADE, related_name='home_insurance3')
    fullname = models.CharField(max_length=200, default=None, null=True)
    birth_day = models.IntegerField(default=0)
    birth_month = models.IntegerField(default=0)
    birth_year = models.IntegerField(default=0)
    gioi_tinh = models.IntegerField(default=0)
    so_cmnd = models.CharField(max_length=255, null=True)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Người thụ hưởng'
        verbose_name_plural = 'Người thụ hưởng'


class GoiSanPhamChinh(models.Model):
    company = models.ForeignKey(Company, on_delete=models.CASCADE, related_name='home_insurance4')
    ten_loai_hinh_bao_hiem = models.CharField(max_length=255, null=True) 
    id_loai_hinh_bao_hiem = models.IntegerField(default=0) # xem payment
    ten_goi_san_pham_chinh = models.CharField(max_length=255, null=True)
    id_goi_san_pham_chinh = models.IntegerField(default=0) # xem payment
    so_phi_chinh = models.FloatField(default=0.0)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Gói sản phẩm chính'
        verbose_name_plural = 'Gói sản phẩm chính'


class GoiSanPhamPhu(models.Model):
    company = models.ForeignKey(Company, on_delete=models.CASCADE, related_name='home_insurance5')
    ten_loai_hinh_bao_hiem = models.CharField(max_length=255, null=True) 
    id_loai_hinh_bao_hiem = models.IntegerField(default=0) # xem payment
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

