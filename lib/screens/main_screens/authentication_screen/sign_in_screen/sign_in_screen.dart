// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:app/helpers/colors.dart';
import 'package:app/helpers/routes.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_editing_controllers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/other_provider/common_provider.dart';
import 'package:app/screens/screen_layouts/authentication_layout/authentication_layout.dart';
import 'package:app/screens/widgets/icons/custom_icons.dart';
import 'package:app/screens/widgets/main_button/main_button.dart';
import 'package:app/screens/widgets/rich_text/rich_text.dart';
import 'package:app/screens/widgets/text_button/text_button.dart';
import 'package:app/screens/widgets/text_fields/custom_text_field.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/services/validation_service.dart';
import 'package:app/utils/log_util.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    ScreenUtil.init(context);
    // final darkModeEnabled = context.isDarkMode;
    return AuthenticationLayout(
      isAppBar: true,
      backgroundColor: AppColors.primaryWhiteColor,
      isContainer1: true,
      isBodyLeadingAvailable: true,
      container1Height: ScreenUtils.height * 0.3,
      isHeadingAvailable: true,
      headerText: "login".tr(),
      isSubHeadingAvailable: true,
      headerSubText: "OneApp for all your banking needs",
      isContainer2: true,
      useImage: true,
      // imageName: ImageAsset().authBg,
      container2CustomWidget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ColumnSpacer(0.05),
              CustomLableTextField(
                signInUserNameController,
                hint: "Username",
                autovalidate: true,
                validator: (input) => ValidationService.validateIsNotEmptyField(
                    input, "UserName"),
              ),
              ColumnSpacer(0.02),
              Consumer<CommonProvider>(
                builder: (BuildContext context, CommonProvider value,
                        Widget? child) =>
                    CustomLableTextField(
                  signInPasswordController,
                  hint: "Password",
                  obscureText: !value.getStates('obscureText'),
                  suffixIcon: IconButton(
                    onPressed: () {
                      value.toggleStates('obscureText');
                    },
                    icon: value.getStates('obscureText')
                        ? CustomVisibility_ON_Icon()
                        : CustomVisibility_OFF_Icon(),
                  ),
                  autovalidate: true,
                  validator: (input) =>
                      ValidationService.validateIsNotEmptyField(
                          input, "Password"),
                ),
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
                btnOnPress: () {
                  if (_formKey.currentState!.validate()) {
                    pushScreen(context, ScreenRoutes.toExistingUserLogin);
                  }
                },
              ),
              ColumnSpacer(0.02),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Are you a new user? ",
                    style: commonTextStyle.copyWith(
                        color: AppColors.primarySubBlackColor),
                  ),
                  UnderlinedTextButton(
                    fonttWeight: FontWeight.w600,
                    text: 'Sign up',
                    color: AppColors.primarySubBlackColor,
                    onTap: () {
                      pushScreen(context, ScreenRoutes.toSignUpScreen);
                    },
                  ),
                ],
              ),
              // ColumnSpacer(0.03),
              //? Divider Line
              // Row(
              //   children: <Widget>[
              //     Expanded(child: Divider()),
              //     Padding(
              //       padding:
              //           EdgeInsets.symmetric(horizontal: UI_Padding.PADDING_2X),
              //       child: Text('or continue to',
              //           style: commonTextStyle.copyWith(
              //               color: AppColors.primarySubBlackColor)),
              //     ),
              //     Expanded(child: Divider()),
              //   ],
              // ),
              // ColumnSpacer(0.03),
              // MainButton(
              //   buttontitle: "Access eSlips",
              //   btnOnPress: () {
              //     pushScreen(context, ScreenRoutes.toESlipsScreen);
              //   },
              // ),
              ColumnSpacer(0.1),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UnderlinedTextButton(
                    text: 'Need help',
                    color: AppColors.secondarySubBlueColor2,
                    onTap: () {},
                  ),
                  RowSpacer(0.03),
                  UnderlinedTextButton(
                    text: 'More info',
                    color: AppColors.primarySubBlackColor,
                    onTap: () {},
                  ),
                ],
              ),
              ColumnSpacer(0.05),
              TermsAndPrivacyText(
                onTermsTap: () {
                  printLog("Terms of Use clicked");
                },
                onPrivacyTap: () {
                  printLog("Privacy Policy clicked");
                },
              ),

              // RichText(
              //   textAlign: TextAlign.center,
              //   text: TextSpan(
              //     children: [
              //       TextSpan(
              //         text: 'By using OneApp, you agree to our ',
              //         style: TextStyle(color: AppColors.primaryBlackColor),
              //       ),
              //       TextSpan(
              //         text: 'Terms of Use',
              //         style: mainButtonTextStyle.copyWith(
              //             color: AppColors.primarySubBlackColor,
              //             fontSize: 12.sp,
              //             fontWeight: FontWeight.w700),
              //         recognizer: TapGestureRecognizer()
              //           ..onTap = () {
              //             // Open Terms of Use link
              //           },
              //       ),
              //       TextSpan(
              //         text: ' and ',
              //         style: TextStyle(color: Colors.black),
              //       ),
              //       TextSpan(
              //         text: 'Privacy Policy',
              //         style: mainButtonTextStyle.copyWith(
              //             color: AppColors.primarySubBlackColor,
              //             fontSize: 12.sp,
              //             fontWeight: FontWeight.w700),
              //         recognizer: TapGestureRecognizer()
              //           ..onTap = () {
              //             // Open Privacy Policy link
              //           },
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
