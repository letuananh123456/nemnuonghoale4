from django import forms


class PaymentForm(forms.Form):

    # order_id = forms.CharField(max_length=250)
    # order_type = forms.CharField(max_length=20)
    # amount = forms.IntegerField()
    type_payment = forms.CharField(max_length=100)
    bank_code = forms.CharField(max_length=20, required=False)
    # language = forms.CharField(max_length=2)
