from django.urls import path
from .views import (
   InfoPersonalhealthView,ComapreHealth,CopperHealthVBI,SilverHealthVBI,
   TitaniumHealthVBI,GoldHealthVBI,PlatinumHealthVBI,DiamonHealthVBI,Personalpayment,
   ComaprePrepayment,APIPersonHealthDataFamily,
   APIPersonHealthPushChangeGoi,GoiSanPhamChinhAPIView,GoiSanPhamPhuAPIView,APIPersonHealthPushSPP,APIPushArrSppPersonhealth,APIPushSpcPersonhealth
)
urlpatterns = [
   path('xoi-thit-lon/', InfoPersonalhealthView.as_view(), name='personalhealth'),
   path('compare-health/', ComapreHealth.as_view(), name='compare_health_url'),
   # goi sp vbi
   path('copperhealth-oder-VBI/', CopperHealthVBI.as_view(), name='copper-health-oder_url'),
   path('silverhealth-oder-VBI/', SilverHealthVBI.as_view(), name='silver-health-oder_url'),
   path('titaniumhealth-oder-VBI/', TitaniumHealthVBI.as_view(), name='titanium-health-oder_url'),
   path('goldhealth-oder-VBI/', GoldHealthVBI.as_view(), name='gold-health-oder_url'),
   path('platinumhealth-oder-VBI/', PlatinumHealthVBI.as_view(), name='platinum-health-oder_url'),
   path('diamondhealth-oder-VBI/', DiamonHealthVBI.as_view(), name='diamond-health-oder_url'),
    # detail payment personalhealth
   path('comapre-prepayment/', ComaprePrepayment.as_view(),name='comapre_prepayment_url'),
   path('personalpayment/', Personalpayment.as_view(), name='personalpayment_url'),
    # api personalhealth
   path('api-personhealth-data-family/', APIPersonHealthDataFamily.as_view(), name='api-personhealth-data-family'),
   path('api_push_change_goi/', APIPersonHealthPushChangeGoi.as_view(), name='api_push_change_goi'),
   path('api-insert_goisanphamchinh-SKCN/', GoiSanPhamChinhAPIView.as_view(), name='api-insert_goibaohiem'),
   path('api-insert-goisanphamphu-SKCN/', GoiSanPhamPhuAPIView.as_view(), name='api-insert_phispc'),
   path('api-change-goispp/', APIPersonHealthPushSPP.as_view(), name='api-change-goispp/'),
   path('api-push-arr-goispp/', APIPushArrSppPersonhealth.as_view(), name='api-push-arr-goispp/'),
   path('api-push-spc/', APIPushSpcPersonhealth.as_view(), name='api-push-spc/'),

]

