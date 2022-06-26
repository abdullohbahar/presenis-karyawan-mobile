import 'dart:convert';

import 'package:absensi_karyawan/helpers/api.dart';
import 'package:absensi_karyawan/helpers/api_url.dart';
import 'package:absensi_karyawan/model/presensi_masuk.dart';

class PresensiMasukBloc {
  static Future<PresensiMasuk> masuk({String? idKaryawan}) async {
    String apiUrl = ApiUrl.presensiMasuk;

    var body = {"idKaryawan": idKaryawan};
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return PresensiMasuk.fromJson(jsonObj);
  }
}
