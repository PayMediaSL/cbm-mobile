import 'package:flutter/material.dart';

class TransactionDataProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _transactions = [
    {
      "title": "Purchase Pickme",
      "amount": -3670.00,
      "type": "Debit",
      "date": "24-Jul 10:53"
    },
    {
      "title": "Allowance June 2024",
      "amount": 2543.00,
      "type": "Credit",
      "date": "24-Jul 10:53"
    },
    {
      "title": "Purchase Pickme",
      "amount": -3670.00,
      "type": "Debit",
      "date": "24-Jul 10:53"
    },
    {
      "title": "Purchase Pickme",
      "amount": -3670.00,
      "type": "Debit",
      "date": "24-Jul 10:53"
    },
    {
      "title": "Allowance June 2024",
      "amount": 2543.00,
      "type": "Credit",
      "date": "24-Jul 10:53"
    },
    {
      "title": "Allowance June 2024",
      "amount": 2543.00,
      "type": "Credit",
      "date": "24-Jul 10:53"
    },
    {
      "title": "Purchase Pickme",
      "amount": -3670.00,
      "type": "Debit",
      "date": "24-Jul 10:53"
    },
  ];
  Map<int, bool> expandedState = {};

  Map<int, double> _swipeOffsets = {};

  List<Map<String, dynamic>> get transactions => _transactions;
  Map<int, double> get swipeOffsets => _swipeOffsets;

  void toggleExpandedState(int index) {
    expandedState[index] = !(expandedState[index] ?? false);
    notifyListeners();
  }

  // Method to reset the state (if needed)
  void resetExpandedState(int index) {
    expandedState[index] = false;
    notifyListeners();
  }

  // Update the swipe offset with maximum swipe limit
  void updateSwipeOffset(int index, double offset, double screenWidth,
      double maxSwipeOffsetFactor) {
    _swipeOffsets[index] =
        offset.clamp(-screenWidth * maxSwipeOffsetFactor, 0.0);
    notifyListeners();
  }

  // Reset swipe offset when drag ends based on the threshold
  void resetSwipeOffset(int index, double swipeThresholdFactor,
      double screenWidth, double maxSwipeOffsetFactor) {
    if (_swipeOffsets[index]! < -screenWidth * swipeThresholdFactor) {
      _swipeOffsets[index] =
          -screenWidth * maxSwipeOffsetFactor; // Swipe is considered complete
    } else {
      _swipeOffsets[index] =
          0.0; // Reset swipe if it's not beyond the threshold
    }
    notifyListeners();
  }

  double? getSwipeOffset(int index) => _swipeOffsets[index];

  // void updateSwipeOffset(int index, double offset) {
  //   _swipeOffsets[index] = offset;
  //   notifyListeners();
  // }

  // void resetSwipeOffset(int index, double threshold, double screenWidth) {
  //   if (_swipeOffsets[index]! < -screenWidth * threshold) {
  //     _swipeOffsets[index] = -screenWidth * 0.2;
  //   } else {
  //     _swipeOffsets[index] = 0.0;
  //   }
  //   notifyListeners();
  // }
}
