from django.urls import path
from .views import (
   InfoInvestmentView,InvestmentCompare, NhapThongTinDauTuChinhAPI, GoiSanPhamChinhApi, GoiSanPhamPhuApi
   ,InvestmentApiViewRobot,AddDataLaiSuatApi,PushSpcInvestment,PrePaymentInvest,LienKetChungView,LienKetDonViView,
)

app_name = 'investment'

urlpatterns = [
    path('nem-thit-bo/', InfoInvestmentView.as_view(), name='investment'),
    path('so-sanh-dau-tu/', InvestmentCompare.as_view(), name='investment-compare'),
    path('investment-lienketchung/', LienKetChungView.as_view(), name='investment-lienketchung'),
    path('investment-lienketdonvi/', LienKetDonViView.as_view(), name='investment-lienketdonvi'),
    path('prepayment/', PrePaymentInvest.as_view(), name='prepayment'),

    path('nhapthongtindautuchinhapi/', NhapThongTinDauTuChinhAPI.as_view(), name='nhap-thong-tin-dau-tu-chinh-api'),
    path('add-goi-san-pham-chinh/', GoiSanPhamChinhApi.as_view(), name='add-goi-san-pham-chinh'),
    path('add-goi-san-pham-phu/', GoiSanPhamPhuApi.as_view(), name='add-goi-san-pham-phu'),

    path('api-investment-robot/', InvestmentApiViewRobot.as_view(), name='api-investment-robot'),
    path('api-add-laisuat/', AddDataLaiSuatApi.as_view(), name='api-add-laisuat'),
    path('api-push-spc/', PushSpcInvestment.as_view(), name='api-push-spc'),


]

