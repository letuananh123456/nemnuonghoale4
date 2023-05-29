
from apps.personalhealth.tasks import gui_thong_tin_don_hang_per
from apps.tndsxemay.tasks import gui_thong_tin_dh_tndsxemay
from apps.tndsoto.tasks import gui_thong_tin_dh_tndsoto
from apps.homeinsurance.tasks import send_info_dhhome
from apps.termlife.tasks import gui_thong_tin_dh_termlife
from apps.investment.tasks import gui_thong_tin_dh_investment



def send_mana_by_loaihinh(id,loai_hinh_bh):
    if loai_hinh_bh == 6:
        gui_thong_tin_don_hang_per.delay(id)
    elif loai_hinh_bh == 15:
        gui_thong_tin_dh_tndsxemay.delay(id)
    elif loai_hinh_bh == 13:
        gui_thong_tin_dh_tndsoto.delay(id)
    elif loai_hinh_bh == 19:
        send_info_dhhome.delay(id)
    elif loai_hinh_bh == 1:
        gui_thong_tin_dh_termlife.delay(id)
    elif loai_hinh_bh == 2:
        gui_thong_tin_dh_investment.delay(id)
    else:
        return False