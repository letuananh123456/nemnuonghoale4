from django.shortcuts import render,redirect
from django.views import View
# Create your views here.


class MobileScreenView(View):
    def get(self,request):
        return render(request, 'mobilescreen/mobilescreen.html')

    def post(self, request): 
        return redirect('mobliescreen:mobile_prequote_url')

class MobilePreQuote(View):

    def get(self, request):
        return render(request, 'mobilescreen/PreQuote.html')

    def post(self, request): 
        return redirect('mobliescreen:mobile_quote_url')            

class MobileQuote(View):

    def get(self, request):
        return render(request, 'mobilescreen/Quotes.html')

class MobileProduct(View):
    def get(self, request):

        return render(request, 'mobilescreen/Product.html')


class MobileForm(View):
    def get(self, request):
    
        return render(request, 'mobilescreen/form.html')        
   
         

    


        