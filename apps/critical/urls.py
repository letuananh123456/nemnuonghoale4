from django.urls import path
from .views import (
   CriticalInsurance,CriticalQuotes,CriticalInfo
)
urlpatterns = [
    path('hiem-ngheo/', CriticalInsurance.as_view(), name='critical'),
    path('hiem-ngheo-m2/', CriticalQuotes.as_view(), name='critical_quotes'),
    path('hiem-ngheo-info/', CriticalInfo.as_view(), name='critical-info'),
]

