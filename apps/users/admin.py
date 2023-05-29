from django.contrib import admin

# from .models import Token, LoginHistory, Notification, UserNotification, OderTutorial ,AddInforUser
from .models import User, CountOTP, LoginHistory, LenhRutTien, BankAccount,ForgotPassword
from import_export.admin import ImportExportModelAdmin
from import_export import resources


class UserResource(resources.ModelResource):
    class Meta:
        model = User

class LenhRutTienResource(resources.ModelResource):
    class Meta:
        model = LenhRutTien

class ForgotPasswordResource(resources.ModelResource):
    class Meta:
        model = ForgotPassword

class CountOTPResource(resources.ModelResource):
    class Meta:
        model = CountOTP

class BankAccountResource(resources.ModelResource):
    class Meta:
        model = BankAccount

class UserAdmin(ImportExportModelAdmin):
    list_display = ('id','username' ,'fullname', 'images_user', 'gender', 'birth_day', 'birth_month','birth_year', 'link_info', 'code_invite', 'register_ctv','created_at')
    resource_class = UserResource


# # Register out own model admin, based on the default UserAdmin
# @admin.register(User)
# class CustomUserAdmin(UserAdmin):
#     list_display = ('id', 'username', 'email', 'first_name', 'last_name', 'is_active', 'is_staff')

# class TokenAdmin(admin.ModelAdmin):
#     list_display = ('key', 'user', 'created')

class BankAccountAdmin(ImportExportModelAdmin):
    resource_class = BankAccountResource

class LoginHistoryAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'start_date', 'end_date', 'num_date')


class CountOTPAmin(ImportExportModelAdmin):
    list_display = ('id', 'ip_client', 'count_otp','phone_otp','create_at')
    resource_class = CountOTPResource


class ForgotPasswordAdmin(ImportExportModelAdmin):
    list_display = ('id', 'user', 'forgot_pass', 'ngay_thay_doi')
    resource_class = ForgotPasswordResource


# class UserNotificationAdmin(admin.ModelAdmin):
#     list_display = ('id', 'user', 'notification', 'is_read', 'created_at')


class LenhRutTienAdmin(ImportExportModelAdmin):
    list_display = ["bank_account","amount_withdraw","is_da_gui_mana","created_at","status"]
    resource_class = LenhRutTienResource

admin.site.register(User, UserAdmin)
admin.site.register(CountOTP,CountOTPAmin)

# admin.site.register(Token, TokenAdmin)
admin.site.register(LoginHistory, LoginHistoryAdmin)
admin.site.register(ForgotPassword, ForgotPasswordAdmin)
# admin.site.register(UserNotification, UserNotificationAdmin)
# admin.site.register(OderTutorial, OderTutorialtAdmin)
admin.site.register(LenhRutTien,LenhRutTienAdmin)
admin.site.register(BankAccount, BankAccountAdmin)


