from django.shortcuts import render, redirect
from django.views import View
import json
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import permissions
from rest_framework import status
# from apps.core.utils import validate_data
from rest_framework.renderers import TemplateHTMLRenderer, JSONRenderer
from apps.article.models import GioiThieuLoaiHinhBH

# Create your views here.

class InfoPensionView(View):
    def get(self, request):
        gioithieuhuutri = GioiThieuLoaiHinhBH.objects.get(id = 5)
        context = {
            'p1': gioithieuhuutri
        }
        return render(request, 'pension/pension.html',context)

    def post(self, request):
        return redirect('pension-compare-url')


class PensionCompare(View):
    def get(self, request):
        return render(request, 'pension/pension_compare.html')

    
class PensionApiViewRobot(APIView):
    permission_classes = (permissions.AllowAny,)

    def post(self, request):
        valid_data = validate_data(investment_serializers.InfoProductPension, request.data)
        robot_huutri_gioitinh = valid_data.get('robot_huutri_gioitinh')
        robot_huutri_tuoi = valid_data.get('robot_huutri_tuoi')
        robot_huutri_luong = valid_data.get('robot_huutri_luong')
        robot_huutri_thoigian_luonghuu = valid_data.get('robot_huutri_thoigian_luonghuu')
        robot_huutri_sonam = valid_data.get('robot_huutri_sonam')
        robot_huutri_uudai = valid_data.get('robot_huutri_uudai')

        request.session['robot_huutri_gioitinh'] = robot_huutri_gioitinh
        request.session['robot_huutri_tuoi'] = robot_huutri_tuoi
        request.session['robot_huutri_luong'] = robot_huutri_luong
        request.session['robot_huutri_thoigian_luonghuu'] = robot_huutri_thoigian_luonghuu
        request.session['robot_huutri_sonam'] = robot_huutri_sonam
        request.session['robot_huutri_uudai'] = robot_huutri_uudai

        return Response(1, status=status.HTTP_200_OK)


class SubmitHuuTri(APIView):
    permission_classes = (permissions.AllowAny,)

    def post(self, request):
        valid_data = validate_data(investment_serializers.ProductHuuTriSerializer, request.data)
        product_id = valid_data.get('product_id')
        sotiendautumoithang = valid_data.get('sotiendautumoithang')
        sonamdongphi = valid_data.get('sonamdongphi')
        sonamhopdong = valid_data.get('sonamhopdong')

        request.session['huutri_product_id'] = product_id
        request.session['huutri_tiendautumoithang'] = sotiendautumoithang
        request.session['huutri_sonamdongphi'] = sonamdongphi
        request.session['huutri_sonamhopdong'] = sonamhopdong

        return Response(1, status=status.HTTP_200_OK)

        
class HuuTriDetail(View):
    def get(self, request):
        return render(request, 'pension/pension_detail.html')
    
    def post(self, request):
        print('ngay sinh: ', request.POST)
        muachoai = request.POST.get('muachoai')
        ngaysinh = request.POST.get('ngaysinh_child')
        thangsinh = request.POST.get('thangsinh_child')
        namsinh = request.POST.get('namsinh_child')
        email = request.POST.get('txtEmail')

        ho = request.POST.get('Firstname')
        tendem = request.POST.get('Midname')
        ten = request.POST.get('Lastname')
        gioitinh = request.POST.get('gioitinh')
        sonamhopdong = request.POST.get('sonamhopdong')
        sonamdongphi = request.POST.get('sonamdongphi')
        phuongthucdongphi = request.POST.get('phuongthucdongphi')
        sotiendautu = int(request.POST.get('sotiendautu'))
        product_id = request.session.get('invest_product_id')
        sex = 0
        if gioitinh == 'Nam':
            sex = 0
        else:
            sex = 1

        cus_id = int(request.session.get('investment_cus_id'))
        
        try:  
            prod = InvestmentProduct.objects.get(id=product_id)
        except:
            return redirect('investment-compare')

        if request.user.is_authenticated:
            cus_phone_number = request.user.username
        else:
            cus = Customer.objects.get(id=cus_id)
            cus_phone_number = cus.phone_number

        order_id = unique_order_id_generator(cus_phone_number)
        print('order =', order_id)
        InvestCustomerSave.objects.create(order_id=order_id, ho=ho, tendem=tendem, ten=ten, gioi_tinh=sex,
            so_dien_thoai=cus_phone_number, email=email, ngay_sinh=int(ngaysinh), thang_sinh=int(thangsinh),
            nam_sinh=int(namsinh),so_nam_hop_dong=int(sonamhopdong), so_nam_dong_phi=int(sonamdongphi),
            phuong_thuc_dong_phi=int(phuongthucdongphi), product_pick_id=int(product_id), so_tien_dau_tu=sotiendautu
        )
        request.session['ma_don_hang_bihama'] = order_id
        request.session['pay_so_dien_thoai'] = request.user.username
        request.session['pay_tien_thanh_toan'] = int(sotiendautu*prod.tylephi*prod.tyleloinhuan)
        request.session['pay_product_id'] = prod.id
        request.session['pay_loai_san_pham'] = 5 # dau tu
        return redirect('payment')  
        

