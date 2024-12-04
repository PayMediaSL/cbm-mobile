// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:app/helpers/colors.dart';
import 'package:app/helpers/routes.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_editing_controllers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/screens/screen_layouts/authentication_layout/authentication_layout.dart';
import 'package:app/screens/widgets/main_button/main_button.dart';
import 'package:app/screens/widgets/text_fields/custom_text_field.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  bool _isPasswordVisible = false; // Controls password visibility

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    ScreenUtil.init(context);
    return AuthenticationLayout(
      backgroundColor: AppColors.primaryWhiteColor,
      isContainer1: true,
      isBodyLeadingAvailable: true,
      container1Height: ScreenUtils.height * 0.3,
      isHeadingAvailable: true,
      headerText: "Login",
      isSubHeadingAvailable: true,
      headerSubText: "OneApp for all your banking needs",
      isContainer2: true,
      useImage: true,
      imageName: ImageAsset().authBg,
      container2CustomWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ColumnSpacer(0.05),
            CustomLableTextField(
              signInUserNameController,
              hint: "Username",
            ),
            ColumnSpacer(0.02),
            CustomLableTextField(
              signInPasswordController,
              hint: "Password",
              obscureText: !_isPasswordVisible,
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  )),
            ),
            ColumnSpacer(0.02),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  pushScreen(context, ScreenRoutes.toforgetPswScreen);
                },
                child: Text(
                  "Forgot Password ?",
                  style: commonTextStyle.copyWith(
                      color: AppColors.primarySubBlackColor, fontSize: 14.sp),
                ),
              ),
            ),
            ColumnSpacer(0.02),
            MainButton(
              buttontitle: "Login",
              isMainButton: true,
              btnOnPress: () {},
            ),
            ColumnSpacer(0.02),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account? ",
                  style: commonTextStyle.copyWith(
                      color: AppColors.primarySubBlackColor),
                ),
                Text(
                  "Sign up ",
                  style: commonTextStyle.copyWith(
                    color: AppColors.primarySubBlackColor,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),

            ColumnSpacer(0.03),
//? Divider Line
            Row(
              children: <Widget>[
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('or continue to',
                      style: commonTextStyle.copyWith(
                          color: AppColors.primarySubBlackColor)),
                ),
                Expanded(child: Divider()),
              ],
            ),
            ColumnSpacer(0.03),

            MainButton(
              buttontitle: "Access eSlips",
              btnOnPress: () {},
            ),
            ColumnSpacer(0.07),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
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
                  TextSpan(
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
