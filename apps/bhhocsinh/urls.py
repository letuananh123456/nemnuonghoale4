from django.urls import path
from .views import (
   TNDSTNCarDetail,TNDSTNCarMucDichSuDong,TNDSTNCarInfoChoHangXe,TNDSTNCarDongXe,TNDSTNCarInfoCus,
   TNDSTNCompareCarProductView,TNDSTNDetailCarInfo,TNDSTNGetCompareProductCar,TNDSTNCarPayment

)
app_name = 'tndstnoto'
urlpatterns = [
    path('bien-so/', TNDSTNCarDetail.as_view(), name='tndstn-o-to-view'),
    path('muc-dich/', TNDSTNCarMucDichSuDong.as_view(), name='tndstn-o-to-muc-dich-dung'),
    path('muc-dich/car-info', TNDSTNCarInfoChoHangXe.as_view(), name='tndstn-car-info'),
    path('muc-dich/car-dongxe', TNDSTNCarDongXe.as_view(), name='tndstn-car-dongxe'),
    path('muc-dich/car-info-cus', TNDSTNCarInfoCus.as_view(), name='tndstn-car-info-cus'),
    # path('mua-bao-hiem-o-to/', InfoCarView.as_view(), name='bb-buycar'),
    path('so-sanh/', TNDSTNCompareCarProductView.as_view(), name='tndstn-compare'),
    path('detail-car/', TNDSTNDetailCarInfo.as_view(), name='tndstn-detail-car'),
    path('payment-car/', TNDSTNCarPayment.as_view(), name='tndstn-payment-car'),
]

