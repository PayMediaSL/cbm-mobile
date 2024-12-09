import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _selectedLocale = Locale('en'); // Default locale

  Locale get selectedLocale => _selectedLocale;

  void changeLocale(Locale locale) {
    _selectedLocale = locale;
    notifyListeners();
  }
}
