import 'package:app/helpers/colors.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      "title": "Bill Payment",
      "time": "2 mins ago",
      "description":
          "The bill payment of LKR 100.00 to Airtel *****567 was a success!"
    },
    {
      "title": "Bill Payment",
      "time": "9 hours ago",
      "description":
          "The bill payment of LKR 100.00 to Airtel *****567 was a success!"
    },
    {
      "title": "Bill Payment",
      "time": "9 hours ago",
      "description":
          "The bill payment of LKR 100.00 to Airtel *****567 was a success!"
    },
    {
      "title": "Bill Payment",
      "time": "9 hours ago",
      "description":
          "The bill payment of LKR 100.00 to Airtel *****567 was a success!"
    },
    {
      "title": "Bill Payment",
      "time": "05/24",
      "description":
          "The bill payment of LKR 100.00 to Airtel *****567 was a success!"
    },
    {
      "title": "Bill Payment",
      "time": "05/23",
      "description":
          "The bill payment of LKR 100.00 to Airtel *****567 was a success!"
    },
    {
      "title": "Bill Payment",
      "time": "05/22",
      "description":
          "The bill payment of LKR 100.00 to Airtel *****567 was a success!"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();

    // Parse the notifications and filter the ones within the last 7 days
    final List<Map<String, String>> lastSevenDaysNotifications =
        notifications.where((notification) {
      final notificationDate = _parseDate(notification['time']!);
      return notificationDate != null &&
          now.difference(notificationDate).inDays <= 7;
    }).toList();

    // Filter out the older notifications (older than 7 days)
    final List<Map<String, String>> olderNotifications =
        notifications.where((notification) {
      final notificationDate = _parseDate(notification['time']!);
      return notificationDate == null ||
          now.difference(notificationDate).inDays > 7;
    }).toList();

    return HomeMainLayout(
      backgroundColor: AppColors.SecondarysubGreyColor,
      isBgContainer1: true,
      isBgContainer2: true,
      isBgContainer1Height: ScreenUtils.height * 0.1,
      onBackIconAvailable: true,
      onBackTitleAvailable: true,
      onBackTap: () {
        popScreen(context);
      },
      backTitle: "Notifications",
      children: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColumnSpacer(0.1),
            _buildSection(
              title: "Last 7 Days  (${lastSevenDaysNotifications.length})",
              notifications: lastSevenDaysNotifications,
            ),
            ColumnSpacer(0.02),
            _buildSection(
              title: "Older (${olderNotifications.length})",
              notifications: olderNotifications,
            ),
          ],
        ),
      ),
    );
  }

  DateTime? _parseDate(String time) {
    try {
      if (time.contains("mins ago") || time.contains("hours ago")) {
        return DateTime.now();
      } else if (time.contains("/")) {
        final parts = time.split("/");
        final month = int.parse(parts[0]);
        final day = int.parse(parts[1]);
        final year = DateTime.now().year; // Assume it's from the current year
        return DateTime(year, month, day);
      }
    } catch (e) {
      print("Error parsing date: $e");
    }
    return null;
  }

  Widget _buildSection({
    required String title,
    required List<Map<String, String>> notifications,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: ScreenUtils.height * 0.4,
          // margin: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.primaryWhiteColor,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 15.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: commonTextStyle.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.bottomNavIconColor)),
                  // ColumnSpacer(0.001),
                  Column(
                    children: notifications
                        .map((notification) =>
                            _buildNotificationTile(notification))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationTile(Map<String, String> notification) {
    return ListTile(
      leading: Container(
          height: ScreenUtils.width * 0.1,
          width: ScreenUtils.width * 0.1,
          decoration: BoxDecoration(
              color: AppColors.bottomNavBgColor,
              borderRadius: BorderRadius.circular(10.sp)),
          child: Center(
              child: const Icon(Icons.receipt_long, color: Colors.blue))),
      title: Text(
        notification["title"]!,
        style: commonTextStyle.copyWith(
            color: AppColors.primaryBlackColor, fontSize: 13.sp),
      ),
      subtitle: Text(
        notification["description"]!,
        style: commonTextStyle.copyWith(
            color: AppColors.primarySubBlackColor, fontSize: 11.sp),
      ),
      trailing: Text(
        notification["time"]!,
        style: commonTextStyle.copyWith(
            color: AppColors.primarySubBlackColor, fontSize: 9.sp),
      ),
    );
  }
}
