from rest_framework import serializers


class AddSpcApiDataHomeSer(serializers.Serializer):
    company = serializers.IntegerField()
    ten_loai_hinh_bao_hiem = serializers.CharField() 
    id_loai_hinh_bao_hiem = serializers.IntegerField()
    ten_goi_san_pham_chinh = serializers.CharField()
    id_goi_san_pham_chinh = serializers.IntegerField()
    so_phi_chinh = serializers.FloatField()


class AddSppApiDataHomeSer(serializers.Serializer):
    company = serializers.IntegerField()
    ten_loai_hinh_bao_hiem = serializers.CharField() 
    id_loai_hinh_bao_hiem = serializers.IntegerField()
    ten_goi_san_pham_chinh = serializers.CharField()
    id_goi_san_pham_chinh = serializers.IntegerField()
    ten_goi_san_pham_phu = serializers.CharField()
    id_goi_san_pham_phu = serializers.IntegerField()
    so_phi_phu = serializers.FloatField()


class APIChangeHomeValueSer(serializers.Serializer):
    so_tien_muabh = serializers.IntegerField()
    in_home_value = serializers.IntegerField()


class APIChangeListSppSer(serializers.Serializer):
    id_cty_home = serializers.IntegerField()
    arr_list_spp = serializers.CharField()


class ApiPushSpcHomeSer(serializers.Serializer):
    id_cty_home = serializers.IntegerField()
    inpi_ngay_hieu_luc = serializers.CharField()
    inpi_ngay_ket_thuc = serializers.CharField()
    so_tien_muabh = serializers.IntegerField()
    in_home_value = serializers.IntegerField()


class APIPushSppMoneyHomeSer(serializers.Serializer):
    arr_list_spp = serializers.CharField()

