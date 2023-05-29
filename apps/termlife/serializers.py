from rest_framework import serializers



class AddSpcApiDataTermLifeSer(serializers.Serializer):
    company = serializers.IntegerField()
    ten_loai_hinh_bao_hiem = serializers.CharField()
    id_loai_hinh_bao_hiem = serializers.IntegerField()
    gioi_tinh = serializers.IntegerField()
    tuoi = serializers.IntegerField()
    so_nam_hop_dong = serializers.IntegerField()
    so_nam_dong_phi = serializers.IntegerField()
    cach_tra_phi = serializers.IntegerField()
    ten_goi_san_pham_chinh = serializers.CharField()
    id_goi_san_pham_chinh = serializers.IntegerField()
    so_phi_chinh_hang_nam = serializers.FloatField()
    so_phi_chinh_hang_nua_nam = serializers.FloatField()
    so_phi_chinh_hang_quy = serializers.FloatField()
    so_phi_chinh_hang_thang = serializers.FloatField()


class AddSppApiDataTermLifeSer(serializers.Serializer):
    company = serializers.IntegerField()
    ten_loai_hinh_bao_hiem = serializers.CharField()
    id_loai_hinh_bao_hiem = serializers.IntegerField()
    gioi_tinh = serializers.IntegerField()
    tuoi = serializers.IntegerField()
    so_nam_hop_dong = serializers.IntegerField()
    so_nam_dong_phi = serializers.IntegerField()
    cach_tra_phi = serializers.IntegerField()
    ten_goi_san_pham_chinh = serializers.CharField()
    id_goi_san_pham_chinh = serializers.IntegerField()
    ten_goi_san_pham_phu = serializers.CharField()
    id_goi_san_pham_phu = serializers.IntegerField()
    so_tien_bao_hiem = serializers.IntegerField()
    so_phi_phu_nam = serializers.FloatField()


class ApiChangeProductTermlifeSer(serializers.Serializer):
    stbh = serializers.IntegerField()
    snhd = serializers.IntegerField()
    sndphi = serializers.IntegerField()
    tra_phi = serializers.IntegerField()
    loaispc = serializers.IntegerField()
    ht_tra_phi = serializers.IntegerField()


class ApiPushProductTermlifeSer(serializers.Serializer):
    stbh = serializers.IntegerField()
    snhd = serializers.IntegerField()
    sndphi = serializers.IntegerField()
    tra_phi = serializers.IntegerField()
    loaispc = serializers.IntegerField()
    ht_tra_phi = serializers.IntegerField()
    smoking = serializers.IntegerField()
    cty = serializers.IntegerField()


class ApiChangeSppTLSer(serializers.Serializer):
    pbbtnv = serializers.CharField()
    pbbthn = serializers.CharField()
    spc = serializers.IntegerField()