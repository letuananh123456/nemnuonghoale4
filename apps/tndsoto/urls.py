from django.urls import path
from .views import (
   TNDSOtoQuest1,TNDSOtoCompareProduct,TNDSOtoPrepayment,AddDataTndsOto,ChangeTrongTaiAPI,PushSpcTNDSOto

)
app_name = 'tndsoto'
urlpatterns = [
    path('xoi-thit-bo/', TNDSOtoQuest1.as_view(), name='thong-tin-o-to'),
    path('san-pham-bao-hiem-tndsoto/', TNDSOtoCompareProduct.as_view(), name='san-pham-bao-hiem-tndsoto'),
    path('thong-tin-nhan-bao-hiem-tndsoto/', TNDSOtoPrepayment.as_view(), name='thong-tin-nhan-bao-hiem-tndsoto'),
    #api
    path('change-trong-tai/', ChangeTrongTaiAPI.as_view(), name='change-trong-tai'),
    path('api-push-spc-tnds-oto/', PushSpcTNDSOto.as_view(), name='api-push-spc-tnds-oto'),
    path('api-add-spc-tndsoto/', AddDataTndsOto.as_view(), name='api-add-tndsoto'),



]
