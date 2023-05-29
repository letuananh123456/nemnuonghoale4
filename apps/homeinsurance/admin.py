from django.contrib import admin
from .models import NguoiDuocBaoHiemTam, NguoiDuocBaoHiem, NguoiThuHuong, GoiSanPhamChinh, GoiSanPhamPhu
from import_export.admin import ImportExportModelAdmin
from import_export import resources
# Register your models here.
class NguoiThuHuongResource(resources.ModelResource):
    class Meta:
        model = NguoiThuHuong

class NguoiDuocBaoHiemResource(resources.ModelResource):
    class Meta:
        model = NguoiDuocBaoHiem

class NguoiDuocBaoHiemTamResource(resources.ModelResource):
    class Meta:
        model = NguoiDuocBaoHiemTam

class NguoiDuocBaoHiemTamAdmin(ImportExportModelAdmin):
    list_display = ('id', 'nguoimuabaohiemtam', 'loai_nha', 'tuoi_tho_ngoi_nha','gia_tri_can_nha','gia_tri_tai_san_ben_trong', 'dia_chi_tinh_thanh_pho', 'dia_chi_quan_huyen','dia_chi_chi_tiet', 'ngay_hieu_luc', 'ngay_ket_thuc', 'relationship', 'created_at')
    resource_class = NguoiDuocBaoHiemTamResource


class NguoiDuocBaoHiemAdmin(ImportExportModelAdmin):
    list_display = ('id','ma_don_hang_bihama' ,'nguoimuabaohiem', 'loai_nha', 'tuoi_tho_ngoi_nha','gia_tri_can_nha','gia_tri_tai_san_ben_trong', 'dia_chi_tinh_thanh_pho', 'dia_chi_quan_huyen','dia_chi_chi_tiet', 'ngay_hieu_luc', 'ngay_ket_thuc', 'relationship', 'created_at')
    resource_class = NguoiDuocBaoHiemResource


class NguoiThuHuongAdmin(ImportExportModelAdmin):
    list_display = ('id', 'nguoiduocbaohiem', 'fullname', 'birth_day','birth_month','birth_year','gioi_tinh','so_cmnd')
    resource_class = NguoiThuHuongResource


class GoiSanPhamChinhAdmin(admin.ModelAdmin):
    list_display = ('id', 'company', 'ten_loai_hinh_bao_hiem', 'id_loai_hinh_bao_hiem','ten_goi_san_pham_chinh','id_goi_san_pham_chinh','so_phi_chinh')


class GoiSanPhamPhuAdmin(admin.ModelAdmin):
    list_display = ('id', 'company', 'ten_loai_hinh_bao_hiem', 'id_loai_hinh_bao_hiem','ten_goi_san_pham_chinh','id_goi_san_pham_chinh','ten_goi_san_pham_phu','id_goi_san_pham_phu','so_phi_phu')




admin.site.register(NguoiDuocBaoHiemTam, NguoiDuocBaoHiemTamAdmin)
admin.site.register(NguoiDuocBaoHiem, NguoiDuocBaoHiemAdmin)
admin.site.register(NguoiThuHuong, NguoiThuHuongAdmin)
admin.site.register(GoiSanPhamChinh, GoiSanPhamChinhAdmin)
admin.site.register(GoiSanPhamPhu, GoiSanPhamPhuAdmin)





