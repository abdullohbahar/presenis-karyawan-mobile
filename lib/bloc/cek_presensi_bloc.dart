import 'dart:convert';

import 'package:absensi_karyawan/helpers/api.dart';
import 'package:absensi_karyawan/helpers/api_url.dart';
import 'package:absensi_karyawan/model/cek_presensi.dart';

class CekPresensiBloc {
  static Future<CekPresensiMasuk> cekPresensi({String? idKaryawan}) async {
    String apiUrl = ApiUrl.cekPresensiMasuk;

    var body = {"idKaryawan": idKaryawan};
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return CekPresensiMasuk.fromJson(jsonObj);
  }
}
