from django.urls import path
from .views import (
   InfoInternationalTravelView,CompareInternationalTravelView
)
app_name = 'travelquocte'
urlpatterns = [
    path('', InfoInternationalTravelView.as_view(), name='travel_quocte'),
    path('travelquocte-compare/', CompareInternationalTravelView.as_view(), name='travelquocte_compare'),
]

