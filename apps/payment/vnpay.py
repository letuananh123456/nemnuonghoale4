import hashlib
import urllib
import urllib.parse

from django.utils.http import urlencode


class vnpay:
    requestData = {}
    responseData = {}

    def get_payment_url(self, vnpay_payment_url, secret_key):
        inputData = sorted(self.requestData.items())
        #print('input data la: ')
        #print(inputData)
        queryString = ''
        hasData = ''
        seq = 0
        for key, val in inputData:
            if seq == 1:
                
                queryString = queryString + "&" + key + '=' + urllib.parse.quote(str(val), safe='')
                
                #print('ham quote=', queryString)
                hasData = hasData + "&" + str(key) + '=' + str(val)
            else:
                seq = 1
                queryString = key + '=' + urllib.parse.quote(str(val), safe='')
                hasData = str(key) + '=' + str(val)

        hashValue = self.__md5(secret_key + hasData)
        return vnpay_payment_url + "?" + queryString + '&vnp_SecureHashType=SHA256&vnp_SecureHash=' + hashValue

    def validate_response(self, secret_key):
        vnp_SecureHash = self.responseData['vnp_SecureHash']
        # Remove hash params
        if 'vnp_SecureHash' in self.responseData.keys():
            self.responseData.pop('vnp_SecureHash')

        if 'vnp_SecureHashType' in self.responseData.keys():
            self.responseData.pop('vnp_SecureHashType')

        inputData = sorted(self.responseData.items())
        hasData = ''
        seq = 0

        for key, val in inputData:
            if str(key).startswith('vnp_'):
                if seq == 1:
                    hasData = hasData + "&" + str(key) + '=' + str(val)
                else:
                    seq = 1
                    hasData = str(key) + '=' + str(val)
        hashValue = self.__md5(secret_key + hasData)

        print(
            'Validate debug, HashData:' + secret_key + hasData + "\n HashValue:" + hashValue + "\nInputHash:" + vnp_SecureHash)

        return vnp_SecureHash == hashValue

    def __md5(self, input):
        byteInput = input.encode('utf-8')
        return hashlib.sha256(byteInput).hexdigest()
