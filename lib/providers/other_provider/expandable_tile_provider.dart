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
