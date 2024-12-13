import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const int _primaryValue = 0xFFfc470f;
  static const MaterialColor primaryColor = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(_primaryValue),
      100: Color(_primaryValue),
      200: Color(_primaryValue),
      300: Color(_primaryValue),
      400: Color(_primaryValue),
      500: Color(_primaryValue),
      600: Color(_primaryValue),
      700: Color(_primaryValue),
      800: Color(_primaryValue),
      900: Color(_primaryValue),
    },
  );

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;

  static Color primaryRedColor = Colors.red;
  static Color primaryAmberColor = Colors.amber;
  static Color primaryBlueColor = HexColor("#103489");
  static Color primaryWhiteColor = HexColor("#FFFFFF");
  static Color primaryBlackColor = HexColor("#020617");
  static Color primarySubBlackColor = HexColor("#475569");
  static Color primaryGreyColor = HexColor("#E5E7EB");
  static Color secondarySubBlackColor = HexColor("#475569");
  static Color primaryGreyColor2 = HexColor("#DADADA");

  //! Primary Sub BlackColor

  //! Onboard Indicator
  static Color onBoardActiveColor = HexColor("#CBD5E1");
  static Color onBoardSubTextStyleColor = HexColor("#64748B");
  // static Color onBoardInActiveColor = HexColor("#FFFFFF");

  //! Button Color
  static Color mainButtonBgColor = HexColor("#3A69CF");
  static Color subGreyColor = HexColor("#fafafa");

  //! Egt started SubHeadingColor
  static Color getStartedSubHeading = HexColor("#CBD5E1");

  //! TextField Border Color
  static Color textFieldBorderColor = HexColor("#CBD5E1");

  //! TextField Hint Color
  static Color textFieldHintColor = HexColor("#94A3B8");

  //! Sub Grey Color
  static Color SecondarysubGreyColor = HexColor("#E5E7EB");

  //bottom Navigation bgColor

  static Color bottomNavBgColor = HexColor("#E0EBF9");
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
