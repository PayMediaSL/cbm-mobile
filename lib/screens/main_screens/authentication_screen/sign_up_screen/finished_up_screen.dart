import 'package:app/helpers/colors.dart';
import 'package:app/helpers/routes.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/screens/screen_layouts/authentication_layout/authentication_layout.dart';
import 'package:app/screens/widgets/main_button/main_button.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinishedUpScreen extends StatelessWidget {
  const FinishedUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    ScreenUtils.init(context);
    return AuthenticationLayout(
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
              child: Column(
                children: [],
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
