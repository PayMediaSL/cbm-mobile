// // ignore_for_file: deprecated_member_use

// import 'package:cbm_one_app/helpers/colors.dart';
// import 'package:cbm_one_app/helpers/spacers.dart';
// import 'package:cbm_one_app/helpers/text_styles.dart';
// import 'package:cbm_one_app/providers/date_tme/date_time_provider.dart';
// import 'package:cbm_one_app/services/screen_size_calculator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';

// class DateTimePickerWidget extends StatelessWidget {
//   const DateTimePickerWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final dateTimeProvider = Provider.of<DateTimeProvider>(context);

//     bool isAM = dateTimeProvider.selectedTime.hour < 12;

//     // print(formattedTime);
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         // Calendar Picker
//         DatePickerTheme(
//           data: DatePickerThemeData(
//               backgroundColor: Colors.white,
//               dayBackgroundColor: MaterialStateProperty.resolveWith<Color?>(
//                 (Set<MaterialState> states) {
//                   if (states.contains(MaterialState.selected)) {
//                     return AppColors.primaryBlueColor;
//                   }
//                   return null;
//                 },
//               ),
//               todayBackgroundColor: MaterialStateProperty.resolveWith<Color?>(
//                 (Set<MaterialState> states) {
//                   if (states.contains(MaterialState.selected)) {
//                     return AppColors.primaryBlueColor;
//                   }
//                   return null;
//                 },
//               ),
//               todayForegroundColor: MaterialStateProperty.resolveWith<Color?>(
//                 (Set<MaterialState> states) {
//                   if (states.contains(MaterialState.selected)) {
//                     return AppColors.white;
//                   }
//                   return null;
//                 },
//               ),
//               todayBorder: BorderSide(
//                 color: AppColors.primaryBlueColor,
//               )),
//           child: CalendarDatePicker(
//             initialDate: dateTimeProvider.selectedDate,
//             firstDate: DateTime(2000),
//             lastDate: DateTime(2100),
//             onDateChanged: (date) {
//               dateTimeProvider.updateDate(date);
//             },
//           ),
//         ),
//         // ColumnSpacer(0.002),

//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               "Time",
//               style: commonTextHeadingStyle.copyWith(fontSize: 20.sp),
//             ),
//             Row(
//               children: [
//                 Container(
//                   height: ScreenUtils.width * 0.1,
//                   width: ScreenUtils.width * 0.25,
//                   decoration: BoxDecoration(
//                       color: HexColor("#767680").withOpacity(0.12),
//                       borderRadius: BorderRadius.circular(8.sp)),
//                   child: Center(
//                     child: Text(
//                       "${dateTimeProvider.selectedTime.hour} : ${dateTimeProvider.selectedTime.minute}",
//                       style: TextStyle(fontSize: 16.sp),
//                     ),
//                   ),
//                 ),
//                 RowSpacer(0.03),
//                 Container(
//                   decoration: BoxDecoration(
//                       color: HexColor("#767680").withOpacity(0.12),
//                       borderRadius: BorderRadius.circular(8.sp)),
//                   padding:
//                       EdgeInsets.symmetric(vertical: 5.sp, horizontal: 5.sp),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       // AM Container
//                       Container(
//                         height: ScreenUtils.width * 0.07,
//                         width: ScreenUtils.width * 0.1,
//                         decoration: BoxDecoration(
//                           color: isAM ? Colors.white : Colors.transparent,
//                           borderRadius: BorderRadius.circular(5.sp),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "AM",
//                             style: TextStyle(
//                                 fontSize: 13.sp, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                       // PM Container
//                       Container(
//                         height: ScreenUtils.width * 0.07,
//                         width: ScreenUtils.width * 0.1,
//                         decoration: BoxDecoration(
//                           color: isAM ? Colors.transparent : Colors.white,
//                           borderRadius: BorderRadius.circular(5.sp),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "PM",
//                             style: TextStyle(
//                                 fontSize: 13.sp, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         )
//         // Time Picker
//         // Row(
//         //   mainAxisAlignment: MainAxisAlignment.center,
//         //   children: [
//         //     Text(
//         //       "${dateTimeProvider.selectedTime.format(context)}",
//         //       style: const TextStyle(fontSize: 18),
//         //     ),
//         //     const SizedBox(width: 16),
//         //     ElevatedButton(
//         //       onPressed: () async {
//         //         final pickedTime = await showTimePicker(
//         //           context: context,
//         //           initialTime: dateTimeProvider.selectedTime,
//         //         );
//         //         if (pickedTime != null) {
//         //           dateTimeProvider.updateTime(pickedTime);
//         //         }
//         //       },
//         //       child: const Text('Pick Time'),
//         //     ),
//         //   ],
//         // ),
//       ],
//     );
//   }
// }

