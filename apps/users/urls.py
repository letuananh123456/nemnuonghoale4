from django.urls import path
from apps.users.views import (
    LoginView, RegisterView, SettingUser, LogoutView,PhanHoiThayDoiTuyenTren,
    SettingThongBao, OderManagement, OTPView,ViewMenuMobile, Tutorial, ShowBvWalletApi,PhanHoiThayDiaDiemKinhDoanAPI,UserBihamaPlatformAPI,
    ElectronicWallet,UpdateInforUserCTV_API, feedback_lenh_rut_tien, BankAccount_CTVAPI, ThongBaoTroThanhCongTacVien,ForgotPassWord,OTPForGotPassWord
    )

urlpatterns = [
    path('dang-xuat/', LogoutView.as_view(), name='logout_url'),
    path('dang-nhap/', LoginView.as_view(), name='login_url'),
    path('dang-ky/', RegisterView.as_view(), name='register_url'),
    path('verify-account/', OTPView.as_view() , name='otp_verify'),
    path('cai-dat/', SettingUser.as_view(), name='user-setting'),
    path('cai-dat/order-management/', OderManagement.as_view(), name='order-management'),
    path('cai-dat/thong-bao', SettingThongBao.as_view(), name='setting-thongbao'),
    path('user-setting-mb/', ViewMenuMobile.as_view(), name='user-setting-mb-url'),
    path('electronic-wallet/', ElectronicWallet.as_view(), name='electronic-wallet-url'),
    path('tutorial/', Tutorial.as_view(), name='tutorial-url'),
    path('ctv-change-info-user/', UpdateInforUserCTV_API.as_view(),name='ctv-change-info-user'),
    path('create-bank-account-ctv/', BankAccount_CTVAPI.as_view(), name="create-bank-account-ctv"),
    path('feed-lenh-rut-tien/',feedback_lenh_rut_tien.as_view(),name='feedback_lenh_rut_tien'),
    path('show-bv-ctv/',ShowBvWalletApi.as_view(),name="show-bv-ctv"),
    path('ctv/feedback-dang-thanhcong-ki-ctv/',ThongBaoTroThanhCongTacVien.as_view(),name='feedback-dang-ki-ctv'),
    path('quen-matkhau/',ForgotPassWord.as_view(),name="forgot_passw"),
    path('lay-matkhau/',OTPForGotPassWord.as_view(),name="lay_matkhau"),
    path("phan-hoi-thay-doi-dia-diem-kd-api/", PhanHoiThayDiaDiemKinhDoanAPI.as_view()),
    path('update-create-user/',UserBihamaPlatformAPI.as_view(),name="update-create-user"),

]

