from django.urls import path
from .views import (
    KienThucView, AddDataKienThucAPI   
)
urlpatterns = [
    path('<category>/<slug:slug>/', KienThucView.as_view(), name='kien_thuc_url'),
    path('add-data-kienthuc/', AddDataKienThucAPI.as_view(), name='add_data_kienthuc'),

]

