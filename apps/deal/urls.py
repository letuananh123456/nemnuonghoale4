from django.urls import path
from .views import (
   DealKhuyenMaiView
)
urlpatterns = [
    path('khuyen-mai/', DealKhuyenMaiView.as_view(), name='deal-km'),
]

