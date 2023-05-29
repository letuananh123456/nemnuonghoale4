from django.urls import path
from .views import (
  HomeInsurance,HomePreQuote1,HomePreQuote2,HomeQuote,AddSpcApiDataHome,AddSppApiDataHome,APIChangeHomeValue,ApiPushSpcHome,HomeProduct,HomeForm,
  APIChangeListSpp,APIPushSppMoneyHome
)
app_name = 'homeinsurance'
urlpatterns = [
    path('video', HomeInsurance.as_view(), name='homeinsurance'),
    path('home-prequote1/', HomePreQuote1.as_view(), name='prequote_url_1'),
    path('home-prequote2/', HomePreQuote2.as_view(), name='prequote_url_2'),
    path('home-quote/', HomeQuote.as_view(), name='home-prequote-url'),
    path('home-product/', HomeProduct.as_view(), name='home-product-url'),
    path('home-form/', HomeForm.as_view(), name='home-form-url'),
    #api home
    path('api-add-spc-home/', AddSpcApiDataHome.as_view(), name='api_add_spc_home'),
    path('api-add-spp-home/', AddSppApiDataHome.as_view(), name='api_add_spp_home'),
    path('api-change-home-value/', APIChangeHomeValue.as_view(), name='api-change-home-value'),
    path('api-change-list-spp/', APIChangeListSpp.as_view(), name='api-change-list-spp'),
    path('api-push-spc-home/', ApiPushSpcHome.as_view(), name='api-push-spc-home'),
    path('api-push-spp-money-home/', APIPushSppMoneyHome.as_view(), name='api-push-spp-money-home'),


]
