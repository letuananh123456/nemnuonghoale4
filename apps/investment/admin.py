from django.contrib import admin
from .models import NguoiDuocBaoHiemTam, NguoiDuocBaoHiem, GoiSanPhamChinh, GoiSanPhamPhu, NguoiThuHuongTam, NguoiThuHuong, LaiSuatThiTruong, GiaTriDauTu
from import_export.admin import ImportExportModelAdmin
from import_export import resources
# Register your models here.

class NguoiThuHuongResource(resources.ModelResource):
    class Meta:
        model = NguoiThuHuong

class NguoiThuHuongTamResource(resources.ModelResource):
    class Meta:
        model = NguoiThuHuongTam

class NguoiDuocBaoHiemResource(resources.ModelResource):
    class Meta:
        model = NguoiDuocBaoHiem

class NguoiDuocBaoHiemTamResource(resources.ModelResource):
    class Meta:
        model = NguoiDuocBaoHiemTam


class NguoiDuocBaoHiemTamAdmin(ImportExportModelAdmin):
    list_display = ('id', 'nguoimuabaohiemtam', 'username', 'fullname', 'birth_day', 'birth_month','birth_year', 'gioi_tinh', 'email', 'dia_chi_tinh_thanh_pho', 'dia_chi_quan_huyen', 'dia_chi_chi_tiet', 'so_cmnd','images_cmt_mattruoc','images_cmt_matsau', 'cmt_ngay_cap', 'cmt_noi_cap', 'ngay_hieu_luc', 'ngay_ket_thuc', 'relationship')
    resource_class = NguoiDuocBaoHiemTamResource


class NguoiDuocBaoHiemAdmin(ImportExportModelAdmin):
    list_display = ('id', 'nguoimuabaohiem', 'username', 'fullname', 'birth_day', 'birth_month','birth_year', 'gioi_tinh', 'email', 'dia_chi_tinh_thanh_pho', 'dia_chi_quan_huyen', 'dia_chi_chi_tiet', 'so_cmnd','images_cmt_mattruoc','images_cmt_matsau', 'cmt_ngay_cap', 'cmt_noi_cap', 'ngay_hieu_luc', 'ngay_ket_thuc', 'relationship')
    resource_class = NguoiDuocBaoHiemResource


class NguoiThuHuongTamAdmin(ImportExportModelAdmin):
    list_display = ('id','nguoiduocbaohiemtam', 'fullname', 'birth_day','birth_month','birth_year','gioi_tinh','so_cmnd','images_cmt_mattruoc','images_cmt_matsau','cmt_ngay_cap','cmt_noi_cap','relationship','ty_le_thu_huong')
    resource_class = NguoiThuHuongTamResource


class NguoiThuHuongAdmin(ImportExportModelAdmin):
    list_display = ('id', 'nguoiduocbaohiem', 'fullname','birth_day','birth_month','birth_year','gioi_tinh','so_cmnd','images_cmt_mattruoc','images_cmt_matsau','cmt_ngay_cap','cmt_noi_cap','relationship','ty_le_thu_huong')
    resource_class = NguoiThuHuongResource


class GoiSanPhamChinhAdmin(admin.ModelAdmin):
    list_display = ('id','company', 'ten_loai_hinh_bao_hiem','ty_le_phi_rui_ro_hang_nam', 'id_loai_hinh_bao_hiem','gioi_tinh','tuoi','phi_ban_dau_co_ban','phi_ban_dau_dong_them','phi_cham_dut_co_ban','phi_cham_dut_dong_them','ten_goi_san_pham_chinh','id_goi_san_pham_chinh','so_phi_chinh_hang_nam')
    list_editable = ['phi_cham_dut_co_ban']


class GoiSanPhamPhuAdmin(admin.ModelAdmin):
    list_display = ('id', 'company','ten_loai_hinh_bao_hiem','id_loai_hinh_bao_hiem','ten_goi_san_pham_chinh','id_goi_san_pham_chinh','ten_goi_san_pham_phu','id_goi_san_pham_phu','loai_nghe_nghiep','so_tien_bao_hiem','so_phi_phu_nam')


class LaiSuatThiTruongAdmin(admin.ModelAdmin):
    list_display = ('id', 'nam','phantram')



admin.site.register(NguoiDuocBaoHiemTam, NguoiDuocBaoHiemTamAdmin)
admin.site.register(NguoiDuocBaoHiem, NguoiDuocBaoHiemAdmin)
admin.site.register(NguoiThuHuongTam, NguoiThuHuongTamAdmin)
admin.site.register(NguoiThuHuong, NguoiThuHuongAdmin)
admin.site.register(GoiSanPhamChinh, GoiSanPhamChinhAdmin)
admin.site.register(GoiSanPhamPhu, GoiSanPhamPhuAdmin)
admin.site.register(LaiSuatThiTruong,LaiSuatThiTruongAdmin)
admin.site.register(GiaTriDauTu)



