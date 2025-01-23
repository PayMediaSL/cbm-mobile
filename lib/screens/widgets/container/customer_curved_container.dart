// ignore_for_file: sized_box_for_whitespace

import 'package:cbm_one_app/helpers/colors.dart';
import 'package:cbm_one_app/helpers/constants.dart';
import 'package:cbm_one_app/services/screen_size_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCurvedContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double? borderradius;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  final EdgeInsetsGeometry? margin;
  const CustomCurvedContainer(
      {super.key,
      this.height,
      this.width,
      this.borderradius,
      this.padding,
      this.margin,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding:
          padding ?? EdgeInsets.symmetric(vertical: 15.sp, horizontal: 15.sp),
      height: height ?? ScreenUtils.height * 0.3,
      width: width ?? ScreenUtils.width,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(borderradius ?? UI.borderRadius)),
      child: child,
    );
  }
}
