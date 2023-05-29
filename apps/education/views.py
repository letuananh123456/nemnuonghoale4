from django.shortcuts import render, redirect
from django.views import View
import json
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import permissions
from rest_framework import status
from rest_framework.renderers import TemplateHTMLRenderer, JSONRenderer
from apps.article.models import GioiThieuLoaiHinhBH


class InfoEducationView(View):
    def get(self, request):
        gioithieudautu = GioiThieuLoaiHinhBH.objects.get(id = 4)
        context = {
            'p1': gioithieudautu
        }
        return render(request, 'education/education.html',context)

    def post(self, request):
        return redirect('education-compare-url')


class EducationCompare(View):
    def get(self, request):
        return render(request, 'education/education_compare.html')


class EducationRobot(View):

    def get(self, request):
        return render(request, 'education/education_compare.html')

    
