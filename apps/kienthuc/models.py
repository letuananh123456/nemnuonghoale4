from django.db import models
from django.contrib.auth.models import User
from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField

# Create your models here.


class KienthucCategory(models.Model):
    name_category = models.CharField(max_length=255)
    slug = models.CharField(unique=True, max_length=255)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Category Kiến thức'
        verbose_name_plural = 'Category Kiến thức'


class KienThucModel(models.Model):
    title = models.CharField(max_length=255)
    sub_title = models.CharField(max_length=255)
    slug = models.CharField(unique=True, max_length=255)
    content = RichTextUploadingField(default='')
    link_video = models.CharField(max_length=255)
    category = models.ForeignKey(KienthucCategory, on_delete=models.CASCADE)
    created_time = models.DateTimeField(auto_now_add=True, null=True)
    images = models.TextField(default=None, null=True)
    status = models.IntegerField(default=0)


    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Kiến thức'
        verbose_name_plural = 'Kiến thức'

