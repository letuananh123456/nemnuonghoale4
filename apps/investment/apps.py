from django.apps import AppConfig


class InvestmentConfig(AppConfig):
    name = 'investment'


admin.site.register(HieuXuatThiTruong)
admin.site.register(HieuXuatCongTy)