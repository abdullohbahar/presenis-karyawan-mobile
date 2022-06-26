import 'package:absensi_karyawan/ui/login-page.dart';
import 'package:flutter/material.dart';
import 'package:absensi_karyawan/helpers/user_info.dart';
import 'package:absensi_karyawan/ui/absensi-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget page = const CircularProgressIndicator();

  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    var token = await UserInfo().getToken();
    if (token == null) {
      setState(() {
        page = LoginPage();
      });
    } else {
      setState(() {
        page = AbsensiPage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Absensi Karyawan',
      debugShowCheckedModeBanner: false,
      home: page,
    );
  }
}
