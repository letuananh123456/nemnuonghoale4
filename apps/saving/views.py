from django.shortcuts import render, redirect
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import permissions
from rest_framework import status
from apps.core.utils import validate_data
from django.views import View
from apps.article.models import GioiThieuLoaiHinhBH
# Create your views here.


class InfoSavingView(View):
    def get(self, request):
        gioithieutichluy = GioiThieuLoaiHinhBH.objects.get(id = 3)
        context = {
            'p1': gioithieutichluy
        }
        return render(request, 'saving/saving.html',context)

    def post(self, request):
        return redirect('saving-compare')


class SavingCompare(View):
    def get(self, request):
        return render(request, 'saving/saving_compare.html')  


class SavingDetail(View):
    def get(self, request):
        return render(request, 'saving/saving_order.html')              
