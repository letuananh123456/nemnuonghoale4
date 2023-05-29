bien1 = 1 #'DUOI50TRIEU'
bien2 = 2 #'TU50DEN100TRIEU'
bien3 = 3 #'TU100DEN200TRIEU'
bien4 = 4 #'TU200DEN300TRIEU'
bien5 = 5 #'TU300DEN400TRIEU'
bien6 = 6 #'TU400DEN500TRIEU'
bien7 = 7 #'TU500DEN1TY'
bien8 = 8 #'TU1TYDEN2TY'
bien9 = 9 #'TU2TYDEN5TY'
bien10 = 10 #'TREN5TY'

kq1 = {}

kq1['ketqua1'] = 0
kq1['ketqua2'] = 0

mucdich1 = 1 #'BAOVECHOCON'
mucdich2 = 2 #'BAOVEDUONGGIA'
mucdich3 = 3 #'BAOVEDAUTU'
mucdich4 = 4 #'BAOVETICHLUY'
mucdich5 = 5 #'BAOVETAISANKHIMAT'
mucdich6 = 6 #'BAOVEBENHHIEMNGHEO'
mucdich7 = 7 #'BAOVEUNGTHU'
mucdich8 = 8 #'BAOVESUCKHOEHANGNAM'
mucdich9 = 9 #'BAOVETAINANCANHAN'
mucdich10 = 10 #'BAOVETROCAPNAMVIEN'

kq2 = {}

kq2['ketqua1'] = ""
kq2['ketqua2'] = ""

spchinh1 = 'TUKY'
spchinh2 = 'DAUTU'
spchinh3 = 'TICHLUY'
spchinh4 = 'GIAODUC'
spchinh5 = 'HUUTRI'

spphu1 = 'BAOHIEMSUCKHOECANHAN'
spphu2 = 'BAOHIEMTAINANCANHAN'
spphu3 = 'BAOHIEMTROCAPYTE'
spphu4 = 'BAOHIEMBENHHIEMNGHEO'
spphu5 = 'BAOHIEMUNGTHU'

bhxh1 = 1 #CO'
bhxh2 = 2 #KHONG'

bhyt1 = 1 #CO'
bhyt2 = 2 #KHONG'

honnhan1 = 1 # 'DOCTHAN'
honnhan2 = 2 # 'DINHHON'
honnhan3 = 3 # 'COGIADINHCHUACOCON'
honnhan4 = 4 # 'COGIADINHCOMOTCON'
honnhan5 = 5 # 'COGIADINHCO2CON'
honnhan6 = 6 # 'COGIADINHCONHIEUHON2CON'
honnhan7 = 7 # 'LYHON'
honnhan8 = 8 # 'LYHONNUOI1CON'
honnhan9 = 9 # 'LYHONNUOI2CON'
honnhan10 =10  # 'LYHONNUOINHIEUHON2CON'
honnhan11 = 11 # 'GOAVOCHONG'
honnhan12 = 12 # 'GOAVOCHONGNUOI1CON'
honnhan13 = 13 # 'GOAVOCHONGNUOI2CON'
honnhan14 = 14 # 'GOAVOCHONGNUOINHIEUHON2CON'

gioitinh1 = 1 # 'NAM'
gioitinh2 = 2 #'NU'

typejob1 = 1 # 'NHANVIEN'
typejob2 = 2 # 'LAMCHU'

kq3 = {}

kq3['ketqua1'] = 0
kq3['ketqua2'] = 0

# sản phẩm đầu tư
quantam1=1  #LAICAONHAT
quantam2=2  #LOTHAPNHAT
quantam3=3  #CANBANGCA2

kqquantam = 0

cohoi1 = 1 #Nhận ngay 20 triệu
cohoi2 = 2 #Có 50 % cơ hội nhận được 100 triệu
cohoi3 = 3 #Có 25% cơ hội nhận được 200 triệu
cohoi4 = 4 #Có 5% cơ hội nhận được 2 tỷ

kqcohoi = 0

ruiro1 = 1 #Sẽ lỗ
ruiro2 = 2 #Không chắc chắn
ruiro3 = 3 #Cơ hội
ruiro4 = 4 #Lo lắng

kqruiro = 0

