import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToggleSwitchProvider with ChangeNotifier {
  Map<String, bool> _switchStates = {};

  bool getSwitchState(String key) {
    return _switchStates[key] ?? false; // Default to false if not set
  }

  ToggleSwitchProvider() {
    _loadSwitchStates();
  }

  void toggleSwitch(String key, bool value) async {
    _switchStates[key] = value;
    notifyListeners();
    await _saveSwitchState(key);
  }

  Future<void> _loadSwitchStates() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (String key in prefs.getKeys()) {
      if (key.startsWith('switch_')) {
        _switchStates[key] = prefs.getBool(key) ?? false;
      }
    }
    notifyListeners();
  }

  // Save the state of a specific switch
  Future<void> _saveSwitchState(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, _switchStates[key]!);
  }
}
