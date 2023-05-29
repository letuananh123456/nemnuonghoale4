from insecom.celery import app
from celery import shared_task
from .utils import get_thong_tin_don_hang_tndsoto
import requests
from apps.payment.models import DonDatHang
from apps.core.utils import get_request_hash_data
from django.conf import settings
import json

@app.task
def gui_thong_tin_dh_tndsoto(id):
    dh = DonDatHang.objects.get(id=id)
    data = get_thong_tin_don_hang_tndsoto(id)
    url = settings.MANAGER_URL + "tndsoto/create-dh-tndsoto/"
    headers = {"Content-Type": "application/json"}
    hashvalue = get_request_hash_data(data,secret_key=settings.SECURITY_KEY_MANA_SAN)
    print(json.dumps(hashvalue))
    r = requests.post(url, json=hashvalue, headers=headers)
    print( r.status_code)
    print(r.url)
    if r.status_code == 200:
        dh.is_da_gui_manager = True
        dh.save()

@shared_task
def filter_dh_tndsoto_chuagui_mana():
    ds = DonDatHang.objects.filter(loai_hinh_bao_hiem=13, is_da_gui_manager=False )
    for obj in ds:
        gui_thong_tin_dh_tndsoto.delay(obj.id)
