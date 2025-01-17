import 'package:flutter/material.dart';

class CommonProvider extends ChangeNotifier {
  // Maps to store states, countdown values, timer activity, and overall progress states
  final Map<String, bool> _states = {};
  final Map<String, int> _countdowns = {};
  final Map<String, bool> _isTimerActive = {};
  final Map<String, bool> _stateprogress = {
    "aboutyou": false,
    "identity": false,
    "signature": false,
    "billingproof": false,
  };
  // Map to store selected dates
  final Map<String, DateTime?> _selectedDates = {};

  // Get the current state for a key (default value is false if the key doesn't exist)
  bool getStates(String key) {
    if (!_states.containsKey(key)) {
      _states[key] = false; // Initialize the key with false by default
    }
    return _states[key]!;
  }

  // Toggle the current state for a key
  void toggleStates(String key) {
    if (!_states.containsKey(key)) {
      _states[key] =
          false; // Initialize the key with false if not already present
    }
    _states[key] =
        !_states[key]!; // Toggle the state value (false to true or vice versa)
    notifyListeners();
  }

  // Set a specific state for a key
  void setStates(String key, bool value) {
    _states[key] = value; // Set the specific state value
    notifyListeners();
  }

  // Get the current countdown value for a key (default is 120 seconds)
  int getCountdown(String key, {int defaultValue = 120}) {
    if (!_countdowns.containsKey(key)) {
      _countdowns[key] =
          defaultValue; // Initialize countdown with default value
    }
    return _countdowns[key]!;
  }

  // Check if the timer is active for a key
  bool isTimerActive(String key) {
    return _isTimerActive[key] ?? false;
  }

  // Start the countdown for a key
  void startCountdown(String key, {int duration = 120}) {
    _countdowns[key] = duration;
    _isTimerActive[key] = true;
    notifyListeners();
    _runCountdown(key);
  }

  // Private function to handle countdown logic
  void _runCountdown(String key) async {
    while (_countdowns[key]! > 0) {
      await Future.delayed(const Duration(seconds: 1));
      _countdowns[key] = _countdowns[key]! - 1;
      notifyListeners();
    }
    _isTimerActive[key] = false; // Mark the timer as inactive
    notifyListeners();
  }

  void resetCountdown(String key, {int defaultValue = 0}) {
    _countdowns[key] = defaultValue; // Reset the countdown to default value
    _isTimerActive[key] = false; // Mark the timer as inactive
    notifyListeners();
  }

  // Get progress as a percentage of completed states
  double get progress =>
      _stateprogress.values.where((v) => v).length / _stateprogress.length;
  // Check if progress is fully completed
  bool get isProgressComplete => progress == 1.0;
  // Get the state of a specific key in the progress map
  bool getStateProgress(String key) => _stateprogress[key] ?? false;

  // Update the state of a specific key in the progress map
  void updateStateProgress(String key, bool value) {
    if (_stateprogress.containsKey(key)) {
      _stateprogress[key] = value;
      notifyListeners();
    }
  }

  //! Date Picker

  DateTime? getSelectedDate(String key) => _selectedDates[key];
  void setSelectedDate(String key, DateTime date) {
    _selectedDates[key] = date;
    notifyListeners();
  }

  //! Common Update Index Provider
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
