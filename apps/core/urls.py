from django.urls import path
from .views import (
   GetListItemProvincial,ThanhPhoAPIView,HuyenAPIView,PolicyView,IndexView, ComingSoon, MaGiamGiaManagerAPI,AddDataCtyApi,
   UpdateOrderManagerAPI,APICheckDiscountCore,ApiAddDataLinhvuc,ApiAddDataChiTietCongViec,ApiAddDataNoiDungNgheNghiep,
   ApiChangeLinhVucNN,ApiChangeNgheNghiep,TestView,ContactView, ThankYouFromBihamaView , UpdateDH_Tu_Manager ,PushImagesApi, PushImagesApi, RegisterBihamaPlatformAPI
)
urlpatterns = [
    # api tinh huyen
    path('', IndexView.as_view(), name='index_page'),
    path('api-list-provincial/', GetListItemProvincial.as_view(), name='api-list-provincial-url'),
    path('api-thanhpho/', ThanhPhoAPIView.as_view(), name='api-thanhpho'),
    path('api-huyen/', HuyenAPIView.as_view(), name='api-huyen'),
    #chinhsach
    path('policy/', PolicyView.as_view(), name='policy-url'),
    path('contact/', ContactView.as_view(), name='contact-url'),
    path('test/', TestView.as_view(), name='test-url'),
    path('coming-soon/', ComingSoon.as_view(), name='coming_soon_url'),
    path('api-create-discount/', MaGiamGiaManagerAPI.as_view(), name='api_create_mgg_url'),
    path('api-add-data-cty/', AddDataCtyApi.as_view(), name='api-add-data-cty-url'),
    path('api-update-order-manager/', UpdateOrderManagerAPI.as_view(), name="api_update_order-manager"),
    path('api-check-discount/', APICheckDiscountCore.as_view(), name='api-check-discount'),

    path('api-add-linhvuc/', ApiAddDataLinhvuc.as_view(), name='api-add-linhvuc'),
    path('api-add-ctcongviec/', ApiAddDataChiTietCongViec.as_view(), name='api-add-ctcongviec'),
    path('api-add-ndnghenghiep/', ApiAddDataNoiDungNgheNghiep.as_view(), name='api-add-ndnghenghiep'),
    path('api-change-linhvuc/', ApiChangeLinhVucNN.as_view(), name='api-change-linhvuc'),
    path('api-change-nghenghiep/', ApiChangeNgheNghiep.as_view(), name='api-change-nghenghiep'),
    # thankyou
    path('thank-you/', ThankYouFromBihamaView.as_view(), name='thank_you'),
    path('update-dh-tu-manager/', UpdateDH_Tu_Manager.as_view()),
    path('api-push-image-invest/', PushImagesApi.as_view(), name='api-push-image-invest'),
    path('api-base64-images/', PushImagesApi.as_view(), name='api-base64-images'),
    path('register-bihama-platform/', RegisterBihamaPlatformAPI.as_view(), name='register_bihama_platform'),

]

