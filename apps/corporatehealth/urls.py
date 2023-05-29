from django.urls import path
from .views import (
   CompanyInsurance
)
urlpatterns = [
    path('corporate-health/',CompanyInsurance.as_view(), name='corporate_health'),
]

