// ignore_for_file: use_super_parameters, camel_case_types

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavIcons {
  static const IconData home = Icons.home;
  static const IconData payment = Icons.payment;
  static const IconData lifestyle = Icons.grid_view;
  static const IconData transactions = Icons.swap_horiz;
  static const IconData menu = Icons.menu;
}

class BaseIcons {
  static const IconData add = Icons.add;
  static const IconData close = Icons.close;
  static const IconData error = Icons.error;
  static const IconData addCircle = Icons.add_circle;
}

class NavigationIcons {
  static const IconData forwardArrowIOS = Icons.arrow_forward_ios_outlined;
  static const IconData backwardArrowIOS = Icons.arrow_back_ios;
  static const IconData arrowForward = Icons.arrow_forward;
  static const IconData arrowBackward = Icons.arrow_back;
  static const IconData dropdownArrow = Icons.arrow_drop_down_rounded;
}

class ActionIcons {
  static const IconData refresh = Icons.refresh;
  static const IconData share = Icons.share;
  static const IconData edit = Icons.edit;
  static const IconData copy = Icons.copy;
  static const IconData download = Icons.download;
}

class FormIcons {
  static const IconData name = Icons.person_outline_rounded;
  static const IconData email = Icons.email_outlined;
  static const IconData birthday = Icons.calendar_month_outlined;
  static const IconData mobile = Icons.phone_outlined;
  static const IconData nic = Icons.person;
  static const IconData address = Icons.home_outlined;
}

class UtilityIcons {
  static const IconData calendar = Icons.calendar_month;
  static const IconData location = Icons.location_on_outlined;
  static const IconData camera = Icons.camera_alt_outlined;
  static const IconData wallet = Icons.account_balance_wallet;
  static const IconData receipt = Icons.receipt_long;
  static const IconData creditCard = Icons.credit_card;
  static const IconData flash = Icons.flash_auto;
  static const IconData check = Icons.check;
  static const IconData more = Icons.more_horiz;
}

class KeyboardIcons {
  static const IconData keyboardUp = Icons.keyboard_arrow_up;
  static const IconData keyboardDown = Icons.keyboard_arrow_down;
  static const IconData menu = Icons.menu_rounded;
  static const IconData gridView = Icons.grid_view;
}

// class AppIcons {
//   static const IconData refresh = Icons.refresh;
//   static const IconData calendar = Icons.calendar_month;
//   static const IconData keyboardup = Icons.keyboard_arrow_up;
//   static const IconData keyboarddown = Icons.keyboard_arrow_down;
//   static const IconData location = Icons.location_on_outlined;
//   static const IconData share = Icons.share;
//   static const IconData camera = Icons.camera_alt_outlined;
//   static const IconData forwardArrowIOS = Icons.arrow_forward_ios_outlined;
//   static const IconData backwardArrowIOS = Icons.arrow_back_ios;
//   static const IconData check = Icons.check;
//   static const IconData more = Icons.more_horiz;
//   static const IconData arrowForward = Icons.arrow_forward;
//   static const IconData arrowBackward = Icons.arrow_back;
//   static const IconData menu = Icons.menu_rounded;
//   static const IconData gridView = Icons.grid_view;
//   static const IconData edit = Icons.edit;
//   static const IconData receipt = Icons.receipt_long;
//   static const IconData add = Icons.add;
//   static const IconData creditCard = Icons.credit_card;
//   static const IconData flash = Icons.flash_auto;
//   static const IconData copy = Icons.copy;
//   static const IconData close = Icons.close;
//   static const IconData error = Icons.error;
//   static const IconData wallet = Icons.account_balance_wallet;
//   static const IconData dropdownArrow = Icons.arrow_drop_down_rounded;
//   static const IconData addCircle = Icons.add_circle;
//   static const IconData download = Icons.download;
//   // Icons.arrow_back
//   //                               : Icons.arrow_forward,
//   //! Details Update Icons
//   static const IconData name = Icons.person_outline_rounded;
//   static const IconData email = Icons.email_outlined;
//   static const IconData birthday = Icons.calendar_month_outlined;
//   static const IconData mobile = Icons.phone_outlined;
//   static const IconData nic = Icons.person;
//   static const IconData address = Icons.person_outline_rounded;
// }

class CustomDropdownArrowIcon extends StatelessWidget {
  final Color? color;
  final double? size;

  const CustomDropdownArrowIcon({Key? key, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_drop_down,
      // color: color ?? Colors.black,
      size: size ?? UI_Iconsize.AUTH_LEADING_ICON_SIZE,
    );
  }
}

class CustomInfoIcon extends StatelessWidget {
  final Color? color;
  final double? size;

  const CustomInfoIcon({Key? key, this.color, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.info_outline,
      color: color ?? AppColors.primaryBlackColor,
      size: size ?? UI_Iconsize.AUTH_LEADING_ICON_SIZE,
    );
  }
}

class CustomLeadingArrowBackIcon extends StatelessWidget {
  final Color? color;
  final double? size;

  const CustomLeadingArrowBackIcon({Key? key, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_back,
      color: color ?? Colors.black,
      size: size ?? UI_Iconsize.AUTH_LEADING_ICON_ARROW_SIZE,
    );
  }
}

class CustomVisibility_ON_Icon extends StatelessWidget {
  final Color? color;
  final double? size;

  const CustomVisibility_ON_Icon({Key? key, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.visibility,
      color: color ?? AppColors.toggleIconColor,
      size: size ?? UI_Iconsize.AUTH_LEADING_ICON_ARROW_SIZE,
    );
  }
}

class CustomVisibility_OFF_Icon extends StatelessWidget {
  final Color? color;
  final double? size;

  const CustomVisibility_OFF_Icon({Key? key, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.visibility_off,
      color: color ?? AppColors.toggleIconColor,
      size: size ?? UI_Iconsize.AUTH_LEADING_ICON_ARROW_SIZE,
    );
  }
}

class ForwardArrowIcon extends StatelessWidget {
  final Color? color;
  final double? size;

  const ForwardArrowIcon({Key? key, this.color, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_forward_ios_rounded,
      color: color ?? AppColors.primarySubBlackColor,
      size: size,
    );
  }
}

class ArrowIcon extends StatelessWidget {
  final double size;
  final double rightPadding;
  final Color? color;

  const ArrowIcon({
    this.size = 18.0,
    this.rightPadding = 10.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_forward_ios,
      size: size.sp,
      color: color ?? AppColors.primaryBlackColor,
    );
  }
}
