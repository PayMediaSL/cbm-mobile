// import 'package:flutter/material.dart';

// class TabBarProvider extends ChangeNotifier {
//   int _selectedIndex = 0;

//   int get selectedIndex => _selectedIndex;

//   void updateIndex(int index) {
//     _selectedIndex = index;
//     notifyListeners(); // Notify listeners about state changes
//   }
// }

import 'package:flutter/material.dart';

class TabBarProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  // Update index and notify listeners
  void updateIndex(int index) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      notifyListeners();
    }
  }
}
