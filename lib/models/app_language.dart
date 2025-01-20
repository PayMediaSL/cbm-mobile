import 'dart:convert';

import 'package:cbm_one_app/constants.dart';
import 'package:cbm_one_app/utils/log_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AvailableLanguages { en, si, ta }

class AppLanguage extends ChangeNotifier {
  String? _appLocale = 'en';
  final String _defaultLocale = 'en';

  Map<String, String>? _localizedStrings;

  String get appLocale => _appLocale ?? _defaultLocale;

  set appLocal(String? locale) {
    _appLocale = locale;
    notifyListeners();
  }

  void changeLanguage(AvailableLanguages language) async {
    printLog("changeLanguage to: $language");
    switch (language) {
      case AvailableLanguages.en:
        appLocal = "en";
        break;
      case AvailableLanguages.si:
        appLocal = "si";
        break;
      case AvailableLanguages.ta:
        appLocal = "ta";
        break;
      default:
        appLocal = "en";
        break;
    }
    load();
    notifyListeners();
  }

  void changeLanguageByCode(String? code) async {
    code ??= "en";
    printLog("changeLanguage to: $code");

    if (!["en", "si", "ta"].contains(code)) {
      appLocal = "en";
    } else {
      appLocal = code;
    }
    await load();
    notifyListeners();
  }

  Future<void> load() async {
    String langFile = 'i18n/$appLocale.json';
    printLog('Load lang file -> $langFile');

    String jsonString = await rootBundle.loadString(langFile);

    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));

    notifyListeners();
  }

  String getString(String key) => _localizedStrings?[key] ?? key;

  Future<String?> setAppLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    String? lang = prefs.getString(Keys.appLanguage);
    changeLanguageByCode(lang);
    return lang ?? "en";
  }

  AvailableLanguages getCurrentLang() {
    switch (appLocale) {
      case 'en':
        return AvailableLanguages.en;
      case 'si':
        return AvailableLanguages.si;
      case 'ta':
        return AvailableLanguages.ta;
      default:
        return AvailableLanguages.en;
    }
  }
}
