from rest_framework import serializers

class NhapThongTinDauTuChinhAPI(serializers.Serializer):
    stdautuhangnam = serializers.IntegerField()
    sonamdongphi = serializers.IntegerField()
    sonamhopdong = serializers.IntegerField()
    stbaohiem = serializers.IntegerField()
    laisuatminhhoa = serializers.FloatField()


class AddGoiSanPhamChinhAPI(serializers.Serializer):
    company = serializers.IntegerField()
    ten_loai_hinh_bao_hiem = serializers.CharField()
    id_loai_hinh_bao_hiem = serializers.IntegerField()
    gioi_tinh = serializers.IntegerField()
    tuoi = serializers.IntegerField()
    phi_quan_ly_hop_dong = serializers.FloatField()
    phi_ban_dau_co_ban = serializers.FloatField()
    phi_ban_dau_dong_them = serializers.FloatField()
    phi_cham_dut_co_ban = serializers.FloatField()
    phi_cham_dut_dong_them = serializers.FloatField()
    ten_goi_san_pham_chinh = serializers.CharField()
    id_goi_san_pham_chinh = serializers.IntegerField()
    so_phi_chinh_hang_nam = serializers.FloatField()
    ty_le_phi_rui_ro_hang_nam = serializers.FloatField()


class AddGoiSanPhamPhuAPI(serializers.Serializer):
    company = serializers.IntegerField()
    ten_loai_hinh_bao_hiem = serializers.CharField()
    id_loai_hinh_bao_hiem = serializers.IntegerField()
    ten_goi_san_pham_chinh = serializers.CharField()
    id_goi_san_pham_chinh = serializers.IntegerField()
    ten_goi_san_pham_phu = serializers.CharField()
    id_goi_san_pham_phu = serializers.IntegerField()
    loai_nghe_nghiep = serializers.IntegerField()
    so_tien_bao_hiem = serializers.IntegerField()
    so_phi_phu_nam = serializers.FloatField()


class InfoProductInvestSerRobot(serializers.Serializer):
    robot_dautu_gioitinh = serializers.IntegerField()
    robot_dautu_tuoi = serializers.IntegerField()
    robot_dautu_luong = serializers.IntegerField()
    robot_dautu_tamnhin = serializers.IntegerField()
    robot_dautu_mongmuon = serializers.IntegerField()
    robot_dautu_ruiro = serializers.IntegerField()
    robot_dautu_dudinh = serializers.IntegerField()
    robot_dautu_loaibaohiem = serializers.IntegerField()


class AddDataLaiSuatApiSer(serializers.Serializer):
    nam = serializers.IntegerField()
    laisuat = serializers.FloatField()


class PushSpcInvestmentSer(serializers.Serializer):
    stdautuhangnam = serializers.IntegerField()
    sonamdongphi = serializers.IntegerField()
    sonamhopdong = serializers.IntegerField()
    stbaohiem = serializers.IntegerField()
    laisuatminhhoa = serializers.FloatField()
    cty = serializers.IntegerField()