import 'package:cbm_one_app/helpers/colors.dart';
import 'package:cbm_one_app/helpers/spacers.dart';
import 'package:cbm_one_app/helpers/text_styles.dart';
import 'package:cbm_one_app/providers/date_tme/date_time_provider.dart';
import 'package:cbm_one_app/services/screen_size_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DateTimePickerWidget extends StatelessWidget {
  final String dateKey; // The dateKey to identify this calendar

  const DateTimePickerWidget({super.key, required this.dateKey});

  @override
  Widget build(BuildContext context) {
    final dateTimeProvider = Provider.of<DateTimeProvider>(context);

    DateTime selectedDate = dateTimeProvider.getSelectedDate(dateKey);
    TimeOfDay selectedTime = dateTimeProvider.getSelectedTime(dateKey);
    bool isAM = selectedTime.hour < 12;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Calendar Picker
        DatePickerTheme(
          data: DatePickerThemeData(
              backgroundColor: Colors.white,
              dayBackgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return AppColors.primaryBlueColor;
                  }
                  return null;
                },
              ),
              todayBackgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return AppColors.primaryBlueColor;
                  }
                  return null;
                },
              ),
              todayForegroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return AppColors.white;
                  }
                  return null;
                },
              ),
              todayBorder: BorderSide(
                color: AppColors.primaryBlueColor,
              )),
          child: CalendarDatePicker(
            initialDate: selectedDate,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            onDateChanged: (date) {
              dateTimeProvider.updateDate(dateKey, date);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Time",
              style: commonTextHeadingStyle.copyWith(fontSize: 20.sp),
            ),
            Row(
              children: [
                Container(
                  height: ScreenUtils.width * 0.1,
                  width: ScreenUtils.width * 0.25,
                  decoration: BoxDecoration(
                      color: HexColor("#767680").withOpacity(0.12),
                      borderRadius: BorderRadius.circular(8.sp)),
                  child: Center(
                    child: Text(
                      "${selectedTime.hour} : ${selectedTime.minute}",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ),
                RowSpacer(0.03),
                Container(
                  decoration: BoxDecoration(
                      color: HexColor("#767680").withOpacity(0.12),
                      borderRadius: BorderRadius.circular(8.sp)),
                  padding:
                      EdgeInsets.symmetric(vertical: 5.sp, horizontal: 5.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // AM Container
                      Container(
                        height: ScreenUtils.width * 0.07,
                        width: ScreenUtils.width * 0.1,
                        decoration: BoxDecoration(
                          color: isAM ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(5.sp),
                        ),
                        child: Center(
                          child: Text(
                            "AM",
                            style: TextStyle(
                                fontSize: 13.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      // PM Container
                      Container(
                        height: ScreenUtils.width * 0.07,
                        width: ScreenUtils.width * 0.1,
                        decoration: BoxDecoration(
                          color: isAM ? Colors.transparent : Colors.white,
                          borderRadius: BorderRadius.circular(5.sp),
                        ),
                        child: Center(
                          child: Text(
                            "PM",
                            style: TextStyle(
                                fontSize: 13.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
