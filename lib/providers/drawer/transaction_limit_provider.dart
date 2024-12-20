import 'package:flutter/material.dart';

class TransactionLimitProvider with ChangeNotifier {
  List<Map<String, String>> _dataList = [];

  List<Map<String, String>> get dataList => _dataList;

  TransactionLimitProvider() {
    fetchData();
  }

  // Method to fetch data from the API
  Future<void> fetchData() async {
    // Replace with actual API response
    _dataList = [
      {
        'title': 'Daily limit of transfer between own accounts',
        'amount': 'LKR 999,999,999.00',
      },
      {
        'title': 'Maximum withdrawal limit',
        'amount': 'LKR 500,000,000.00',
      },
      {
        'title': 'Maximum deposit limit',
        'amount': 'LKR 300,000,000.00',
      },
      {
        'title': 'Maximum deposit limit',
        'amount': 'LKR 300,000,000.00',
      },
      {
        'title': 'Maximum deposit limit',
        'amount': 'LKR 300,000,000.00',
      },
      {
        'title': 'Maximum deposit limit',
        'amount': 'LKR 300,000,000.00',
      },
      {
        'title': 'Maximum deposit limit',
        'amount': 'LKR 300,000,000.00',
      },
      {
        'title': 'Maximum deposit limit',
        'amount': 'LKR 300,000,000.00',
      },
      {
        'title': 'Maximum deposit limit',
        'amount': 'LKR 300,000,000.00',
      },
      {
        'title': 'Maximum deposit limit',
        'amount': 'LKR 300,000,000.00',
      },
    ];

    notifyListeners(); // Notify listeners about the new data
  }
}
