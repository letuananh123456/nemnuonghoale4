from rest_framework import serializers

class AddDataTndsOtoSer(serializers.Serializer):
    company = serializers.IntegerField()
    ten_loai_hinh_bao_hiem = serializers.CharField()
    id_loai_hinh_bao_hiem = serializers.IntegerField()
    ten_trong_tai = serializers.CharField()
    id_trong_tai = serializers.IntegerField()
    so_phi_chinh = serializers.IntegerField()

    
class ChangeTrongTaiAPISer(serializers.Serializer):
    trong_tai = serializers.IntegerField()

    
class PushSpcTNDSOtoSer(serializers.Serializer):
    trong_tai = serializers.IntegerField()
    ngay_hieu_luc = serializers.CharField()
    ngay_ket_thuc = serializers.CharField()
    id_cty = serializers.IntegerField()