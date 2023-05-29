from django.db import models
from ckeditor_uploader.fields import RichTextUploadingField

# Create your models here.


class Insurancecompany(models.Model):
    id_cpn = models.IntegerField(default=0)
    name_cpn = models.CharField(max_length=200)
    slug = models.CharField(max_length=200, null=True)
    sub_title = RichTextUploadingField(default='')
    title = models.CharField(max_length=200, null=True)
    link_cpn = models.CharField(max_length=200, null=True)
    content = RichTextUploadingField(default='')
    tac_gia = models.CharField(max_length=200)
    seo_key_word = models.CharField(max_length=200, null = True, default=None)
    images = models.TextField(null=True, default=None)
    created_time = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return str(self.id)


    class Meta:
        verbose_name = 'Công ty bảo hiểm'
        verbose_name_plural = 'Công ty bảo hiểm'


    # def get_absolute_url(self):
    #     return reverse('company_detail', kwargs={'slug': self.slug})
