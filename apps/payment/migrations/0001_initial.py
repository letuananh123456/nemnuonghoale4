# Generated by Django 2.2.2 on 2021-02-23 13:02

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('core', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='DonDatHang',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('loai_hinh_bao_hiem', models.IntegerField(default=0)),
                ('cong_ty', models.IntegerField(default=0)),
                ('goi_san_pham_chinh', models.IntegerField(default=0)),
                ('goi_san_pham_phu', models.TextField(default=None, null=True)),
                ('so_phi_chinh', models.BigIntegerField(default=0)),
                ('tong_so_phi_phu', models.BigIntegerField(default=0)),
                ('so_phi_VAT', models.BigIntegerField(default=0)),
                ('tong_phi_thanh_toan', models.BigIntegerField(default=0)),
                ('tong_phi_thanh_toan_sau_giam_gia', models.BigIntegerField(default=0)),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('loai_hop_dong', models.IntegerField(default=0)),
                ('ngay_phat_hanh_hop_dong_hoac_ack', models.DateTimeField(null=True)),
                ('loai_thanh_toan', models.IntegerField(default=0)),
                ('ma_don_hang_bihama', models.CharField(max_length=255, unique=True)),
                ('tinh_trang_don_dat_hang', models.IntegerField(default=0)),
                ('ma_giao_dich_cong_thanh_toan', models.CharField(default=None, max_length=255, null=True)),
                ('tinh_trang_thanh_toan_cong_thanh_toan', models.IntegerField(default=0)),
                ('code_ma_giam_gia', models.CharField(default=None, max_length=255, null=True)),
                ('ma_hop_dong', models.CharField(default=None, max_length=255, null=True)),
                ('link_giay_chung_nhan', models.TextField(default=None, max_length=255, null=True)),
                ('is_da_gui_manager', models.BooleanField(default=False)),
                ('is_da_gui_cong_thanh_toan', models.BooleanField(default=False)),
                ('is_tai_tuc', models.IntegerField(default=0)),
                ('nguoimuabaohiem', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.NguoiMuaBaoHiem')),
            ],
            options={
                'verbose_name': 'Đơn đặt hàng ',
                'verbose_name_plural': 'Đơn đặt hàng',
            },
        ),
        migrations.CreateModel(
            name='MaGiamGia',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('loai_hinh_bao_hiem', models.IntegerField(default=0)),
                ('cong_ty', models.IntegerField(default=0)),
                ('goi_san_pham', models.IntegerField(default=0)),
                ('ngay_hieu_luc', models.DateField()),
                ('ngay_ket_thuc', models.DateField()),
                ('chi_tieu', models.CharField(max_length=255)),
                ('ten_chien_luoc', models.CharField(max_length=255)),
                ('discount', models.FloatField(default=0.0)),
                ('code_ma_giam_gia', models.CharField(max_length=255, unique=True)),
                ('is_su_dung', models.IntegerField(default=0)),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
            ],
            options={
                'verbose_name': 'Mã giảm giá ',
                'verbose_name_plural': 'Mã giảm giá',
            },
        ),
        migrations.CreateModel(
            name='TaiTuc',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ma_tai_tuc_bihama', models.CharField(max_length=255, unique=True)),
                ('cach_tra_phi', models.IntegerField(default=0)),
                ('dinh_ky_dong_phi', models.IntegerField(default=0)),
                ('ky_dong_phi', models.IntegerField(default=0)),
                ('so_tien', models.BigIntegerField(default=0)),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('dondathang', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='payment.DonDatHang')),
            ],
            options={
                'verbose_name': 'Tái Tục và Đóng Thêm',
                'verbose_name_plural': 'Tái Tục và Đóng Thêm',
            },
        ),
    ]
