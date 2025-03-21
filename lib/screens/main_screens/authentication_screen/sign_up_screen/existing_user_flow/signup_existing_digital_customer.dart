// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants/ui_constants.dart';
import 'package:app/helpers/routes.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_editing_controllers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/other_provider/common_provider.dart';
import 'package:app/providers/validation_provider/password_validation_provider.dart';
import 'package:app/providers/value_notifier/value_notifier.dart';
import 'package:app/screens/screen_layouts/wizard_layout/wizard_layout.dart';
import 'package:app/screens/widgets/container/customer_curved_container.dart';
import 'package:app/screens/widgets/icons/custom_icons.dart';
import 'package:app/screens/widgets/image/custom_asset_image.dart';
import 'package:app/screens/widgets/pin_field/pin_field.dart';
import 'package:app/screens/widgets/pin_field/pin_pad.dart';
import 'package:app/screens/widgets/rich_text/rich_text.dart';
import 'package:app/screens/widgets/switch/toggle_switch.dart';
import 'package:app/screens/widgets/text_button/text_button.dart';
import 'package:app/screens/widgets/text_fields/custom_text_field.dart';
import 'package:app/screens/widgets/text_style/font_family.dart';
import 'package:app/screens/widgets/validation/password_validation_widget.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/services/validation_service.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/log_util.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUpExistingDigitalCustomer extends StatefulWidget {
  const SignUpExistingDigitalCustomer({super.key});

  @override
  State<SignUpExistingDigitalCustomer> createState() =>
      _SignUpExistingDigitalCustomerState();
}

//! Global Keys
final _formKey = GlobalKey<FormState>();

final _wizardController = WizardLayoutController();
final _progressNotifier = GenericValueNotifier<bool>(false);
bool autoValidate = false;

//Otp PassCodce
String passcode = '';
const identityDetailsId = 0;
const loginWithcbm = 1;
const newCredentialId = 2;
const createPasscodeId = 3;
const enableBiometrics = 4;

