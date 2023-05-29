from django.urls import path
from .views import (
   InfoDelayTravelView,CompareDelayTravelView
)
app_name = 'delay'
urlpatterns = [
   path('', InfoDelayTravelView.as_view(), name='travel_delay'),
    path('traveldelay-compare/', CompareDelayTravelView.as_view(), name='traveldelay_compare'),
]

