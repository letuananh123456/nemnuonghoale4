from django.urls import path
from .views import (
   InfohospitalcashView,Comparehospitalcash,hospitalcashOder,Copperhospitalcash,Silverhospitalcash,
   Titaniumhospitalcash,Goldhospitalcash,Platinumhospitalcash,Diamonhospitalcash,DetailhospitalcashPoly,
   hospitalcashPoly,hospitalcashpayment,hospitalcashPrepayment,hospitalcashQuote
)
urlpatterns = [
    path('y-te-nam-vien/', InfohospitalcashView.as_view(), name='hospitalcash'),
    path('compare-ytnv-health/', Comparehospitalcash.as_view(), name='compare_ytnv_url'),
    path('ytnv-oder/', hospitalcashOder.as_view(), name='ytnv-oder_url'),
    path('copper-ytnv-oder/', Copperhospitalcash.as_view(), name='copper-ytnv-oder_url'),
    path('silver-ytnv-oder/', Silverhospitalcash.as_view(), name='silver-ytnv-oder_url'),
    path('titanium-ytnv-oder/', Titaniumhospitalcash.as_view(), name='titanium-ytnv-oder_url'),
    path('gold-ytnv-oder/', Goldhospitalcash.as_view(), name='gold-ytnv-oder_url'),
    path('platinum-ytnv-oder/', Platinumhospitalcash.as_view(), name='platinum-ytnv-oder_url'),
    path('diamond-ytnv-oder/', Diamonhospitalcash.as_view(), name='diamond-ytnv-oder_url'),
    path('detail_ytnv/', DetailhospitalcashPoly.as_view(), name='detail-ytnv_url'),
    path('ytnv-poly/', hospitalcashPoly.as_view(), name='ytnv_poly_url'),
    path('ytnv-payment/', hospitalcashpayment.as_view(), name='ytnv-payment_url'),
    path('comapre-ytnv-prepayment/', hospitalcashPrepayment.as_view(),name='comapre_ytnv_prepayment_url'),
    path('ytnv-quote/', hospitalcashQuote.as_view(), name='ytnv-quote_url'),
]

