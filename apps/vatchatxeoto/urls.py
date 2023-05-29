from django.urls import path
from .views import (
   VatchatxeotoCarDetail,VatchatxeotoCarMucDichSuDong,VatchatxeotoCarInfoChoHangXe,VatchatxeotoCarDongXe,VatchatxeotoCarInfoCus,
   VatchatxeotoCompareCarProductView,VatchatxeotoDetailCarInfo,VatchatxeotoCarPayment

)
app_name = 'vatchatxeoto'
urlpatterns = [
    path('bien-so/', VatchatxeotoCarDetail.as_view(), name='vcxot-o-to-view'),
    path('muc-dich/', VatchatxeotoCarMucDichSuDong.as_view(), name='vcxot-o-to-muc-dich-dung'),
    path('muc-dich/car-info', VatchatxeotoCarInfoChoHangXe.as_view(), name='vcxot-car-info'),
    path('muc-dich/car-dongxe', VatchatxeotoCarDongXe.as_view(), name='vcxot-car-dongxe'),
    path('muc-dich/car-info-cus', VatchatxeotoCarInfoCus.as_view(), name='vcxot-car-info-cus'),
    # path('mua-bao-hiem-o-to/', InfoCarView.as_view(), name='bb-buycar'),
    path('so-sanh/', VatchatxeotoCompareCarProductView.as_view(), name='vcxot-compare'),
    path('detail-car/', VatchatxeotoDetailCarInfo.as_view(), name='vcxot-detail-car'),
    path('payment-car/', VatchatxeotoCarPayment.as_view(), name='vcxot-payment-car'),
]

