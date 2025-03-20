import 'package:app/helpers/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;
  final Color? trackColor;
  final Color? thumbColor;

  const ToggleSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.trackColor,
    this.thumbColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: value,
      activeColor: activeColor ?? AppColors.primarySubBlackColor,
      trackColor: trackColor ?? AppColors.primaryBlackColor.withOpacity(0.12),
      thumbColor: thumbColor ?? HexColor("#FEF7FF"),
      onChanged: onChanged,
    );
  }
}
