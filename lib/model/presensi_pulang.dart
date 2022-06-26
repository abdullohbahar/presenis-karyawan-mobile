class PresensiPulang {
  String? jam;

  PresensiPulang({this.jam});

  factory PresensiPulang.fromJson(Map<String, dynamic> obj) {
    return PresensiPulang(
      jam:obj['data']['jam']
    );
  }
}
