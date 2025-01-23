import 'package:flutter/material.dart';

class HomeScreenDataProvider extends ChangeNotifier {
  // List<Map<String, dynamic>> quickAccess = [];
  // String? selectedItem; // Track the selected item by its name

  // HomeScreenDataProvider() {
  //   _loadQuickAccess();
  // }

  // // Load saved quick access items from shared preferences
  // Future<void> _loadQuickAccess() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? savedItems = prefs.getString('quickAccess');
  //   if (savedItems != null) {
  //     List<dynamic> decodedItems = jsonDecode(savedItems);
  //     quickAccess = decodedItems
  //         .map((item) => {
  //               'name': item['name'],
  //               'assetImage': item['assetImage'],
  //             })
  //         .toList();
  //   }
  //   notifyListeners();
  // }

  // // Save quick access items to shared preferences
  // Future<void> _saveQuickAccess() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String encodedItems = jsonEncode(quickAccess);
  //   await prefs.setString('quickAccess', encodedItems);
  // }

  // // Add an item to quickAccess and save it
  // Future<void> addItem(String name, String assetImage) async {
  //   quickAccess.add({"name": name, "assetImage": assetImage});
  //   await _saveQuickAccess(); // Save the updated list to shared preferences
  //   notifyListeners(); // Notify listeners for UI update
  // }

  // // Select an item and set it as the active item
  // void selectItem(String name) {
  //   selectedItem = name;
  //   notifyListeners(); // Notify listeners for UI update
  // }

  // // Delete an item from quickAccess and shared preferences
  // Future<void> deleteItem(int index) async {
  //   quickAccess.removeAt(index);
  //   await _saveQuickAccess(); // Save the updated list to shared preferences
  //   notifyListeners(); // Notify listeners for UI update
  // }
}
