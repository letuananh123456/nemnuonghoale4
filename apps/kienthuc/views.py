from django.shortcuts import render, redirect
from django.views import View
from .models import KienThucModel, KienthucCategory
from rest_framework import permissions
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from apps.core.utils import validate_data, validate_response ,convert_price_to_string , check_ma_giam_gia
from apps.kienthuc import serializers as kienthuc_serializers
from django.core.paginator import Paginator


class KienThucView(View):
    def get(self, request, category, slug):
        artical = KienThucModel.objects.filter(slug=slug).first()
        try:
            cate = KienthucCategory.objects.get(slug=category)
        except:
            cate = ''
        list_item = KienThucModel.objects.filter(category=cate).exclude(slug=slug)
        if category=="loai1":
            nameca="Kiến Thức Chung"
        elif category=="loai2":
            nameca="Sử dụng Sàn Bihama"
        elif category=="loai3":
            nameca="Cộng Tác Viên Bihama"
        elif category=="loai4":
            nameca="Bảo Hiểm Nhân Thọ"
        elif category=="loai5":
            nameca="Bảo Hiểm Phi Nhân Thọ"
        else:
            nameca=""


        if len(list_item) < 6:
            context = {'p1': artical,'list_item': list_item, 'nameca':nameca}
        else:
            paginator = Paginator(list_item, 5)
            page_number = request.GET.get('page')
            page_list_sanpham = paginator.get_page(page_number)
            context = {'p1': artical,'list_item': page_list_sanpham,'nameca':nameca}

        return render(request, "kienthuc/kienthuc.html", context)


class AddDataKienThucAPI(APIView):
    permission_classes = (permissions.AllowAny,)
    def post(self, request):
        valid_data = validate_data(kienthuc_serializers.AddDataKienThucAPISer, request.data)

        title = valid_data.get('title')
        slug = valid_data.get('slug')
        content = valid_data.get('content')
        link_video = valid_data.get('link_video')
        images = valid_data.get('images')
        slug_category = valid_data.get('slug_category')
        name_category = valid_data.get('name_category')

        if KienthucCategory.objects.filter(slug=slug_category,name_category=name_category).exists():
            cata=KienthucCategory.objects.get(slug=slug_category,name_category=name_category)
        else:
            cata=KienthucCategory.objects.create(slug=slug_category,name_category=name_category)
        if KienThucModel.objects.filter(title=title,slug=slug,content=content,link_video=link_video,category=cata,images=images).exists():
            return Response(1, status=status.HTTP_400_BAD_REQUEST)  
        else:
            KienThucModel.objects.create(title=title,slug=slug,content=content,link_video=link_video,category=cata,images=images)
            return Response(1, status=status.HTTP_200_OK)




