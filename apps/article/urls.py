from django.urls import path
from .views import (
   Articles,ArticleDetail,AddDataTinTuc
)
urlpatterns = [
    path('tin-tuc/', Articles.as_view(), name='articles1-url'),
    path('tin-tuc/<slug:slug>/',ArticleDetail.as_view(), name='article_detail_slug'),
    path('add-data-tin-tuc/',AddDataTinTuc.as_view(), name='add-data-tin-tuc'),

]

