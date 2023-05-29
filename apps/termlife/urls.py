from django.urls import path
from .views import (
   ProductTuky,CompareProductView,HoanPhiView,QuestionHealthHoanPhiView,SummaryOrderTermlifeView,CompareMultiProductView,
   AddSpcApiDataTermLife,AddSpcpApiDataTermLife, ApiChangeProductTermlife,ApiPushProductTermlife,TruyenThongView,ThaiSanView,ApiChangeSppTermLife,
   QuestionHealthTruyenThongView,QuestionHealthThaiSanView
)
app_name = 'termlife'

urlpatterns = [
    path('nem-thit-lon/', ProductTuky.as_view(), name='life-product'),
    path('compare/', CompareProductView.as_view(), name='compare-url'),
    path('hoanphi-fubon/', HoanPhiView.as_view(), name='hoanphi_order'),
    path('truyenthong-fubon/', TruyenThongView.as_view(), name='truyenthong_order'),
    path('thaisan-fubon/', ThaiSanView.as_view(), name='thaisan_order'),

    path('cauhoi-suckhoe-hoanphi/', QuestionHealthHoanPhiView.as_view(), name='question-health-hoanphi'),
    path('cauhoi-suckhoe-truyenthong/', QuestionHealthTruyenThongView.as_view(), name='question-health-truyenthong'),
    path('cauhoi-suckhoe-thaisan/', QuestionHealthThaiSanView.as_view(), name='question-health-thaisan'),

    path('summary-order-termlife/', SummaryOrderTermlifeView.as_view(), name='summary-order-termlife'),
    path('compare-multi-product/', CompareMultiProductView.as_view(), name='compare-multi-product'),

    #api insert database
    path('api-add-spc-term-life/', AddSpcApiDataTermLife.as_view(), name='api-add-spc-term-life'),
    path('api-add-spp-term-life/', AddSpcpApiDataTermLife.as_view(), name='api-add-spp-term-life'),
    path('change-product-tl/', ApiChangeProductTermlife.as_view(), name='change-product-tl'),
    path('push-product-tl/', ApiPushProductTermlife.as_view(), name='push-product-tl'),
    path('change-spp-tl/', ApiChangeSppTermLife.as_view(), name='change-spp-tl'),




]

