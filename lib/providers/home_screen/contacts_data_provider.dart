import 'package:app/models/contacts/contacts_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart'; // Import your contacts package

class ContactsProvider with ChangeNotifier {
  ContactsProvider() {
    fetchContacts();
  }

  List<MyContact> _contacts = [];
  final bool _isLoading = false;
  final List<Contact> _contactsdetails = [];
  List<MyContact> _filteredContacts = [];

  List<MyContact> get contacts => _contacts;
  bool get isLoading => _isLoading;
  List<Contact> get contactsdetails => _contactsdetails;
  List<MyContact> get filteredContacts => _filteredContacts;

  Future<void> fetchContacts() async {
    PermissionStatus status = await Permission.contacts.request();

    if (status.isGranted) {
      List<Contact> getContacts = await FlutterContacts.getContacts(
        withProperties: true,
        withPhoto: false,
      );

      List<MyContact> newContacts = [];
      for (var contact in getContacts) {
        if (contact.phones.isNotEmpty) {
          MyContact myContact = MyContact(
            name: contact.displayName,
            mobileNumber: contact.phones[0].number,
            hashValue: contact.hashCode,
          );
          newContacts.add(myContact);
          _contacts = newContacts;
          notifyListeners();
        }
      }
    }

    // Notify listeners when the contact list is updated
  }

  String getContactInitials(String? name) {
    if (name == null || name.isEmpty) return "??";

    List<String> names = name.split(" ");
    String firstLetter = names.first[0];
    String lastLetter = names.length > 1 ? names.last[0] : "";

    return lastLetter.isNotEmpty ? "$firstLetter$lastLetter" : firstLetter;
  }

  void filterContacts(String query) {
    final queryLower = query.toLowerCase();
    _filteredContacts = _contacts.where((contact) {
      final nameLower = contact.name?.toLowerCase() ?? '';
      final numberLower = contact.mobileNumber?.toLowerCase() ?? '';
      return nameLower.contains(queryLower) || numberLower.contains(queryLower);
    }).toList();
    notifyListeners();
  }
}
