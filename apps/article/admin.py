from django.contrib import admin
from .models import GioiThieuLoaiHinhBH, Article



class GioiThieuLoaiHinhBHAdmin(admin.ModelAdmin):
    list_display = ('id', 'content', 'link_video', 'loai_hinh_bao_hiem','created_time','status')



class ArticleAdmin(admin.ModelAdmin):
    list_display = ('id', 'title', 'slug','sub_title','loai_tin_tuc','content','images_gioi_thieu','sub_content','seo_key_word','status','created_time')




admin.site.register(GioiThieuLoaiHinhBH, GioiThieuLoaiHinhBHAdmin)
admin.site.register(Article, ArticleAdmin)

