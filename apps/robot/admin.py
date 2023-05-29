from django.contrib import admin
from .models import RobotChung, Robot1DauTu
# Register your models here.

class RobotChungAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'ma_don_hang_bihama', 'cong_ty', 'loai_hinh_bao_hiem', 'goi_san_pham_chinh', 'goi_san_pham_phu', 'so_phi_chinh')


class Robot1DauTuAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'ma_don_hang_bihama', 'cong_ty', 'loai_hinh_bao_hiem', 'goi_san_pham_chinh', 'goi_san_pham_phu', 'so_phi_chinh')


admin.site.register(RobotChung, RobotChungAdmin)
admin.site.register(Robot1DauTu, Robot1DauTuAdmin)
