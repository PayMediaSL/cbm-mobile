// ignore_for_file: use_super_parameters, camel_case_types

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants/ui_constants.dart';
import 'package:flutter/material.dart';

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
      color: color ?? Colors.black,
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
