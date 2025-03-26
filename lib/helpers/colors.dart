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

  // static Color primaryRedColor = Colors.red;
  static Color primaryAmberColor = Colors.amber;
  static Color primaryBlueColor = HexColor("#103489");
  static Color secondaryBlueColor = HexColor("#578AFA");
  static Color secondarySubBlueColor = HexColor("#C7DBF6");
  static Color secondarySubBlueColor2 = HexColor("#3F6BD1");

  static Color primaryWhiteColor = HexColor("#FFFFFF");
  static Color primaryBlackColor = HexColor("#020617");
  static Color primarySubBlackColor = HexColor("#475569");
  static Color primaryGreyColor = HexColor("#E5E7EB");
  static Color secondarySubBlackColor = HexColor("#475569");
  static Color primaryGreyColor2 = HexColor("#DADADA");

  static Color? primaryRedShadeColor = Colors.red[50];
  static Color? primaryGreenShadeColor = Colors.green[50];
  static Color primaryRedColor = HexColor("#DC2626");
  static Color primaryGreenColor = HexColor("#16A34A");
  static Color suffixIconColor = HexColor("#B0B0B0");
  static Color primarypaleGreenColor = HexColor("#22C55E");
  static Color primarypaleRedColor = HexColor("#F24141");
  static Color primaryRadioButtonFillColor = HexColor("#71717A");
  static Color toggleSwitchThumpColor = HexColor("#FEF7FF");

  //?Authentication'

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
  static Color textFieldBorderColor2 = HexColor("#D1D5DB");

  //! TextField Hint Color
  static Color textFieldHintColor = HexColor("#94A3B8");

  //! Sub Grey Color
  static Color SecondarysubGreyColor = HexColor("#E5E7EB");
  static Color secondarysubGreyColor2 = HexColor("#64748B");
  static Color secondarysubGreyColor3 = HexColor("#9CA3AF");
  static Color secondarysubGreyColor4 = HexColor("#6B7280");
  static Color secondarysubGreyColor5 = HexColor("#E2E8F0");
  static Color? secondarysubGreyColor6 = Colors.grey[200];

  //bottom Navigation bgColor

  static Color bottomNavBgColor = HexColor("#E0EBF9");
  static Color iconGreyColor = HexColor("#EEEEEF");
  static Color bottomNavIconColor = HexColor("#334155");

  //? Home Screen Life style Color

  static Color homeLifestyleFood = HexColor("#EDB37E");
  static Color homeLifestyleEntertainment = HexColor("#AFCCA1");
  static Color homeLifestyleHealth = HexColor("#92B0EA");
  static Color homeLifestyleInsurance = HexColor("#9DDDD5");
  static Color homeLifestyleGaming = HexColor("#9DDDD5");
  static Color homeLifestyleEcommerce = HexColor("#9ACED9");
  static Color homeLifestyleTrabsport = HexColor("#F2A9CE");
  static Color homeLifestyleEducation = HexColor("#CDD0CD");

  //? Do moere in home Scereenm
  static Color doDoMoreColor1 = HexColor("#FEE7FE");
  static Color doDoMoreColor2 = HexColor("#F1EFE1");
  static Color doDoMoreColor3 = HexColor("#EAEAEA");
  static Color doDoMoreColor4 = HexColor("#D4EFFA");

  //? Payment Color
  static Color paymentGlobalTransferColor = HexColor("#EDB37E");
  static Color paymentDomesticTransferColor = HexColor("#AFCCA1");
  static Color paymentPaybillColor = HexColor("#92B0EA");
  static Color paymentQRPayColor = HexColor("#9DDDD5");
  static Color paymentfavraPayColor = HexColor("#9ACED9");
  static Color paymentcardPaymentcolor = HexColor("#F2A9CE");
  static Color paymentMobileReload = HexColor("#CDD0CD");
  static Color paymentSchedulePayment = HexColor("#FC8D94");

  //? ICon Color

  static Color toggleIconColor = HexColor("#334155");
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
