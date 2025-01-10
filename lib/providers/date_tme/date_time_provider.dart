import 'package:flutter/material.dart';

// class DateTimeProvider with ChangeNotifier {
//   DateTime _selectedDate = DateTime.now();
//   TimeOfDay _selectedTime = TimeOfDay.now();

//   DateTime get selectedDate => _selectedDate;
//   TimeOfDay get selectedTime => _selectedTime;

//   void updateDate(DateTime date) {
//     _selectedDate = date;
//     notifyListeners();
//   }

//   void updateTime(TimeOfDay time) {
//     _selectedTime = time;
//     notifyListeners();
//   }
// }

class DateTimeProvider with ChangeNotifier {
  // Map to store selected dates for each calendar using a unique dateKey
  final Map<String, DateTime> _selectedDates = {};
  final Map<String, TimeOfDay> _selectedTimes = {};

  DateTime getSelectedDate(String dateKey) =>
      _selectedDates[dateKey] ?? DateTime.now();
  TimeOfDay getSelectedTime(String dateKey) =>
      _selectedTimes[dateKey] ?? TimeOfDay.now();

  void updateDate(String dateKey, DateTime date) {
    _selectedDates[dateKey] = date;
    notifyListeners();
  }

  void updateTime(String dateKey, TimeOfDay time) {
    _selectedTimes[dateKey] = time;
    notifyListeners();
  }
}
