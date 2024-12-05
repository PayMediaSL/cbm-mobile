import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/services/input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLableTextField extends StatelessWidget {
  const CustomLableTextField(this.controller,
      {super.key,
      this.hint,
      this.suffixIcon,
      this.obscureText = false,
      this.validator,
      this.maxLength,
      this.inputFormatters,
      this.keyboardType,
      this.enabled = true,
      this.textInputAction,
      this.autovalidate,
      this.contentPadding,
      this.focus,
      this.onChanged,
      this.prefixIcon,
      this.lable,
      this.onTap,
      this.isContentPadding = false,
      this.readOnly});

  final TextEditingController controller;
  final String? hint;
  final String? lable;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final String? Function(String? input)? validator;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool? enabled;
  final TextInputAction? textInputAction;
  final bool? autovalidate;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focus;
  final Function(String)? onChanged;
  final void Function()? onTap;
  final bool? readOnly;
  final bool isContentPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      onTap: onTap,
      autovalidateMode:
          autovalidate == null ? null : AutovalidateMode.onUserInteraction,
      controller: controller,
      // focusNode: focus,
      maxLength: maxLength ?? 200,
      cursorColor: AppColors.primaryBlueColor,
      keyboardType: keyboardType,
      style: commonTextStyle.copyWith(color: AppColors.primaryBlackColor),
      inputFormatters: inputFormatters ?? [AlphaNumericInputFormatter()],
      textInputAction: textInputAction,
      decoration: InputDecoration(
          labelText: lable,
          labelStyle: TextStyle(
              fontFamily: "inter",
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.black.withOpacity(0.7)),
          hintText: hint ?? '',
          hintStyle: TextStyle(
            fontFamily: "exo2",
            color: AppColors.textFieldHintColor,
            fontSize: 14.sp,
          ),
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(UI.borderRadiusTextField),
            borderSide: BorderSide(color: AppColors.textFieldBorderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(UI.borderRadiusTextField),
            borderSide: BorderSide(color: AppColors.textFieldBorderColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(UI.borderRadiusTextField),
            borderSide: BorderSide(color: AppColors.primaryRedColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(UI.borderRadiusTextField),
            borderSide: BorderSide(color: AppColors.primaryRedColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(UI.borderRadiusTextField),
            borderSide: BorderSide(color: AppColors.textFieldBorderColor),
          ),
          contentPadding: isContentPadding
              ? contentPadding ??
                  EdgeInsets.symmetric(
                      horizontal: UI.getPadding(2), vertical: 20)
              : null,
          filled: true,
          fillColor: AppColors.white,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon),

      obscureText: obscureText,
      validator: validator,
      enabled: enabled,
      onChanged: (value) {
        onChanged?.call(value);
      },
    );
  }
}
