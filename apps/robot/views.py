from django.shortcuts import render
from rest_framework.response import Response
import json
from rest_framework.views import APIView
from rest_framework import permissions
from rest_framework import status
from apps.core.utils import validate_data, validate_response ,convert_price_to_string , check_ma_giam_gia
from rest_framework.renderers import TemplateHTMLRenderer, JSONRenderer
from rest_framework.views import exception_handler as drf_exception_handler
from apps.robot import utils as robot_utils
from apps.robot import models as robot_models
from . import serializers as robot_serializers

# Create your views here.


class HomeApiViewRobot(APIView):
    permission_classes = (permissions.AllowAny,)

    def post(self, request, format=None):
        valid_data = validate_data(robot_serializers.InfoRobotIHome, request.data)

        robot_home_name= valid_data.get('robot_home_name')
        robot_home_sex= valid_data.get('robot_home_sex')
        robot_home_birthday = valid_data.get('robot_home_birthday')
        robot_home_xahoi = valid_data.get('robot_home_xahoi')
        robot_home_yte = valid_data.get('robot_home_yte')
        robot_home_luong = valid_data.get('robot_home_luong')
        robot_home_mucdich = valid_data.get('robot_home_mucdich')
        robot_home_quanhe = valid_data.get('robot_home_quanhe')
        robot_home_isboss = valid_data.get('robot_home_isboss')

        request.session['robot_home_name'] = robot_home_name
        request.session['robot_home_sex'] = robot_home_sex
        request.session['robot_home_birthday'] = robot_home_birthday
        request.session['robot_home_xahoi'] = robot_home_xahoi
        request.session['robot_home_yte'] = robot_home_yte
        request.session['robot_home_luong'] = robot_home_luong
        request.session['robot_home_mucdich'] = robot_home_mucdich
        request.session['robot_home_quanhe'] = robot_home_quanhe
        request.session['robot_home_isboss'] = robot_home_isboss


        kqHomeRobotMoneyBH = robot_utils.get_premium(robot_home_luong)
        kqHomeRobotProductBH = robot_utils.get_product(0,0,robot_home_xahoi,robot_home_yte,robot_home_luong,robot_home_mucdich,robot_home_quanhe,robot_home_isboss)
        kqHomeRobotYearBH = robot_utils.get_time(robot_home_sex,robot_home_birthday,kqHomeRobotProductBH,0)
        data = {
            'kqHomeRobotMoneyBH':kqHomeRobotMoneyBH,
            'kqHomeRobotProductBH':kqHomeRobotProductBH,
            'kqHomeRobotYearBH':kqHomeRobotYearBH

        }
        return Response(data=data, status=status.HTTP_200_OK)