from django.shortcuts import render, redirect
from django.views import View
# from apps.articles.models import Article
# from apps.core.models import Company
# from .models import TouristInformation
from datetime import datetime
# Create your views here.

class InfoDelayTravelView(View):
    def get(self, request):
        return render(request, 'delay/travel.html',)

    # def post(self, request):
    #     name = request.POST.get("cus-name")
    #     dd = request.POST.get("termBirthday_birth[day]")
    #     mm = request.POST.get("termBirthday_birth[month]")
    #     yyyy = request.POST.get("termBirthday_birth[year]")
    #     phone = request.POST.get("phone-number")
    #     cus = Customer.objects.create(name=name, dob_dd=dd, dob_mm=mm, dob_yyyy=yyyy, phone_number=phone)
    #     request.session['cus_id'] = cus.id
    #     return redirect('compare-url')

    # def post(self, request):
    #     destination = request.POST.get("nuocden")
    #     ageYou = request.POST.get("memage1")
    #     ageParents = request.POST.get("memage2")
    #     ageChild1 = request.POST.get("memage3")
    #     ageChild2 = request.POST.get("memage4")
    #     startDate = request.POST.get("startdate")
    #     endDate = request.POST.get("enddate")
    #     startDate1= datetime.strptime(startDate, "%d/%m/%Y").strftime("%Y-%m-%d")
    #     endDate1= datetime.strptime(endDate, "%d/%m/%Y").strftime("%Y-%m-%d")
    #     print("helo",startDate1)
    #     TouristInformation.objects.create(
    #         destination=destination, ageYou=ageYou,ageParents=ageParents,
    #         ageChild1=ageChild1, ageChild2=ageChild2, startDate=startDate1, endDate=endDate1
    #     )
    #     return redirect('travel-compare')

class CompareDelayTravelView(View):
    def get(self, request):
        return render(request, 'delay/travel-compare.html')