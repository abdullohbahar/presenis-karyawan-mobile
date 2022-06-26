class getPresensi {
  String? keterangan;
  String? jenisPresensi;
  String? tanggal;
  String? jam;

  getPresensi({this.keterangan, this.jenisPresensi, this.tanggal, this.jam});

  factory getPresensi.fromJson(Map<String, dynamic> obj) {
    return getPresensi(
      keterangan: obj['keterangan'],
      jenisPresensi: obj['jenis_presensi'],
      tanggal: obj['tanggal'],
      jam: obj['jam'],
    );
  }
}
