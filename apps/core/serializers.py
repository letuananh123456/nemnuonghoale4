from rest_framework import serializers

class ListItemProvincial(serializers.Serializer):
    thanhpho = serializers.IntegerField()


class ListItemDistrict(serializers.Serializer):
    name = serializers.CharField()
    slug = serializers.CharField()
    type_ciy = serializers.CharField()
    name_with_type = serializers.CharField()
    path = serializers.CharField()
    path_with_type = serializers.CharField()
    code = serializers.CharField()
    parent_code = serializers.IntegerField()


class APIthanhpho(serializers.Serializer):
    name = serializers.CharField()
    code = serializers.IntegerField()
    group = serializers.IntegerField()
    longitude = serializers.FloatField()
    latitude = serializers.FloatField()


class APIhuyen(serializers.Serializer):
    name = serializers.CharField()
    parent_code = serializers.IntegerField()    
    longitude = serializers.FloatField()
    latitude = serializers.FloatField()
    

class MaGiamGiaManagerAPISer(serializers.Serializer):
    loai_hinh_bao_hiem = serializers.IntegerField()
    cong_ty = serializers.IntegerField()
    goi_san_pham = serializers.IntegerField()
    ngay_hieu_luc = serializers.DateField()
    ngay_ket_thuc = serializers.DateField()
    chi_tieu = serializers.CharField()
    ten_chien_luoc = serializers.CharField()
    discount = serializers.FloatField()
    code_ma_giam_gia = serializers.CharField()
    is_su_dung = serializers.IntegerField()
    secret = serializers.CharField()


class AddDataCtyApiSer(serializers.Serializer):
    logo = serializers.CharField()
    ten_cong_ty = serializers.CharField()
    id_ten_cong_ty = serializers.IntegerField() # xem payment
    bai_gioi_thieu_cong_ty = serializers.CharField()
    nam_thanh_lap = serializers.CharField()
    bien_thanh_toan = serializers.FloatField()
    so_chi_nhanh = serializers.IntegerField()


class UpdateOrderManagerAPISer(serializers.Serializer):
    ma_don_hang_bihama = serializers.CharField()
    loai_hinh_bao_hiem = serializers.IntegerField()
    ma_hop_dong = serializers.CharField(allow_null=True)
    link_giay_chung_nhan = serializers.CharField(allow_null=True,allow_blank=True)
    tinh_trang_don_dat_hang = serializers.IntegerField()
    code_ma_giam_gia = serializers.CharField(allow_null=True)
    is_su_dung = serializers.IntegerField()
    ngay_hieu_luc = serializers.CharField()
    ngay_ket_thuc = serializers.CharField()
    ngay_phat_hanh_hoac_ack = serializers.CharField(allow_null=True)
    secret = serializers.CharField()


class APICheckDiscountSer(serializers.Serializer):
    ma_giam_gia=serializers.CharField()
    loai_hinh_bao_hiem=serializers.IntegerField()


class ApiAddDataLinhvucSer(serializers.Serializer):
    linhvuc=serializers.CharField()
    code_linhvuc=serializers.IntegerField()


class ApiAddDataChiTietCongViecSer(serializers.Serializer):
    chitiet=serializers.CharField()
    code_linhvuc=serializers.IntegerField()
    code_chitiet=serializers.IntegerField()


class ApiAddDataNoiDungNgheNghiepSer(serializers.Serializer):
    noidungcongviec= serializers.CharField()
    code_chitiet=serializers.IntegerField()
    capnghenghiep= serializers.IntegerField()
    hanchetichluy= serializers.FloatField()


class ApiChangeLinhVucNNSer(serializers.Serializer):
    code_linhvuc=serializers.IntegerField()


class ApiChangeNgheNghiepSer(serializers.Serializer):
    code_chitiet=serializers.IntegerField()


class PushImagesApiSer(serializers.Serializer):
    strBase64 = serializers.CharField()
    typeImage =serializers.IntegerField()
    typePer =serializers.IntegerField()
    typeLhbh = serializers.IntegerField()


class RegisterBihamaPlatformAPISer(serializers.Serializer):
    username = serializers.CharField()
    password =serializers.CharField()
    status_code =serializers.IntegerField()

