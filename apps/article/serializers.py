from rest_framework import serializers

class AddDataTinTucSer(serializers.Serializer):
    title =  serializers.CharField()
    slug =  serializers.CharField()
    sub_title =  serializers.CharField()
    seo_key_word =  serializers.CharField()
    loai_tin_tuc =  serializers.IntegerField()
    images_gioi_thieu =  serializers.CharField()

