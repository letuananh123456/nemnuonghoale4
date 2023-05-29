from django import forms
from captcha.fields import ReCaptchaField
from captcha.widgets import ReCaptchaV2Checkbox

class LoginForm(forms.Form):
    username = forms.CharField(max_length=100, required=True, 
    widget=forms.TextInput(attrs={'class': 'input100', 'placeholder':'Số điện thoại'}))
    password = forms.CharField(max_length=50, required=True, 
    widget=forms.TextInput(attrs={'type': 'password', 'class': 'input100', 'placeholder':'Mật khẩu'}))


class FormWithCaptcha(forms.Form):
    captcha = ReCaptchaField(widget=ReCaptchaV2Checkbox(api_params={'hl': 'vi', 'onload': 'onLoadFunc'}))

    class Meta:
        fields = ('captcha')