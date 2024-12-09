import 'package:flutter/material.dart';

class CommonProvider extends ChangeNotifier {
  final Map<String, bool> _states = {};

  /// Get the current state for a key (default value can be passed)
  bool getState(String key, {bool defaultValue = true}) {
    if (!_states.containsKey(key)) {
      _states[key] = defaultValue; // Initialize the key with the default value
    }
    return _states[key]!;
  }

  /// Toggle the current state for a key
  void toggleState(String key) {
    _states[key] = !_states[key]!;
    notifyListeners();
  }

  /// Set a specific state for a key
  void setState(String key, bool value) {
    _states[key] = value;
    notifyListeners();
  }
}
