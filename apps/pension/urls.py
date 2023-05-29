from django.urls import path
from .views import (
   InfoPensionView,PensionCompare,HuuTriDetail
)
urlpatterns = [
    path('huu-tri/', InfoPensionView.as_view(), name='pension'),
    path('so-sanh-huu-tri/', PensionCompare.as_view(), name='pension-compare-url'),
    path('huutri-order/', HuuTriDetail.as_view(), name='huutri-order'),
]

