import 'dart:convert';

import 'package:absensi_karyawan/helpers/api.dart';
import 'package:absensi_karyawan/helpers/api_url.dart';
import 'package:absensi_karyawan/model/login.dart';

class LoginBloc {
  static Future<Login> login({String? email, String? password}) async {
    String apiUrl = ApiUrl.login;

    var body = {"email": email, "password": password};
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return Login.fromJson(jsonObj);
  }
}
