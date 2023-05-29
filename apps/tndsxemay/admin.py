from django.contrib import admin
from .models import NguoiDuocBaoHiemTam, NguoiDuocBaoHiem, GoiSanPhamChinh, GoiSanPhamPhu
from import_export.admin import ImportExportModelAdmin
from import_export import resources
# Register your models here.



class NguoiDuocBaoHiemResource(resources.ModelResource):
    class Meta:
        model = NguoiDuocBaoHiem

class NguoiDuocBaoHiemTamResource(resources.ModelResource):
    class Meta:
        model = NguoiDuocBaoHiemTam


class NguoiDuocBaoHiemTamAdmin(ImportExportModelAdmin):
    list_display = ('id', 'nguoimuabaohiemtam', 'bien_so_xe', 'loai_xe','so_tien_bao_hiem_tnds_tu_nguyen','so_cho_tai_nan_nguoi_tren_xe', 'so_tien_bao_hiem_tai_nan_nguoi_tren_xe','so_tien_bao_hiem_chay_no', 'images_dangky_mattruoc', 'images_dangky_matsau', 'ngay_hieu_luc', 'ngay_ket_thuc')
    resource_class = NguoiDuocBaoHiemTamResource


class NguoiDuocBaoHiemAdmin(ImportExportModelAdmin):
    list_display = ('id', 'nguoimuabaohiem', 'ma_don_hang_bihama', 'bien_so_xe','loai_xe', 'ngay_hieu_luc', 'ngay_ket_thuc','created_at')
    resource_class = NguoiDuocBaoHiemResource


class GoiSanPhamChinhAdmin(admin.ModelAdmin):
    list_display = ('id', 'company', 'ten_loai_hinh_bao_hiem', 'id_loai_hinh_bao_hiem','ten_loai_xe','id_loai_xe','so_phi_chinh')


class GoiSanPhamPhuAdmin(admin.ModelAdmin):
    list_display = ('id', 'company', 'ten_loai_hinh_bao_hiem', 'id_loai_hinh_bao_hiem','ten_goi_san_pham_phu','id_goi_san_pham_phu','so_phi_phu')




admin.site.register(NguoiDuocBaoHiemTam, NguoiDuocBaoHiemTamAdmin)
admin.site.register(NguoiDuocBaoHiem, NguoiDuocBaoHiemAdmin)
admin.site.register(GoiSanPhamChinh, GoiSanPhamChinhAdmin)
admin.site.register(GoiSanPhamPhu, GoiSanPhamPhuAdmin)
