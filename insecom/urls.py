"""insecom URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from django.conf import settings
from apps.core import views as core_views
from apps.payment import views as vnp_payment_views
from apps.personalhealth import views as personalhealth_views
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
#from django.conf.urls import patterns, url
from apps.users.views import (
    LoginView, RegisterView, SettingUser, LogoutView,
    SettingThongBao, OderManagement, OTPView,ViewMenuMobile, Tutorial,
    ElectronicWallet, 
    )
from apps.homeinsurance import views as homeinsurance_views
from apps.article import views as article_views
from django.conf.urls import handler404, handler500 ,handler403


handler404 = "apps.core.views.Error404Page"
handler500 = "apps.core.views.Error500Page"
handler403 = "apps.core.views.Error403Page"



urlpatterns = [
    path('admin/', admin.site.urls),
    #about
    path('about/', include('apps.about.urls')),
    # claim
    path('claim/', include('apps.claim.urls')),
    #user
    path('', include('apps.users.urls')),
    #khuyenmai
    path('deal/', include('apps.deal.urls')),

    #Bh nhan tho:
    #san pham tu ki
    path('termlife/', include('apps.termlife.urls')),
    #san pham dau tu
    path('investment/', include('apps.investment.urls')),
    #san pham tich luy
    # path('saving/', include('apps.saving.urls')),
    #san pham giao duc
    # path('education/', include('apps.education.urls')),
    #san pham huu tri
    # path('pension/', include('apps.pension.urls')),

    #bao hiem suc khoe:
    #bao hiem suc khoe ca nhan
    path('personalhealth/', include('apps.personalhealth.urls')),
    #bao hiem suc khoe doanh nghiep
    # path('corporatehealth/', include('apps.corporatehealth.urls')),
    #bao hiem tai nan ca nhan
    # path('personalaccident/', include('apps.personalaccident.urls')),
    # #bao hiem tro cap y te nam vien
    # path('hospitalcash/', include('apps.hospitalcash.urls')),
    # bao hiem benh hiem ngheo
    # path('critical/', include('apps.critical.urls')),
    # bao hiem benh ung thu
    # path('cancel/', include('apps.cancel.urls')),

    #bao hiem oto:
    #vat chat xe o to
    # path('vcxot-o-to/', include('apps.vatchatxeoto.urls')),
    # baohiem TNDS o to
    path('tnds-o-to/', include('apps.tndsoto.urls')),
    #bao hiem TYNDS xe may:
    # bao hiem trach nhiem dan su xe may
    path('tnds-xe-may/', include('apps.tndsxemay.urls')),
    # bao hiem du lich
    #bao hiem du lich viet nam
    # path('travel-vn/', include('apps.travelvn.urls')),
    #bao hiem du lich quoc te
    # path('travel-quocte/', include('apps.travelquocte.urls')),
    #bao hiem du lich tre chuyen bay
    # path('travel-delay/', include('apps.delay.urls')),

    #bao hiem khac
    # tai tuc
    path('renewal/', include('apps.renewal.urls')),
    # nha tu nhan
    path('nha-tu-nhan/', include('apps.homeinsurance.urls')),
    #man hinh dien thoai
    # path('mobile-screen/', include('apps.mobilescreen.urls')),
    # kien thuc
    path('kienthuc/', include('apps.kienthuc.urls')),
    #payment
    path('payment/', include('apps.payment.urls')),
    path('thanh-toan/', vnp_payment_views.payment, name='payment'),
    path('payment_ipn/', vnp_payment_views.payment_ipn, name='payment_ipn'),
    path('payment_return/', vnp_payment_views.payment_return, name='payment_return'),
    path('query/', vnp_payment_views.query, name='query'),
    path('refund/', vnp_payment_views.refund, name='refund'),
    
    #tin tuc
    path('article/', include('apps.article.urls')),
    #cong ty bao hiem
    path('insurancecompany/', include('apps.insurancecompany.urls')),
    # core
    path('', include('apps.core.urls')),
    path('ckeditor/', include('ckeditor_uploader.urls')),
    path('robot/', include('apps.robot.urls')),

]




