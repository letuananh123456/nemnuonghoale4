from django.urls import path
from .views import (
   InfoEducationView,EducationCompare,EducationRobot
)
urlpatterns = [
    path('giao-duc/', InfoEducationView.as_view(), name='education'),
    path('so-sanh-giao-duc/', EducationCompare.as_view(), name='education-compare-url'),
]

