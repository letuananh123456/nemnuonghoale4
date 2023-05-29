from django.db import models
from apps.users.models import User
from apps.core.models import NguoiMuaBaoHiem

# from apps.core.utils import convert_price_to_string
# Create your models here.

"""
* loai_hinh_bao_hiem
1 - Sản phẩm tử kỳ
2 - Sản phẩm đầu tư
3 - Sản phẩm tích luỹ
4 - Sản phẩm giáo dục
5 - Sản phẩm hưu trí
6 - BH sức khoẻ cá nhân
7 - BH sức khoẻ doanh nghiệp
8 - BH tai nạn cá nhân
9 - BH trợ cấp y tế, nằm viện
10 - BH bệnh hiểm nghèo
11 - BH bệnh ung thư
12 - BH vật chất xe
13 - BH TNDS bắt buộc ô tô
14 - BH học sinh
15 - BH TNDS xe máy 
16 - BH du lịch Việt Nam
17 - BH du lịch quốc tế
18 - BH trễ chuyến bay 
19 - BH nhà tư nhân
20 - BH màn hình điện thoại  
* cong_ty
1 - BH VBI
2 - BH Fubon
3 - BH Opes
* goi_san_pham_chinh
Điều kiện: loai_hinh_bao_hiem/cong_ty/goi_san_pham_chinh
6 - BH sức khoẻ cá nhân/1 - BH VBI/
Gói chính sản phẩm VBI:
1 - Gói đồng
2 - Gói bạc 
3 - Gói titan
4 - Gói vàng 
5 - Gói bạch kim
6 - Gói kim cương
* goi_san_pham_phu
Điều kiện: loai_hinh_bao_hiem/cong_ty/goi_san_pham_chinh/goi_san_pham_phu
6 - BH sức khoẻ cá nhân/1 - BH VBI/goi_san_pham_chinh/
Một Gói chính có nhiều gói phụ sản phẩm VBI:
1 - Điều trị ngoại trú
2 - Thai sản 
3 - Nha khoa
4 - Trợ cấp nằm viện do tai nạn
loai_thanh_toan
1 - CoD
2- Vnpay
tinh_trang_thanh_toan_cong_thanh_toan
0 - chưa thanh toán
1 - đã thanh toán
2 - thanh toán thất bại
Gioi tinh
ca_nam và nu = 0
nu = 1
nam = 2
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
chau_ruot =12

tinh trang don hang
    0- chua chuyen
    1- dang xu li
    2- phat hanh
    3- ack          #voi bh nhan tho
    4- huy
"""

class MaGiamGia(models.Model):
    loai_hinh_bao_hiem = models.IntegerField(default=0) # 100 là tất cả
    cong_ty = models.IntegerField(default=0) # 100 là tất cả
    goi_san_pham = models.IntegerField(default=0) # 100 là tất cả
    ngay_hieu_luc = models.DateField()
    ngay_ket_thuc = models.DateField()
    chi_tieu = models.CharField(max_length=255)
    ten_chien_luoc = models.CharField(max_length=255)
    discount = models.FloatField(default=0.0)
    code_ma_giam_gia = models.CharField(max_length=255, unique=True)
    is_su_dung = models.IntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True, null=True)
    

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Mã giảm giá '
        verbose_name_plural = 'Mã giảm giá'


class DonDatHang(models.Model):
    loai_hinh_bao_hiem = models.IntegerField(default=0)
    cong_ty = models.IntegerField(default=0)
    goi_san_pham_chinh = models.IntegerField(default=0)
    goi_san_pham_phu = models.TextField(default=None, null=True)
    so_phi_chinh = models.BigIntegerField(default=0)
    tong_so_phi_phu = models.BigIntegerField(default=0)
    so_phi_VAT = models.BigIntegerField(default=0)
    tong_phi_thanh_toan = models.BigIntegerField(default=0)
    tong_phi_thanh_toan_sau_giam_gia = models.BigIntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True, null=True)
    loai_hop_dong = models.IntegerField(default=0) # 0 hop dong vang lai (nguoi gioi thieu la None or ==0), 1 hop dong marketing(co nguoi gioi thieu), 2 hop dong ban le(nguoi mua va nguoi gioi thieu trung nhau)
    ngay_phat_hanh_hop_dong_hoac_ack = models.DateTimeField(null=True)
    loai_thanh_toan = models.IntegerField(default=0)
    ma_don_hang_bihama = models.CharField(max_length=255, unique=True)
    tinh_trang_don_dat_hang = models.IntegerField(default=0) # dùng để binding ra mà hình quản lý đơn hàng , da ack 
    ma_giao_dich_cong_thanh_toan = models.CharField(max_length=255, default=None , null=True)
    tinh_trang_thanh_toan_cong_thanh_toan = models.IntegerField(default=0)  # dung de luu status trang thai thanh toan
    code_ma_giam_gia = models.CharField(null=True,max_length=255,default=None)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    nguoimuabaohiem = models.ForeignKey(NguoiMuaBaoHiem, on_delete=models.CASCADE)
    ma_hop_dong = models.CharField(default=None, max_length=255, null=True)
    link_giay_chung_nhan = models.TextField(default=None, max_length=255, null=True)
    is_da_gui_manager = models.BooleanField(default=False)
    is_da_gui_cong_thanh_toan = models.BooleanField(default=False)
    is_tai_tuc = models.IntegerField(default=0) # 1 don tai tuc 2 la don dong them hop dong dau tu LKC


    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Đơn đặt hàng '
        verbose_name_plural = 'Đơn đặt hàng'


class TaiTuc(models.Model):
    dondathang = models.ForeignKey(DonDatHang, on_delete=models.CASCADE) # luu object cu
    ma_tai_tuc_bihama = models.CharField(max_length=255, unique=True) # luu ma_don_hang_bihama moi
    cach_tra_phi = models.IntegerField(default=0) # 1 la mot lan 2 la hang nam
    dinh_ky_dong_phi = models.IntegerField(default=0) # 1 la mot lan 2 la hang nam 3 la hang nua nam 4 la hang quy 5 la hang thang 6 la hang ngay
    ky_dong_phi = models.IntegerField(default=0) # tuy vao dinh ky vi du hang nam select la 1 den 100, hang nua nam select la 1 va 2, hang quy la 1, 2, 3 va 4, hang thang 1 đến 12, hàng ngày là 1 đến 31
    so_tien = models.BigIntegerField(default=0) 
    created_at = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Tái Tục và Đóng Thêm'
        verbose_name_plural = 'Tái Tục và Đóng Thêm'




    # @property
    # def get_oder_status_text(self):
    #     if(self.status==0):
    #         text='Chưa thanh toán'
    #     elif (self.status==1):
    #         text='Đã thanh toán'
    #     elif (self.status==2):
    #         text='Đã thanh toán'
    #     else:
    #         text=""
    #     return text

    # @property
    # def get_gia_tien(self):
    #     money=convert_price_to_string(self.so_tien)
    #     return money

    # @property
    # def type_product(self):
    #     if(self.loai_san_pham==1):
    #         text='Tử kỳ'
    #     elif (self.loai_san_pham==2):
    #         text='Sức khỏe'
    #     elif (self.loai_san_pham==3):
    #         text='Du lịch'
    #     elif (self.loai_san_pham==4):
    #         text='Ô tô'
    #     elif (self.loai_san_pham==5):
    #         text='Đầu tư'
    #     else:
    #         text=""
    #     return text
