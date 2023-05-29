from django.shortcuts import render,redirect
from django.views import View
from rest_framework.response import Response
# Create your views here.

class ClaimSupport(View):

    def get(self, request):
        return render(request, 'claim/index.html')

    def post(self, request):
        return render(request, 'claim/index.html')    


class ClaimTukySupport(View):

    def get(self, request):
        return render(request, 'claim/term_claim.html')

    def post(self, request):
        return render(request, 'claim/term_claim.html')


class ClaimHealthSupport(View):
    def get(self, request):
        return render(request, 'claim/health_claim.html')

    def post(self, request):
        return render(request, 'claim/health_claim.html')


class ClaimCarSupport(View):
    def get(self, request):
        return render(request, 'claim/car_claim.html')
         
         
    def post(self, request):
        return render(request, 'claim/car_claim.html')


class ClaimHomeSupport(View):
    def get(self, request):
        return render(request, 'claim/home_claim.html')
         
         
    def post(self, request):
        return render(request, 'claim/home_claim.html')


class ClaimCriticalSupport(View):
    def get(self, request):
        return render(request, 'claim/critical_claim.html')
         
         
    def post(self, request):
        return render(request, 'claim/critical_claim.html')


class ClaimPersonalAccidentSupport(View):
    def get(self, request):
        return render(request, 'claim/personalaccident_claim.html')
         
         
    def post(self, request):
        return render(request, 'claim/personalaccident_claim.html')


class AboutView(View):
     def get(self, request):
        return render(request, 'about.html')