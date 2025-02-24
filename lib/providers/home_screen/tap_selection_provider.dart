import 'package:flutter/material.dart';

// TabSelectionModel to manage the selected tab state
class TabSelectionProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
