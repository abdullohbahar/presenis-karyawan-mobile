class PresensiMasuk {
  String? jam;

  PresensiMasuk({this.jam});

  factory PresensiMasuk.fromJson(Map<String, dynamic> obj) {
    return PresensiMasuk(
      jam:obj['data']['jam']
    );
  }
}
