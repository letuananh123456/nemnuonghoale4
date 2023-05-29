from django.urls import path
from .views import (
  MobileScreenView,MobilePreQuote,MobileQuote,MobileProduct,MobileForm
)
app_name = 'mobliescreen'
urlpatterns = [
    path('', MobileScreenView.as_view(), name='mobile_screen'),
    path('mobile-prequote/', MobilePreQuote.as_view(), name='mobile_prequote_url'),
    path('mobile-quote/', MobileQuote.as_view(), name='mobile_quote_url'),
    path('mobile-product/', MobileProduct.as_view(), name='mobile-product-url'),
    path('mobile-form/', MobileForm.as_view(), name='mobile-form-url'),
]

