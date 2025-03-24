import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants/ui_constants.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFieldRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String hintText;
  final TextEditingController controller;
  final double? height;
  final int maxLines;

  const CustomTextFieldRow({
    Key? key,
    required this.icon,
    required this.label,
    required this.hintText,
    required this.controller,
    this.height, // Default height
    this.maxLines = 1, // Default to single-line TextField
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.primarySubBlackColor),
            SizedBox(width: 8.sp),
            Text(label,
                style: commonTextStyle.copyWith(
                    color: AppColors.primarySubBlackColor)),
          ],
        ),
        SizedBox(
          height: height ?? ScreenUtils.height * 0.06,
          width: ScreenUtils.width * 0.6,
          child: Transform.scale(
            scale: 0.8, // Adjust scaling if needed
            child: TextField(
              controller: controller,
              maxLines: maxLines,
              textAlign: TextAlign.right, // Align entered text to the right
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: AppColors.primaryGreyColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      UI_Borderradius.COMMON_BORDER_RADIUS_2),
                  borderSide: BorderSide(color: AppColors.textFieldBorderColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      UI_Borderradius.COMMON_BORDER_RADIUS_2),
                  borderSide: BorderSide(color: AppColors.textFieldBorderColor),
                ),
                filled: true,
                fillColor: AppColors.primaryWhiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
