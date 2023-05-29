import binascii
import os
from django.db import models
from django.utils.translation import gettext_lazy as _
from django.contrib.auth.models import AbstractUser
# Create your models here.
from django.conf import settings


TOKEN_LENGTH = 64
RESET_TOKEN_LENGTH = 10
CONFIRM_EMAIL_TOKEN_LENGTH = 128


# this function generate access token  
def generate_access_token(user_id):
    num_bytes = TOKEN_LENGTH // 2
    token = binascii.hexlify(os.urandom(num_bytes)).decode()
    access_token = '{user_id}:{token}'.format(
        user_id=user_id,
        token=token,
    )
    return access_token


class User(AbstractUser):
    fullname = models.CharField(max_length=200, default=None, null=True)
    images_user = models.TextField(null = True, default=None)
    gender = models.IntegerField(default=0)
    birth_day = models.IntegerField(default=0)
    birth_month = models.IntegerField(default=0)
    birth_year = models.IntegerField(default=0)
    link_info = models.CharField(default=None, max_length=255, null=True) # link tuyen dung cua chinh user
    code_invite = models.CharField(default=None, max_length=255, null=True, blank=True) # ma code nguoi gioi thieu cua user
    register_ctv = models.BooleanField(default=False)
    loai_hinh_muon_hop_tac = models.IntegerField(default=0) # 0 la cong tac vien, 1 la dai ly
    dia_chi_tinh_thanh_pho = models.IntegerField(null=True,blank=True)
    dia_chi_quan_huyen = models.IntegerField(null=True,blank=True)
    dia_chi_chi_tiet = models.CharField(max_length=200, default=None, null=True)
    chung_chi_dai_ly = models.BooleanField(default=False)
    so_chung_chi = models.CharField(max_length=200, default=None, null=True,blank=True)
    loai_hinh_bao_hiem_cua_chung_chi = models.IntegerField(default=0) # 1 la nhan tho, 2 la phi nhan tho
    is_gui_register = models.BooleanField(default=False)    
    created_at = models.DateTimeField(auto_now_add=True, null=True)


    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'User'
        verbose_name_plural = 'User'

    @property
    def ref_link_invite(self):
        return settings.BIHAMA_REGISTER_URL+"/dang-ky/"+"?ref="+self.link_info


class Token(models.Model):
    """
    The default authorization token model.
    """
    key = models.CharField(_("Key"), max_length=128, primary_key=True)
    user = models.ForeignKey(
        User, related_name='tokens',
        on_delete=models.CASCADE, verbose_name=_("User")
    )
    created = models.DateTimeField(_("Created"), auto_now_add=True)

    class Meta:
        db_table = 'token'

    def __str__(self):
        return 'Token (user {}): {}'.format(self.user_id, self.key)


class LoginHistory(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    start_date = models.DateField(auto_now_add=True)
    end_date = models.DateField(auto_now=True)
    num_date = models.IntegerField(default=1)

    def __str__(self):
        return str(self.user)

    class Meta:
        verbose_name = 'Lịch sử đăng nhập login '
        verbose_name_plural = 'Lịch sử đăng nhập login '


class ResetToken(models.Model):
    reset_token = models.CharField(_("Reset token"), primary_key=True, max_length=RESET_TOKEN_LENGTH)
    user = models.ForeignKey(
        User, related_name='reset_token',
        on_delete=models.CASCADE, verbose_name=_('user')
    )
    created_at = models.DateTimeField(_("Created"), auto_now_add=True)

    class Meta:
        db_table = 'reset_token'

    def save(self, *args, **kwargs):
        if not self.reset_token:
            self.reset_token = self.generate_reset_token()
        return super(ResetToken, self).save(*args, **kwargs)

    def generate_reset_token(self):
        num_bytes = RESET_TOKEN_LENGTH // 2
        return binascii.hexlify(os.urandom(num_bytes)).decode()

    def __str__(self):
        return 'ResetToken (user {}): {}'.format(self.user_id, self.reset_token)


class ConfirmEmailToken(models.Model):
    token = models.CharField(_("token"), primary_key=True, max_length=CONFIRM_EMAIL_TOKEN_LENGTH)
    user = models.ForeignKey(
        User, related_name='confirm_email_token',
        on_delete=models.CASCADE, verbose_name=_('user')
    )
    created_at = models.DateTimeField(_('Created'), auto_now_add=True)

    class Meta:
        db_table = 'confirm_email_token'

    def save(self, *args, **kwargs):
        if not self.token:
            self.token = self.generate_confirm_email_token()
        return super(ConfirmEmailToken, self).save(*args, **kwargs)

    def generate_confirm_email_token(self):
        num_bytes = CONFIRM_EMAIL_TOKEN_LENGTH // 2
        return binascii.hexlify(os.urandom(num_bytes)).decode()

    def __str__(self):
        return 'ConfirmEmailToken (user {}): {}'.format(self.user, self.token)


class Notification(models.Model):
    title = models.TextField(blank=True, default='')
    body = models.TextField(blank=True, default='')
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'notification'
        ordering = ['-created_at']


class UserNotification(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    notification = models.ForeignKey(Notification, on_delete=models.CASCADE, related_name='user_notifications')
    is_read = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'user_notification'
        ordering = ['-created_at']


class OderTutorial(models.Model):
    title = models.TextField(blank=True, default='')
    content = models.TextField(blank=True, default='')
    people_post = models.CharField(blank=True, default='',max_length=255)
    total_view = models.IntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True)


class CountOTP(models.Model):
    ip_client=models.CharField(max_length=255)
    count_otp=models.IntegerField(default=0)
    phone_otp=models.CharField(max_length=255)
    create_at=models.TimeField(max_length=255,auto_now_add=True)

    def __str__(self):
        return str(self.ip_client)

    class Meta:
        verbose_name = 'Đếm số lần nhập OTP '
        verbose_name_plural = 'Đếm số lần nhập OTP'


class BankAccount(models.Model):
    ctv = models.ForeignKey(User, on_delete=models.CASCADE)
    bank_name = models.CharField(max_length=200)
    fullname = models.CharField(max_length=200)
    bank_number = models.CharField(default=None,max_length=225)
    branch = models.CharField(max_length=200)
    created_at = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Tài khoản ngân hàng user '
        verbose_name_plural = 'Tài khoản ngân hàng user'


class LenhRutTien(models.Model):
    bank_account = models.ForeignKey(BankAccount, on_delete=models.CASCADE)
    amount_withdraw = models.BigIntegerField(default=0)
    is_da_gui_mana = models.BooleanField(default=False)
    is_da_gui_ctv = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    status = models.IntegerField(default=False)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Đặt lệnh rút tiền'
        verbose_name_plural = 'Đặt lệnh rút tiền'


class ForgotPassword(models.Model):
    user=models.ForeignKey(User, on_delete=models.CASCADE)
    forgot_pass=models.IntegerField(default=1)   #so lan thay doi duoc password
    ngay_thay_doi=models.DateTimeField()

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Lấy lại mật khẩu'
        verbose_name_plural = 'Lấy lại mật khẩu'