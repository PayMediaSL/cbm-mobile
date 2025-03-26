// ignore_for_file: unused_local_variable

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants/ui_constants.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/date_tme/date_time_provider.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DateTimePickerWidget extends StatelessWidget {
  final String dateKey;

  const DateTimePickerWidget({super.key, required this.dateKey});

  @override
  Widget build(BuildContext context) {
    final dateTimeProvider = Provider.of<DateTimeProvider>(context);
    DateTime selectedDate = dateTimeProvider.getSelectedDate(dateKey);
    TimeOfDay selectedTime = dateTimeProvider.getSelectedTime(dateKey);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CalendarPicker(dateKey: dateKey),
        TimePickerRow(dateKey: dateKey, selectedTime: selectedTime),
      ],
    );
  }
}

//! Calendar Picker
class CalendarPicker extends StatelessWidget {
  final String dateKey;

  const CalendarPicker({super.key, required this.dateKey});

  @override
  Widget build(BuildContext context) {
    final dateTimeProvider = Provider.of<DateTimeProvider>(context);
    DateTime selectedDate = dateTimeProvider.getSelectedDate(dateKey);

    return DatePickerTheme(
      data: DatePickerThemeData(
        backgroundColor: AppColors.primaryWhiteColor,
        dayBackgroundColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected)
                ? AppColors.primaryBlueColor
                : null),
        todayBackgroundColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected)
                ? AppColors.primaryBlueColor
                : null),
        todayForegroundColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected)
                ? AppColors.primaryWhiteColor
                : null),
        todayBorder: BorderSide(color: AppColors.primaryBlueColor),
      ),
      child: CalendarDatePicker(
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        onDateChanged: (date) => dateTimeProvider.updateDate(dateKey, date),
      ),
    );
  }
}

//! Time Picker

class TimePickerRow extends StatelessWidget {
  final String dateKey;
  final TimeOfDay selectedTime;

  const TimePickerRow(
      {super.key, required this.dateKey, required this.selectedTime});

  @override
  Widget build(BuildContext context) {
    bool isAM = selectedTime.hour < 12;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Time", style: commonTextHeadingStyle.copyWith(fontSize: 20.sp)),
        Row(
          children: [
            TimeDisplay(selectedTime: selectedTime),
            RowSpacer(0.03),
            AmPmSelector(isAM: isAM),
          ],
        ),
      ],
    );
  }
}

class TimeDisplay extends StatelessWidget {
  final TimeOfDay selectedTime;

  const TimeDisplay({super.key, required this.selectedTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.width * 0.1,
      width: ScreenUtils.width * 0.25,
      decoration: BoxDecoration(
          color: HexColor("#767680").withOpacity(0.12),
          borderRadius:
              BorderRadius.circular(UI_Borderradius.SUB_BORDER_RADIUS)),
      child: Center(
        child: Text(
          "${selectedTime.hour} : ${selectedTime.minute}",
          style: TextStyle(fontSize: 16.sp),
        ),
      ),
    );
  }
}

class AmPmSelector extends StatelessWidget {
  final bool isAM;

  const AmPmSelector({super.key, required this.isAM});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: HexColor("#767680").withOpacity(0.12),
          borderRadius: BorderRadius.circular(8.sp)),
      padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 5.sp),
      child: Row(
        children: [
          AmPmContainer(label: "AM", isSelected: isAM),
          AmPmContainer(label: "PM", isSelected: !isAM),
        ],
      ),
    );
  }
}

class AmPmContainer extends StatelessWidget {
  final String label;
  final bool isSelected;

  const AmPmContainer(
      {super.key, required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.width * 0.07,
      width: ScreenUtils.width * 0.1,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryWhiteColor : Colors.transparent,
        borderRadius:
            BorderRadius.circular(UI_Borderradius.SMALL_BORDER_RADIUS),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
