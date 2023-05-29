from django.urls import path
from .views import (
   InfoTravelView,CompareTravelView
)
app_name = 'travelvn'
urlpatterns = [
    path('',InfoTravelView.as_view(), name='travel_vn'),
    path('travelvn-compare/',CompareTravelView.as_view(), name='travelvn_compare'),
]

