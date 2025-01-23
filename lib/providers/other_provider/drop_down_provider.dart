import 'package:flutter/material.dart';

class DropdownProvider with ChangeNotifier {
  // Map to store the selected value for each dropdown
  Map<String, String> selectedValues = {};

  // Method to update the selected value
  void updateSelectedValue(String dropdownKey, String value) {
    selectedValues[dropdownKey] = value;
    notifyListeners(); // Notify listeners when a value is updated
  }

  // Get the selected value for a specific dropdown
  String getSelectedValue(String dropdownKey) {
    return selectedValues[dropdownKey] ?? '';
  }
}
