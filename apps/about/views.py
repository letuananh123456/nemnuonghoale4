from django.shortcuts import render,redirect
from django.views import View
# Create your views here.
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.utils import six
from apps.users.models import User
from django.contrib.sites.shortcuts import get_current_site
from django.utils.encoding import force_bytes, force_text
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.template.loader import render_to_string
from django.core.mail import EmailMessage
from django.http import HttpResponse
from django.conf import settings
from django.contrib.auth.mixins import LoginRequiredMixin
from apps.core.models import Provincial
from apps.users.forms import FormWithCaptcha
from apps.users.tasks import gui_info_register_ctv
from apps.users.models import User
from django.core.mail import EmailMultiAlternatives
import email
import os


class TokenGenerator(PasswordResetTokenGenerator):
   def _make_hash_value(self, user, timestamp):
      return (six.text_type(user.pk) + six.text_type(timestamp) + six.text_type(user.is_active))

account_activation_token = TokenGenerator()


class AboutView(View):
   def get(self, request):
      return render(request, 'about/about.html')


class PolicyView(View):
   def get(self, request):
      return render(request, 'about/policy.html')


class SellView(View):
   def get(self, request):
      return render(request, 'about/sellbihama.html')


class DoneMail(View):
   def get(self, request):
      return render(request, 'about/done_mail.html')


class SellercenterView(LoginRequiredMixin,View):
   login_url = '/dang-nhap/' 
   def get(self, request):
      list_provincial=Provincial.objects.all().order_by("name")
      user = User.objects.get(id=request.user.id)
      print( user.code_invite,"kkhanhnck")
      if user.code_invite != "" and user.code_invite != None:
         link_invte= settings.BIHAMA_REGISTER_URL+ "/dang-ky/?ref=" +user.code_invite
      else:
         link_invte=0
      captcha = FormWithCaptcha()
      print(type(link_invte),'kkhanhnck')
      return render(request, 'about/sellercenter.html',context={"list_data": list_provincial,'captcha':captcha, 'link_invte':link_invte})
   def post(self,request):
      ctv_lh = request.POST.get('ctv_lh')
      link_gt = request.POST.get('link_gt')
      name_ctv = request.POST.get('name_ctv')
      mail_user = request.POST.get('mail_user')
      thanhpho = request.POST.get('thanhpho')
      huyen = request.POST.get('huyen')
      add_detail = request.POST.get('add_detail')
      sochungchi = request.POST.get('sochungchi')
      loaihbhchungchi = request.POST.get('loaihbh')
      ischungchi=int(request.POST.get('ischungchi'))
      user=User.objects.get(id=request.user.id)
      current_site = settings.URL_RIGISTER_CTV
      email_subject = 'Tin tứccộng tác viên'
      message = render_to_string('about/activate_account.html', {
            'user': user,
            'domain': current_site,
            'uid': urlsafe_base64_encode(force_bytes(user.pk)),
            'token': account_activation_token.make_token(user),
      })
      user = User.objects.get(id=request.user.id)
      if user.code_invite == None or user.code_invite == "":
         if User.objects.filter(link_info=link_gt).exists() and link_gt != "":
            code_invite=link_gt[len(link_gt)-10:len(link_gt)]
            user.code_invite = code_invite
         elif link_gt == "":
            user.code_invite = None
         else:
            user.code_invite = None
            user.save()
            captcha = FormWithCaptcha()
            list_provincial=Provincial.objects.all().order_by("name")
            context = {'message1': "Link giới thiệu bạn nhập không chính xác , Tin tứcthất bại",'captcha':captcha,'list_data':list_provincial,'link_invte':0}
            return render(request, 'about/sellercenter.html',context)         
      user.fullname=name_ctv
      user.loai_hinh_muon_hop_tac=ctv_lh
      user.dia_chi_tinh_thanh_pho=thanhpho
      user.dia_chi_quan_huyen=huyen
      user.dia_chi_chi_tiet=add_detail
      if ischungchi is 1:
         user.chung_chi_dai_ly=ischungchi
         user.so_chung_chi=sochungchi
         user.loai_hinh_bao_hiem_cua_chung_chi=loaihbhchungchi
      user.email=mail_user
      user.save() 
      # email = EmailMessage(email_subject, message,'Bihama.com/Bihama.vn', to=[mail_user])
      # email.send()
      email_message = EmailMultiAlternatives(email_subject, message, from_email=settings.EMAIL_HOST_USER, to= [mail_user])
      email_message.mixed_subtype = 'related'
      path_image = os.path.join(settings.STATICFILES_DIRS[0] , "core/mail/bihama.jpg")
      part = email.mime.base.MIMEBase( "image", "jpeg" )
      part.set_payload(open(path_image,'rb').read())
      email.encoders.encode_base64(part)
      part.add_header( 'Content-ID', "<bihama>")
      email_message.attach( part )
      # email_message.content_subtype = "html/text"
      email_message.attach_alternative(message, "text/html")
      email_message.send()
      return render(request, 'about/done_mail.html', context={'img_dk':0})


def activate_account(request, uidb64, token):
   try:
      uid = force_bytes(urlsafe_base64_decode(uidb64))
      user = User.objects.get(id=uid)
   except(TypeError, ValueError, OverflowError, User.DoesNotExist):
      user = None
   if user is not None and account_activation_token.check_token(user, token):
      user.register_ctv=True
      user.save()
      gui_info_register_ctv.delay(user.id)
      return render(request, 'about/done_mail.html', context={'img_dk':1})
   else:
      return render(request, 'about/done_mail.html', context={'img_dk':2})


class GetTheApp(View):
   def get(self, request):
      return render(request, 'about/getapp.html')