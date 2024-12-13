import 'package:app/helpers/colors.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNavBarItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isActive;
  // final Color activeColor;
  // final Color inactiveColor;
  const CustomNavBarItem({
    Key? key,
    required this.label,
    required this.icon,
    required this.isActive,
    // required this.activeColor,
    // required this.inactiveColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    ScreenUtil.init(context);

    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Container(
        width: ScreenUtils.width * 0.2,
        decoration: BoxDecoration(
          color: isActive ? AppColors.bottomNavBgColor : AppColors.transparent,

          // Correctly setting background color
          // borderRadius: BorderRadius.circular(
          //     10), // Optional: add some corner radius for better styling
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive
                  ? AppColors.primaryBlueColor
                  : Colors.grey, // Change icon color based on active state
            ),
            SizedBox(height: 3), // Space between the icon and text
            Text(
              label,
              style: TextStyle(
                fontFamily: "inter",
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w600,
                color: isActive
                    ? AppColors.primaryBlueColor
                    : AppColors
                        .primarySubBlackColor, // Change text color based on active state
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
