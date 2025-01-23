import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext {
  bool get isDarkMode =>
      MediaQuery.of(this).platformBrightness == Brightness.dark;
}
