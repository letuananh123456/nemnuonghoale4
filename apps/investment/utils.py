from rest_framework.serializers import Serializer
import json
import numpy as np
from django.conf import settings
from datetime import date
from django.core.exceptions import ObjectDoesNotExist
from . import models as api_models
import collections
import pandas as pd
import os
from .models import GoiSanPhamChinh
from . import models as investment_models
from apps.core import models as core_models
from apps.payment import models as pm_models

# chú ý: số tiền đầu tư không được lớn hơn quá 6 lần tài khoản cơ bản, nếu muốn nhiều phải mua số tiền bảo hiểm cao
def minh_hoa_hop_dong(tuoi, gioi_tinh, so_tien_dau_tu, thoi_gian_dong_phi, so_tien_bao_hiem, lai_suat_minh_hoa):
    tuoi_bao_hiem = []
    a = tuoi - 1
    while a < 98:
        a += 1
        tuoi_bao_hiem.append(a)
    tuoi_bao_hiem_numpy = np.array(tuoi_bao_hiem)
    nam_hop_dong = []
    b = 99 - tuoi
    c = 0
    while c < b:
        c += 1
        nam_hop_dong.append(c)
    nam_hop_dong_numpy = np.array(nam_hop_dong)
    phi_dong_hang_nam = []
    k = 0
    a = tuoi - 1
    while a < 98:
        a += 1
        if a <= tuoi + thoi_gian_dong_phi - 1:
            phi_dong_hang_nam.append(so_tien_dau_tu)
        else:
            phi_dong_hang_nam.append(0)
    phi_dong_hang_nam_numpy = np.array(phi_dong_hang_nam)
    phi_bao_hiem_co_ban = []
    objects_ty_le_phi_nam_dau = GoiSanPhamChinh.objects.get(gioi_tinh = gioi_tinh, tuoi = tuoi)
    ty_le_phi_nam_dau = objects_ty_le_phi_nam_dau.so_phi_chinh_hang_nam
    so_tien_dong_hang_nam = np.around(ty_le_phi_nam_dau*so_tien_bao_hiem,0)
    m = 0
    while m < thoi_gian_dong_phi:
        m += 1
        phi_bao_hiem_co_ban.append(so_tien_dong_hang_nam)
    n = b - thoi_gian_dong_phi
    e = 0 
    while e < n:
        e += 1
        phi_bao_hiem_co_ban.append(0)
    phi_bao_hiem_co_ban_numpy = np.array(phi_bao_hiem_co_ban)
    phi_bao_hiem_dong_them = []
    if so_tien_dau_tu > so_tien_dong_hang_nam:
        x = 0
        while x < thoi_gian_dong_phi:
            x += 1
            phi_bao_hiem_dong_them.append(so_tien_dau_tu - so_tien_dong_hang_nam)
        l = 0
        while l < n:
            l += 1
            phi_bao_hiem_dong_them.append(0)
    else:
        y = 0
        while y < b:
            y += 1
            phi_bao_hiem_dong_them.append(0)
    phi_bao_hiem_dong_them_numpy = np.array(phi_bao_hiem_dong_them)
    phi_ban_dau = []
    total = GoiSanPhamChinh.objects.filter(gioi_tinh=gioi_tinh)
    ty_le_phi_ban_dau = total.values_list('phi_ban_dau_co_ban', flat=True)
    lis_ty_le_phi_ban_dau = [i for i in ty_le_phi_ban_dau]
    ty_le_phi_ban_dau_theo_nam_dong_phi = lis_ty_le_phi_ban_dau[0:thoi_gian_dong_phi]
    so_nam_con_lai = 99 - tuoi - thoi_gian_dong_phi
    list_so_nam_con_lai = []
    z = 0
    while z < so_nam_con_lai:
        z += 1
        list_so_nam_con_lai.append(0)
    total_ty_le_phi_ban_dau = ty_le_phi_ban_dau_theo_nam_dong_phi + list_so_nam_con_lai
    total_ty_le_phi_ban_dau_numpy = np.array(total_ty_le_phi_ban_dau)
    phi_ban_dau = np.around(phi_bao_hiem_co_ban_numpy*total_ty_le_phi_ban_dau_numpy)
    phi_ban_dau_numpy = np.array(phi_ban_dau)
    tai_khoan_co_ban_duoc_phan_bo = []
    tai_khoan_co_ban_duoc_phan_bo = phi_bao_hiem_co_ban_numpy - phi_ban_dau_numpy
    tai_khoan_co_ban_duoc_phan_bo_numpy = tai_khoan_co_ban_duoc_phan_bo
    tai_khoan_dong_them_duoc_phan_bo = []
    tai_khoan_dong_them_duoc_phan_bo = phi_bao_hiem_dong_them_numpy
    tai_khoan_dong_them_duoc_phan_bo_numpy = np.array(tai_khoan_dong_them_duoc_phan_bo)
    phi_quan_ly_hop_dong = []
    a = tuoi-1
    while a < 98:
        a += 1
        phi_quan_ly_hop_dong.append(360000)
    phi_quan_ly_hop_dong_numpy = np.array(phi_quan_ly_hop_dong)
    phi_BH_rui_ro = []
    b = 99 - tuoi
    c = 0
    while c < b:
        c += 1
        phi_BH_rui_ro.append(0)
    phi_BH_rui_ro_numpy = np.array(phi_BH_rui_ro)
    thuong_duy_tri_hop_dong = []
    b = 99 - tuoi
    c = 0
    while c < b:
        c += 1
        thuong_duy_tri_hop_dong.append(0)
    thuong_duy_tri_hop_dong_numpy = np.array(thuong_duy_tri_hop_dong)
    gia_tri_tai_khoan_co_ban = []
    b = 99 - tuoi
    c = 0
    while c < b:
        c += 1
        gia_tri_tai_khoan_co_ban.append(0)
    gia_tri_tai_khoan_co_ban_numpy = np.array(gia_tri_tai_khoan_co_ban)
    gia_tri_tai_khoan_dong_them = []
    b = 99 - tuoi
    c = 0
    while c < b:
        c += 1
        gia_tri_tai_khoan_dong_them.append(0)
    gia_tri_tai_khoan_dong_them_numpy = np.array(gia_tri_tai_khoan_dong_them)
    gia_tri_tai_khoan_hop_dong = []
    b = 99 - tuoi
    c = 0
    while c < b:
        c += 1
        gia_tri_tai_khoan_hop_dong.append(0)
    gia_tri_tai_khoan_hop_dong_numpy = np.array(gia_tri_tai_khoan_hop_dong)
    quyen_loi_bao_hiem = []
    b = 99 - tuoi
    c = 0
    while c < b:
        c += 1
        quyen_loi_bao_hiem.append(0)
    quyen_loi_bao_hiem_numpy = np.array(quyen_loi_bao_hiem)
    gia_tri_hoan_lai = []
    b = 99 - tuoi
    c = 0
    while c < b:
        c += 1
        gia_tri_hoan_lai.append(0)
    gia_tri_hoan_lai_numpy = np.array(gia_tri_hoan_lai)
    tai_khoan_dong_them_duoc_phan_bo[-1] = 0
    gia_tri_tai_khoan_dong_them[-1] = 0
    gia_tri_tai_khoan_co_ban[-1] = 0
    gia_tri_tai_khoan_hop_dong[-1] = 0
    quyen_loi_bao_hiem[-1] = so_tien_bao_hiem
    ab = 98 - tuoi
    cd = -1
    ty_le_phi_rui_ro_hang_nam = total.values_list('ty_le_phi_rui_ro_hang_nam', flat=True)
    lis_ty_le_phi_ban_dau = [i for i in ty_le_phi_rui_ro_hang_nam]
    ty_le_rui_ro_theo_nam_dong_phi = lis_ty_le_phi_ban_dau[tuoi:]
    while cd < ab:
        cd +=1
        gia_tri_tai_khoan_dong_them[cd] = np.around((gia_tri_tai_khoan_dong_them[cd -1] + tai_khoan_dong_them_duoc_phan_bo_numpy[cd])*(1+lai_suat_minh_hoa),0)
        quyen_loi_bao_hiem[cd] = np.around(so_tien_bao_hiem + gia_tri_tai_khoan_dong_them[cd],0)
        phi_BH_rui_ro[cd] = np.around(ty_le_rui_ro_theo_nam_dong_phi[cd]*(quyen_loi_bao_hiem[cd -1] - gia_tri_tai_khoan_hop_dong[cd -1]),0)
        gia_tri_tai_khoan_co_ban[cd] = np.around((gia_tri_tai_khoan_co_ban[cd - 1] + tai_khoan_co_ban_duoc_phan_bo[cd] - phi_quan_ly_hop_dong[cd] - phi_BH_rui_ro[cd])*(1+lai_suat_minh_hoa))
        if gia_tri_tai_khoan_co_ban[cd] <= 0:
            gia_tri_tai_khoan_co_ban[cd] = 0
        so_nam_tinh_thuong = thoi_gian_dong_phi//5
        if so_nam_tinh_thuong == 19:
            thuong_duy_tri_hop_dong[4] = np.around((sum(gia_tri_tai_khoan_co_ban[:5])//5)*0.05)
            thuong_duy_tri_hop_dong[9] = np.around((sum(gia_tri_tai_khoan_co_ban[5:10])//5)*0.05)
            thuong_duy_tri_hop_dong[14] = np.around((sum(gia_tri_tai_khoan_co_ban[10:15])//5)*0.05)
            thuong_duy_tri_hop_dong[19] = np.around((sum(gia_tri_tai_khoan_co_ban[15:20])//5)*0.1)
            thuong_duy_tri_hop_dong[24] = np.around((sum(gia_tri_tai_khoan_co_ban[20:25])//5)*0.02)
            thuong_duy_tri_hop_dong[29] = np.around((sum(gia_tri_tai_khoan_co_ban[25:30])//5)*0.02)
            thuong_duy_tri_hop_dong[34] = np.around((sum(gia_tri_tai_khoan_co_ban[30:35])//5)*0.02)
            thuong_duy_tri_hop_dong[39] = np.around((sum(gia_tri_tai_khoan_co_ban[35:40])//5)*0.02)
            thuong_duy_tri_hop_dong[44] = np.around((sum(gia_tri_tai_khoan_co_ban[40:45])//5)*0.02)
            thuong_duy_tri_hop_dong[49] = np.around((sum(gia_tri_tai_khoan_co_ban[45:50])//5)*0.02)
            thuong_duy_tri_hop_dong[54] = np.around((sum(gia_tri_tai_khoan_co_ban[50:55])//5)*0.02)
            thuong_duy_tri_hop_dong[59] = np.around((sum(gia_tri_tai_khoan_co_ban[55:60])//5)*0.02)
            thuong_duy_tri_hop_dong[64] = np.around((sum(gia_tri_tai_khoan_co_ban[60:65])//5)*0.02)
            thuong_duy_tri_hop_dong[69] = np.around((sum(gia_tri_tai_khoan_co_ban[65:70])//5)*0.02)
            thuong_duy_tri_hop_dong[74] = np.around((sum(gia_tri_tai_khoan_co_ban[70:75])//5)*0.02)
            thuong_duy_tri_hop_dong[79] = np.around((sum(gia_tri_tai_khoan_co_ban[75:80])//5)*0.02)
            thuong_duy_tri_hop_dong[84] = np.around((sum(gia_tri_tai_khoan_co_ban[80:85])//5)*0.02)
            thuong_duy_tri_hop_dong[89] = np.around((sum(gia_tri_tai_khoan_co_ban[85:90])//5)*0.02)
            thuong_duy_tri_hop_dong[94] = np.around((sum(gia_tri_tai_khoan_co_ban[90:95])//5)*0.02)
            gia_tri_tai_khoan_co_ban[cd] = np.around(np.around(gia_tri_tai_khoan_co_ban[cd] + thuong_duy_tri_hop_dong[cd]))
        elif so_nam_tinh_thuong == 18:
            thuong_duy_tri_hop_dong[4] = np.around((sum(gia_tri_tai_khoan_co_ban[:5])//5)*0.05)
            thuong_duy_tri_hop_dong[9] = np.around((sum(gia_tri_tai_khoan_co_ban[5:10])//5)*0.05)
            thuong_duy_tri_hop_dong[14] = np.around((sum(gia_tri_tai_khoan_co_ban[10:15])//5)*0.05)
            thuong_duy_tri_hop_dong[19] = np.around((sum(gia_tri_tai_khoan_co_ban[15:20])//5)*0.1)
            thuong_duy_tri_hop_dong[24] = np.around((sum(gia_tri_tai_khoan_co_ban[20:25])//5)*0.02)
            thuong_duy_tri_hop_dong[29] = np.around((sum(gia_tri_tai_khoan_co_ban[25:30])//5)*0.02)
            thuong_duy_tri_hop_dong[34] = np.around((sum(gia_tri_tai_khoan_co_ban[30:35])//5)*0.02)
            thuong_duy_tri_hop_dong[39] = np.around((sum(gia_tri_tai_khoan_co_ban[35:40])//5)*0.02)
            thuong_duy_tri_hop_dong[44] = np.around((sum(gia_tri_tai_khoan_co_ban[40:45])//5)*0.02)
            thuong_duy_tri_hop_dong[49] = np.around((sum(gia_tri_tai_khoan_co_ban[45:50])//5)*0.02)
            thuong_duy_tri_hop_dong[54] = np.around((sum(gia_tri_tai_khoan_co_ban[50:55])//5)*0.02)
            thuong_duy_tri_hop_dong[59] = np.around((sum(gia_tri_tai_khoan_co_ban[55:60])//5)*0.02)
            thuong_duy_tri_hop_dong[64] = np.around((sum(gia_tri_tai_khoan_co_ban[60:65])//5)*0.02)
            thuong_duy_tri_hop_dong[69] = np.around((sum(gia_tri_tai_khoan_co_ban[65:70])//5)*0.02)
            thuong_duy_tri_hop_dong[74] = np.around((sum(gia_tri_tai_khoan_co_ban[70:75])//5)*0.02)
            thuong_duy_tri_hop_dong[79] = np.around((sum(gia_tri_tai_khoan_co_ban[75:80])//5)*0.02)
            thuong_duy_tri_hop_dong[84] = np.around((sum(gia_tri_tai_khoan_co_ban[80:85])//5)*0.02)
            thuong_duy_tri_hop_dong[89] = np.around((sum(gia_tri_tai_khoan_co_ban[85:90])//5)*0.02)
            gia_tri_tai_khoan_co_ban[cd] = np.around(gia_tri_tai_khoan_co_ban[cd] + thuong_duy_tri_hop_dong[cd])
        elif so_nam_tinh_thuong == 17:
            thuong_duy_tri_hop_dong[4] = np.around((sum(gia_tri_tai_khoan_co_ban[:5])//5)*0.05)
            thuong_duy_tri_hop_dong[9] = np.around((sum(gia_tri_tai_khoan_co_ban[5:10])//5)*0.05)
            thuong_duy_tri_hop_dong[14] = np.around((sum(gia_tri_tai_khoan_co_ban[10:15])//5)*0.05)
            thuong_duy_tri_hop_dong[19] = np.around((sum(gia_tri_tai_khoan_co_ban[15:20])//5)*0.1)
            thuong_duy_tri_hop_dong[24] = np.around((sum(gia_tri_tai_khoan_co_ban[20:25])//5)*0.02)
            thuong_duy_tri_hop_dong[29] = np.around((sum(gia_tri_tai_khoan_co_ban[25:30])//5)*0.02)
            thuong_duy_tri_hop_dong[34] = np.around((sum(gia_tri_tai_khoan_co_ban[30:35])//5)*0.02)
            thuong_duy_tri_hop_dong[39] = np.around((sum(gia_tri_tai_khoan_co_ban[35:40])//5)*0.02)
            thuong_duy_tri_hop_dong[44] = np.around((sum(gia_tri_tai_khoan_co_ban[40:45])//5)*0.02)
            thuong_duy_tri_hop_dong[49] = np.around((sum(gia_tri_tai_khoan_co_ban[45:50])//5)*0.02)
            thuong_duy_tri_hop_dong[54] = np.around((sum(gia_tri_tai_khoan_co_ban[50:55])//5)*0.02)
            thuong_duy_tri_hop_dong[59] = np.around((sum(gia_tri_tai_khoan_co_ban[55:60])//5)*0.02)
            thuong_duy_tri_hop_dong[64] = np.around((sum(gia_tri_tai_khoan_co_ban[60:65])//5)*0.02)
            thuong_duy_tri_hop_dong[69] = np.around((sum(gia_tri_tai_khoan_co_ban[65:70])//5)*0.02)
            thuong_duy_tri_hop_dong[74] = np.around((sum(gia_tri_tai_khoan_co_ban[70:75])//5)*0.02)
            thuong_duy_tri_hop_dong[79] = np.around((sum(gia_tri_tai_khoan_co_ban[75:80])//5)*0.02)
            thuong_duy_tri_hop_dong[84] = np.around((sum(gia_tri_tai_khoan_co_ban[80:85])//5)*0.02)
            gia_tri_tai_khoan_co_ban[cd] = np.around(gia_tri_tai_khoan_co_ban[cd] + thuong_duy_tri_hop_dong[cd])
        elif so_nam_tinh_thuong == 16:
            thuong_duy_tri_hop_dong[4] = np.around((sum(gia_tri_tai_khoan_co_ban[:5])//5)*0.05)
            thuong_duy_tri_hop_dong[9] = np.around((sum(gia_tri_tai_khoan_co_ban[5:10])//5)*0.05)
            thuong_duy_tri_hop_dong[14] = np.around((sum(gia_tri_tai_khoan_co_ban[10:15])//5)*0.05)
            thuong_duy_tri_hop_dong[19] = np.around((sum(gia_tri_tai_khoan_co_ban[15:20])//5)*0.1)
            thuong_duy_tri_hop_dong[24] = np.around((sum(gia_tri_tai_khoan_co_ban[20:25])//5)*0.02)
            thuong_duy_tri_hop_dong[29] = np.around((sum(gia_tri_tai_khoan_co_ban[25:30])//5)*0.02)
            thuong_duy_tri_hop_dong[34] = np.around((sum(gia_tri_tai_khoan_co_ban[30:35])//5)*0.02)
            thuong_duy_tri_hop_dong[39] = np.around((sum(gia_tri_tai_khoan_co_ban[35:40])//5)*0.02)
            thuong_duy_tri_hop_dong[44] = np.around((sum(gia_tri_tai_khoan_co_ban[40:45])//5)*0.02)
            thuong_duy_tri_hop_dong[49] = np.around((sum(gia_tri_tai_khoan_co_ban[45:50])//5)*0.02)
            thuong_duy_tri_hop_dong[54] = np.around((sum(gia_tri_tai_khoan_co_ban[50:55])//5)*0.02)
            thuong_duy_tri_hop_dong[59] = np.around((sum(gia_tri_tai_khoan_co_ban[55:60])//5)*0.02)
            thuong_duy_tri_hop_dong[64] = np.around((sum(gia_tri_tai_khoan_co_ban[60:65])//5)*0.02)
            thuong_duy_tri_hop_dong[69] = np.around((sum(gia_tri_tai_khoan_co_ban[65:70])//5)*0.02)
            thuong_duy_tri_hop_dong[74] = np.around((sum(gia_tri_tai_khoan_co_ban[70:75])//5)*0.02)
            thuong_duy_tri_hop_dong[79] = np.around((sum(gia_tri_tai_khoan_co_ban[75:80])//5)*0.02)
            gia_tri_tai_khoan_co_ban[cd] = np.around(gia_tri_tai_khoan_co_ban[cd] + thuong_duy_tri_hop_dong[cd])
        elif so_nam_tinh_thuong == 15:
            thuong_duy_tri_hop_dong[4] = np.around((sum(gia_tri_tai_khoan_co_ban[:5])//5)*0.05)
            thuong_duy_tri_hop_dong[9] = np.around((sum(gia_tri_tai_khoan_co_ban[5:10])//5)*0.05)
            thuong_duy_tri_hop_dong[14] = np.around((sum(gia_tri_tai_khoan_co_ban[10:15])//5)*0.05)
            thuong_duy_tri_hop_dong[19] = np.around((sum(gia_tri_tai_khoan_co_ban[15:20])//5)*0.1)
            thuong_duy_tri_hop_dong[24] = np.around((sum(gia_tri_tai_khoan_co_ban[20:25])//5)*0.02)
            thuong_duy_tri_hop_dong[29] = np.around((sum(gia_tri_tai_khoan_co_ban[25:30])//5)*0.02)
            thuong_duy_tri_hop_dong[34] = np.around((sum(gia_tri_tai_khoan_co_ban[30:35])//5)*0.02)
            thuong_duy_tri_hop_dong[39] = np.around((sum(gia_tri_tai_khoan_co_ban[35:40])//5)*0.02)
            thuong_duy_tri_hop_dong[44] = np.around((sum(gia_tri_tai_khoan_co_ban[40:45])//5)*0.02)
            thuong_duy_tri_hop_dong[49] = np.around((sum(gia_tri_tai_khoan_co_ban[45:50])//5)*0.02)
            thuong_duy_tri_hop_dong[54] = np.around((sum(gia_tri_tai_khoan_co_ban[50:55])//5)*0.02)
            thuong_duy_tri_hop_dong[59] = np.around((sum(gia_tri_tai_khoan_co_ban[55:60])//5)*0.02)
            thuong_duy_tri_hop_dong[64] = np.around((sum(gia_tri_tai_khoan_co_ban[60:65])//5)*0.02)
            thuong_duy_tri_hop_dong[69] = np.around((sum(gia_tri_tai_khoan_co_ban[65:70])//5)*0.02)
            thuong_duy_tri_hop_dong[74] = np.around((sum(gia_tri_tai_khoan_co_ban[70:75])//5)*0.02)
            gia_tri_tai_khoan_co_ban[cd] = np.around(gia_tri_tai_khoan_co_ban[cd] + thuong_duy_tri_hop_dong[cd])
        elif so_nam_tinh_thuong == 14:
            thuong_duy_tri_hop_dong[4] = np.around((sum(gia_tri_tai_khoan_co_ban[:5])//5)*0.05)
            thuong_duy_tri_hop_dong[9] = np.around((sum(gia_tri_tai_khoan_co_ban[5:10])//5)*0.05)
            thuong_duy_tri_hop_dong[14] = np.around((sum(gia_tri_tai_khoan_co_ban[10:15])//5)*0.05)
            thuong_duy_tri_hop_dong[19] = np.around((sum(gia_tri_tai_khoan_co_ban[15:20])//5)*0.1)
            thuong_duy_tri_hop_dong[24] = np.around((sum(gia_tri_tai_khoan_co_ban[20:25])//5)*0.02)
            thuong_duy_tri_hop_dong[29] = np.around((sum(gia_tri_tai_khoan_co_ban[25:30])//5)*0.02)
            thuong_duy_tri_hop_dong[34] = np.around((sum(gia_tri_tai_khoan_co_ban[30:35])//5)*0.02)
            thuong_duy_tri_hop_dong[39] = np.around((sum(gia_tri_tai_khoan_co_ban[35:40])//5)*0.02)
            thuong_duy_tri_hop_dong[44] = np.around((sum(gia_tri_tai_khoan_co_ban[40:45])//5)*0.02)
            thuong_duy_tri_hop_dong[49] = np.around((sum(gia_tri_tai_khoan_co_ban[45:50])//5)*0.02)
            thuong_duy_tri_hop_dong[54] = np.around((sum(gia_tri_tai_khoan_co_ban[50:55])//5)*0.02)
            thuong_duy_tri_hop_dong[59] = np.around((sum(gia_tri_tai_khoan_co_ban[55:60])//5)*0.02)
            thuong_duy_tri_hop_dong[64] = np.around((sum(gia_tri_tai_khoan_co_ban[60:65])//5)*0.02)
            thuong_duy_tri_hop_dong[69] = np.around((sum(gia_tri_tai_khoan_co_ban[65:70])//5)*0.02)
            gia_tri_tai_khoan_co_ban[cd] = np.around(gia_tri_tai_khoan_co_ban[cd] + thuong_duy_tri_hop_dong[cd])
        elif so_nam_tinh_thuong == 13:
            thuong_duy_tri_hop_dong[4] = np.around((sum(gia_tri_tai_khoan_co_ban[:5])//5)*0.05)
            thuong_duy_tri_hop_dong[9] = np.around((sum(gia_tri_tai_khoan_co_ban[5:10])//5)*0.05)
            thuong_duy_tri_hop_dong[14] = np.around((sum(gia_tri_tai_khoan_co_ban[10:15])//5)*0.05)
            thuong_duy_tri_hop_dong[19] = np.around((sum(gia_tri_tai_khoan_co_ban[15:20])//5)*0.1)
            thuong_duy_tri_hop_dong[24] = np.around((sum(gia_tri_tai_khoan_co_ban[20:25])//5)*0.02)
            thuong_duy_tri_hop_dong[29] = np.around((sum(gia_tri_tai_khoan_co_ban[25:30])//5)*0.02)
            thuong_duy_tri_hop_dong[34] = np.around((sum(gia_tri_tai_khoan_co_ban[30:35])//5)*0.02)
            thuong_duy_tri_hop_dong[39] = np.around((sum(gia_tri_tai_khoan_co_ban[35:40])//5)*0.02)
            thuong_duy_tri_hop_dong[44] = np.around((sum(gia_tri_tai_khoan_co_ban[40:45])//5)*0.02)
            thuong_duy_tri_hop_dong[49] = np.around((sum(gia_tri_tai_khoan_co_ban[45:50])//5)*0.02)
            thuong_duy_tri_hop_dong[54] = np.around((sum(gia_tri_tai_khoan_co_ban[50:55])//5)*0.02)
            thuong_duy_tri_hop_dong[59] = np.around((sum(gia_tri_tai_khoan_co_ban[55:60])//5)*0.02)
            thuong_duy_tri_hop_dong[64] = np.around((sum(gia_tri_tai_khoan_co_ban[60:65])//5)*0.02)
            gia_tri_tai_khoan_co_ban[cd] = np.around(gia_tri_tai_khoan_co_ban[cd] + thuong_duy_tri_hop_dong[cd])
        elif so_nam_tinh_thuong == 12:
            thuong_duy_tri_hop_dong[4] = np.around((sum(gia_tri_tai_khoan_co_ban[:5])//5)*0.05)
            thuong_duy_tri_hop_dong[9] = np.around((sum(gia_tri_tai_khoan_co_ban[5:10])//5)*0.05)
            thuong_duy_tri_hop_dong[14] = np.around((sum(gia_tri_tai_khoan_co_ban[10:15])//5)*0.05)
            thuong_duy_tri_hop_dong[19] = np.around((sum(gia_tri_tai_khoan_co_ban[15:20])//5)*0.1)
            thuong_duy_tri_hop_dong[24] = np.around((sum(gia_tri_tai_khoan_co_ban[20:25])//5)*0.02)
            thuong_duy_tri_hop_dong[29] = np.around((sum(gia_tri_tai_khoan_co_ban[25:30])//5)*0.02)
            thuong_duy_tri_hop_dong[34] = np.around((sum(gia_tri_tai_khoan_co_ban[30:35])//5)*0.02)
            thuong_duy_tri_hop_dong[39] = np.around((sum(gia_tri_tai_khoan_co_ban[35:40])//5)*0.02)
            thuong_duy_tri_hop_dong[44] = np.around((sum(gia_tri_tai_khoan_co_ban[40:45])//5)*0.02)
            thuong_duy_tri_hop_dong[49] = np.around((sum(gia_tri_tai_khoan_co_ban[45:50])//5)*0.02)
            thuong_duy_tri_hop_dong[54] = np.around((sum(gia_tri_tai_khoan_co_ban[50:55])//5)*0.02)
            thuong_duy_tri_hop_dong[59] = np.around((sum(gia_tri_tai_khoan_co_ban[55:60])//5)*0.02)
            gia_tri_tai_khoan_co_ban[cd] = np.around(gia_tri_tai_khoan_co_ban[cd] + thuong_duy_tri_hop_dong[cd])
        elif so_nam_tinh_thuong == 11:
            thuong_duy_tri_hop_dong[4] = np.around((sum(gia_tri_tai_khoan_co_ban[:5])//5)*0.05)
            thuong_duy_tri_hop_dong[9] = np.around((sum(gia_tri_tai_khoan_co_ban[5:10])//5)*0.05)
            thuong_duy_tri_hop_dong[14] = np.around((sum(gia_tri_tai_khoan_co_ban[10:15])//5)*0.05)
            thuong_duy_tri_hop_dong[19] = np.around((sum(gia_tri_tai_khoan_co_ban[15:20])//5)*0.1)
            thuong_duy_tri_hop_dong[24] = np.around((sum(gia_tri_tai_khoan_co_ban[20:25])//5)*0.02)
            thuong_duy_tri_hop_dong[29] = np.around((sum(gia_tri_tai_khoan_co_ban[25:30])//5)*0.02)
            thuong_duy_tri_hop_dong[34] = np.around((sum(gia_tri_tai_khoan_co_ban[30:35])//5)*0.02)
            thuong_duy_tri_hop_dong[39] = np.around((sum(gia_tri_tai_khoan_co_ban[35:40])//5)*0.02)
            thuong_duy_tri_hop_dong[44] = np.around((sum(gia_tri_tai_khoan_co_ban[40:45])//5)*0.02)
            thuong_duy_tri_hop_dong[49] = np.around((sum(gia_tri_tai_khoan_co_ban[45:50])//5)*0.02)
            thuong_duy_tri_hop_dong[54] = np.around((sum(gia_tri_tai_khoan_co_ban[50:55])//5)*0.02)
            gia_tri_tai_khoan_co_ban[cd] = np.around(gia_tri_tai_khoan_co_ban[cd] + thuong_duy_tri_hop_dong[cd])
        elif so_nam_tinh_thuong == 10:
            thuong_duy_tri_hop_dong[4] = np.around((sum(gia_tri_tai_khoan_co_ban[:5])//5)*0.05)
            thuong_duy_tri_hop_dong[9] = np.around((sum(gia_tri_tai_khoan_co_ban[5:10])//5)*0.05)
            thuong_duy_tri_hop_dong[14] = np.around((sum(gia_tri_tai_khoan_co_ban[10:15])//5)*0.05)
            thuong_duy_tri_hop_dong[19] = np.around((sum(gia_tri_tai_khoan_co_ban[15:20])//5)*0.1)
            thuong_duy_tri_hop_dong[24] = np.around((sum(gia_tri_tai_khoan_co_ban[20:25])//5)*0.02)
            thuong_duy_tri_hop_dong[29] = np.around((sum(gia_tri_tai_khoan_co_ban[25:30])//5)*0.02)
            thuong_duy_tri_hop_dong[34] = np.around((sum(gia_tri_tai_khoan_co_ban[30:35])//5)*0.02)
            thuong_duy_tri_hop_dong[39] = np.around((sum(gia_tri_tai_khoan_co_ban[35:40])//5)*0.02)
            thuong_duy_tri_hop_dong[44] = np.around((sum(gia_tri_tai_khoan_co_ban[40:45])//5)*0.02)
            thuong_duy_tri_hop_dong[49] = np.around((sum(gia_tri_tai_khoan_co_ban[45:50])//5)*0.02)
            gia_tri_tai_khoan_co_ban[cd] = np.around(gia_tri_tai_khoan_co_ban[cd] + thuong_duy_tri_hop_dong[cd])
        elif so_nam_tinh_thuong == 9:
            thuong_duy_tri_hop_dong[4] = np.around((sum(gia_tri_tai_khoan_co_ban[:5])//5)*0.05)
            thuong_duy_tri_hop_dong[9] = np.around((sum(gia_tri_tai_khoan_co_ban[5:10])//5)*0.05)
            thuong_duy_tri_hop_dong[14] = np.around((sum(gia_tri_tai_khoan_co_ban[10:15])//5)*0.05)
            thuong_duy_tri_hop_dong[19] = np.around((sum(gia_tri_tai_khoan_co_ban[15:20])//5)*0.1)
            thuong_duy_tri_hop_dong[24] = np.around((sum(gia_tri_tai_khoan_co_ban[20:25])//5)*0.02)
            thuong_duy_tri_hop_dong[29] = np.around((sum(gia_tri_tai_khoan_co_ban[25:30])//5)*0.02)
            thuong_duy_tri_hop_dong[34] = np.around((sum(gia_tri_tai_khoan_co_ban[30:35])//5)*0.02)
            thuong_duy_tri_hop_dong[39] = np.around((sum(gia_tri_tai_khoan_co_ban[35:40])//5)*0.02)
            thuong_duy_tri_hop_dong[44] = np.around((sum(gia_tri_tai_khoan_co_ban[40:45])//5)*0.02)
            gia_tri_tai_khoan_co_ban[cd] = np.around(gia_tri_tai_khoan_co_ban[cd] + thuong_duy_tri_hop_dong[cd])
        elif so_nam_tinh_thuong == 8:
            thuong_duy_tri_hop_dong[4] = np.around((sum(gia_tri_tai_khoan_co_ban[:5])//5)*0.05)
            thuong_duy_tri_hop_dong[9] = np.around((sum(gia_tri_tai_khoan_co_ban[5:10])//5)*0.05)
            thuong_duy_tri_hop_dong[14] = np.around((sum(gia_tri_tai_khoan_co_ban[10:15])//5)*0.05)
            thuong_duy_tri_hop_dong[19] = np.around((sum(gia_tri_tai_khoan_co_ban[15:20])//5)*0.1)
            thuong_duy_tri_hop_dong[24] = np.around((sum(gia_tri_tai_khoan_co_ban[20:25])//5)*0.02)
            thuong_duy_tri_hop_dong[29] = np.around((sum(gia_tri_tai_khoan_co_ban[25:30])//5)*0.02)
            thuong_duy_tri_hop_dong[34] = np.around((sum(gia_tri_tai_khoan_co_ban[30:35])//5)*0.02)
            thuong_duy_tri_hop_dong[39] = np.around((sum(gia_tri_tai_khoan_co_ban[35:40])//5)*0.02)
            gia_tri_tai_khoan_co_ban[cd] = np.around(gia_tri_tai_khoan_co_ban[cd] + thuong_duy_tri_hop_dong[cd])
        elif so_nam_tinh_thuong == 7:
            thuong_duy_tri_hop_dong[4] = np.around((sum(gia_tri_tai_khoan_co_ban[:5])//5)*0.05)
            thuong_duy_tri_hop_dong[9] = np.around((sum(gia_tri_tai_khoan_co_ban[5:10])//5)*0.05)
            thuong_duy_tri_hop_dong[14] = np.around((sum(gia_tri_tai_khoan_co_ban[10:15])//5)*0.05)
            thuong_duy_tri_hop_dong[19] = np.around((sum(gia_tri_tai_khoan_co_ban[15:20])//5)*0.1)
            thuong_duy_tri_hop_dong[24] = np.around((sum(gia_tri_tai_khoan_co_ban[20:25])//5)*0.02)
            thuong_duy_tri_hop_dong[29] = np.around((sum(gia_tri_tai_khoan_co_ban[25:30])//5)*0.02)
            thuong_duy_tri_hop_dong[34] = np.around((sum(gia_tri_tai_khoan_co_ban[30:35])//5)*0.02)
            gia_tri_tai_khoan_co_ban[cd] = np.around(gia_tri_tai_khoan_co_ban[cd] + thuong_duy_tri_hop_dong[cd])
        elif so_nam_tinh_thuong == 6:
            thuong_duy_tri_hop_dong[4] = np.around((sum(gia_tri_tai_khoan_co_ban[:5])//5)*0.05)
            thuong_duy_tri_hop_dong[9] = np.around((sum(gia_tri_tai_khoan_co_ban[5:10])//5)*0.05)
            thuong_duy_tri_hop_dong[14] = np.around((sum(gia_tri_tai_khoan_co_ban[10:15])//5)*0.05)
            thuong_duy_tri_hop_dong[19] = np.around((sum(gia_tri_tai_khoan_co_ban[15:20])//5)*0.1)
            thuong_duy_tri_hop_dong[24] = np.around((sum(gia_tri_tai_khoan_co_ban[20:25])//5)*0.02)
            thuong_duy_tri_hop_dong[29] = np.around((sum(gia_tri_tai_khoan_co_ban[25:30])//5)*0.02)
            gia_tri_tai_khoan_co_ban[cd] = np.around(gia_tri_tai_khoan_co_ban[cd] + thuong_duy_tri_hop_dong[cd])
        elif so_nam_tinh_thuong == 5:
            thuong_duy_tri_hop_dong[4] = np.around((sum(gia_tri_tai_khoan_co_ban[:5])//5)*0.05)
            thuong_duy_tri_hop_dong[9] = np.around((sum(gia_tri_tai_khoan_co_ban[5:10])//5)*0.05)
            thuong_duy_tri_hop_dong[14] = np.around((sum(gia_tri_tai_khoan_co_ban[10:15])//5)*0.05)
            thuong_duy_tri_hop_dong[19] = np.around((sum(gia_tri_tai_khoan_co_ban[15:20])//5)*0.1)
            thuong_duy_tri_hop_dong[24] = np.around((sum(gia_tri_tai_khoan_co_ban[20:25])//5)*0.02)
            gia_tri_tai_khoan_co_ban[cd] = np.around(gia_tri_tai_khoan_co_ban[cd] + thuong_duy_tri_hop_dong[cd])
        elif so_nam_tinh_thuong == 4:
            thuong_duy_tri_hop_dong[4] = np.around((sum(gia_tri_tai_khoan_co_ban[:5])//5)*0.05)
            thuong_duy_tri_hop_dong[9] = np.around((sum(gia_tri_tai_khoan_co_ban[5:10])//5)*0.05)
            thuong_duy_tri_hop_dong[14] = np.around((sum(gia_tri_tai_khoan_co_ban[10:15])//5)*0.05)
            thuong_duy_tri_hop_dong[19] = np.around((sum(gia_tri_tai_khoan_co_ban[15:20])//5)*0.1)
            gia_tri_tai_khoan_co_ban[cd] = np.around(gia_tri_tai_khoan_co_ban[cd] + thuong_duy_tri_hop_dong[cd])
        elif so_nam_tinh_thuong == 3:
            thuong_duy_tri_hop_dong[4] = np.around((sum(gia_tri_tai_khoan_co_ban[:5])//5)*0.05)
            thuong_duy_tri_hop_dong[9] = np.around((sum(gia_tri_tai_khoan_co_ban[5:10])//5)*0.05)
            thuong_duy_tri_hop_dong[14] = np.around((sum(gia_tri_tai_khoan_co_ban[10:15])//5)*0.05)
            gia_tri_tai_khoan_co_ban[cd] = np.around(gia_tri_tai_khoan_co_ban[cd] + thuong_duy_tri_hop_dong[cd])
        elif so_nam_tinh_thuong == 2:
            thuong_duy_tri_hop_dong[4] = np.around((sum(gia_tri_tai_khoan_co_ban[:5])//5)*0.05)
            thuong_duy_tri_hop_dong[9] = np.around((sum(gia_tri_tai_khoan_co_ban[5:10])//5)*0.05)
            gia_tri_tai_khoan_co_ban[cd] = np.around(gia_tri_tai_khoan_co_ban[cd] + thuong_duy_tri_hop_dong[cd])
        elif so_nam_tinh_thuong == 1:
            thuong_duy_tri_hop_dong[4] = np.around((sum(gia_tri_tai_khoan_co_ban[:5])//5)*0.05)
            gia_tri_tai_khoan_co_ban[cd] = np.around(gia_tri_tai_khoan_co_ban[cd] + thuong_duy_tri_hop_dong[cd])
        gia_tri_tai_khoan_hop_dong[cd] = np.around(gia_tri_tai_khoan_co_ban[cd] + gia_tri_tai_khoan_dong_them[cd])
        if gia_tri_tai_khoan_hop_dong[cd] >= quyen_loi_bao_hiem[cd]:
            quyen_loi_bao_hiem[cd] = gia_tri_tai_khoan_hop_dong[cd]
        ty_le_phi_cham_dut_co_ban = total.values_list('phi_cham_dut_co_ban', flat=True)
        lis_ty_le_phi_cham_dut_co_ban = [i for i in ty_le_phi_cham_dut_co_ban]
        ty_le_cham_dut_co_ban_theo_nam_dong_phi = lis_ty_le_phi_cham_dut_co_ban
        ty_le_phi_cham_dut_dong_them = total.values_list('phi_cham_dut_dong_them', flat=True)
        lis_ty_le_phi_cham_dut_dong_them = [i for i in ty_le_phi_cham_dut_dong_them]
        ty_le_cham_dut_dong_them_theo_nam_dong_phi = lis_ty_le_phi_cham_dut_dong_them
        gia_tri_hoan_lai[cd] = np.around(gia_tri_tai_khoan_co_ban[cd]*(1-ty_le_cham_dut_co_ban_theo_nam_dong_phi[cd]) + gia_tri_tai_khoan_dong_them[cd]*(1-ty_le_cham_dut_dong_them_theo_nam_dong_phi[cd]))

    context = {
        'tuoibaohiem': tuoi_bao_hiem_numpy,
        'namhopdong': list(nam_hop_dong_numpy),
        'phi_dong_hang_nam': list(phi_dong_hang_nam_numpy),
        'phi_bao_hiem_co_ban': phi_bao_hiem_co_ban_numpy,
        'phi_bao_hiem_dong_them': phi_bao_hiem_dong_them_numpy,
        'phi_ban_dau': phi_ban_dau_numpy,
        'tai_khoan_co_ban_duoc_phan_bo': tai_khoan_co_ban_duoc_phan_bo_numpy,
        'tai_khoan_dong_them_duoc_phan_bo': tai_khoan_dong_them_duoc_phan_bo_numpy,
        'phi_quan_ly_hop_dong': phi_quan_ly_hop_dong_numpy,
        'phi_BH_rui_ro': phi_BH_rui_ro,
        'gia_tri_tai_khoan_co_ban': gia_tri_tai_khoan_co_ban,
        'thuong_duy_tri_hop_dong': thuong_duy_tri_hop_dong,
        'gia_tri_tai_khoan_dong_them': gia_tri_tai_khoan_dong_them,
        'gia_tri_tai_khoan_hop_dong': gia_tri_tai_khoan_hop_dong,
        'gia_tri_hoan_lai': gia_tri_hoan_lai,
        'quyen_loi_bao_hiem': quyen_loi_bao_hiem,
    }
    return context



def get_data_orderinvestment(id):
    dh = pm_models.DonDatHang.objects.get(id=id)
    ndbh = investment_models.NguoiDuocBaoHiem.objects.get(nguoimuabaohiem=dh.nguoimuabaohiem)
    nth = investment_models.NguoiThuHuong.objects.filter(nguoiduocbaohiem=ndbh)
    data_dict = dict()


    data_dict["fullname"] = dh.nguoimuabaohiem.fullname
    data_dict["username"] = dh.nguoimuabaohiem.username
    data_dict["birth_day"] = dh.nguoimuabaohiem.birth_day
    data_dict["birth_month"] = dh.nguoimuabaohiem.birth_month
    data_dict["birth_year"] = dh.nguoimuabaohiem.birth_year
    data_dict["gioi_tinh"] = dh.nguoimuabaohiem.gioi_tinh
    data_dict["email"] = dh.nguoimuabaohiem.email
    data_dict["dia_chi_tinh_thanh_pho"] = dh.nguoimuabaohiem.dia_chi_tinh_thanh_pho
    data_dict["dia_chi_quan_huyen"] = dh.nguoimuabaohiem.dia_chi_quan_huyen 
    data_dict["dia_chi_chi_tiet"] = dh.nguoimuabaohiem.dia_chi_chi_tiet
    data_dict["so_cmnd"] = dh.nguoimuabaohiem.so_cmnd
    data_dict["images_cmt_mattruoc"] = dh.nguoimuabaohiem.images_cmt_mattruoc
    data_dict["images_cmt_matsau"] = dh.nguoimuabaohiem.images_cmt_matsau
    data_dict["cmt_ngay_cap"] = dh.nguoimuabaohiem.cmt_ngay_cap.strftime('%Y-%m-%d')
    data_dict["cmt_noi_cap"] = dh.nguoimuabaohiem.cmt_noi_cap
    if dh.nguoimuabaohiem.ngay_hieu_luc is not None:
        data_dict["ngay_hieu_luc_nguoimua"] = dh.nguoimuabaohiem.ngay_hieu_luc.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    else:
        data_dict["ngay_hieu_luc_nguoimua"] = None
    if dh.nguoimuabaohiem.ngay_ket_thuc is not None:
        data_dict["ngay_ket_thuc_nguoimua"] = dh.nguoimuabaohiem.ngay_ket_thuc.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    else:
        data_dict["ngay_ket_thuc_nguoimua"] = None
    data_dict["ho_ten_nhan"] = dh.nguoimuabaohiem.ho_ten_nhan
    data_dict["email_nhan"] = dh.nguoimuabaohiem.email_nhan
    data_dict["so_dien_thoai_nhan"] = dh.nguoimuabaohiem.so_dien_thoai_nhan
    data_dict["dia_chi_tinh_thanh_pho_nhan"] = dh.nguoimuabaohiem.dia_chi_tinh_thanh_pho_nhan
    data_dict["dia_chi_quan_huyen_nhan"] = dh.nguoimuabaohiem.dia_chi_quan_huyen_nhan
    data_dict["dia_chi_chi_tiet_nhan"] = dh.nguoimuabaohiem.dia_chi_chi_tiet_nhan
    data_dict["status_marriage"] = dh.nguoimuabaohiem.status_marriage
    data_dict["job"] = dh.nguoimuabaohiem.job 
    data_dict["weight"] = dh.nguoimuabaohiem.weight
    data_dict["height"] = dh.nguoimuabaohiem.height
    data_dict["nationality"] = dh.nguoimuabaohiem.nationality
    data_dict["nationality_paper"] = dh.nguoimuabaohiem.nationality_paper 
    data_dict["create_at_nguoimua"] = dh.nguoimuabaohiem.created_at.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    data_dict["code_invite"] = dh.user.code_invite
    data_dict["register_ctv"] = dh.user.register_ctv

    data_dict["loai_hinh_bao_hiem"] = dh.loai_hinh_bao_hiem
    data_dict["cong_ty"] = dh.cong_ty
    data_dict["goi_san_pham"] = dh.goi_san_pham_chinh
    data_dict["goi_san_pham_phu"] = dh.goi_san_pham_phu
    data_dict["so_phi_chinh"] = str(dh.so_phi_chinh)
    data_dict["so_phi_phu"] = str(dh.tong_so_phi_phu )
    data_dict["so_phi_VAT"] = str(dh.so_phi_VAT )
    data_dict["tong_phi_thanh_toan"] = str(dh.tong_phi_thanh_toan)
    data_dict["tong_phi_thanh_toan_sau_giam_gia"] = str(dh.tong_phi_thanh_toan_sau_giam_gia)
    data_dict["loai_thanh_toan"] = dh.loai_thanh_toan 
    data_dict["ma_don_hang_bihama"] = dh.ma_don_hang_bihama
    data_dict["tinh_trang_don_dat_hang"] = dh.tinh_trang_don_dat_hang  
    data_dict["ma_giao_dich_cong_thanh_toan"] = dh.ma_giao_dich_cong_thanh_toan
    data_dict["tinh_trang_thanh_toan_cong_thanh_toan"] = dh.tinh_trang_thanh_toan_cong_thanh_toan  
    data_dict["magiamgia"] = dh.code_ma_giam_gia
    data_dict["create_at_dh"] = dh.created_at.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    data_dict["loaihopdong"] = dh.loai_hop_dong
    data_dict["is_tai_tuc"] = dh.is_tai_tuc

    data_dict["username_ndbh"] = ndbh.username
    data_dict["fullname_ndbh"] = ndbh.fullname
    data_dict["birth_day_ndbh"] = ndbh.birth_day
    data_dict["birth_month_ndbh"] = ndbh.birth_month
    data_dict["birth_year_ndbh"] = ndbh.birth_year
    data_dict["gioi_tinh_ndbh"] = ndbh.gioi_tinh
    data_dict["email_ndbh"] = ndbh.email
    data_dict["dia_chi_tinh_thanh_pho_ndbh"] = ndbh.dia_chi_tinh_thanh_pho
    data_dict["dia_chi_quan_huyen_ndbh"] = ndbh.dia_chi_quan_huyen
    data_dict["dia_chi_chi_tiet_ndbh"] = ndbh.dia_chi_chi_tiet
    data_dict["so_cmnd_ndbh"] = ndbh.so_cmnd
    data_dict["images_cmt_mattruoc_ndbh"] = ndbh.images_cmt_mattruoc
    data_dict["images_cmt_matsau_ndbh"] = ndbh.images_cmt_matsau
    data_dict["cmt_ngay_cap_ndbh"] = ndbh.cmt_ngay_cap.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    data_dict["cmt_noi_cap_ndbh"] = ndbh.cmt_noi_cap
    if ndbh.ngay_hieu_luc is not None:
        data_dict["ngay_hieu_luc_ndbh"] = ndbh.ngay_hieu_luc.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    else:
        data_dict["ngay_hieu_luc_ndbh"] = None
    if ndbh.ngay_ket_thuc is not None:
        data_dict["ngay_ket_thuc_ndbh"] = ndbh.ngay_ket_thuc.strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    else:
        data_dict["ngay_ket_thuc_ndbh"] = None
    data_dict["cau_hoi_suc_khoe_1_ndbh"] = ndbh.cau_hoi_suc_khoe_1
    data_dict["cau_hoi_suc_khoe_2_ndbh"] = ndbh.cau_hoi_suc_khoe_2
    data_dict["cau_hoi_suc_khoe_3_ndbh"] = ndbh.cau_hoi_suc_khoe_3
    data_dict["cau_hoi_suc_khoe_4_ndbh"] = ndbh.cau_hoi_suc_khoe_4
    data_dict["cau_hoi_suc_khoe_5_ndbh"] = ndbh.cau_hoi_suc_khoe_5
    data_dict["cau_hoi_suc_khoe_6_ndbh"] = ndbh.cau_hoi_suc_khoe_6
    data_dict["cau_hoi_suc_khoe_7_ndbh"] = ndbh.cau_hoi_suc_khoe_7
    data_dict["cau_hoi_suc_khoe_8_ndbh"] = ndbh.cau_hoi_suc_khoe_8
    data_dict["status_marriage_ndbh"] = ndbh.status_marriage
    data_dict["so_tien_bao_hiem_ndbh"] = ndbh.so_tien_bao_hiem
    data_dict["so_nam_hop_dong_ndbh"] = ndbh.so_nam_hop_dong
    data_dict["so_nam_dong_phi_ndbh"] = ndbh.so_nam_dong_phi
    data_dict["cach_tra_phi_ndbh"] = ndbh.cach_tra_phi
    data_dict["dinh_ky_dong_phi_ndbh"] = ndbh.dinh_ky_dong_phi
    data_dict["job_ndbh"] = ndbh.job
    data_dict["weight_ndbh"] = ndbh.weight
    data_dict["height_ndbh"] = ndbh.height
    data_dict["nationality_ndbh"] = ndbh.nationality
    data_dict["nationality_paper_ndbh"] = ndbh.nationality_paper
    data_dict["is_smoke_ndbh"] = ndbh.is_smoke
    data_dict["relationship_ndbh"] = ndbh.relationship
    data_dict["created_at_ndbh"] = ndbh.created_at.strftime('%Y-%m-%dT%H:%M:%S.%fZ')

    list_nth = list()
    for obj in nth:
        dict_nth = dict()
        dict_nth["fullname"] = obj.fullname
        dict_nth["birth_day"] = obj.birth_day
        dict_nth["birth_month"] = obj.birth_month
        dict_nth["birth_year"] = obj.birth_year
        dict_nth["gioi_tinh"] = obj.gioi_tinh
        dict_nth["so_cmnd"] = obj.so_cmnd
        dict_nth["images_cmt_mattruoc"] = obj.images_cmt_mattruoc
        dict_nth["images_cmt_matsau"] = obj.images_cmt_matsau
        dict_nth["cmt_ngay_cap"] = obj.cmt_ngay_cap.strftime('%Y-%m-%d')
        dict_nth["cmt_noi_cap"] = obj.cmt_noi_cap
        dict_nth["relationship"] = obj.relationship
        dict_nth["ty_le_thu_huong"] = obj.ty_le_thu_huong
        list_nth.append(dict_nth)
    data_dict['dsnth'] = list_nth
    return data_dict


