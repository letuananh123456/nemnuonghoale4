# from __future__ import absolute_import, unicode_literals
# from datetime import timedelta
# import requests
# from celery import shared_task
# from celery.utils.log import get_task_logger
# from django.conf import settings
# import time
# from insecom.celery import app
# import requests
# # from apps.homeinsurance.models import HomeProducts
# # from apps.homeinsurance.models import HomeInsurancesSave
# from apps.payment.models import DonDatHang

# _logger = get_task_logger(__name__)


# # @app.task
# # def api_order_home_success(ma_hoa_don):
# #     print('resssssssss=')
# #     data = HomeInsurancesSave.objects.get(order_id=ma_hoa_don)
# #     data_payment = PaymentDetail.objects.get(ma_hoa_don=ma_hoa_don)

# #     url= settings.PORTAL_QL_RETURN_URL+"api-order-home-success/"
# #     print(url)
# #     json_data={
# #         'home_type':data.home_type,
# #         'construction_value':data.construction_value,
# #         'home_age':data.home_age,
# #         'thanh_pho':data.thanh_pho,
# #         'huyen':data.huyen,
# #         'address':data.address,
# #         'sex':data.sex,
# #         'full_name':data.full_name,
# #         'email':data.email,
# #         'phone':data.phone,
# #         'ngaysinh':data.ngaysinh,
# #         'thangsinh':data.thangsinh,
# #         'namsinh':data.namsinh,
# #         'address_nguoimua':data.address_nguoimua,
# #         'money_home':data.money_home,
# #         'money_inhome':data.money_inhome,
# #         'sonamhopdong':data.sonamhopdong,
# #         'select_them':data.select_them,
# #         'money_has_vat':data.money_has_vat,

# #         'ma_hoa_don':data_payment.ma_hoa_don,
# #         'so_tien':data_payment.so_tien,
# #         'loai_san_pham':data_payment.loai_san_pham,
# #         'so_dien_thoai':data_payment.so_dien_thoai,
# #         'status':data_payment.ma_hoa_don,
# #         'created_at':data_payment.created_at,
# #         'vnp_TransactionNo':data_payment.vnp_TransactionNo,
# #         'product_id':data_payment.product_id.id,
# #         'order_status':data_payment.order_status,
# #         }
# #     r = requests.post(url, json=json_data)
# #     print(r.status_code)
# #     print(r)
# #     print("adsadadd")
# #     print(json_data)
# #     return r.status_code


# @app.task
# def send_request_update_info(data_dict):
#     ma = data_dict['ma_don_hang_bihama']
#     re = requests.get("http://dummy.restapiexample.com/api/v1/employees")
#     donhang = DonDatHang.objects.get(ma_don_hang_bihama=ma)
#     if re.status_code == 200:
#         donhang.is_da_gui_manager = True
#     else:
#         donhang.is_da_gui_manager = False
