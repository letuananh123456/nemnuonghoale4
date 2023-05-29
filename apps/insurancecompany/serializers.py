from rest_framework import serializers

class AddDatainsurancecompanyser(serializers.Serializer):
    name_cpn =  serializers.CharField()
    slug =  serializers.CharField()
    sub_title = serializers.CharField()
    # title =  serializers.CharField()
    link_cpn =  serializers.CharField()
    # content =  serializers.CharField()
    # tac_gia =  serializers.CharField()
    # seo_key_word =  serializers.CharField()
    images = serializers.CharField()
    


