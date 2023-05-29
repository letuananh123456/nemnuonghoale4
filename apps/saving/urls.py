from django.urls import path
from .views import (
   InfoSavingView,SavingCompare,SavingDetail
)
urlpatterns = [
    path('tich-luy/', InfoSavingView.as_view(), name='saving'),
    path('so-sanh-tich-luy/', SavingCompare.as_view(), name='saving-compare'),
    path('saving-order/', SavingDetail.as_view(), name='saving-order'),
]

