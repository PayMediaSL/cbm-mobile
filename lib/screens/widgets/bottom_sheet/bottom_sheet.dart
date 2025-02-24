import 'package:app/helpers/colors.dart';
import 'package:app/screens/widgets/calendar/calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showDateTimePickerBottomSheet(BuildContext context, String dateKey) {
  showModalBottomSheet(
    backgroundColor: AppColors.subGreyColor,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 15.sp),
        padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 20.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13.sp),
        ),
        child: DateTimePickerWidget(dateKey: dateKey),
      );
    },
  );
}
