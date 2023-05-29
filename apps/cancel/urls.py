from django.urls import path
from .views import (
   CannerInsurance,CancerQuotes,CannerInfo
)
urlpatterns = [
    path('ung-thu/', CannerInsurance.as_view(), name='cancel'),
    path('ung-thu-m2/', CancerQuotes.as_view(), name='cancel_quotes'),
    path('ung-thu-info/', CannerInfo.as_view(), name='ung-thu-info'),
]

