import 'package:flutter/material.dart';

class QrScannerState with ChangeNotifier {
  String _qrData = '';

  String get qrData => _qrData;

  void updateQrData(String data) {
    _qrData = data;
    notifyListeners();
  }
}
