import 'package:app/helpers/colors.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClickableTextSpan extends TextSpan {
  ClickableTextSpan({
    required String text,
    required TextStyle style,
    required VoidCallback onTap,
  }) : super(
          text: text,
          style: style,
          recognizer: TapGestureRecognizer()..onTap = onTap,
        );
}

class TermsAndPrivacyText extends StatelessWidget {
  final VoidCallback onTermsTap;
  final VoidCallback onPrivacyTap;

  const TermsAndPrivacyText({
    super.key,
    required this.onTermsTap,
    required this.onPrivacyTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By using OneApp, you agree to our ',
            style: TextStyle(color: AppColors.primaryBlackColor),
          ),
          ClickableTextSpan(
            text: 'Terms of Use',
            style: mainButtonTextStyle.copyWith(
                color: AppColors.primarySubBlackColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w700),
            onTap: onTermsTap,
          ),
          const TextSpan(
            text: ' and ',
            style: TextStyle(color: Colors.black),
          ),
          ClickableTextSpan(
            text: 'Privacy Policy',
            style: mainButtonTextStyle.copyWith(
                color: AppColors.primarySubBlackColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w700),
            onTap: onPrivacyTap,
          ),
        ],
      ),
    );
  }
}
