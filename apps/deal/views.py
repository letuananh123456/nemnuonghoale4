from django.shortcuts import render, redirect
# from .models import Customer
from rest_framework.views import exception_handler as drf_exception_handler
from django.views import View
# from .models import Product, Voucher
# from apps.articles.models import Article
# from apps.core.models import Company
# from . import models as core_models
# from apps.termlife.models import TermLifeProduct
# from apps.apis.utils import tinhphi

# from . import serializers as home_robot_serializers
import json
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import permissions
from rest_framework import status
# from apps.core.utils import validate_data
from rest_framework.renderers import TemplateHTMLRenderer, JSONRenderer

# from apps.robot import utils as robot_utils
# from .utils import convert_price_to_string

# Create your views here.

class DealKhuyenMaiView(View):
     def get(self, request):
        # item_list = Voucher.objects.all()
        # context = {
        #     'item_list': item_list
        # }
        return render(request, 'deal/deal.html')

     def post(self, request):
        # email_buyer = request.POST.get("email")
        # core_models.EmailBuyer.objects.create(
        #     email_buyer=email_buyer          
        # )
        # context = {
        #     'message': 'Bạn đã đăng kí thành công'
        # }
        return render(request, 'deal/deal.html')   