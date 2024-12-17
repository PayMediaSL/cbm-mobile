import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsProvider extends ChangeNotifier {
  List<Contact> _contacts = [];
  bool _isLoading = false;

  List<Contact> get contacts => _contacts;
  bool get isLoading => _isLoading;

  ContactsProvider() {
    loadContacts();
  }

  Future<void> loadContacts() async {
    _isLoading = true;
    notifyListeners();

    // Request permission to access contacts
    PermissionStatus status = await Permission.contacts.request();
    if (status.isGranted) {
      // Fetch contacts
      Iterable<Contact> fetchedContacts = await ContactsService.getContacts();
      _contacts = fetchedContacts.where((c) => c.displayName != null).toList();
    } else {
      // Handle permission denial
      print("Permission denied!");
    }

    _isLoading = false;
    notifyListeners();
  }

  String getContactInitials(String? name) {
    if (name == null || name.isEmpty) return "??";

    List<String> names = name.split(" ");
    String firstLetter = names.first[0];
    String lastLetter = names.length > 1 ? names.last[0] : "";

    return lastLetter.isNotEmpty ? "$firstLetter$lastLetter" : firstLetter;
  }
}
