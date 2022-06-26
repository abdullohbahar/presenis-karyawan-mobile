import 'package:absensi_karyawan/bloc/logout_bloc.dart';
import 'package:absensi_karyawan/model/presensi.dart';
import 'package:absensi_karyawan/bloc/presensi_bloc.dart';
import 'package:absensi_karyawan/ui/absensi-page.dart';
import 'package:absensi_karyawan/ui/login-page.dart';
import 'package:flutter/material.dart';

class dataPresensi extends StatefulWidget {
  dataPresensi({Key? key}) : super(key: key);

  @override
  State<dataPresensi> createState() => _dataPresensiState();
}

class _dataPresensiState extends State<dataPresensi> {
  getPresensi? presensi;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Data Presensi")),
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
        body: FutureBuilder<List>(
          future: getPresensiBloc.presensi(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListAbsensi(list: snapshot.data)
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class ListAbsensi extends StatelessWidget {
  final List? list;

  const ListAbsensi({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, i) {
          return ItemAbsensi(absensi: list![i]);
        });
  }
}

class ItemAbsensi extends StatelessWidget {
  final getPresensi absensi;
  const ItemAbsensi({Key? key, required this.absensi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(absensi.jenisPresensi!),
          subtitle: Text(absensi.keterangan! + " | " + absensi.jam! + " | " + absensi.tanggal!),
        ),
      ),
    );
  }
}
