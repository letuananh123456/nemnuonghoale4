from rest_framework import serializers
from django.contrib.auth.models import User
from .models import LoginHistory



class LoginEmailValidator(serializers.Serializer):
    username = serializers.CharField(required=True, allow_blank=False)
    password = serializers.CharField(required=True, allow_blank=False)


class UserSerializer(serializers.ModelSerializer):

    class Meta:
        model = User
        fields = (
            'id', 'username', 'email',
        )


class TokenSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    username = serializers.CharField()
    email = serializers.CharField()
    access_token = serializers.CharField()
    

class LoginHistorySerializer(serializers.ModelSerializer):

    class Meta:
        model = LoginHistory
        fields = (
            'start_date', 'end_date', 'num_date',
        )


class UpdateInforUserApi(serializers.Serializer):
    password = serializers.CharField()
    username = serializers.CharField()
    email = serializers.CharField()
    ho_va_ten = serializers.CharField()
    # images_user = serializers.CharField(allow_null=True, allow_blank = True)
    gender = serializers.IntegerField()
    birth_day = serializers.IntegerField()
    birth_month = serializers.IntegerField()
    birth_year = serializers.IntegerField()
    link_info = serializers.CharField(allow_null=True, allow_blank=True)
    code_invite = serializers.CharField(allow_null=True, allow_blank=True)
    api_hope = serializers.IntegerField()
    secret = serializers.CharField()



class BankAccount_CTVSerializer(serializers.Serializer):
    link_info = serializers.CharField()
    bank_name = serializers.CharField()
    fullname = serializers.CharField()
    bank_number = serializers.CharField()
    branch = serializers.CharField()
    created_at = serializers.DateTimeField()
    secret = serializers.CharField()

class feedback_LenhRutTienSerializer(serializers.Serializer):
    stk = serializers.CharField()
    amount_withdraw = serializers.IntegerField()
    created_at = serializers.DateTimeField()
    status = serializers.IntegerField()
    secret= serializers.CharField()


class Feedback_Dangki_CTVSerializer(serializers.Serializer):
    username = serializers.CharField()
    link_info = serializers.URLField()
    secret= serializers.CharField()


class Feedback_thay_doi_tuyen_tren(serializers.Serializer):
    link_info = serializers.CharField()
    code_info_thaydoi = serializers.CharField()
    secret= serializers.CharField()


class PhanHoiThayDiaDiemKinhDoanhSerializer(serializers.Serializer):
    link_info = serializers.CharField()
    dia_chi_tinh_thanh_pho_kd_moi = serializers.IntegerField()
    dia_chi_quan_huyen_kd_moi = serializers.IntegerField()
    dia_chi_chi_tiet_kd_moi = serializers.CharField()
    secret= serializers.CharField()
