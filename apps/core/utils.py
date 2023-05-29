from __future__ import print_function
from rest_framework.serializers import Serializer
import locale
import json
import hashlib
from django.utils import timezone
from datetime import timedelta
import requests
from apps.core.models import GoogleVision
import json
import base64
import os
from datetime import datetime
from django.conf import settings
from django.shortcuts import redirect
import os.path
# from googleapiclient.discovery import build
# from google_auth_oauthlib.flow import InstalledAppFlow
# from google.auth.transport.requests import Request
# from google.oauth2.credentials import Credentials
# from google_auth_oauthlib import flow
# from google_auth_oauthlib.flow import Flow
# import httplib2


def convert_price_to_string(price):
    return f"{price:,}"


def validate_data(schema_cls: Serializer, data: dict) -> dict:
    """Validate data using Marshmallow schema
    Return validated data if success, raise ValidationError if failed
    """
    schema = schema_cls(data=data)
    schema.is_valid(raise_exception=True)
    return schema.validated_data


def h__md5(input):
    byteInput = input.encode('utf-8')
    return hashlib.sha256(byteInput).hexdigest()


def get_request_hash_data(data_dict, secret_key):
    hash_value = data_dict
    data = json.dumps(data_dict)
    hashValue = h__md5(secret_key + data)
    hash_value['secret'] = hashValue
    return hash_value


def validate_response(data_dict, secret_key):
    secure_hash = data_dict.pop('secret')
    data = json.dumps(data_dict)
    hashValue = h__md5(secret_key + data)
    return secure_hash == hashValue


def loai_hop_dong(user, total_money, loai_hinh_bao_hiem):
    if user.link_info == '' or user.link_info == None:
        if user.code_invite == '' or user.code_invite == None:
            loai_hop_dong = 0       # hop dong vang lai
        elif user.code_invite != '' or user.code_invite != None:
            loai_hop_dong = 1       # hop dong marketing
    elif user.link_info != "" and user.link_info != None:
        loai_hop_dong = 2           # hop dong ban le
    return loai_hop_dong


def check_ma_giam_gia(tk, loai_hinh_bao_hiem, cong_ty, goi_san_pham):
    current_day = timezone.now()
    today_phathanh = current_day.date() - tk.ngay_hieu_luc
    ketthuc_today = tk.ngay_ket_thuc - current_day.date()
    if today_phathanh < timedelta(days=0) or ketthuc_today < timedelta(days=0):
        check = False
    else:
        if tk.loai_hinh_bao_hiem == loai_hinh_bao_hiem and tk.cong_ty == cong_ty and tk.goi_san_pham == goi_san_pham:
            if tk.is_su_dung > 0:
                check = True
            else:
                check = False
        elif tk.loai_hinh_bao_hiem == 100 and tk.cong_ty == 100 and tk.goi_san_pham == 100:
            if tk.is_su_dung > 0:
                check = True
            else:
                check = False
        elif tk.loai_hinh_bao_hiem == 100 and tk.cong_ty == cong_ty and tk.goi_san_pham == goi_san_pham:
            if tk.is_su_dung > 0:
                check = True
            else:
                check = False
        elif tk.loai_hinh_bao_hiem == loai_hinh_bao_hiem and tk.cong_ty == 100 and tk.goi_san_pham == goi_san_pham:
            if tk.is_su_dung > 0:
                check = True
            else:
                check = False
        elif tk.loai_hinh_bao_hiem == loai_hinh_bao_hiem and tk.cong_ty == cong_ty and tk.goi_san_pham == 100:
            if tk.is_su_dung > 0:
                check = True
            else:
                check = False
        elif tk.loai_hinh_bao_hiem == loai_hinh_bao_hiem and tk.cong_ty == 100 and tk.goi_san_pham == 100:
            if tk.is_su_dung > 0:
                check = True
            else:
                check = False
        elif tk.loai_hinh_bao_hiem == 100 and tk.cong_ty == cong_ty and tk.goi_san_pham == 100:
            if tk.is_su_dung > 0:
                check = True
            else:
                check = False
        elif tk.loai_hinh_bao_hiem == 100 and tk.cong_ty == 100 and tk.goi_san_pham == goi_san_pham:
            if tk.is_su_dung > 0:
                check = True
            else:
                check = False
        else:
            check = False
    return check


def get_data_dict_model(model_intanse):
    # hàm này truyền vào 1 object được query từ db ra bằng câu lệnh
    # MODEL.objects.get(id=id)
    model_dict = model_intanse.__dict__
    model_dict.pop('_state')
    return model_dict


def convert_sex(sex_gt):
    if sex_gt == 1:
        sex_gt = "Bà"
    elif sex_gt == 2:
        sex_gt = "Ông"
    else:
        sex_gt = ""
    return sex_gt


def ttdon_hang(ttdh):
    if ttdh == 1:
        ttdhang = "Chờ duyệt đơn"
    elif ttdh == 0:
        ttdhang = "Đơn hàng lỗi"
    elif ttdh == 2:
        ttdhang = "Đã phát hành hợp đồng"
    elif ttdh == 3:
        ttdhang = "Đã ACK"
    elif ttdh == 4:
        ttdhang = "Đã hủy đơn"
    else:
        ttdhang = ""
    return ttdhang


