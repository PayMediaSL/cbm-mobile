import 'package:cbm_one_app/helpers/colors.dart';
import 'package:cbm_one_app/helpers/spacers.dart';
import 'package:cbm_one_app/helpers/text_styles.dart';
import 'package:cbm_one_app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:cbm_one_app/services/screen_size_calculator.dart';
import 'package:cbm_one_app/utils/navigation_util.dart';
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
      "time": "05/24/2023",
      "description":
          "The bill payment of LKR 100.00 to Airtel *****567 was a success!"
    },
    {
      "title": "Bill Payment",
      "time": "31/12/2024",
      "description":
          "The bill payment of LKR 100.00 to Airtel *****567 was a success!"
    },
    {
      "title": "Bill Payment",
      "time": "21/4/24",
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
      print("asasas");
      final notificationDate = _parseDate(notification['time']!);
      print(notificationDate);
      return notificationDate == null ||
          now.difference(notificationDate).inDays > 7;
    }).toList();

    return HomeMainLayout(
      backgroundColor: AppColors.SecondarysubGreyColor,
      isBgContainer1: true,
      isBgContainer2: true,
      isBgContainer1Height: ScreenUtils.height * 0.07,
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
            ColumnSpacer(0.06),
            // Top container for "Last 7 Days"
            _buildSection(
              title: "Last 7 Days (${lastSevenDaysNotifications.length})",
              notifications: lastSevenDaysNotifications,
              isTopContainer: true,
            ),
            ColumnSpacer(0.02),

            _buildSection(
              title: "Older (${olderNotifications.length})",
              notifications: olderNotifications,
              isTopContainer: true,
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
        if (parts.length == 3) {
          final day = int.tryParse(parts[0]);
          final month = int.tryParse(parts[1]);
          final year = int.tryParse(parts[2]);

          // Ensure the day, month, and year are valid
          if (day != null &&
              month != null &&
              year != null &&
              month >= 1 &&
              month <= 12 &&
              day >= 1 &&
              day <= 31) {
            // Parse the date
            final parsedDate = DateTime(year, month, day);
            return parsedDate;
          }
        }
      }
    } catch (e) {}
    return null;
  }

  Widget _buildSection({
    required String title,
    required List<Map<String, String>> notifications,
    required bool isTopContainer,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: ScreenUtils.height * 0.4,
          width: ScreenUtils.width,
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
                  Text(
                    title,
                    style: commonTextStyle.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.bottomNavIconColor),
                  ),
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
