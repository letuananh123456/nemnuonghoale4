from django.shortcuts import render, redirect
from django.views import View
import json
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import permissions
from rest_framework import status
from apps.core.utils import validate_data
from rest_framework.renderers import TemplateHTMLRenderer, JSONRenderer
from . import models as person_models 

# Create your views here.
class GoiSanPhamInsertAPIView(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request, format=None):
        valid_data = validate_data(personserializers.PesonDataSerial, request.data)

        cong_ty = valid_data.get('cong_ty')
        loai_hinh_bao_hiem = valid_data.get('loai_hinh_bao_hiem')
        ten_goi_san_pham = valid_data.get('ten_goi_san_pham')
        
        
        gsp = person_models.GoiSanPhamVBI.objects.get_or_create(cong_ty=cong_ty, loai_hinh_bao_hiem=loai_hinh_bao_hiem,
                                    ten_goi_san_pham=ten_goi_san_pham)
        return Response(1, status=status.HTTP_200_OK)


class PhiSanPhamCInsertAPIView(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request, format=None):
        valid_data = validate_data(personserializers.PesonPhiSPCDataSerial, request.data)

        goisanpham = valid_data.get('goisanpham')
        tuoi = valid_data.get('tuoi')
        phi_bao_hiem = valid_data.get('phi_bao_hiem')

        goispdong = person_models.GoiSanPhamVBI.objects.get(ten_goi_san_pham="Gói Đồng")
        goispbac = person_models.GoiSanPhamVBI.objects.get(ten_goi_san_pham="Gói Bạc")
        goisptitan = person_models.GoiSanPhamVBI.objects.get(ten_goi_san_pham="Gói TiTan")
        goispvang = person_models.GoiSanPhamVBI.objects.get(ten_goi_san_pham="Gói Vàng")
        goispbachkim = person_models.GoiSanPhamVBI.objects.get(ten_goi_san_pham="Gói Bạch Kim")
        goispkimcuong = person_models.GoiSanPhamVBI.objects.get(ten_goi_san_pham="Gói Kim Cương")

        # spc = person_models.PhiSanPhamChinhVBI.objects.get_or_create(goisanpham=goisanpham, tuoi=tuoi,
        #                             phi_bao_hiem=phi_bao_hiem)
        print("sdaddsadasdddsad=",goispdong);
        print("sdaddsadasdddsad=",type(goisanpham));
        if goisanpham=="Gói Đồng":
            person_models.PhiSanPhamChinhVBI.objects.get_or_create(goisanpham=goispdong, tuoi=tuoi,
                     phi_bao_hiem=phi_bao_hiem)
        elif goisanpham=="Gói Bạc":
            person_models.PhiSanPhamChinhVBI.objects.get_or_create(goisanpham=goispbac, tuoi=tuoi,
                     phi_bao_hiem=phi_bao_hiem)
        elif goisanpham=="Gói TiTan":
            person_models.PhiSanPhamChinhVBI.objects.get_or_create(goisanpham=goisptitan, tuoi=tuoi,
                     phi_bao_hiem=phi_bao_hiem)
        elif goisanpham=="Gói Vàng":
            person_models.PhiSanPhamChinhVBI.objects.get_or_create(goisanpham=goispvang, tuoi=tuoi,
                     phi_bao_hiem=phi_bao_hiem)
        elif goisanpham=="Gói Bạch Kim":
            person_models.PhiSanPhamChinhVBI.objects.get_or_create(goisanpham=goispbachkim, tuoi=tuoi,
                     phi_bao_hiem=phi_bao_hiem)
        elif goisanpham=="Gói Kim Cương":
            person_models.PhiSanPhamChinhVBI.objects.get_or_create(goisanpham=goispkimcuong, tuoi=tuoi,
                     phi_bao_hiem=phi_bao_hiem)

        return Response(1, status=status.HTTP_200_OK)


