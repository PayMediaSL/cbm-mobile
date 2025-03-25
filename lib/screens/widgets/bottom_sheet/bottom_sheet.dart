import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants/ui_constants.dart';
import 'package:app/screens/widgets/calendar/calendar_widget.dart';
import 'package:flutter/material.dart';

void showDateTimePickerBottomSheet(BuildContext context, String dateKey) {
  showModalBottomSheet(
    backgroundColor: AppColors.subGreyColor,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        margin: EdgeInsets.symmetric(
            vertical: UI_Padding.PRIMARY_COMMON_PADDING_2,
            horizontal: UI_Padding.PRIMARY_COMMON_PADDING_2),
        padding: EdgeInsets.symmetric(
            vertical: UI_Padding.PRIMARY_COMMON_PADDING_2,
            horizontal: UI_Padding.PRIMARY_COMMON_PADDING_3),
        decoration: BoxDecoration(
          color: AppColors.primaryWhiteColor,
          borderRadius:
              BorderRadius.circular(UI_Borderradius.TEXT_FORM_FIELD_RADIUS),
        ),
        child: DateTimePickerWidget(dateKey: dateKey),
      );
    },
  );
}
