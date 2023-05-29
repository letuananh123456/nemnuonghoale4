from rest_framework import serializers


class InfoRobotIHome(serializers.Serializer):
    robot_home_name = serializers.CharField()
    robot_home_sex = serializers.IntegerField()
    robot_home_birthday = serializers.IntegerField()
    robot_home_xahoi = serializers.IntegerField()
    robot_home_yte = serializers.IntegerField()
    robot_home_luong = serializers.IntegerField()
    robot_home_mucdich = serializers.IntegerField()
    robot_home_quanhe = serializers.IntegerField()
    robot_home_isboss = serializers.IntegerField()