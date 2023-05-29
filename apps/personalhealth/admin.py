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
    list_display = ('id', 'nguoimuabaohiemtam', 'username', 'fullname', 'birth_day', 'birth_month','birth_year', 'gioi_tinh', 'email', 'dia_chi_tinh_thanh_pho', 'dia_chi_quan_huyen', 'dia_chi_chi_tiet', 'so_cmnd','images_cmt_mattruoc','images_cmt_matsau', 'cmt_ngay_cap', 'cmt_noi_cap', 'ngay_hieu_luc', 'ngay_ket_thuc', 'cau_hoi_suc_khoe_1', 'cau_hoi_suc_khoe_2', 'chi_tiet_benh_tat', 'relationship')
    resource_class = NguoiDuocBaoHiemTamResource


class NguoiDuocBaoHiemAdmin(ImportExportModelAdmin):
    list_display = ('id', 'nguoimuabaohiem', 'username', 'fullname', 'birth_day', 'birth_month','birth_year', 'gioi_tinh', 'email', 'dia_chi_tinh_thanh_pho', 'dia_chi_quan_huyen', 'dia_chi_chi_tiet', 'so_cmnd','images_cmt_mattruoc','images_cmt_matsau', 'cmt_ngay_cap', 'cmt_noi_cap', 'ngay_hieu_luc', 'ngay_ket_thuc', 'cau_hoi_suc_khoe_1', 'cau_hoi_suc_khoe_2', 'chi_tiet_benh_tat', 'relationship')
    resource_class = NguoiDuocBaoHiemResource


class GoiSanPhamChinhAdmin(admin.ModelAdmin):
    list_display = ('id','company', 'ten_loai_hinh_bao_hiem', 'id_loai_hinh_bao_hiem','gioi_tinh','tuoi','ten_goi_san_pham_chinh','id_goi_san_pham_chinh','so_phi_chinh')


class GoiSanPhamPhuAdmin(admin.ModelAdmin):
    list_display = ('id', 'company', 'id_loai_hinh_bao_hiem','gioi_tinh','tuoi','ten_goi_san_pham_chinh','id_goi_san_pham_chinh','ten_goi_san_pham_phu','id_goi_san_pham_phu','so_phi_phu')




admin.site.register(NguoiDuocBaoHiemTam, NguoiDuocBaoHiemTamAdmin)
admin.site.register(NguoiDuocBaoHiem, NguoiDuocBaoHiemAdmin)
admin.site.register(GoiSanPhamChinh, GoiSanPhamChinhAdmin)
admin.site.register(GoiSanPhamPhu, GoiSanPhamPhuAdmin)





