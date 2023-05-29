from insecom.celery import app
from celery import shared_task
from .utils import get_info_dh_home
from apps.core.utils import get_request_hash_data
from apps.payment.models import DonDatHang
from django.conf import settings
import requests
from apps.payment import models as payment_models
import json



@app.task
def send_info_dhhome(id):
    donhang = payment_models.DonDatHang.objects.get(id=id)
    data = get_info_dh_home(id)
    print(json.dumps(data))
    hashdata = get_request_hash_data(data,settings.SECURITY_KEY_MANA_SAN)
    return
    url = settings.MANAGER_URL + "home/create-dh-homies/"
    print(json.dumps(hashdata))
    r = requests.post(url, json=hashdata)
    print(r.status_code)
    if r.status_code == 200:
        donhang.is_da_gui_manager = True
        donhang.save()

@shared_task
def filter_dhhome_chuagui_mana():
    ds = payment_models.DonDatHang.objects.filter(loai_hinh_bao_hiem=19, is_da_gui_manager=False)
    for obj in ds:
        send_info_dhhome.delay(obj.id)
