// ignore_for_file: must_be_immutable, use_super_parameters

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton extends StatelessWidget {
  MainButton({
    Key? key,
    this.btnOnPress,
    this.buttontitle = "",
    this.isMainButton = false,
    this.isPaddingNeeded = false,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.buttonTitleTextStyle,
    this.borderRadius,
  }) : super(key: key);
  final VoidCallback? btnOnPress;
  final String buttontitle;
  bool isMainButton;
  bool isPaddingNeeded;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final TextStyle? buttonTitleTextStyle;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    ScreenUtils.init(context);
    // Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isPaddingNeeded ? UI.PADDING_4X : 0,
      ),
      child: SizedBox(
        width: ScreenUtils.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 10.h,
              ),
              elevation: 0,
              fixedSize: Size(ScreenUtils.width * 0.88, 40.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    borderRadius ?? UI.borderRadiusButton),
              ),
              backgroundColor: backgroundColor ??
                  (isMainButton
                      ? AppColors.mainButtonBgColor
                      : AppColors.primaryGreyColor),
              side: !isMainButton
                  ? BorderSide(
                      width: borderWidth ?? 0.5.w,
                      color: borderColor ?? AppColors.subGreyColor,
                    )
                  : null),
          onPressed: btnOnPress,
          child: Text(
            buttontitle,
            style: buttonTitleTextStyle ??
                (isMainButton
                    ? mainButtonTextStyle
                    : mainButtonTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        color: AppColors.black,
                      )),
          ),
        ),
      ),
    );
  }
}
