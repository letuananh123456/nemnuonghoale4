# from django.urls import path
# from apps.payment import views as vnpay_python_views
from django.urls import path, include
from . import views as payment_views
app_name = 'payment'

urlpatterns = [
    path("update-status-discount/", payment_views.UpdateTinhTrangMaGiamGia.as_view()),
    path("chuyen-khoan/", payment_views.ChuyenKhoan.as_view(), name='chuyen_khoan')

]
