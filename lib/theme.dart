// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:app/helpers/colors.dart';
// import 'package:app/helpers/constants/ui_constants.dart';
// import 'package:app/helpers/text_styles.dart';

// class CustomTheme {
//   static ThemeData get lightTheme => ThemeData(
//         fontFamily: UIFontFamily.inter,
//         brightness: Brightness.light,
//         primaryColor: AppColors.primaryBlueColor,
//         scaffoldBackgroundColor: AppColors.SecondarysubGreyColor,
//         textTheme: _lightTextTheme,
//         appBarTheme: _lightAppBarTheme,
//       );

//   static ThemeData get darkTheme => ThemeData(
//         fontFamily: UIFontFamily.inter,
//         brightness: Brightness.dark,
//         primaryColor: AppColors.primaryBlackColor,
//         scaffoldBackgroundColor: AppColors.primaryGreyColor2,
//         textTheme: _darkTextTheme,
//         appBarTheme: _darkAppBarTheme,
//         iconTheme: _darkIconTheme,
//       );

//   //? THEME VALUE CAN ABLE TO MODIFY

//   //** Text Themes */
//   static final TextTheme _lightTextTheme = TextTheme(
//     displaySmall: commonTextStyle,
//   );

//   static final TextTheme _darkTextTheme = TextTheme(
//     displaySmall: TextStyle(
//       color: AppColors.primaryAmberColor,
//       fontSize: 10.sp,
//       fontWeight: FontWeight.bold,
//     ),
//   );

//   //** App Bar Themes */
//   static final AppBarTheme _lightAppBarTheme = AppBarTheme(
//     backgroundColor: AppColors.primaryBlueColor,
//     titleTextStyle:
//         TextStyle(color: AppColors.primaryWhiteColor, fontSize: 20.sp),
//   );

//   static final AppBarTheme _darkAppBarTheme = AppBarTheme(
//     backgroundColor: AppColors.primaryGreyColor,
//     titleTextStyle:
//         TextStyle(color: AppColors.primaryWhiteColor, fontSize: 20.sp),
//   );

//   //** Icon Theme */
//   static final IconThemeData _darkIconTheme = IconThemeData(
//     color: AppColors.primaryRedColor,
//   );
// }

import 'package:app/helpers/colors.dart';
import 'package:app/screens/widgets/text_style/font_family.dart';
import 'package:app/screens/widgets/theme/app_bar_theme.dart';
import 'package:app/screens/widgets/theme/app_text_theme.dart';
import 'package:app/screens/widgets/theme/icon_theme.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme => ThemeData(
        fontFamily: primaryFontFamily,
        brightness: Brightness.light,
        primaryColor: AppColors.primaryBlueColor,
        scaffoldBackgroundColor: AppColors.SecondarysubGreyColor,
        textTheme: AppTextTheme.lightTextTheme,
        appBarTheme: AppBarThemes.lightAppBarTheme,
      );

  static ThemeData get darkTheme => ThemeData(
        fontFamily: primaryFontFamily,
        brightness: Brightness.dark,
        primaryColor: AppColors.primaryBlackColor,
        scaffoldBackgroundColor: AppColors.primaryGreyColor2,
        textTheme: AppTextTheme.darkTextTheme,
        appBarTheme: AppBarThemes.darkAppBarTheme,
        iconTheme: AppIconTheme.darkIconTheme,
      );
}
