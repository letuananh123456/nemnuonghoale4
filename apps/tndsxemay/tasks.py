from .utils import get_thong_tin_don_hang_tnxemay
from apps.core.utils import get_request_hash_data
# from datetime import datetime
from apps.payment.models import DonDatHang
from insecom.celery import app
from celery import shared_task
import json
from django.conf import settings
import requests


@app.task
def gui_thong_tin_dh_tndsxemay(id):
    dh = DonDatHang.objects.get(id=id)
    data = get_thong_tin_don_hang_tnxemay(id)
    hashdata = get_request_hash_data(data, secret_key=settings.SECURITY_KEY_MANA_SAN)
    url = settings.MANAGER_URL + "tndsxemay/create-dh-tndsxemay/"
    headers = {"Content-Type": "application/json"}
    print(json.dumps(hashdata))
    r = requests.post(url, json=hashdata, headers=headers)
    print(r.status_code)
    if r.status_code == 200:
        dh.is_da_gui_manager = True
        dh.save()

@shared_task
def filter_dh_tsdsxemay_chuagui_mana():
    ds_dh = DonDatHang.objects.filter(is_da_gui_manager=False, loai_hinh_bao_hiem=15)
    for obj in ds_dh:
        gui_thong_tin_dh_tndsxemay.delay(obj.id)