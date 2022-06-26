import 'dart:convert';

import 'package:absensi_karyawan/helpers/api.dart';
import 'package:absensi_karyawan/helpers/api_url.dart';
import 'package:absensi_karyawan/model/presensi_pulang.dart';

class PresensiPulangBloc {
  static Future<PresensiPulang> pulang({String? idKaryawan}) async {
    String apiUrl = ApiUrl.presensiPulang;

    var body = {"idKaryawan": idKaryawan};
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return PresensiPulang.fromJson(jsonObj);
  }
}
