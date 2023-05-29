from rest_framework import serializers


class APIGoiSanPhamChinh(serializers.Serializer):
    company = serializers.IntegerField()
    ten_loai_hinh_bao_hiem = serializers.CharField() 
    id_loai_hinh_bao_hiem = serializers.IntegerField()
    gioi_tinh = serializers.IntegerField()
    tuoi = serializers.IntegerField() 
    ten_goi_san_pham_chinh = serializers.CharField()
    id_goi_san_pham_chinh = serializers.IntegerField()
    so_phi_chinh = serializers.FloatField()


class APIGoiSanPhamPhu(serializers.Serializer):
    company = serializers.IntegerField()
    ten_loai_hinh_bao_hiem = serializers.CharField() 
    id_loai_hinh_bao_hiem = serializers.IntegerField()
    gioi_tinh = serializers.IntegerField()
    tuoi = serializers.IntegerField()
    ten_goi_san_pham_chinh = serializers.CharField()
    id_goi_san_pham_chinh = serializers.IntegerField()
    ten_goi_san_pham_phu = serializers.CharField()
    id_goi_san_pham_phu = serializers.IntegerField()
    so_phi_phu = serializers.FloatField()


class APIPersonHealthDataFamilySer(serializers.Serializer):
    infodata = serializers.CharField()


class APIPersonHealthPushChangeGoiSer(serializers.Serializer):
    goisp = serializers.IntegerField()


class APIPersonHealthPushSPPSer(serializers.Serializer):
    name_goi_vbi=serializers.IntegerField()
    arr_spp_per=serializers.CharField()


class APIPushArrSppPersonhealthSer(serializers.Serializer):
    name_goi_vbi=serializers.IntegerField()
    value_input_spp=serializers.CharField()


class APIPushSpcPersonhealthSer(serializers.Serializer):
    name_congty=serializers.IntegerField()
    goispper=serializers.IntegerField()
    inpi_ngay_hieu_luc=serializers.CharField()



