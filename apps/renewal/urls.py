from django.urls import path
from .views import (
  TaiTuc1,TaiTuc,SelectRenewal,PayRenewal,RenewalHelth,ChooseRenewal
)
app_name = 'renewal'
urlpatterns = [
    path('', TaiTuc1.as_view(), name='renewal_index1'),
    path('tai-tuc', TaiTuc.as_view(), name='renewal_index'),
    path('chon-phuong-thuc', ChooseRenewal.as_view(), name='choose-renewal'),
    path('select-renewal/', SelectRenewal.as_view(), name='select-renewal'),
    path('pay-renewal/', PayRenewal.as_view(), name='pay-renewal-url'),
    path('renewa-helth/', RenewalHelth.as_view(), name='renewa_helth'),
]

