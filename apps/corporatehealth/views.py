from django.shortcuts import render, redirect
from django.views import View

class CompanyInsurance(View):

    def get(self, request):
        return render(request,'corporatehealth/familyhealth.html', )

class CompanyInfoPerson(View):

    def get(self, request):
        return render(request,'familyhealth/info-payment.html')  


class CompanyProducts(View):

    def get(self, request):
        return render(request,'familyhealth/group-compayny.html')   


class CompanyQuestion(View):

    def get(self, request):
        return render(request,'familyhealth/group-question-company.html')                   


class CompanyPayment(View):

    def get(self, request):
        return render(request,'familyhealth/group-payment-company.html')

    def post(self, request):
        order_id = unique_order_id_generator(request.user.username)
        return redirect('payment')       