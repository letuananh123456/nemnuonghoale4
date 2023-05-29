from django.shortcuts import render
from django.views import View
# Create your views here.

class InfoCriticalView(View):
    def get(self, request):
        return render(request, 'product-infor.html')

class CriticalInsurance(View):
    def get(self, request):
        return render(request, 'critical/cancer.html')

class CriticalQuotes(View):
    def get(self, request):
        return render(request, 'critical/cancer_quotes.html')


class CriticalInfo(View):
    def get(self, request):
        return render(request, 'critical/cancer-info.html')        


    
    



