class CekPresensiMasuk {
  String? presensiMasuk;
  String? presensiPulang;

  CekPresensiMasuk({this.presensiMasuk, this.presensiPulang});

  factory CekPresensiMasuk.fromJson(Map<String, dynamic> obj) {
    return CekPresensiMasuk(
        presensiMasuk: obj['data']['cek_presensi_masuk'],
        presensiPulang: obj['data']['cek_presensi_pulang']);
  }
}
