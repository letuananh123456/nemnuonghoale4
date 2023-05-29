from __future__ import absolute_import, unicode_literals

from datetime import timedelta
import requests
from celery import shared_task
from celery.utils.log import get_task_logger
from django.conf import settings
import time
from insecom.celery import app
from celery.schedules import crontab
from celery import shared_task
_logger = get_task_logger(__name__)
from apps.users.models import User
from apps.core.utils import get_request_hash_data
from .models import BankAccount, LenhRutTien
from datetime import datetime
from .utils import get_data_user_register_ctv
import json
import base64
import os


# update pw sang portal
@app.task
def send_update_password_infor_portal(fullname,images_user,gender,birth_day,birth_month,birth_year,link_info,email,password):
    data_user = dict()
    data_user["fullname"] = fullname
    data_user["images_user"] = images_user
    data_user["gender"] = gender
    data_user["birth_day"] = birth_day
    data_user["birth_month"] = birth_month
    data_user["birth_year"] = birth_year
    data_user["link_info"] = link_info
    data_user["email"] = email
    data_user["password"] = password

    data = get_request_hash_data(data_user, settings.SECURITY_KEY_CTV_SAN)
    url = settings.PORTAL_URL+"users/change-password-san-api/"
    r = requests.post(url,json=data)
    if r.status_code==200:
        print(r.status_code)
    else:
        print("err")

# update is_ctv sang manager
@app.task
def send_update_register_manager(username,register_ctv):
    data_user = dict()
    data_user["username"] = username
    data_user["register_ctv"] = register_ctv
    data = get_request_hash_data(data_user, settings.SECURITY_KEY_MANA_SAN)
    print(data)
    url = settings.MANAGER_URL+"core/cap-nhat-register-ben-san/"
    r = requests.post(url,json=data)
    print(r.status_code)

@app.task
def gui_lenh_rut_tien_sang_mana(id):
    lrt = LenhRutTien.objects.get(id=id)
    data = dict()
    data["stk"] = lrt.bank_account.bank_number
    data["amount_withdraw"] = lrt.amount_withdraw
    data["nguon"] = 1
    data["created_at"] = lrt.created_at.strftime("%Y-%m-%d %H:%M:%S.%f")
    data2 = dict(data)
    hashdata = get_request_hash_data(data,settings.SECURITY_KEY_MANA_SAN)
    url = settings.MANAGER_URL + "quanlycongtacvien/create-lenh-rut-tien/"
    r = requests.post(url, json=hashdata)
    if r.status_code == 200:
        lrt.is_da_gui_mana = True
        lrt.save()
    hashdata2 = get_request_hash_data(data2,settings.SECURITY_KEY_CTV_SAN)
    url1 = settings.PORTAL_URL + "vitien/create-lenh-rut-tien-san/"
    r = requests.post(url1, json=hashdata2)
    if r.status_code == 200:
        lrt.is_da_gui_ctv = True
        lrt.save()


@shared_task
def filter_lenh_rut_tien_chua_duyet():
    ds = LenhRutTien.objects.filter(is_da_gui_mana=False)
    for obj in ds:
        gui_lenh_rut_tien_sang_mana.delay(obj.id)

@app.task
def gui_info_register_ctv(id):
    u = User.objects.get(id=id)
    data = get_data_user_register_ctv(id)
    hashdata = get_request_hash_data(data,settings.SECURITY_KEY_MANA_SAN)
    print(json.dumps(hashdata))
    url = settings.MANAGER_URL + "quanlycongtacvien/user-register-ctv/"
    # url = "http://portal.bihama.vn/users/create-ctv/"
    return 
    r = requests.post(url, json=hashdata)
    print(r.status_code)
    if r.status_code==200:
        u.is_gui_register = True
        u.save()

@shared_task
def filter_user_register_ctv_chua_gui_mana():
    ds = User.objects.filter(is_gui_register=False, register_ctv=True)
    print(ds)
    for obj in ds:
        gui_info_register_ctv.delay(obj.id)


@app.task
def create_or_update_info_user_taichinh(data):
    data_hash = get_request_hash_data(data, settings.SECURITY_KEY_TAICHINH_SAN)
    url = settings.TAICHINH_URL + "update-create-user"
    headers = {"Content-Type":"appilication/json"}
    reponse = requests.request("POST", url, data=data_hash, headers=headers)
    print(reponse.content, reponse.status_code)


@app.task
def create_or_update_info_user_yte(data):
    data_hash = get_request_hash_data(data, settings.SECURITY_KEY_YTE_SAN)
    url = settings.YTE_URL + "update-create-user/"
    headers = {"Content-Type":"appilication/json"}
    reponse = requests.request("POST", url, data=data_hash, headers=headers)
    print(reponse.content, reponse.status_code)
    