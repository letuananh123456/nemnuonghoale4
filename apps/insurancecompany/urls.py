from django.urls import path
from .views import (
   ISRCPNView,AddDatainsurancecompany
)
urlpatterns = [
    path('insurancecompany/<slug:slug>', ISRCPNView.as_view(), name='company_detail'),
    path('add-data-cong-ty-bao-hiem/',AddDatainsurancecompany.as_view(), name='add-data-cong-ty-bao-hiem'),
]
