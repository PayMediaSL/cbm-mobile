// ignore_for_file: sized_box_for_whitespace

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants.dart';
import 'package:app/helpers/constants/ui_constants.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:flutter/material.dart';

class CustomCurvedContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double? borderradius;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final Color? color;

  final EdgeInsetsGeometry? margin;
  const CustomCurvedContainer(
      {super.key,
      this.height,
      this.width,
      this.borderradius,
      this.padding,
      this.margin,
      this.color,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding ??
          EdgeInsets.symmetric(
              vertical: UI_Padding.PRIMARY_COMMON_PADDING_2,
              horizontal: UI_Padding.PRIMARY_COMMON_PADDING_2),
      height: height ?? ScreenUtils.height * 0.3,
      width: width ?? ScreenUtils.width,
      decoration: BoxDecoration(
          color: color ?? AppColors.primaryWhiteColor,
          borderRadius: BorderRadius.circular(borderradius ?? UI.borderRadius)),
      child: child,
    );
  }
}
