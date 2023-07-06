import 'package:flutter/material.dart';
import 'package:musasy/model/modelJadwal.dart';
import 'package:musasy/model/modelLogin.dart';

class JadwalProvider with ChangeNotifier {
  List<ModelJadwal> _listJadwal = [];

  List<ModelJadwal> get allJadwal => _listJadwal;

  void buatJadwal(ModelJadwal newJadwal) {
    _listJadwal.add(newJadwal);
    notifyListeners();
  }
}
