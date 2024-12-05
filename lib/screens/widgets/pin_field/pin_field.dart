import 'package:app/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PinFeild extends StatelessWidget {
  const PinFeild({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Padding(
      padding: EdgeInsets.only(top: 25.h, left: 70.w, right: 70.w),
      child: PinCodeTextField(
        controller: controller,
        appContext: context,
        autoDisposeControllers: false,
        length: 6,
        keyboardType: TextInputType.none,
        obscureText: false,
        obscuringCharacter: '*',
        textStyle: const TextStyle(color: AppColors.transparent),
        blinkWhenObscuring: true,
        enableActiveFill: true,
        cursorColor: AppColors.primaryBlueColor,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          activeBorderWidth: 0,
          inactiveBorderWidth: 0,
          borderWidth: 0,
          disabledBorderWidth: 0,
          fieldHeight: 15.h,
          fieldWidth: 15.w,
          activeFillColor: AppColors.onBoardSubTextStyleColor,
          disabledColor: Colors.white,
          // activeColor: AppColors.pinActive,
          inactiveFillColor: AppColors.white,
          inactiveColor: AppColors.primarySubBlackColor,
          activeColor:
              AppColors.onBoardSubTextStyleColor, // Set selected border color

          // selectedFillColor: AppColors.pinActive,
          // inactiveColor: AppColors.pinActive,
          // selectedColor: AppColors.pinActive,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
