from django.shortcuts import render, redirect
from django.views import View
# Create your views here.

from rest_framework.response import Response
from rest_framework import permissions
from rest_framework import status
from apps.core.utils import validate_data
import datetime
from django.db.models import Q


class TNDSTNCarDetail(View):
    def get(self, request): 
        return render(request, 'tndstnoto/info_car.html')


class TNDSTNCarMucDichSuDong(View):
    def get(self, request):
        return render(request, 'tndstnoto/car_muc_dich.html')



class TNDSTNCarInfoChoHangXe(View):

    def get(self, request):
        return render(request, 'tndstnoto/car-info.component.html')


class TNDSTNCarDongXe(View):

    def get(self, request):
        return render(request, 'tndstnoto/car-dongxe.component.html')


class TNDSTNCarInfoCus(View):
    def get(self, request):
        return render(request, 'tndstnoto/car-info-cus.component.html')

class TNDSTNCompareCarProductView(View):
    def get(self, request):
        return render(request, 'tndstnoto/compare-car.html')

# class TNDSTNView(View):
#     def get(self, request):
#         return redirect('o-to-view')


# class TNDSTNInfoCarView(View):
#     def get(self, request):
#         return render(request, 'tndstnoto/index.html')

class TNDSTNDetailCarInfo(View):
    def get(self, request):
        return render(request, 'tndstnoto/detail-car-info.html')


class TNDSTNGetCompareProductCar(View):
    def get(self, request):
        return render(request, 'tndstnoto/compare_product.html')


class TNDSTNCarPayment(View):
    def get(self, request):
        return render(request, 'payment2.html')