def cty_bh(ttdh):
    if ttdh == 1:
        ttdhang = "Công ty VBI"
    elif ttdh == 2:
        ttdhang = "Công ty Fubon"
    elif ttdh == 3:
        ttdhang = "Công ty Opes"
    else:
        ttdhang = ""
    return ttdhang


def loai_hinh_bao_hiem(ttdh):
    if ttdh == 19:
        ttdhang = "Bảo hiểm Nhà tư nhân"
    elif ttdh == 1:
        ttdhang = "Bảo hiểm Tử kỳ"
    elif ttdh == 2:
        ttdhang = "Bảo hiểm Đầu tư"
    elif ttdh == 6:
        ttdhang = "Bảo hiểm Sức khỏe cá nhân"
    elif ttdh == 15:
        ttdhang = "Bảo hiểm TNDS bắt buộc xe máy"
    elif ttdh == 13:
        ttdhang = "Bảo hiểm TNDS bắt buộc ô tô"
    else:
        ttdhang = ""
    return ttdhang


def goi_san_pham_chinh(ttdh, lhbh):
    if ttdh == 1 and lhbh == 19:
        ttdhang = "Giá trị căn nhà"
    elif ttdh == 2 and lhbh == 19:
        ttdhang = "Tài sản bên trong"
    else:
        ttdhang = ""
    return ttdhang


def access_token_google():
    url = "https://oauth2.googleapis.com/token"
    data = dict()
    data["code"] = "4/3gF0K0EGlX77wa7EunOdo3CCuYNpjkDJmwNesGgBPHUluLqb1dDa_yZ97R6ys_xYsVO1ZXVxHyEaC1ILIeZu_E0"
    data["client_id"] = "130846271073-sraihc8aac5883mo2564usit9oas544n.apps.googleusercontent.com"
    data["client_secret"] = "7cmtm991pqR77_I63ScN1NKM"
    data["redirect_uri"] = "https://www.bihama.vn"
    data["grant_type"] = "authorization_code"
    r = requests.post(url, data=data)
    if r.status_code == 200:
        data_reponse = json.loads(r.content[""])
        current_day = datetime.now() + timedelta(seconds=data["expires_in"])
        GoogleVision.objects.create(access_token=data["access_token"],expires_in=current_day,scope=data["scope"],token_type=data["token_type"])
    print(r.content)


def refresh_token():
    url = "https://oauth2.googleapis.com/token"
    data = dict()
    data["client_id"] = "130846271073-sraihc8aac5883mo2564usit9oas544n.apps.googleusercontent.com"
    data["client_secret"] = "7cmtm991pqR77_I63ScN1NKM"
    data["refresh_token"] = "1//0e1w2yDBaEU8zCgYIARAAGA4SNwF-L9IrSbOSoCQYw-Qyh-N940XZ11AsC0bmzJsmhv3ctc1a9mzlD5KhOUD8xPB_mjPU0lLsMP8"
    data["grant_type"] = "refresh_token"
    r = requests.post(url, data=data)
    data = json.loads(r.content)
    if r.status_code == 200:
        data = json.loads(r.content)
        current_day = datetime.now() + timedelta(seconds=data["expires_in"])
        GoogleVision.objects.create(access_token=data["access_token"],expires_in=current_day,scope=data["scope"],token_type=data["token_type"])


def post_data(string_base64=""):
    url = "https://vision.googleapis.com/v1/images:annotate"
    data =  {
        "requests": [
            {
                "image": {
                    "content": string_base64
                },
                "features": [
                    {
                        "type": "TEXT_DETECTION"
                    }
                ]
            }
        ]
    }

    access_token = GoogleVision.objects.all().last().access_token
    headers = {"Authorization":"Bearer {}".format(access_token)}
    r = requests.post(url, json=data, headers=headers)
    if r.status_code == 401:
        refresh_token()
        r = requests.post(url, json=data, headers=headers)
    return json.loads(r.content)

def check_sotien(s):
    s_split = s.split(',')
    return all( i.isnumeric() for i in s_split) , int(''.join(s_split))
# PATH_IMAGE = os.path.join(settings.STATICFILES_DIRS[0] , "core/images/back1.jpg")
# with open(PATH_IMAGE, "rb") as image_file:
#     encoded_string = base64.b64encode(image_file.read()).decode('utf-8')


