from django.contrib import admin
from .models import DonDatHang, MaGiamGia, TaiTuc
from import_export.admin import ImportExportModelAdmin
from import_export import resources
# Register your models here.

class DonDatHangResource(resources.ModelResource):
    class Meta:
        model = DonDatHang


class MaGiamGiaResource(resources.ModelResource):
    class Meta:
        model = MaGiamGia

class TaiTucResource(resources.ModelResource):
    class Meta:
        model = TaiTuc

class DonDatHangAdmin(ImportExportModelAdmin):
    list_display = ('id', 'loai_hinh_bao_hiem', 'cong_ty', 'goi_san_pham_chinh', 'goi_san_pham_phu','so_phi_chinh','tong_so_phi_phu','so_phi_VAT','tong_phi_thanh_toan','tong_phi_thanh_toan_sau_giam_gia','created_at', 'loai_thanh_toan', 'ma_don_hang_bihama', 'tinh_trang_don_dat_hang', 'ma_giao_dich_cong_thanh_toan', 'tinh_trang_thanh_toan_cong_thanh_toan','code_ma_giam_gia', 'user', 'nguoimuabaohiem', 'is_da_gui_manager','is_da_gui_cong_thanh_toan','ma_hop_dong','link_giay_chung_nhan')
    resource_class = DonDatHangResource


class MaGiamGiaAdmin(ImportExportModelAdmin):
    list_display = ('id', 'loai_hinh_bao_hiem', 'cong_ty', 'goi_san_pham', 'ngay_hieu_luc','ngay_ket_thuc', 'discount', 'code_ma_giam_gia', 'is_su_dung')
    resource_class = MaGiamGiaResource


class TaiTucAdmin(ImportExportModelAdmin):
    list_display = ('id', 'dondathang', 'ma_tai_tuc_bihama', 'cach_tra_phi', 'dinh_ky_dong_phi','ky_dong_phi', 'so_tien', 'created_at')
    resource_class = TaiTucResource



admin.site.register(DonDatHang, DonDatHangAdmin)
admin.site.register(MaGiamGia, MaGiamGiaAdmin)
admin.site.register(TaiTuc, TaiTucAdmin)