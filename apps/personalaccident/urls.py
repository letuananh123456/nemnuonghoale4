from django.urls import path
from .views import (
   InfoPerSonalaccidentView,ComparePerSonalaccident,PerSonalaccidentOder,CopperPerSonalaccident,SilverPerSonalaccident,
   TitaniumPerSonalaccident,GoldPerSonalaccident,PlatinumPerSonalaccident,DiamonPerSonalaccident,DetailPerSonalaccidentPoly,
   PerSonalaccidentPoly,PerSonalaccidentpayment,PerSonalaccidentPrepayment,PerSonalaccidentQuote
)
urlpatterns = [
    path('tai-nan-ca-nhan/', InfoPerSonalaccidentView.as_view(), name='personalaccdient'),
    path('compare-PSACD-health/', ComparePerSonalaccident.as_view(), name='compare_PSACD_url'),
    path('PSACD-oder/', PerSonalaccidentOder.as_view(), name='PSACD-oder_url'),
    path('copper-PSACD-oder/', CopperPerSonalaccident.as_view(), name='copper-PSACD-oder_url'),
    path('silver-PSACD-oder/', SilverPerSonalaccident.as_view(), name='silver-PSACD-oder_url'),
    path('titanium-PSACD-oder/', TitaniumPerSonalaccident.as_view(), name='titanium-PSACD-oder_url'),
    path('gold-PSACD-oder/', GoldPerSonalaccident.as_view(), name='gold-PSACD-oder_url'),
    path('platinum-PSACD-oder/', PlatinumPerSonalaccident.as_view(), name='platinum-PSACD-oder_url'),
    path('diamond-PSACD-oder/', DiamonPerSonalaccident.as_view(), name='diamond-PSACD-oder_url'),
    path('detail_PSACD/', DetailPerSonalaccidentPoly.as_view(), name='detail-PSACD_url'),
    path('PSACD-poly/', PerSonalaccidentPoly.as_view(), name='PSACD_poly_url'),
    path('PSACD-payment/', PerSonalaccidentpayment.as_view(), name='PSACD-payment_url'),
    path('comapre-PSACD-prepayment/', PerSonalaccidentPrepayment.as_view(),name='comapre_PSACD_prepayment_url'),
    path('PSACD-quote/', PerSonalaccidentQuote.as_view(), name='PSACD-quote_url'),
]

