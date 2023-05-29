from django.shortcuts import render
from django.views import View

# Create your views here.
class TaiTuc1(View):

    def get(self, request):
        return render(request, 'renewal/index1.html')


class TaiTuc(View):

    def get(self, request):
        return render(request, 'renewal/index.html')


class ChooseRenewal(View):

    def get(self, request):
        return render(request, 'renewal/ChooseRenewal.html')


class SelectRenewal(View):

    def get(self, request):
        return render(request, 'renewal/select-company.html')


class PayRenewal(View):

    def get(self, request):
        return render(request, 'renewal/pay-renewal.html')


class RenewalHelth(View):

    def get(self, request):
        return render(request, 'renewal/renewal-helth.html')