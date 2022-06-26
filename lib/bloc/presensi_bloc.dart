import 'dart:convert';

import 'package:absensi_karyawan/helpers/api.dart';
import 'package:absensi_karyawan/helpers/api_url.dart';
import 'package:absensi_karyawan/helpers/user_info.dart';
import 'package:absensi_karyawan/model/presensi.dart';

class getPresensiBloc {
  static Future<List<getPresensi>> presensi() async {
    var idKaryawan = await UserInfo().getUserID();

    String apiUrl = ApiUrl.getPresensi + "/" + idKaryawan.toString();
    var response = await Api().get(Uri.parse(apiUrl));
    var jsonObj = json.decode(response.body);
    List<dynamic> listPresensi = (jsonObj as Map<String, dynamic>)['data']['get_presensi'];
    List<getPresensi> showPresensi = [];
    for (int i = 0; i < listPresensi.length; i++) {
      showPresensi.add(getPresensi.fromJson(listPresensi[i]));
    }
    return showPresensi;
  }
}
