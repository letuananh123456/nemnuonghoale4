from django.shortcuts import render
from django.views import View
# Create your views here.

class InfoCancelView(View):
    def get(self, request):
        return render(request, 'product-infor.html')

class CannerInsurance(View):
    def get(self, request):
        return render(request, 'cancer/cancer.html')

class CancerQuotes(View):
    def get(self, request):
        return render(request, 'cancer/cancer_quotes.html')


class CannerInfo(View):
    def get(self, request):
        return render(request, 'cancer/cancer-info.html')        


    
    



