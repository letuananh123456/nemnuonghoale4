from django.shortcuts import render, redirect
from django.views import View
# Create your views here.

from rest_framework.response import Response
from rest_framework import permissions
from rest_framework import status
from apps.core.utils import validate_data
import datetime
from django.db.models import Q


class VatchatxeotoCarDetail(View):
    def get(self, request): 
        return render(request, 'vatchatxeoto/info_car.html')


class VatchatxeotoCarMucDichSuDong(View):
    def get(self, request):
        return render(request, 'vatchatxeoto/car_muc_dich.html')



class VatchatxeotoCarInfoChoHangXe(View):

    def get(self, request):
        return render(request, 'vatchatxeoto/car-info.component.html')


class VatchatxeotoCarDongXe(View):

    def get(self, request):
        return render(request, 'vatchatxeoto/car-dongxe.component.html')


class VatchatxeotoCarInfoCus(View):
    def get(self, request):
        return render(request, 'vatchatxeoto/car-info-cus.component.html')

class VatchatxeotoCompareCarProductView(View):
    def get(self, request):
        return render(request, 'vatchatxeoto/compare-car.html')

# class TNDSBBView(View):
#     def get(self, request):
#         return redirect('o-to-view')


# class TNDSBBInfoCarView(View):
#     def get(self, request):
#         return render(request, 'tndsbboto/index.html')

class VatchatxeotoDetailCarInfo(View):
    def get(self, request):
        return render(request, 'vatchatxeoto/detail-car-info.html')


class VatchatxeotoGetCompareProductCar(View):
    def get(self, request):
        return render(request, 'vatchatxeoto/compare_product.html')


class VatchatxeotoCarPayment(View):
    def get(self, request):
        return render(request, 'payment2.html')










