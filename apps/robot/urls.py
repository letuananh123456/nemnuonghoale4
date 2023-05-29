from django.urls import path
from .views import (HomeApiViewRobot)

app_name = 'robot'


urlpatterns = [
    path('api-home-robot/', HomeApiViewRobot.as_view(), name="api_home_robot"),


]