def filterCharacter(listDetect1):
    listDetect=listDetect1[:-1].replace('.','').replace(',','').split('\n')
    socmt=name=ngaysinh=diachi=""
    del listDetect[0:3]
    if ('Nơi thường trú:' in listDetect[len(listDetect)-1]) and (len(listDetect[len(listDetect)-1])>15):
            diachi=listDetect[len(listDetect)-1][15:]
    elif ('Nơi thường trú' in listDetect[len(listDetect)-1]) and (len(listDetect[len(listDetect)-1])>14):
        diachi=listDetect[len(listDetect)-1][14:]
    elif ('Nai thuờng trù' in listDetect[len(listDetect)-1]) and (len(listDetect[len(listDetect)-1])>14):
        diachi=listDetect[len(listDetect)-1][14:]
    elif ('Nai thuờng trù:' in listDetect[len(listDetect)-1]) and (len(listDetect[len(listDetect)-1])>15):
        diachi=listDetect[len(listDetect)-1][15:]

    elif ('Nơi thường trú:' in listDetect[len(listDetect)-2]) and (len(listDetect[len(listDetect)-2])>15):
        diachi=listDetect[len(listDetect)-2][15:]
    elif ('Nơi thường trú' in listDetect[len(listDetect)-2]) and (len(listDetect[len(listDetect)-2])>14):
        diachi=listDetect[len(listDetect)-2][14:]
    elif ('Nai thuờng trù' in listDetect[len(listDetect)-2]) and (len(listDetect[len(listDetect)-2])>14):
        diachi=listDetect[len(listDetect)-2][14:]
    elif ('Nai thuờng trù:' in listDetect[len(listDetect)-2]) and (len(listDetect[len(listDetect)-2])>15):
        diachi=listDetect[len(listDetect)-2][15:]

    elif ('Nơi thường trú:' in listDetect[len(listDetect)-3]) and (len(listDetect[len(listDetect)-3])>15):
        diachi=listDetect[len(listDetect)-3][15:]
    elif ('Nơi thường trú' in listDetect[len(listDetect)-3]) and (len(listDetect[len(listDetect)-3])>14):
        diachi=listDetect[len(listDetect)-3][14:]
    elif ('Nai thuờng trù' in listDetect[len(listDetect)-3]) and (len(listDetect[len(listDetect)-3])>14):
        diachi=listDetect[len(listDetect)-3][14:]
    elif ('Nai thuờng trù:' in listDetect[len(listDetect)-3]) and (len(listDetect[len(listDetect)-3])>15):
        diachi=listDetect[len(listDetect)-3][15:]

    elif ('Nơi thường trú:' in listDetect[len(listDetect)-4]) and (len(listDetect[len(listDetect)-4])>15):
        diachi=listDetect[len(listDetect)-4][15:]
    elif ('Nơi thường trú' in listDetect[len(listDetect)-4]) and (len(listDetect[len(listDetect)-4])>14):
        diachi=listDetect[len(listDetect)-4][14:]
    elif ('Nai thuờng trù' in listDetect[len(listDetect)-4]) and (len(listDetect[len(listDetect)-4])>14):
        diachi=listDetect[len(listDetect)-4][14:]
    elif ('Nai thuờng trù:' in listDetect[len(listDetect)-4]) and (len(listDetect[len(listDetect)-4])>15):
        diachi=listDetect[len(listDetect)-4][15:]

    for it in listDetect:
        if '/' and 'Có' in it:
            listDetect.pop(listDetect.index(it))
        if it.isnumeric() and len(it)>11:
            socmt=it
        elif ("Số:" in it or "SỐ:" in it) and len(it)>=13 and len(it)<=11:
            socmt=it[-9:]
        elif ("Số:" in it or "SỐ:" in it) and len(it)>14:
            socmt=it[-12:]
        elif it.isnumeric() and len(it)<10:
            socmt=it
        if 'NGUYỄN' in it or 'TRẦN' in it  or 'LÊ' in it  or 'PHẠM' in it  or 'HOÀNG' in it  or 'HUỲNH' in it or 'PHAN' in it or 'VŨ' in it or 'VÕ' in it or 'ĐẶNG' in it or 'BÙI' in it or 'ĐỖ' in it or 'HỒ' in it or 'NGÔ' in it or 'DƯƠNG' in it or 'LÝ' in it or 'PHÍ' in it or 'ĐÀO' in it or 'ĐOÀN' in it or 'VƯƠNG' in it or 'TRỊNH' in it or 'TRƯƠNG' in it or 'ĐINH' in it or 'PHÙNG' in it or 'MAI' in it or 'TÔ' in it or 'LÂM' in it or 'HÀ' in it or 'TẠ' in it or 'THÂN' in it or 'TRÁC' in it or 'TỐNG' in it or 'HOA' in it or 'KHÚC' in it or 'TỪ' in it or 'THƯỜNG' in it or 'TIÊU' in it or 'KIM' in it or 'DIỆP' in it:
            name=it

        if '/' in it and len(it)>9:
            ngaysinh=it[-10:]
        elif '-' in it and len(it)>9:
            ngaysinh=it[-10:]

    if '/' in listDetect[len(listDetect)-1]:
        listDetect.pop(len(listDetect)-1)
    quanhuyen=listDetect[len(listDetect)-1]

    datangaysinh=[]
    if  '/' in  ngaysinh:
        datangaysinh=ngaysinh.split('/')
    elif  '-' in  ngaysinh:
        datangaysinh=ngaysinh.split('-')
    data={'socmt':socmt, 'name':name, 'ngaysinh': datangaysinh, 'address':diachi, 'quanhuyen':quanhuyen}
    return data
