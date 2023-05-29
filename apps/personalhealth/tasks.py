from __future__ import absolute_import, unicode_literals
import requests
from celery.utils.log import get_task_logger
from django.conf import settings
import time
from insecom.celery import app
from celery.schedules import crontab
from celery import shared_task
from .utils import get_data_dict_personalhealth
from apps.core.utils import get_request_hash_data
from apps.payment import models as payment_models
import json
_logger = get_task_logger(__name__)

@app.task
def gui_thong_tin_don_hang_per(id2):
    dic = get_data_dict_personalhealth(id2) 
    data = get_request_hash_data(dic, settings.SECURITY_KEY_MANA_SAN)
    print(json.dumps(data))
    url=settings.MANAGER_URL + "personalhealth/san-gui-thongtin-donhang-sang-mana/"
    r = requests.post(url, json=data)
    print(r.status_code)
    return
    if r.status_code == 200:
        donhang = payment_models.DonDatHang.objects.get(id=id2)
        donhang.is_da_gui_manager = True
        donhang.save()
        print("ok",donhang)
    else:
        print("fail") 

@shared_task
def thong_tin_don_hang_chua_gui():
    chua_gui = payment_models.DonDatHang.objects.filter(is_da_gui_manager = False , loai_hinh_bao_hiem = 6)
    print(chua_gui)
    for item in chua_gui:
        print("item")
        id2 = item.id
        gui_thong_tin_don_hang_per.delay(id2)

