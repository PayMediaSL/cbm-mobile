import 'package:flutter/material.dart';

class QRCodeProvider with ChangeNotifier {
  String _data = "https://example.com";
  String _scannedData = '';

  String get data => _data;
  String get scannedData => _scannedData;

  void updateQRData(String newData) {
    _data = newData;
    notifyListeners();
  }

  void updateScannedData(String data) {
    _scannedData = data;
    notifyListeners();
  }
}
