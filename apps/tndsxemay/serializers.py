
from rest_framework import serializers


class ChangeLoaiXeMayAPISer(serializers.Serializer):
    loai_xe_may = serializers.IntegerField()


class PushSpcTNDSXeMaySer(serializers.Serializer):
    loai_xe_may = serializers.IntegerField()
    ngay_hieu_luc = serializers.CharField()
    ngay_ket_thuc = serializers.CharField()
    id_cty = serializers.IntegerField()


class AddDataTndsXeMaySer(serializers.Serializer):
    company = serializers.IntegerField()
    ten_loai_hinh_bao_hiem = serializers.CharField()
    id_loai_hinh_bao_hiem = serializers.IntegerField()
    ten_loai_xe = serializers.CharField()
    id_loai_xe = serializers.IntegerField()
    so_phi_chinh = serializers.IntegerField()