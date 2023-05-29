from django.shortcuts import render
from apps.insurancecompany import models as insurancecompany_models
from apps.article import models as article_models
from apps.insurancecompany import serializers as insurancecompany_serializers
from rest_framework.views import APIView
from rest_framework import permissions
from django.views import View
from apps.core.utils import validate_data
from rest_framework.response import Response
from rest_framework import status

# Create your views here.

class ISRCPNView(View):
    def get(self, request, slug):
        
        list_congtybaohiem = insurancecompany_models.Insurancecompany.objects.all().order_by("-created_time")
        detail_company = insurancecompany_models.Insurancecompany.objects.get(slug =slug)
        list_item_new = article_models.Article.objects.all().order_by("-created_time")[:4]
        list_company_diff =  insurancecompany_models.Insurancecompany.objects.all().exclude(slug = slug).order_by("-created_time")[:3]
        context = {
            'list_congtybaohiem': list_congtybaohiem,
            'detail_company':detail_company,
            'list_item_new':list_item_new,
            'list_company_diff':list_company_diff,
        }
        return render(request, 'insurancecompany/ISRCPN.html',context)       


class AddDatainsurancecompany(APIView):
    permission_classes = (permissions.AllowAny,)
    def post(self, request):
        valid_data = validate_data(insurancecompany_serializers.AddDatainsurancecompanyser, request.data)

        name_cpn = valid_data.get('name_cpn')
        slug = valid_data.get('slug')
        sub_title = valid_data.get('sub_title')
        link_cpn = valid_data.get('link_cpn')
        # content = valid_data.get('content')
        # seo_key_word = valid_data.get('seo_key_word')
        # tac_gia = valid_data.get('tac_gia')
        images = valid_data.get('images')
        if insurancecompany_models.Insurancecompany.objects.filter(name_cpn=name_cpn,sub_title=sub_title,slug=slug,link_cpn=link_cpn,images=images).exists():
            return Response(1, status=status.HTTP_400_BAD_REQUEST)  
        else:
            insurancecompany_models.Insurancecompany.objects.create(name_cpn=name_cpn,slug=slug,sub_title=sub_title,link_cpn=link_cpn,images=images)
            return Response(1, status=status.HTTP_200_OK)  
    
    



