import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants/ui_constants.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:flutter/material.dart';

// class ValidationIndicator extends StatelessWidget {
//   final String text;
//   final bool isValid;

//   const ValidationIndicator({
//     Key? key,
//     required this.text,
//     required this.isValid,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Color iconColor = isValid
//         ? AppColors.primarypaleGreenColor // ✅ Valid: Green
//         : AppColors.primarypaleRedColor;
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: UI_Padding.PADDING_20),
//       child: Row(
//         children: [
//           Icon(
//             Icons.circle,
//             size: 10,
//             color: iconColor,
//           ),
//           RowSpacer(0.02),
//           Text(
//             text,
// style:
//     commonTextStyle.copyWith(color: AppColors.primarySubBlackColor),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ValidationIndicator extends StatelessWidget {
  final String text;
  final bool isValid;
  final bool isChecked; // Indicates whether validation has been checked

  const ValidationIndicator({
    Key? key,
    required this.text,
    required this.isValid,
    required this.isChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color iconColor = isChecked
        ? (isValid
            ? AppColors.primarypaleGreenColor
            : AppColors.primarypaleRedColor)
        : Colors.grey;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: UI_Padding.PADDING_20),
      child: Row(
        children: [
          Icon(Icons.circle,
              size: UI_Iconsize.VALIDATION_CIRCLE_SIZE, color: iconColor),
          RowSpacer(0.02),
          Text(
            text,
            style:
                commonTextStyle.copyWith(color: AppColors.primarySubBlackColor),
          ),
        ],
      ),
    );
  }
}