class _SignUpExistingDigitalCustomerState
    extends State<SignUpExistingDigitalCustomer> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    ScreenUtils.init(context);
    final commonProvider = Provider.of<CommonProvider>(context);
    return ValueListenableBuilder(
      valueListenable: _progressNotifier,
      builder: (BuildContext context, value, Widget? child) {
        return Form(
          autovalidateMode: commonProvider.getStates("signup_autovalidate")
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          key: _formKey,
          child: WizardLayout(
            5,
            controller: _wizardController,
            //!On Back Press
            onBackPress: (currentPage) {
              if (currentPage == 0) {
                return popScreen(context);
              }
              switch (currentPage) {
                case createPasscodeId:
                  commonProvider.setStates("passcode", false);
                  signupCreatePinController.clear();
                  break;

                default:
                  break;
              }
              if (currentPage > 0) {
                _wizardController.updateWizardPage(currentPage - 1);
              } else {
                popScreen(context);
              }
            },

            //! OnPrimary Tap (Refactored)

            onPrimaryTap: (page) {
              printLog(page);
              final isValid = _formKey.currentState?.validate() ?? false;
              final nextPage = page + 1;

              if (!isValid) return;
              switch (page) {
                case identityDetailsId:
                case loginWithcbm:
                case newCredentialId:
                  _wizardController.updateWizardPage(nextPage);
                  break;
                case createPasscodeId:
                  if (!commonProvider.getStates("passcode")) {
                    passcode = signupCreatePinController.text;
                    signupCreatePinController.clear();
                    commonProvider.setStates("passcode", true);
                  } else {
                    _wizardController.updateWizardPage(enableBiometrics);
                  }
                  break;

                case enableBiometrics:
                  pushScreen(context, ScreenRoutes.toSignUpFinishedUp);

                default:
                  _wizardController.updateWizardPage(nextPage);
              }
            },

            //! ALL WIZARDS ARE STRTS FROM HERE
            //* All Wizard Items
            children: <WizardItem>[
              //! Wizard 1 : Account Details
              WizardItem(
                  title: "Identity Details",
                  subtitle:
                      "Enter your NIC or passport number to confirm your identity",
                  defaulButton: true,
                  buttonTitle: "Next",
                  children: [
                    // ColumnSpacer(size)
                    CustomLableTextField(
                      autovalidate: true,
                      validator: (input) =>
                          ValidationService.validateIsNotEmptyField(
                              input, "Passport"),
                      nidOrPassportController,
                      hint: "National ID / Passport Number",
                    ),
                    ColumnSpacer(0.4)
                  ]),

              //! Wizard 2: Login With CBM
              WizardItem(
                  title: "Login with CBM Digital",
                  subtitle:
                      "You can use your existing CBM Digital login details to access OneApp.",
                  defaulButton: true,
                  buttonTitle: "Next",
                  children: [
                    CustomLableTextField(
                      signInUserNameController,
                      hint: "Username",
                      autovalidate: true,
                      validator: (input) =>
                          ValidationService.validateIsNotEmptyField(
                              input, "UserName"),
                    ),
                    ColumnSpacer(0.02),
                    Consumer<CommonProvider>(
                      builder: (BuildContext context, CommonProvider value,
                              Widget? child) =>
                          CustomLableTextField(
                        signInPasswordController,
                        hint: "Password",
                        obscureText: !value.getStates('olduser_signin_psw'),
                        suffixIcon: IconButton(
                          onPressed: () {
                            value.toggleStates('olduser_signin_psw');
                          },
                          icon: value.getStates('olduser_signin_psw')
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
                    ForgotPasswordButton(
                      onTap: () =>
                          pushScreen(context, ScreenRoutes.toforgetPswScreen),
                    ),
                    // Align(
                    //   alignment: Alignment.bottomRight,
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       pushScreen(context, ScreenRoutes.toforgetPswScreen);
                    //     },
                    //     child: Text(
                    //       "Forgot Password ?",
                    //       style: commonTextStyle.copyWith(
                    //           color: AppColors.primarySubBlackColor,
                    //           fontSize: 14.sp),
                    //     ),
                    //   ),
                    // ),
                    ColumnSpacer(0.3)
                  ]),

              //! Wizard 6 : Create Neww Crentials

              WizardItem(
                  title: "Create new credentials",
                  subtitle:
                      "Enter the username and password you would like to use into oneapp.",
                  defaulButton: true,
                  buttonTitle: "Next",
                  defaultButtonBottomWidget: TermsAndPrivacyText(
                    onTermsTap: () {
                      printLog("Terms of Use clicked");
                    },
                    onPrivacyTap: () {
                      printLog("Privacy Policy clicked");
                    },
                  ),
                  children: [
                    CustomLableTextField(
                      signInUserNameController,
                      hint: "Username",
                      autovalidate: true,
                      validator: (input) =>
                          ValidationService.validateIsNotEmptyField(
                              input, "UserName"),
                    ),
                    const ColumnSpacer(0.02),
                    CustomLableTextField(
                      onChanged: (value) {
                        Provider.of<ValidationProvider>(context, listen: false)
                            .validatePassword(value);
                      },
                      signupcreateNewPasswordController,
                      hint: "New Password",
                      obscureText: !commonProvider.getStates("obscureText1"),
                      suffixIcon: IconButton(
                        onPressed: () {
                          commonProvider.toggleStates('obscureText1');
                        },
                        icon: commonProvider.getStates('obscureText1')
                            ? CustomVisibility_ON_Icon()
                            : CustomVisibility_OFF_Icon(),
                      ),
                      autovalidate: true,
                      validator: (input) => ValidationService.validatePassword(
                        input,
                      ),
                    ),
                    const ColumnSpacer(0.005),
                    Text(
                      "You’ll need this password to login to oneapp.",
                      style: commonTextStyle.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.primarySubBlackColor),
                    ),
                    const ColumnSpacer(0.02),
                    CustomLableTextField(
                      signupcreateRe_NewPasswordController,
                      hint: "Re-enter password",
                      obscureText: !commonProvider.getStates("obscureText2"),
                      suffixIcon: IconButton(
                        onPressed: () {
                          commonProvider.toggleStates('obscureText2');
                        },
                        icon: commonProvider.getStates('obscureText2')
                            ? CustomVisibility_ON_Icon()
                            : CustomVisibility_OFF_Icon(),
                      ),
                      autovalidate: true,
                      validator: (input) =>
                          ValidationService.validateConfirmPassword(
                        input,
                        createPassword:
                            signupcreateNewPasswordController.text.toString(),
                      ),
                    ),

                    ColumnSpacer(0.03),
                    //Password ValidationWidget
                    PasswordValidationWidget(),

                    const ColumnSpacer(0.04),
                  ]),

              //! Wizard : Create Pass Code

              WizardItem(
                  title: commonProvider.getStates("passcode")
                      ? "Re-enter passcode"
                      : "Create a passcode",
                  subtitle:
                      "This password will protect your oneapp account on this device",
                  defaulButton: true,
                  buttonTitle: "Next",
                  children: [
                    Center(
                      child: Text(
                        commonProvider.getStates("passcode")
                            ? "Re-enter password"
                            : "Enter password",
                        style: commonTextStyle.copyWith(
                            color: AppColors.secondarySubBlackColor),
                      ),
                    ),
                    PinFeild(
                      controller: signupCreatePinController,
                      onChanged: (value) {},
                      validator: (value) => ValidationService.validatePassCode(
                        value,
                        commonProvider.getStates("passcode") ? passcode : null,
                      ),
                    ),
                    ColumnSpacer(0.03),
                    PinNumberPad(
                      controller: signupCreatePinController,
                      onChanged: (value) {},
                      isBiomentrics: false,
                    ),
                  ]),

              WizardItem(
                  title: "Enable Biometrics",
                  subtitle:
                      "Use fingerprint or face recognition to quickly and securely access your account.",
                  defaulButton: true,
                  defaultButtonBottomWidget: CustomTextButton(
                    onTap: () {},
                    text: 'Skip This Time',
                    fontSize: 17.sp,
                    fonttWeight: FontWeight.w500,
                    color: AppColors.primaryBlackColor,
                  ),
                  buttonTitle: "Next",
                  children: [
                    CustomCurvedContainer(
                      height: ScreenUtils.height * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              CustomCurvedContainer(
                                padding: EdgeInsets.all(UI_Padding.PADDING),
                                height: ScreenUtils.height * 0.09,
                                width: ScreenUtils.height * 0.06,
                                color: AppColors.bottomNavBgColor,
                                child: CustomAppImage(
                                  assetPath: ImageAsset().fingerprint,
                                  color: AppColors.primaryBlueColor,
                                ),
                              ),
                              RowSpacer(0.05),
                              Text("Enable Biometrics",
                                  style: commonTextStyle.copyWith(
                                    fontSize: 17.sp,
                                    color: AppColors.primaryBlackColor,
                                    fontFamily: secondaryFontFamily,
                                  )),
                            ],
                          ),
                          ToggleSwitch(
                            value: false,
                            onChanged: (bool value) {},
                          )

                          // ToggleButtons(children: [], isSelected: isSelected)
                        ],
                      ),
                    ),
                    ColumnSpacer(0.35)
                  ]),
            ],
          ),
        );
      },
    );
  }
}
