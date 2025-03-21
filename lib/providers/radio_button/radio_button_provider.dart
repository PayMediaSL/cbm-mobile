import 'package:flutter/material.dart';

class RadioButtonProvider extends ChangeNotifier {
  final Map<String, String> _selectedOptions = {};

  String getSelectedOption(String groupKey) {
    return _selectedOptions[groupKey] ?? "";
  }

  void setSelectedOption(String groupKey, String value) {
    _selectedOptions[groupKey] = value;
    notifyListeners();
  }
}