dautu1 = 1 #Vẫn gửi ngân hàng
dautu2 = 2 #1 nửa gửi ngân hàng, 1 nửa mua vàng
dautu3 = 3 #Mua toàn bộ vàng
dautu4 = 4 #Mua toàn bộ và vay thêm để mua vàng

kqdautu = 0

phantramtaisanruiro1 = 1 #100% Quỹ đầu tư gồm các tài sản ít rủi ro
phantramtaisanruiro2 = 2 #Quỹ đầu tư gồm 60% các tài sản ít rủi ro, 30% rủi ro trung bình, 10% rủi ro cao
phantramtaisanruiro3 = 3 #Quỹ đầu tư gồm 30% các tài sản ít rủi ro, 40% rủi ro trung bình, 30% rủi ro cao
phantramtaisanruiro4 = 4 #Quỹ đầu tư gồm 10% các tài sản ít rủi ro, 40% rủi ro trung bình, 50% rủi ro cao

kqtaisanruiro = 0



def get_premium(income):
    if income == bien1:
        kq1['ketqua1'] = 1
        kq1['ketqua2'] = 5
    elif income == bien2:
        kq1['ketqua1'] = 3
        kq1['ketqua2'] = 8
    elif income == bien3:
        kq1['ketqua1'] = 4
        kq1['ketqua2'] = 10
    elif income == bien4:
        kq1['ketqua1'] = 6
        kq1['ketqua2'] = 12
    elif income == bien5:
        kq1['ketqua1'] = 10
        kq1['ketqua2'] = 15
    elif income == bien6:
        kq1['ketqua1'] = 12
        kq1['ketqua2'] = 18
    elif income == bien7:
        kq1['ketqua1'] = 15
        kq1['ketqua2'] = 25
    elif income == bien8:
        kq1['ketqua1'] = 20
        kq1['ketqua2'] = 30
    elif income == bien9:
        kq1['ketqua1'] = 25
        kq1['ketqua2'] = 30
    elif income == bien10:
        kq1['ketqua1'] = 30
        kq1['ketqua2'] = 60
    return kq1

