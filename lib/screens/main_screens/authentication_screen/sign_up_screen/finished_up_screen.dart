import 'package:cbm_one_app/helpers/colors.dart';
import 'package:cbm_one_app/helpers/routes.dart';
import 'package:cbm_one_app/helpers/spacers.dart';
import 'package:cbm_one_app/helpers/text_styles.dart';
import 'package:cbm_one_app/screens/screen_layouts/authentication_layout/authentication_layout.dart';
import 'package:cbm_one_app/screens/widgets/main_button/main_button.dart';
import 'package:cbm_one_app/services/screen_size_calculator.dart';
import 'package:cbm_one_app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinishedUpScreen extends StatelessWidget {
  const FinishedUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    ScreenUtils.init(context);
    return AuthenticationLayout(
      isAppBar: true,
      isCustomizeWidget: true,
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppColors.primaryBlueColor,
            height: ScreenUtils.height * 0.7,
            width: ScreenUtils.width,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Column(
                  children: [
                    ColumnSpacer(0.3),
                    Text(
                      "Yay You've joined Oneapp!",
                      style: getStartedHeadingStyle.copyWith(fontSize: 24.sp),
                    ),
                    ColumnSpacer(0.05),
                    Text(
                      "We re Verifying Your Details!",
                      style: getStartedSubHeadingStyle.copyWith(
                          color: AppColors.primaryWhiteColor),
                    ),
                    ColumnSpacer(0.02),
                    Text(
                      "You'll be requested to re-submit your details if we com e across any discrepancies",
                      style: getStartedSubHeadingStyle.copyWith(
                          color: AppColors.primaryWhiteColor),
                    )
                  ],
                ),
              ),
            ),
          ),
          ColumnSpacer(0.1),
          MainButton(
            isMainButton: true,
            isPaddingNeeded: true,
            btnOnPress: () {
              pushScreen(context, ScreenRoutes.toBottomNavigationScreen);
            },
            buttontitle: "Explore my OneApp account",
          )
        ],
      ),
    );
  }
}
