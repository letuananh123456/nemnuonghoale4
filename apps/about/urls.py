from django.urls import path
from .views import (
   AboutView,PolicyView,SellView,SellercenterView,activate_account,DoneMail,GetTheApp
)
urlpatterns = [
    path('ve-chung-toi/', AboutView.as_view(), name='about-url'),
    path('chinh-sach/', PolicyView.as_view(), name='chinh-sach-url'),
    path('ban-hang-cung-bihama/', SellView.as_view(), name='ban-hang-cung-bihama-url'),
    path('dang-ky-ban-hang-cung-bihama/', SellercenterView.as_view(), name='dang-ky-ban-hang-cung-bihama-url'),
    path('activate/<uidb64>[0-9A-Za-z_\-]+/<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20}/',activate_account, name='activate'),
    path('da-gui-mail/', DoneMail.as_view(), name='da-gui-mail'),
    path('tai-ung-dung-bihama/', GetTheApp.as_view(), name='tai-ung-dung-bihama'),
]

