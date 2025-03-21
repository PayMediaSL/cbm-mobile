// ignore_for_file: prefer_const_constructors

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/routes.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/screens/screen_layouts/authentication_layout/authentication_layout.dart';
import 'package:app/screens/widgets/main_button/main_button.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class SignInOptionScreen extends StatelessWidget {
  const SignInOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return AuthenticationLayout(
      isAppBar: true,
      backgroundColor: AppColors.primaryWhiteColor,
      isContainer1: true,
      container1Height: ScreenUtils.height * 0.58,
      isBodyLeadingAvailable: true,
      isBodyLeadingIcon: true,
      isHeadingAvailable: true,
      isSubHeadingAvailable: true,
      headerText: "Are you a registered Flash Digital Banking customer?",
      headerSubText: "Choose one of below options to begin",
      isContainer2: true,
      // defaultButton: true,
      container2CustomWidget: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColumnSpacer(0.07),
          MainButton(
            isPaddingNeeded: true,
            isMainButton: true,
            buttontitle: "Yes",
            btnOnPress: () {
              pushScreen(context, ScreenRoutes.toSignInScreen);
            },
          ),
          ColumnSpacer(0.01),
          MainButton(
            btnOnPress: () {
              pushScreen(context, ScreenRoutes.toSignUpScreen);
            },
            isPaddingNeeded: true,
            buttontitle: "No",
          )
        ],
      ),
    );
  }
}
