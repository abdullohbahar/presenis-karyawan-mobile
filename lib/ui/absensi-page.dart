import 'dart:ffi';

import 'package:absensi_karyawan/bloc/cek_presensi_bloc.dart';
import 'package:absensi_karyawan/bloc/logout_bloc.dart';
import 'package:absensi_karyawan/bloc/presensi_masuk_bloc.dart';
import 'package:absensi_karyawan/bloc/presensi_pulang_bloc.dart';
import 'package:absensi_karyawan/helpers/user_info.dart';
import 'package:absensi_karyawan/ui/data-presensi.dart';
import 'package:absensi_karyawan/ui/login-page.dart';
import 'package:absensi_karyawan/widget/success_dialog.dart';
import 'package:absensi_karyawan/widget/warning_dialog.dart';
import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class AbsensiPage extends StatefulWidget {
  AbsensiPage({Key? key}) : super(key: key);

  @override
  State<AbsensiPage> createState() => _AbsensiPageState();
}

class _AbsensiPageState extends State<AbsensiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Presensi Karyawan')),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              trailing: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AbsensiPage()));
              },
            ),
            ListTile(
              trailing: const Icon(Icons.task_sharp),
              title: const Text('Data Presensi'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => dataPresensi()));
              },
            ),
            ListTile(
              trailing: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                await LogoutBloc.logout().then((value) => {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()))
                    });
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(children: <Widget>[
          SizedBox(
            height: 20,
          ),
          DigitalClock(
            digitAnimationStyle: Curves.elasticOut,
            is24HourTimeFormat: false,
            areaDecoration: BoxDecoration(
              color: Colors.transparent,
            ),
            hourMinuteDigitTextStyle: TextStyle(
              color: Colors.blueGrey,
              fontSize: 50,
            ),
            amPmDigitTextStyle:
                TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.all(25),
            child: FlatButton(
              child: Text(
                'Presensi Masuk',
                style: TextStyle(fontSize: 20.0),
              ),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () {
                _masuk();
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(0),
            child: FlatButton(
              child: Text(
                'Presensi Pulang',
                style: TextStyle(fontSize: 20.0),
              ),
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () {
                _pulang();
              },
            ),
          ),
        ]),
      ),
    );
  }

  void _masuk() async {
    var idKaryawan = await UserInfo().getUserID();
    CekPresensiBloc.cekPresensi(idKaryawan: idKaryawan.toString())
        .then((value) {
      if (value.presensiMasuk == null) {
        PresensiMasukBloc.masuk(idKaryawan: idKaryawan.toString())
            .then((value) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => SuccessDialog(
                    description:
                        "Anda berhasil melakukan presensi masuk pada jam ${value.jam}",
                  ));
        });
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) => const WarningDialog(
                  description: "Anda tadi sudah melakukan presensi masuk",
                ));
      }
    });
  }

  void _pulang() async {
    var idKaryawan = await UserInfo().getUserID();
    CekPresensiBloc.cekPresensi(idKaryawan: idKaryawan.toString())
        .then((value) {
      if (value.presensiPulang == null) {
        PresensiPulangBloc.pulang(idKaryawan: idKaryawan.toString())
            .then((value) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => SuccessDialog(
                    description:
                        "Anda berhasil melakukan presensi pulang pada jam ${value.jam}",
                  ));
        });
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) => const WarningDialog(
                  description: "Anda tadi sudah melakukan presensi pulang",
                ));
      }
    });
  }
}
