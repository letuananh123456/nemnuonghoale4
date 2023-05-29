from django.shortcuts import render
from django.views import View
from apps.article import serializers as article_serializers
from apps.article import models as article_models
from apps.core.utils import validate_data, validate_response ,convert_price_to_string , check_ma_giam_gia
from rest_framework import permissions
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
import urllib.parse
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

# Create your views here.


class Articles(View):
    def get(self, request):
        
        list_baohiem = article_models.Article.objects.filter(loai_tin_tuc=1).order_by("-created_time")
        list_sanpham = article_models.Article.objects.filter(loai_tin_tuc=2).order_by("-created_time")

        paginator = Paginator(list_baohiem, 4)
        page = request.GET.get('page1', 1)
        try:
            page_list_baohiem = paginator.page(page)
        except PageNotAnInteger:
            page_list_baohiem = paginator.page(1)
        except EmptyPage:
            page_list_baohiem = paginator.page(paginator.num_pages)

        paginator1 = Paginator(list_sanpham, 3)
        page1 = request.GET.get('page2', 1)
        try:
            page_list_sanpham = paginator1.page(page1)
        except PageNotAnInteger:
            page_list_sanpham = paginator1.page(1)
        except EmptyPage:
            page_list_sanpham = paginator1.page(paginator1.num_pages)

        context = {'list_baohiem': page_list_baohiem,'list_sanpham':page_list_sanpham} 

        return render(request, 'article/article.html', context)


class ArticleDetail(View):
    def get(self, request, slug):
        artical = article_models.Article.objects.filter(slug=slug).first()
        loai_tin_tuc = artical.loai_tin_tuc
        list_item_lq = article_models.Article.objects.filter(loai_tin_tuc=loai_tin_tuc).exclude(slug = slug).order_by("-created_time")[:3]
        list_item_new = article_models.Article.objects.all().order_by("-created_time")[:4]

        context = {
            'article': artical,
            'list_item_lq': list_item_lq,
            'list_item_new':list_item_new,
        }
        return render(request, 'article/article_detail.html', context)


class AddDataTinTuc(APIView):
    permission_classes = (permissions.AllowAny,)
    def post(self, request):
        valid_data = validate_data(article_serializers.AddDataTinTucSer, request.data)

        title = valid_data.get('title')
        slug = valid_data.get('slug')
        sub_title = valid_data.get('sub_title')
        seo_key_word = valid_data.get('seo_key_word')
        loai_tin_tuc = valid_data.get('loai_tin_tuc')
        images_gioi_thieu = valid_data.get('images_gioi_thieu')

        if article_models.Article.objects.filter(title=title,slug=slug,sub_title=sub_title,
                                                seo_key_word=seo_key_word,loai_tin_tuc=loai_tin_tuc,images_gioi_thieu=images_gioi_thieu).exists():
            return Response(1, status=status.HTTP_400_BAD_REQUEST)  
        else:
            article_models.Article.objects.create(title=title,slug=slug,sub_title=sub_title,
                                                seo_key_word=seo_key_word,loai_tin_tuc=loai_tin_tuc,images_gioi_thieu=images_gioi_thieu)
            return Response(1, status=status.HTTP_200_OK)  