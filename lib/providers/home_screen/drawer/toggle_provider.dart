import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToggleSwitchProvider with ChangeNotifier {
  bool _isSwitched = false;

  bool get isSwitched => _isSwitched;

  ToggleSwitchProvider() {
    _loadSwitchState(); // Load the saved state when the app starts
  }

  void toggleSwitch(bool value) async {
    _isSwitched = value;
    notifyListeners();
    await _saveSwitchState(); // Save the state to local storage
  }

  Future<void> _loadSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isSwitched = prefs.getBool('isSwitched') ?? false; // Default to false
    notifyListeners();
  }

  Future<void> _saveSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSwitched', _isSwitched);
  }
}
