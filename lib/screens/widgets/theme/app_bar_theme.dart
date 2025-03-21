import 'package:app/helpers/colors.dart';
import 'package:flutter/material.dart';

class AppBarThemes {
  static final AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: AppColors.primaryBlueColor,
    titleTextStyle: TextStyle(color: AppColors.primaryWhiteColor, fontSize: 20),
  );

  static final AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: AppColors.primaryGreyColor,
    titleTextStyle: TextStyle(color: AppColors.primaryWhiteColor, fontSize: 20),
  );
}
