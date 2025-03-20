import 'package:app/helpers/colors.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClickableTextSpan extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final TextStyle? style;

  const ClickableTextSpan({
    super.key,
    required this.text,
    required this.onTap,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text,
        style: style ??
            mainButtonTextStyle.copyWith(
                color: AppColors.primarySubBlackColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w700),
        recognizer: TapGestureRecognizer()..onTap = onTap,
      ),
    );
  }
}
