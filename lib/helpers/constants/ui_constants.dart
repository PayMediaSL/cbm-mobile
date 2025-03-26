// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:ui';

import 'package:app/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIFontFamily {
  static const String inter = "inter";
  static const String exo2 = "exo2";
  static const String spaceGrotesk = "spacegrotsek";
  static const String jost = "jost";
}

class UI_Border {
  static Border defaultBorder({Color? color, double width = 1.0}) {
    return Border.all(
      color: color ?? AppColors.primaryGreyColor2,
      style: BorderStyle.solid,
      width: width,
    );
  }

  static Border dynamicGridBorder({required bool isGridView}) {
    return Border.all(
      color: isGridView ? AppColors.onBoardActiveColor : AppColors.transparent,
    );
  }
}

class UI_Iconsize {
  static double AUTH_LEADING_ICON_SIZE = 24.sp;
  static double AUTH_LEADING_ICON_ARROW_SIZE = 20.sp;
  static double VALIDATION_CIRCLE_SIZE = 12.sp;
  static double COMMON_ICON_SIZE = 29.sp;
}

class UI_Icon {
  static double AUTH_LEADING_ICON_SIZE = 24.sp;
}

class UI_Borderradius {
  static double AUTH_LEADING_WIDGET_BORDERRADIUS = 25.sp;
  static double AUTH_LEADING_DROPDOWN_BORDERRADIUS = 25.sp;
  static double COMMON_BORDER_RADIUS = 10.sp;
  static double COMMON_BORDER_RADIUS_2 = 15.sp;
  static double TEXT_FORM_FIELD_RADIUS = 12.sp;
  static double SMALL_BORDER_RADIUS = 10.sp;
  static double PRIMARY_COMMON_BORDER_RADIUS = 12.sp;
}

class UI_Borderwidth {
  static double SMALL_BORDER_WIDTH = 5.sp;
  static double AUTH_LEADING_DROPDOWN_BORDERRADIUS = 25.sp;
}

class UI_Padding {
  static double PADDING_0 = 0.sp;
  static double PADDING = 8.0.sp;
  static double PADDING_2X = PADDING * 2.sp;
  static double PADDING_3X = PADDING * 3.sp;
  static double PADDING_4X = PADDING * 4.sp;
  static double PADDING_8X = PADDING * 8.sp;
  static double PADDING_12X = PADDING * 12.sp;
  static double PADDING_16X = PADDING * 16.sp;
  static double PADDING_20 = 20.sp;
  static double PADDING_15 = 15.sp;

  static double PRIMARY_COMMON_PADDING = 10.sp;
  static double PRIMARY_COMMON_PADDING_2 = 15.sp;
  static double PRIMARY_COMMON_PADDING_3 = 20.sp;
  static double SECONDARY_COMMON_PADDING = 20.sp;
  // static double PRIMARY_COMMON_PADDING_2 = 10.sp;
  // static double PRIMARY_COMMON_PADDING_3 = 20.sp;
  static double PADDING_10 = 10.sp;
  static double PADDING_12 = 12.sp;

  //!Auth
  //Layouts
  static double AUTHLAYOUT_BOTTOM_PADDING = 16.0.sp;
  static double AUTHLAYOUT_HORIZONTAL_PADDING = 20.0.sp;
  static double AUTHLAYOUT_VERTICAL_PADDING = 20.0.sp;
  //LeadingIcons
  static double AUTH_LEADING_WIDGET_HORIZONTAL = 8.sp;
}
