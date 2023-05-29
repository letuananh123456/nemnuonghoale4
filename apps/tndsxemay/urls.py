from django.urls import path
from .views import (
   TNDSXeMayQuest1,TNDSXeMayCompareProduct,TNDSXeMayPrepayment,ChangeLoaiXeMayAPI,PushSpcTNDSXeMay,AddDataTndsXeMay

)
app_name = 'tndsxemay'
urlpatterns = [
    path('nem-nuong-thit-lon/', TNDSXeMayQuest1.as_view(), name='thong-tin-xe-may'),
    path('san-pham-bao-hiem-tndsxemay/', TNDSXeMayCompareProduct.as_view(), name='san-pham-bao-hiem-tndsxemay'),
    path('thong-tin-nhan-bao-hiem-tndsxemay/', TNDSXeMayPrepayment.as_view(), name='thong-tin-nhan-bao-hiem-tndsxemay'),
    #api
    path('change-loai-xe/', ChangeLoaiXeMayAPI.as_view(), name='change-loai-xe'),
    path('api-push-spc-tnds-xe-may/', PushSpcTNDSXeMay.as_view(), name='api-push-spc-tnds-xe-may'),
    path('api-add-spc-tndsxemay/', AddDataTndsXeMay.as_view(), name='api-add-tndsxemay'),


]

