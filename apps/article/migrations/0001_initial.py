# Generated by Django 2.2.2 on 2021-02-23 13:02

import ckeditor_uploader.fields
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Article',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.TextField(max_length=200)),
                ('slug', models.TextField(max_length=200, null=True)),
                ('link_video', models.TextField(default=None, null=True)),
                ('sub_title', models.TextField(default=None, null=True)),
                ('content', ckeditor_uploader.fields.RichTextUploadingField(default='')),
                ('images_gioi_thieu', models.TextField(default=None, null=True)),
                ('sub_content', ckeditor_uploader.fields.RichTextUploadingField(default='')),
                ('tac_gia', models.CharField(max_length=200)),
                ('loai_tin_tuc', models.IntegerField(default=0)),
                ('seo_key_word', models.TextField(default=None, null=True)),
                ('status', models.IntegerField(default=0)),
                ('created_time', models.DateTimeField(auto_now_add=True, null=True)),
            ],
            options={
                'verbose_name': 'Tin tức',
                'verbose_name_plural': 'Tin tức',
            },
        ),
        migrations.CreateModel(
            name='GioiThieuLoaiHinhBH',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('content', ckeditor_uploader.fields.RichTextUploadingField(default='')),
                ('link_video', models.CharField(default=None, max_length=255, null=True)),
                ('loai_hinh_bao_hiem', models.IntegerField(default=0)),
                ('created_time', models.DateTimeField(auto_now_add=True, null=True)),
                ('status', models.IntegerField(default=0)),
            ],
            options={
                'verbose_name': 'Giới thiệu loại hình bảo hiểm',
                'verbose_name_plural': 'Giới thiệu loại hình bảo hiểm',
            },
        ),
    ]