def get_product(sex, age, social_insurance, medical_insurance, income, purpose, marital_status, job_type):
    if purpose == mucdich1:
        kq2['ketqua1'] = spchinh4
        if medical_insurance == bhyt2:
            kq2['ketqua2'] = spphu1
        else: 
            kq2['ketqua2'] = spphu4
    elif purpose == mucdich2:
        kq2['ketqua1'] = spchinh5
        if medical_insurance == bhyt2:
            kq2['ketqua2'] = spphu1
        elif age == gioitinh1 and age <= 45:
            kq2['ketqua2'] = spphu4
        elif age == gioitinh2 and age <= 40:
            kq2['ketqua2'] = spphu4
        else: 
            kq2['ketqua2'] = spphu5
    elif purpose == mucdich3:
        kq2['ketqua1'] = spchinh2
        if medical_insurance == bhyt2:
            kq2['ketqua2'] = spphu1
        else: 
            kq2['ketqua2'] = spphu5
    elif purpose == mucdich4:
        kq2['ketqua1'] = spchinh3
        if medical_insurance == bhyt2:
            kq2['ketqua2'] = spphu1
        elif age == gioitinh1 and age <= 45:
            kq2['ketqua2'] = spphu4
        elif age == gioitinh2 and age <= 40:
            kq2['ketqua2'] = spphu4
        else: 
            kq2['ketqua2'] = spphu5
    elif purpose == mucdich5:
        kq2['ketqua1'] = spchinh1
        if medical_insurance == bhyt2:
            kq2['ketqua2'] = spphu1
        else:
            kq2['ketqua2'] = spphu5
    elif purpose == mucdich6:
        kq2['ketqua2'] = spphu4
        if marital_status == honnhan4 or marital_status == honnhan5 or marital_status == honnhan6 or marital_status == honnhan8 or marital_status == honnhan9 or marital_status == honnhan10 or marital_status == honnhan12 or marital_status == honnhan13 or marital_status == honnhan14 and age <= 35:
            kq2['ketqua1'] = spchinh4
        elif income == bien1:
            kq2['ketqua1'] = spchinh1
        elif job_type == typejob2 and age <= 45:
            kq2['ketqua1'] = spchinh2
        elif age <= 35:
            kq2['ketqua1'] = spchinh3
        elif 35 < age <= 45:
            kq2['ketqua1'] = spchinh2
        else: 
            kq2['ketqua1'] = spchinh5
    elif purpose == mucdich7:
        kq2['ketqua2'] = spphu5
        if marital_status == honnhan4 or marital_status == honnhan5 or marital_status == honnhan6 or marital_status == honnhan8 or marital_status == honnhan9 or marital_status == honnhan10 or marital_status == honnhan12 or marital_status == honnhan13 or marital_status == honnhan14 and age <= 35:
            kq2['ketqua1'] = spchinh4
        elif income == bien1:
            kq2['ketqua1'] = spchinh1
        elif job_type == typejob2 and age <= 45:
            kq2['ketqua1'] = spchinh2
        elif age <= 35:
            kq2['ketqua1'] = spchinh3
        elif 35 < age <= 45:
            kq2['ketqua1'] = spchinh2
        else: 
            kq2['ketqua1'] = spchinh5
    elif purpose == mucdich8:
        kq2['ketqua2'] = spphu1
        if marital_status == honnhan4 or marital_status == honnhan5 or marital_status == honnhan6 or marital_status == honnhan8 or marital_status == honnhan9 or marital_status == honnhan10 or marital_status == honnhan12 or marital_status == honnhan13 or marital_status == honnhan14 and age <= 35:
            kq2['ketqua1'] = spchinh4
        elif income == bien1:
            kq2['ketqua1'] = spchinh1
        elif job_type == typejob2 and age <= 45:
            kq2['ketqua1'] = spchinh2
        elif age <= 35:
            kq2['ketqua1'] = spchinh3
        elif 35 < age <= 45:
            kq2['ketqua1'] = spchinh2
        else: 
            kq2['ketqua1'] = spchinh5
    elif purpose == mucdich9:
        kq2['ketqua2'] = spphu2
        if marital_status == honnhan4 or marital_status == honnhan5 or marital_status == honnhan6 or marital_status == honnhan8 or marital_status == honnhan9 or marital_status == honnhan10 or marital_status == honnhan12 or marital_status == honnhan13 or marital_status == honnhan14 and age <= 35:
            kq2['ketqua1'] = spchinh4
        elif income == bien1:
            kq2['ketqua1'] = spchinh1
        elif job_type == typejob2 and age <= 45:
            kq2['ketqua1'] = spchinh2
        elif age <= 35:
            kq2['ketqua1'] = spchinh3
        elif 35 < age <= 45:
            kq2['ketqua1'] = spchinh2
        else:
            kq2['ketqua1'] = spchinh5
    elif purpose == mucdich10:
        kq2['ketqua2'] = spphu3
        if marital_status == honnhan4 or marital_status == honnhan5 or marital_status == honnhan6 or marital_status == honnhan8 or marital_status == honnhan9 or marital_status == honnhan10 or marital_status == honnhan12 or marital_status == honnhan13 or marital_status == honnhan14 and age <= 35:
            kq2['ketqua1'] = spchinh4
        elif income == bien1:
            kq2['ketqua1'] = spchinh1
        elif job_type == typejob2 and age <= 45:
            kq2['ketqua1'] = spchinh2
        elif age <= 35:
            kq2['ketqua1'] = spchinh3
        elif 35 < age <= 45:
            kq2['ketqua1'] = spchinh2
        else:
            kq2['ketqua1'] = spchinh5
    return kq2

