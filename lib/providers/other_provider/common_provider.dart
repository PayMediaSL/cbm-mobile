// import 'package:flutter/material.dart';

// class CommonProvider extends ChangeNotifier {
//   final Map<String, bool> _states = {};

//   /// Get the current state for a key (default value can be passed)
//   bool getState(String key, {bool defaultValue = true}) {
//     if (!_states.containsKey(key)) {
//       _states[key] = defaultValue; // Initialize the key with the default value
//     }
//     return _states[key]!;
//   }

//   /// Toggle the current state for a key
//   void toggleState(String key) {
//     _states[key] = !_states[key]!;
//     notifyListeners();
//   }

//   /// Set a specific state for a key
//   void setState(String key, bool value) {
//     _states[key] = value;
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';

class CommonProvider extends ChangeNotifier {
  final Map<String, bool> _states = {};
  final Map<String, int> _countdowns = {};
  final Map<String, bool> _isTimerActive = {};

  /// Get the current state for a key (default value is false if the key doesn't exist)
  bool getState(String key) {
    if (!_states.containsKey(key)) {
      _states[key] = false; // Initialize the key with false by default
    }
    return _states[key]!;
  }

  /// Toggle the current state for a key
  void toggleState(String key) {
    if (!_states.containsKey(key)) {
      _states[key] =
          false; // Ensure the key is initialized with false if not already
    }
    _states[key] =
        !_states[key]!; // Toggle the state value (false to true or vice versa)
    notifyListeners();
  }

  /// Set a specific state for a key
  void setState(String key, bool value) {
    _states[key] = value; // Set the specific state value
    notifyListeners();
  }

  /// Get the current state for a key (default value can be passed)
  // bool getState(String key, {bool defaultValue = true}) {
  //   if (!_states.containsKey(key)) {
  //     _states[key] = defaultValue; // Initialize the key with the default value
  //   }
  //   return _states[key]!;
  // }

  // /// Toggle the current state for a key
  // void toggleState(String key) {
  //   _states[key] = !_states[key]!;
  //   notifyListeners();
  // }

  // /// Set a specific state for a key
  // void setState(String key, bool value) {
  //   _states[key] = value;
  //   notifyListeners();
  // }

  ///? ////
  /// Get the current countdown value for a key
  int getCountdown(String key, {int defaultValue = 120}) {
    if (!_countdowns.containsKey(key)) {
      _countdowns[key] = defaultValue;
    }
    return _countdowns[key]!;
  }

  /// Check if the timer is active
  bool isTimerActive(String key) {
    return _isTimerActive[key] ?? false;
  }

  /// Start the countdown for a key
  void startCountdown(String key, {int duration = 120}) {
    _countdowns[key] = duration;
    _isTimerActive[key] = true;
    notifyListeners();
    _runCountdown(key);
  }

  /// Private function to handle countdown
  void _runCountdown(String key) async {
    while (_countdowns[key]! > 0) {
      await Future.delayed(const Duration(seconds: 1));
      _countdowns[key] = _countdowns[key]! - 1;
      notifyListeners();
    }
    _isTimerActive[key] = false; // Mark the timer as inactive
    notifyListeners();
  }
}
