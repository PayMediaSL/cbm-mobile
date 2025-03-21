import 'package:app/helpers/colors.dart';
import 'package:app/helpers/routes.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/screens/widgets/text_style/font_family.dart';
import 'package:app/utils/navigation_util.dart';
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
          fontFamily: primaryFontFamily,
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
  final bool isDisabled;

  const CustomTextButton({
    super.key,
    required this.text,
    this.color,
    required this.onTap,
    this.isDisabled = false,
    this.fonttWeight,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap,
      onTap: isDisabled ? null : onTap,

      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? 13.sp,
          fontFamily: primaryFontFamily,
          color: color ?? AppColors.getStartedSubHeading,
          fontWeight: fonttWeight ?? FontWeight.w400,
          // decoration: TextDecoration.underline,
          // decorationColor: color,
        ),
      ),
    );
  }
}

class ForgotPasswordButton extends StatelessWidget {
  final VoidCallback? onTap;

  const ForgotPasswordButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: GestureDetector(
        onTap:
            onTap ?? () => pushScreen(context, ScreenRoutes.toforgetPswScreen),
        child: Text(
          "Forgot Password?",
          style: commonTextStyle.copyWith(
            color: AppColors.primarySubBlackColor,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}



  // fontSize: 14,
  //   fontWeight: FontWeight.w400,
  //   color: AppColors.getStartedSubHeading,
  //   fontFamily: UIFontFamily.inter