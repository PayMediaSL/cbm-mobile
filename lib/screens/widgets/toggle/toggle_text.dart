import 'package:app/helpers/colors.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:flutter/material.dart';

class ToggleViewWidget extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final bool isExpanded;
  final String viewAllText;
  final String viewLessText;
  final VoidCallback onToggle;
  final TextStyle? toggleTextStyle;

  const ToggleViewWidget({
    Key? key,
    required this.title,
    required this.titleStyle,
    required this.isExpanded,
    required this.viewAllText,
    required this.viewLessText,
    required this.onToggle,
    this.toggleTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: homeScreenTitleStyle),
        GestureDetector(
          onTap: onToggle,
          child: Text(
            isExpanded ? viewLessText : viewAllText,
            style: toggleTextStyle ??
                commonTextStyle.copyWith(
                    decoration: TextDecoration.underline,
                    color: AppColors.primaryBlackColor,
                    fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
