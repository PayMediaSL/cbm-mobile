// import 'package:flutter/material.dart';

// // class ExpandableTileProvider extends ChangeNotifier {
// //   final List<bool> _expandedStates = [];

// //   bool isExpanded(int index) {
// //     return _expandedStates[index];
// //   }

// //   void toggleExpansion(int index) {
// //     _expandedStates[index] = !_expandedStates[index];
// //     notifyListeners();
// //   }
// // }

// class ExpandableTileProvider with ChangeNotifier {
//   List<int> _expandedIndexes = [];

//   List<int> get expandedIndexes => _expandedIndexes;

//   // Toggle the expanded state for a specific index
//   void toggleExpanded(int index) {
//     if (_expandedIndexes.contains(index)) {
//       _expandedIndexes.remove(index);
//     } else {
//       _expandedIndexes.add(index);
//     }
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';

class TransactionProvider with ChangeNotifier {
  // This will store the expanded state of each month
  Map<String, int> _expandedTransactionIndices = {};

  // Get the expanded index for the month group
  int? getExpandedTransactionIndex(String monthYear) {
    return _expandedTransactionIndices[monthYear];
  }

  // Toggle the expanded state of a specific transaction within the group
  void toggleTransactionExpansion(String monthYear, int index) {
    if (_expandedTransactionIndices[monthYear] == index) {
      // If it's already expanded, collapse it
      _expandedTransactionIndices.remove(monthYear);
    } else {
      // Expand the selected transaction and collapse others
      _expandedTransactionIndices[monthYear] = index;
    }
    notifyListeners();
  }
}
