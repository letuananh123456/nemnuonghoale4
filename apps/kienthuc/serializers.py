from rest_framework import serializers


class AddDataKienThucAPISer(serializers.Serializer):
    title = serializers.CharField()
    slug = serializers.CharField()
    content = serializers.CharField()
    link_video = serializers.CharField()
    images = serializers.CharField()
    slug_category = serializers.CharField()
    name_category = serializers.CharField()