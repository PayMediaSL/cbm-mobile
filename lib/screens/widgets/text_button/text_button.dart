import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnderlinedTextButton extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fonttWeight;
  final VoidCallback onTap;
  final double? fontSize;

  const UnderlinedTextButton({
    super.key,
    required this.text,
    this.color,
    required this.onTap,
    this.fonttWeight,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? 13.sp,
          fontFamily: UIFontFamily.inter,
          color: color ?? AppColors.getStartedSubHeading,
          fontWeight: fonttWeight ?? FontWeight.w400,
          decoration: TextDecoration.underline,
          decorationColor: color,
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fonttWeight;
  final VoidCallback onTap;
  final double? fontSize;

  const CustomTextButton({
    super.key,
    required this.text,
    this.color,
    required this.onTap,
    this.fonttWeight,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? 13.sp,
          fontFamily: UIFontFamily.inter,
          color: color ?? AppColors.getStartedSubHeading,
          fontWeight: fonttWeight ?? FontWeight.w400,
          // decoration: TextDecoration.underline,
          // decorationColor: color,
        ),
      ),
    );
  }
}


  // fontSize: 14,
  //   fontWeight: FontWeight.w400,
  //   color: AppColors.getStartedSubHeading,
  //   fontFamily: UIFontFamily.inter