// import 'package:flutter/material.dart';

// class ValidationProvider with ChangeNotifier {
//   bool _isPasswordValid = false;
//   bool _isPasswordChecked = false;

//   bool get isPasswordValid => _isPasswordValid;
//   bool get isPasswordChecked => _isPasswordChecked;

//   void validatePassword(String password, String? previousPassword) {
//     if (password.isEmpty) {
//       _isPasswordValid = false;
//     } else if (password.length != 6 || !RegExp(r'^\d{6}$').hasMatch(password)) {
//       _isPasswordValid = false;
//     } else if (previousPassword != null && password != previousPassword) {
//       _isPasswordValid = false;
//     } else {
//       _isPasswordValid = true;
//     }
//     _isPasswordChecked = true;
//     notifyListeners(); // Notify listeners of the change
//   }

//   void resetValidation() {
//     _isPasswordChecked = false;
//     _isPasswordValid = false;
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';

class ValidationProvider with ChangeNotifier {
  bool _hasMinLength = false;
  bool _hasUpperCase = false;
  bool _hasLowerCase = false;
  bool _hasNumber = false;
  bool _isPasswordChecked = false;

  bool get hasMinLength => _hasMinLength;
  bool get hasUpperCase => _hasUpperCase;
  bool get hasLowerCase => _hasLowerCase;
  bool get hasNumber => _hasNumber;
  bool get isPasswordChecked => _isPasswordChecked;

  void validatePassword(String password) {
    _hasMinLength = password.length >= 8;
    _hasUpperCase = password.contains(RegExp(r'[A-Z]'));
    _hasLowerCase = password.contains(RegExp(r'[a-z]'));
    _hasNumber = password.contains(RegExp(r'[0-9]'));

    _isPasswordChecked = true;
    notifyListeners(); // Notify UI of changes
  }

  void resetValidation() {
    _hasMinLength = false;
    _hasUpperCase = false;
    _hasLowerCase = false;
    _hasNumber = false;
    _isPasswordChecked = false;
    notifyListeners();
  }
}
