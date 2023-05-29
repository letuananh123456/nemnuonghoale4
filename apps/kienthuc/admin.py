from django.contrib import admin
from .models import KienThucModel, KienthucCategory



class KienThucModelAdmin(admin.ModelAdmin):
    list_display = ('id', 'title', 'sub_title', 'slug','content','link_video','category','created_time','status')



class KienthucCategoryAdmin(admin.ModelAdmin):
    list_display = ('id', 'name_category', 'slug')




admin.site.register(KienThucModel, KienThucModelAdmin)
admin.site.register(KienthucCategory, KienthucCategoryAdmin)