def get_time(sex,age,kq2,age_baby):
    if kq2['ketqua1'] == spchinh1 and age <= 30:
        kq3['ketqua1'] = 30
        kq3['ketqua2'] = 'trondoi'
    elif kq2['ketqua1'] == spchinh1 and 30 < age <= 45:
        kq3['ketqua1'] = 25
        kq3['ketqua2'] = 40
    elif kq2['ketqua1'] == spchinh1 and 45 < age <= 55:
        kq3['ketqua1'] = 15
        kq3['ketqua2'] = 25
    elif kq2['ketqua1'] == spchinh1 and 55 < age <= 65:
        kq3['ketqua1'] = 5
        kq3['ketqua2'] = 10
    elif kq2['ketqua1'] == spchinh2 and age <= 30:
        kq3['ketqua1'] = 15
        kq3['ketqua2'] = 20
    elif kq2['ketqua1'] == spchinh2 and 30 < age <= 45:
        kq3['ketqua1'] = 10
        kq3['ketqua2'] = 15 
    elif kq2['ketqua1'] == spchinh2 and 45 < age <= 60:
        kq3['ketqua1'] = 5
        kq3['ketqua2'] = 10 
    elif kq2['ketqua1'] == spchinh2 and 60 < age <= 65:
        kq3['ketqua1'] = 1
        kq3['ketqua2'] = 5
    elif kq2['ketqua1'] == spchinh3 and age <= 30:
        kq3['ketqua1'] = 15
        kq3['ketqua2'] = 25
    elif kq2['ketqua1'] == spchinh3 and 30 < age <= 45:
        kq3['ketqua1'] = 10
        kq3['ketqua2'] = 20
    elif kq2['ketqua1'] == spchinh3 and 45 < age <= 55:
        kq3['ketqua1'] = 10
        kq3['ketqua2'] = 15
    elif kq2['ketqua1'] == spchinh3 and 55 < age <= 65:
        kq3['ketqua1'] = 5
        kq3['ketqua2'] = 10
    elif kq2['ketqua1'] == spchinh4 and 0 < age_baby <= 5:
        kq3['ketqua1'] = 17
        kq3['ketqua2'] = 22
    elif kq2['ketqua1'] == spchinh4 and 5 < age_baby <= 12:
        kq3['ketqua1'] = 11
        kq3['ketqua2'] = 16
    elif sex == gioitinh1 and kq2['ketqua1'] == spchinh5 and age <= 30:
        kq3['ketqua1'] = 15
        kq3['ketqua2'] = 30
    elif sex == gioitinh1 and kq2['ketqua1'] == spchinh5 and 30 < age <= 45:
        kq3['ketqua1'] = 15
        kq3['ketqua2'] = 25
    elif sex == gioitinh1 and kq2['ketqua1'] == spchinh5 and 45 < age <= 55:
        kq3['ketqua1'] = 5
        kq3['ketqua2'] = 15
    elif sex == gioitinh1 and kq2['ketqua1'] == spchinh5 and 55 < age <= 65:
        kq3['ketqua1'] = 5
        kq3['ketqua2'] = 10
    elif sex == gioitinh2 and kq2['ketqua1'] == spchinh5 and age <= 30:
        kq3['ketqua1'] = 15
        kq3['ketqua2'] = 25
    elif sex == gioitinh2 and kq2['ketqua1'] == spchinh5 and 30 < age <= 45:
        kq3['ketqua1'] = 10
        kq3['ketqua2'] = 20
    elif sex == gioitinh2 and kq2['ketqua1'] == spchinh5 and 45 < age <= 55:
        kq3['ketqua1'] = 5
        kq3['ketqua2'] = 15
    elif sex == gioitinh2 and kq2['ketqua1'] == spchinh5 and 55 < age <= 65:
        kq3['ketqua1'] = 5
        kq3['ketqua2'] = 10
    return  kq3

def get_risk_total(interested, chance, think, want, investment_funds):
    if interested == quantam1:
        kqquantam = 20
    elif interested == quantam2:
        kqquantam = 2  
    elif interested == quantam3:
        kqquantam = 5
    if chance == cohoi1:
        kqcohoi = 2
    elif chance == cohoi2:
        kqcohoi = 5
    elif chance == cohoi3:
        kqcohoi = 10 
    elif chance == cohoi4:
        kqcohoi = 20 
    if think == ruiro1:
        kqruiro = 2
    elif think == ruiro2:
        kqruiro = 10 
    elif think == ruiro3:
        kqruiro = 20
    elif think == ruiro4:
        kqruiro = 5
    if want == dautu1:
        kqdautu = 2
    elif want == dautu2:
        kqdautu = 5                  
    elif want == dautu3:
        kqdautu = 10 
    elif want == dautu4:
        kqdautu = 20  
    if investment_funds == phantramtaisanruiro1:
        kqtaisanruiro = 2
    elif investment_funds == phantramtaisanruiro2:
        kqtaisanruiro = 5            
    elif investment_funds == phantramtaisanruiro3:
        kqtaisanruiro = 10 
    elif investment_funds == phantramtaisanruiro4:
        kqtaisanruiro = 20 
    return  kqquantam + kqcohoi + kqruiro + kqdautu + kqtaisanruiro   
