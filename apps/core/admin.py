from django.contrib import admin
from .models import Provincial,District
from .models import NguoiMuaBaoHiemTam, NguoiMuaBaoHiem, Company, LinhVuNgheNghiep, ChiTietCongViec, NoiDungNgheNghiep, GoogleVision
from import_export.admin import ImportExportModelAdmin
from import_export import resources


class NguoiMuaBaoHiemResource(resources.ModelResource):
    class Meta:
        model = NguoiMuaBaoHiem

class NguoiMuaBaoHiemTamResource(resources.ModelResource):
    class Meta:
        model = NguoiMuaBaoHiemTam

class GoogleVisionResource(resources.ModelResource):
    class Meta:
        model = GoogleVision

class NguoiMuaBaoHiemTamAdmin(ImportExportModelAdmin):
    list_display = ('id', 'username', 'fullname', 'birth_day', 'birth_month','birth_year', 'gioi_tinh', 'email', 'dia_chi_tinh_thanh_pho', 'dia_chi_quan_huyen', 'dia_chi_chi_tiet', 'so_cmnd','images_cmt_mattruoc', 'images_cmt_matsau', 'cmt_ngay_cap', 'cmt_noi_cap', 'ngay_hieu_luc', 'ngay_ket_thuc', 'ho_ten_nhan', 'email_nhan', 'so_dien_thoai_nhan', 'dia_chi_tinh_thanh_pho_nhan', 'dia_chi_quan_huyen_nhan', 'dia_chi_chi_tiet_nhan', 'status_marriage','job','weight','height','nationality','nationality_paper', 'created_at')
    resource_class = NguoiMuaBaoHiemTamResource


class NguoiMuaBaoHiemAdmin(ImportExportModelAdmin):
    list_display = ('id', 'username', 'fullname', 'birth_day', 'birth_month','birth_year', 'gioi_tinh', 'email', 'dia_chi_tinh_thanh_pho', 'dia_chi_quan_huyen', 'dia_chi_chi_tiet', 'so_cmnd','images_cmt_mattruoc', 'images_cmt_matsau', 'cmt_ngay_cap', 'cmt_noi_cap', 'ngay_hieu_luc', 'ngay_ket_thuc', 'ho_ten_nhan', 'email_nhan', 'so_dien_thoai_nhan', 'dia_chi_tinh_thanh_pho_nhan', 'dia_chi_quan_huyen_nhan', 'dia_chi_chi_tiet_nhan', 'status_marriage','job','weight','height','nationality','nationality_paper', 'created_at')
    resource_class = NguoiMuaBaoHiemResource


class ProvincialAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'code','group')


class DistrictAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'parent_code')


class CompanyAdmin(admin.ModelAdmin):
    list_display = ('id','logo','ten_cong_ty','id_ten_cong_ty','bai_gioi_thieu_cong_ty','nam_thanh_lap','bien_thanh_toan','so_chi_nhanh')


class LinhVuNgheNghiepAdmin(admin.ModelAdmin):
    list_display = ('id','linhvuc','code_linhvuc',)


class ChiTietCongViecAdmin(admin.ModelAdmin):
    list_display = ('id','chitiet','code_chitiet','code_linhvuc')

        
class NoiDungNgheNghiepAdmin(admin.ModelAdmin):
    list_display = ('id','noidungcongviec','code_chitiet','capnghenghiep','hanchetichluy',)

class GoogleVisionAdmin(ImportExportModelAdmin):
    resource_class = GoogleVisionResource


admin.site.register(NguoiMuaBaoHiemTam, NguoiMuaBaoHiemTamAdmin)
admin.site.register(NguoiMuaBaoHiem, NguoiMuaBaoHiemAdmin)
admin.site.register(Provincial,ProvincialAdmin)
admin.site.register(District,DistrictAdmin)
admin.site.register(Company,CompanyAdmin)
admin.site.register(LinhVuNgheNghiep,LinhVuNgheNghiepAdmin)
admin.site.register(ChiTietCongViec,ChiTietCongViecAdmin)
admin.site.register(NoiDungNgheNghiep,NoiDungNgheNghiepAdmin)
admin.site.register(GoogleVision, GoogleVisionAdmin)