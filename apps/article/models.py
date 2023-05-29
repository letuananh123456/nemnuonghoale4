from django.db import models
from django.contrib.auth.models import User
from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField
from django.urls import reverse

"""
loai_hinh_bao_hiem
1 - Sản phẩm tử kỳ
2 - Sản phẩm đầu tư
3 - Sản phẩm tích luỹ
4 - Sản phẩm giáo dục
5 - Sản phẩm hưu trí
6 - BH sức khoẻ cá nhân
7 - BH sức khoẻ doanh nghiệp
8 - BH tai nạn cá nhân
9 - BH trợ cấp y tế, nằm viện
10 - BH bệnh hiểm nghèo
11 - BH bệnh ung thư
12 - BH vật chất xe
13 - BH TNDS ô tô
14 - BH TNDS xe máy 
15 - BH du lịch Việt Nam
16 - BH du lịch quốc tế
17 - BH trễ chuyến bay 
18 - BH nhà tư nhân
19 - BH màn hình điện thoại 
"""


class GioiThieuLoaiHinhBH(models.Model):
    content = RichTextUploadingField(default='')
    link_video = models.CharField(max_length=255, null = True, default=None)
    loai_hinh_bao_hiem = models.IntegerField(default=0)
    created_time = models.DateTimeField(auto_now_add=True, null=True)
    status = models.IntegerField(default=0)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Giới thiệu loại hình bảo hiểm'
        verbose_name_plural = 'Giới thiệu loại hình bảo hiểm'


class Article(models.Model):
    title = models.TextField(max_length=200)
    slug = models.TextField(max_length=200, null=True)
    link_video = models.TextField( null = True, default=None)
    sub_title = models.TextField( null = True, default=None)
    content = RichTextUploadingField(default='')
    images_gioi_thieu = models.TextField(null=True, default=None)
    sub_content = RichTextUploadingField(default='')
    tac_gia = models.CharField(max_length=200)
    loai_tin_tuc = models.IntegerField(default=0) # 1 la tin bao hiem 2 la tin san pham
    seo_key_word = models.TextField(null = True, default=None)
    status = models.IntegerField(default=0)
    created_time = models.DateTimeField(auto_now_add=True, null=True)


    def __str__(self):
        return str(self.id)


    class Meta:
        verbose_name = 'Tin tức'
        verbose_name_plural = 'Tin tức'


    def get_absolute_url(self):
        return reverse('article_detail_slug', kwargs={'slug': self.slug})