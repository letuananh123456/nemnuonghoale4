from django.urls import path
from .views import (
   ClaimSupport,ClaimTukySupport,ClaimHealthSupport,ClaimCarSupport, ClaimHomeSupport, ClaimCriticalSupport, ClaimPersonalAccidentSupport
)
urlpatterns = [
    path('ho-tro-boi-thuong/', ClaimSupport.as_view(), name='claim-support-url'),
    path('ho-tro-boi-thuong/tu-ky/', ClaimTukySupport.as_view(), name='claim-tuky-support-url'),
    path('ho-tro-boi-thuong/suc-khoe/', ClaimHealthSupport.as_view(), name='claim-health-support-url'),
    path('ho-tro-boi-thuong/o-to/', ClaimCarSupport.as_view(), name='claim-oto-support-url'),
    path('ho-tro-boi-thuong/nha-tu-nhan/', ClaimHomeSupport.as_view(), name='claim-nhatunhan-support-url'),
    path('ho-tro-boi-thuong/benh-hiem-ngheo/', ClaimCriticalSupport.as_view(), name='claim-benhhiemngheo-support-url'),
    path('ho-tro-boi-thuong/tai-nan-ca-nhan/', ClaimPersonalAccidentSupport.as_view(), name='claim-tainancanhan-support-url'),
]