class HealthySubsidiaryInsertAPIView(APIView):
    permission_classes = (permissions.AllowAny, )
    renderer_classes = (JSONRenderer, TemplateHTMLRenderer, )
    def post(self, request, format=None):
        valid_data = validate_data(personserializers.HealProductDataSerial, request.data)

        goisanpham = valid_data.get('goisanpham')
        ten_quyen_loi_phu = valid_data.get('ten_quyen_loi_phu')
        tuoi = valid_data.get('tuoi')
        phi_bao_hiem = valid_data.get('phi_bao_hiem')

        goispdong = person_models.GoiSanPhamVBI.objects.get(ten_goi_san_pham="Gói Đồng")
        goispbac = person_models.GoiSanPhamVBI.objects.get(ten_goi_san_pham="Gói Bạc")
        goisptitan = person_models.GoiSanPhamVBI.objects.get(ten_goi_san_pham="Gói TiTan")
        goispvang = person_models.GoiSanPhamVBI.objects.get(ten_goi_san_pham="Gói Vàng")
        goispbachkim = person_models.GoiSanPhamVBI.objects.get(ten_goi_san_pham="Gói Bạch Kim")
        goispkimcuong = person_models.GoiSanPhamVBI.objects.get(ten_goi_san_pham="Gói Kim Cương")

        print("sdaddsadasdddsad=",goispdong);
        print("sdaddsadasdddsad=",type(goisanpham));
        if goisanpham=="Gói Đồng":
            person_models.PhiSanPhamPhuVBI.objects.get_or_create(goisanpham=goispdong, 
            ten_quyen_loi_phu=ten_quyen_loi_phu, tuoi=tuoi, phi_bao_hiem=phi_bao_hiem)
        elif goisanpham=="Gói Bạc":
            person_models.PhiSanPhamPhuVBI.objects.get_or_create(goisanpham=goispbac,
             ten_quyen_loi_phu=ten_quyen_loi_phu, tuoi=tuoi, phi_bao_hiem=phi_bao_hiem)
        elif goisanpham=="Gói TiTan":
            person_models.PhiSanPhamPhuVBI.objects.get_or_create(goisanpham=goisptitan, 
            ten_quyen_loi_phu=ten_quyen_loi_phu, tuoi=tuoi, phi_bao_hiem=phi_bao_hiem)
        elif goisanpham=="Gói Vàng":
            person_models.PhiSanPhamPhuVBI.objects.get_or_create(goisanpham=goispvang,
            ten_quyen_loi_phu=ten_quyen_loi_phu, tuoi=tuoi, phi_bao_hiem=phi_bao_hiem)
        elif goisanpham=="Gói Bạch Kim":
            person_models.PhiSanPhamPhuVBI.objects.get_or_create(goisanpham=goispbachkim,
            ten_quyen_loi_phu=ten_quyen_loi_phu,tuoi=tuoi, phi_bao_hiem=phi_bao_hiem)
        elif goisanpham=="Gói Kim Cương":
            person_models.PhiSanPhamPhuVBI.objects.get_or_create(goisanpham=goispkimcuong,
            ten_quyen_loi_phu=ten_quyen_loi_phu, tuoi=tuoi, phi_bao_hiem=phi_bao_hiem)

        return Response(1, status=status.HTTP_200_OK)


class InfoPerSonalaccidentView(View):

    def get(self, request):
        return render(request, 'personalaccident/personalhealth.html')


class ComparePerSonalaccident(View):

    def get(self, request):
        return render(request, 'personalaccident/health_compare.html')


class PerSonalaccidentOder(View):

    def get(self, request):
        return render(request,'personalaccident/copperhealth_order.html')


class PerSonalaccidentPoly(View):

    def get(self, request):
        return render(request,'personalaccident/health-poly.html')


class DetailPerSonalaccidentPoly(View):

    def get(self, request):
        return render(request,'personalaccident/detail_health.html')


class PerSonalaccidentPrepayment(View):

    def get(self, request):
        return render(request,'personalaccident/health_prepayment.html')


class PerSonalaccidentQuote(View):

    def get(self, request):
        return render(request,'personalaccident/health_quote.html')


class CopperPerSonalaccident(View):

    def get(self, request):
        return render(request,'personalaccident/copperhealth_order.html')


class SilverPerSonalaccident(View):

    def get(self, request):
        return render(request,'personalaccident/silverhealth_order.html')


class TitaniumPerSonalaccident(View):

    def get(self, request):
        return render(request,'personalaccident/silverhealth_order.html')


class GoldPerSonalaccident(View):

    def get(self, request):
        return render(request,'personalaccident/goldhealth_order.html')


class PlatinumPerSonalaccident(View):

    def get(self, request):
        return render(request,'personalaccident/platinumhealth_order.html')


class DiamonPerSonalaccident(View):

    def get(self, request):
        return render(request,'personalaccident/diamondhealth_order.html')


class PerSonalaccidentpayment(View):

    def get(self, request):
        return render(request,'personalaccident/personalpayment.html')