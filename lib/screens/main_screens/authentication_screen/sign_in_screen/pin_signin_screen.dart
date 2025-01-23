// ignore_for_file: prefer_const_constructors

import 'package:cbm_one_app/helpers/colors.dart';
import 'package:cbm_one_app/helpers/spacers.dart';
import 'package:cbm_one_app/helpers/text_editing_controllers.dart';
import 'package:cbm_one_app/helpers/text_styles.dart';
import 'package:cbm_one_app/screens/screen_layouts/authentication_layout/authentication_layout.dart';
import 'package:cbm_one_app/screens/widgets/main_button/main_button.dart';
import 'package:cbm_one_app/screens/widgets/pin_field/pin_field.dart';
import 'package:cbm_one_app/screens/widgets/pin_field/pin_pad.dart';
import 'package:cbm_one_app/services/screen_size_calculator.dart';
import 'package:cbm_one_app/utils/assest_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PinSignInScreen extends StatelessWidget {
  const PinSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    ScreenUtil.init(context);
    return AuthenticationLayout(
      isContainer1: true,
      isContainer2: true,
      useImage: true,
      imageName: ImageAsset().authBg,
      isBodyLeadingAvailable: true,
      isSubHeadingAvailable: true,
      isHeadingAvailable: true,
      headerText: "Welcome back",
      headerSubText: "OneApp for all your banking needs",
      container2CustomWidget: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            PinFeild(controller: pinController, onChanged: (value) {}),
            ColumnSpacer(0.01),
            Text(
              "Forgot Passcode ?",
              style: commonTextStyle.copyWith(
                  fontSize: 12.sp, color: AppColors.primarySubBlackColor),
            ),
            ColumnSpacer(0.03),
            PinNumberPad(controller: pinController, onChanged: (value) {}),
            ColumnSpacer(0.02),
            MainButton(
              buttontitle: "My ePassbook",
              btnOnPress: () {},
            ),
            ColumnSpacer(0.01),
            MainButton(
              buttontitle: "Access eSlips",
              btnOnPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
