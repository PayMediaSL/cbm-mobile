// ignore_for_file: must_be_immutable

import 'package:cbm_one_app/helpers/colors.dart';
import 'package:cbm_one_app/helpers/constants.dart';
import 'package:cbm_one_app/helpers/spacers.dart';
import 'package:cbm_one_app/helpers/text_editing_controllers.dart';
import 'package:cbm_one_app/helpers/text_styles.dart';
import 'package:cbm_one_app/providers/other_provider/common_provider.dart';
import 'package:cbm_one_app/screens/screen_layouts/authentication_layout/authentication_layout.dart';
import 'package:cbm_one_app/screens/widgets/main_button/main_button.dart';
import 'package:cbm_one_app/screens/widgets/text_fields/custom_text_field.dart';
import 'package:cbm_one_app/services/screen_size_calculator.dart';
import 'package:cbm_one_app/utils/assest_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  // bool _isPasswordVisible = false; // Controls password visibility

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    final commonProvider = Provider.of<CommonProvider>(context);

    return AuthenticationLayout(
      isAppBar: true,
      backgroundColor: AppColors.primaryWhiteColor,
      isContainer1: true,
      isBodyLeadingAvailable: true,
      container1Height: ScreenUtils.height * 0.3,
      isHeadingAvailable: true,
      headerText: "Create new credentials",
      isSubHeadingAvailable: true,
      headerSubText:
          "Enter the username and password you would like to use into oneapp.",
      isContainer2: true,
      useImage: true,
      imageName: ImageAsset().authBg,
      container2CustomWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ColumnSpacer(0.05),
            CustomLableTextField(
              signInUserNameController,
              hint: "Username",
            ),
            const ColumnSpacer(0.02),
            CustomLableTextField(
              TextEditingController(), // Paste Your Actual Controller
              hint: "New Password",
              obscureText: commonProvider.getStates("obscureText1"),
              suffixIcon: IconButton(
                  onPressed: () {
                    commonProvider.toggleStates('obscureText1');
                  },
                  icon: Icon(
                    commonProvider.getStates('obscureText1')
                        ? Icons.visibility_off
                        : Icons.visibility,
                  )),
            ),
            const ColumnSpacer(0.005),
            Padding(
              padding: const EdgeInsets.only(left: UI.PADDING),
              child: Text(
                "You’ll need this password to login to oneapp.",
                style: commonTextStyle.copyWith(
                    fontSize: 12.sp, color: AppColors.primarySubBlackColor),
              ),
            ),
            const ColumnSpacer(0.02),
            CustomLableTextField(
              TextEditingController(), // Paste Your Actual Controller

              hint: "Re-enter password",
              obscureText: commonProvider.getStates("obscureText2"),
              suffixIcon: IconButton(
                  onPressed: () {
                    commonProvider.toggleStates('obscureText2');
                  },
                  icon: Icon(
                    commonProvider.getStates('obscureText2')
                        ? Icons.visibility_off
                        : Icons.visibility,
                  )),
            ),
            const ColumnSpacer(0.1),
            MainButton(
              buttontitle: "Next",
              isMainButton: true,
              btnOnPress: () {},
            ),
            const ColumnSpacer(0.1),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'By using OneApp, you agree to our ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Terms of Use',
                    style: mainButtonTextStyle.copyWith(
                        color: AppColors.primarySubBlackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Open Terms of Use link
                      },
                  ),
                  const TextSpan(
                    text: ' and ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: mainButtonTextStyle.copyWith(
                        color: AppColors.primarySubBlackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Open Privacy Policy link
                      },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
