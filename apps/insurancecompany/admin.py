from django.contrib import admin
from .models import Insurancecompany

# Register your models here.



class insurancecompanyAdmin(admin.ModelAdmin):
    list_display = ('id_cpn', 'name_cpn','slug','sub_title','title','link_cpn','content','seo_key_word','images')




admin.site.register(Insurancecompany, insurancecompanyAdmin)
