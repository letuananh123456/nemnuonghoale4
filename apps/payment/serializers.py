from rest_framework import serializers



class UpdateTinhTrangMaGiamGiaSer(serializers.Serializer):
    code_ma_giam_gia = serializers.CharField()
    tinhtrang = serializers.BooleanField()
    secret = serializers.CharField()