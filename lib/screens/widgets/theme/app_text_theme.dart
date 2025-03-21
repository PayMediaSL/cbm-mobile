import 'package:app/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:app/helpers/text_styles.dart';

class AppTextTheme {
  static final TextTheme lightTextTheme = TextTheme(
    displaySmall: commonTextStyle,
  );

  static final TextTheme darkTextTheme = TextTheme(
    displaySmall: commonTextStyle.copyWith(
      color: AppColors.primaryAmberColor,
      fontSize: 10,
      fontWeight: FontWeight.bold,
    ),
  );
}
