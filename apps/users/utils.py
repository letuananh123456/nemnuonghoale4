from django.utils import timezone
from apps.users.models import LoginHistory, User
import random
import math
import requests
from django.conf import settings
# from apps.investment.models import InvestCustomerSave
from django.conf import settings
# from apps.payment.models import PaymentDetail


def create_or_update_login_history(user_id):
    current_day = timezone.now()
    if LoginHistory.objects.filter(user_id=user_id).exists():
        user_login_day = LoginHistory.objects.filter(
            user_id=user_id
        ).order_by('-end_date').first()
        diff_date = current_day.date() - user_login_day.end_date
        if diff_date.days == 1:
            user_login_day.end_date = current_day.date()
            user_login_day.num_date = user_login_day.num_date + 1
            user_login_day.save()
        elif diff_date.days != 0:
            LoginHistory.objects.create(user_id=user_id)
    else:
        LoginHistory.objects.create(user_id=user_id)


def generate_otp_code():
    ## storing strings in a list
    digits = [i for i in range(0, 10)]
    random_str = ""
    for i in range(6):
        index = math.floor(random.random() * 10)
        random_str += str(digits[index])

    return random_str

def send_otp(phone_number, otp_code):
    sms = otp_code + " la ma xac thuc bihama cua ban"
    url_data = 'http://rest.esms.vn/MainService.svc/json/SendMultipleMessage_V4_post_json/'
    json_data={ 
        "ApiKey": settings.OTP_API_KEY,
        "Content": sms,
        "Phone": phone_number,
        "SecretKey": settings.OTP_SECRETKEY,
        "SmsType": "2",
        "Brandname": "Verify"
    }
    #print(json_data)
    r = requests.post(url_data, json=json_data)
    #print('response: ', r)
    #print('response data: ', r.content)
    #print('status sms api=', r.status_code)

    return r.status_code

def send_voic_call(phone_number, otp_code):
    # s = otp_code
    # voice = " ".join(s)
    # text_mes = "mã xác thực OTP của bạn là: " + voice
    url_data="http://voiceapi.esms.vn/MainService.svc/json/VoiceOTP?ApiKey="+settings.OTP_API_KEY+"&SecretKey="+settings.OTP_SECRETKEY+"&Phone="+phone_number+"&Code="+otp_code +"&Speed=-3&Voice=hatieumai"
    r = requests.get(url_data)
    return r.status_code

# def update_order_info_api(ma_hoa_don):
#     data = InvestCustomerSave.objects.filter(order_id=ma_hoa_don).last()
#     data_payment = PaymentDetail.objects.filter(ma_hoa_don=ma_hoa_don).last()
#     url= settings.PORTAL_RETURN_URL+"order_info_api/"
#     print(url)
#     json_data={
#         'ho':data.ho,
#         'tendem':data.tendem,
#         'ten':data.ten,
#         'so_dien_thoai':data.so_dien_thoai,
#         'email':data.email,
#         'ngay_sinh':data.ngay_sinh,
#         'thang_sinh':data.thang_sinh,
#         'nam_sinh':data.nam_sinh,
#         'gioi_tinh':data.gioi_tinh,    
#         'so_nam_hop_dong':data.so_nam_hop_dong,
#         'so_nam_dong_phi':data.so_nam_dong_phi,
#         'phuong_thuc_dong_phi':data.phuong_thuc_dong_phi,
#         'so_tien_dau_tu':data.so_tien_dau_tu,
#         'phuong_an_bao_ve':data.phuong_an_bao_ve,
#         'address':data.address,
#         'user_pick':data.user_pick.id,
#         'ma_hoa_don':data_payment.ma_hoa_don,
#         'so_tien':data_payment.so_tien,
#         'loai_san_pham':data_payment.loai_san_pham,
#         'so_dien_thoai':data_payment.so_dien_thoai,
#         'status':data_payment.ma_hoa_don,
#         'created_at':data_payment.created_at,
#         'vnp_TransactionNo':data_payment.vnp_TransactionNo,
#         'product_id':data_payment.product_id.id,
#         'order_status':data_payment.order_status
#         }
#     r = requests.post(url, json=json_data)
#     return r.status_code

def gen_link_infor(user_id):
    return 'BV'+str(user_id)

def get_data_user_register_ctv(id):
    data = dict()
    user = User.objects.get(id=id)
    data['username'] = user.username
    data['password'] = user.password
    data['fullname'] = user.fullname
    data['email'] = user.email
    data['images_user'] = user.images_user
    data['gender'] = user.gender
    data['birth_day'] = user.birth_day
    data['birth_month'] = user.birth_month
    data['birth_year'] = user.birth_year
    # if user.link_info is not None:
    #     data['code_invite'] = user.link_info[-10:]
    # else:
    if user.code_invite :
        data['link_invite'] = "https://www.bihama.vn/dang-ky/?ref="+user.code_invite
    else:
        data['link_invite'] = None
    if user.code_invite != "" and user.code_invite != None:
        data['code_invite'] = user.code_invite
    else:
        data['code_invite'] = None
    # data['register_ctv'] = True
    data['loai_hinh_muon_hop_tac'] = user.loai_hinh_muon_hop_tac
    data['dia_chi_tinh_thanh_pho'] = user.dia_chi_tinh_thanh_pho
    data['dia_chi_quan_huyen'] = user.dia_chi_quan_huyen
    data['dia_chi_chi_tiet'] = user.dia_chi_chi_tiet
    data['chung_chi_dai_ly'] = user.chung_chi_dai_ly
    data['so_chung_chi'] = user.so_chung_chi
    data['loai_hinh_bao_hiem_cua_chung_chi'] = user.loai_hinh_bao_hiem_cua_chung_chi
    return data


def data_updata_platform_bihama(password,username,email,ho_va_ten,gender,birth_day,birth_month,birth_year,link_info,code_invite,api_hope=1):
    data = dict()
    data["password"] = password
    data["username"] = username
    data["email"] = email
    data["ho_va_ten"] = ho_va_ten
    data["gender"] = gender
    data["birth_day"] = birth_day
    data["birth_month"] = birth_month
    data["birth_year"] = birth_year
    data["link_info"] = link_info
    data["code_invite"] = code_invite
    data["api_hope"] = api_hope
    return data