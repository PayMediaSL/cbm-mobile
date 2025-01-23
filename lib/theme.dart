// Custom Theme For Dark and Light Mode
import 'package:cbm_one_app/helpers/colors.dart';
import 'package:cbm_one_app/helpers/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: "inter",
    primaryTextTheme: TextTheme(displaySmall: TextStyle()),
    brightness: Brightness.light,
    primaryColor: AppColors.primaryBlueColor,
    scaffoldBackgroundColor: AppColors.SecondarysubGreyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    textTheme: TextTheme(
      displaySmall: commonTextStyle,
    ),
  );

  //! When You try With Copy With value Inside the Copy with will Apply For  Both light and Dark
  //??TODO

  static final ThemeData darkTheme = ThemeData(
      fontFamily: "inter",
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.grey[400],
      textTheme: TextTheme(
          displaySmall: const TextStyle(
        color: Colors.amber,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      )),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.grey,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      iconTheme: IconThemeData(color: Colors.red));
}
