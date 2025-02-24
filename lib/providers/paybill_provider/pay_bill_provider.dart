import 'package:flutter/material.dart';

class PayBillProvider extends ChangeNotifier {
  final List<bool> _expandedStates = [];

  void initializeState(int length) {
    if (_expandedStates.isEmpty) {
      _expandedStates.addAll(List.generate(length, (_) => false));
    }
  }

  bool isExpanded(int index) {
    return _expandedStates[index];
  }

  void toggleExpansion(int index) {
    _expandedStates[index] = !_expandedStates[index];
    notifyListeners();
  }
}
