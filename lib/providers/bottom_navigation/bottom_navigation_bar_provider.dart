// import 'package:flutter/material.dart';

// // class BottomNavBarProvider with ChangeNotifier {
// //   int _selectedIndex = 0;
// //   int get selectedIndex => _selectedIndex;

// //   Widget _currentScreen;
// //   Widget get currentScreen => _currentScreen;

// //   final HomeScreenDataProvider homeDataProvider;

// //   BottomNavBarProvider({
// //     required this.homeDataProvider,
// //   }) : _currentScreen = MainHomeScreen();

// //   void updateIndex(int index, Widget newScreen) {
// //     _selectedIndex = index;
// //     _currentScreen = newScreen;
// //     notifyListeners();
// //   }
// // }

// class BottomNavProvider with ChangeNotifier {
//   int _currentIndex = 0;

//   int get currentIndex => _currentIndex;

//   void updateIndex(int index) {
//     _currentIndex = index;
//     notifyListeners();
//   }
// }

import 'package:cbm_one_app/screens/main_screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class BottomNavProvider with ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  Widget _currentScreen;
  Widget get currentScreen => _currentScreen;

  BottomNavProvider() : _currentScreen = MainHomeScreen();

  void updateIndex(int index, Widget newScreen) {
    _selectedIndex = index;
    _currentScreen = newScreen;
    notifyListeners();
  }
}
