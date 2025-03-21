// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_editing_controllers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/other_provider/common_provider.dart';
import 'package:app/providers/validation_provider/password_validation_provider.dart';
import 'package:app/providers/value_notifier/value_notifier.dart';
import 'package:app/screens/screen_layouts/wizard_layout/wizard_layout.dart';
import 'package:app/screens/widgets/icons/custom_icons.dart';
import 'package:app/screens/widgets/pin_field/custom_pin_field.dart';
import 'package:app/screens/widgets/radio_button/text_radio_button.dart';
import 'package:app/screens/widgets/text_fields/custom_text_field.dart';
import 'package:app/screens/widgets/text_fields/mobile_input_field.dart';
import 'package:app/screens/widgets/validation/password_validation_widget.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/services/validation_service.dart';
import 'package:app/utils/log_util.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ForgetPasswordFlowScreen extends StatefulWidget {
  const ForgetPasswordFlowScreen({super.key});

  @override
  State<ForgetPasswordFlowScreen> createState() =>
      _ForgetPasswordFlowScreenState();
}

//! Global Keys
final _formKey = GlobalKey<FormState>();

final _wizardController = WizardLayoutController();
final _progressNotifier = GenericValueNotifier<bool>(false);
bool autoValidate = false;

//Otp PassCodce
const identityDetailsId = 0;
const accountNumber = 1;
const mobileNumberId = 2;
const selectVerification = 3;
const otpId = 4;
const newCredentialId = 5;

class _ForgetPasswordFlowScreenState extends State<ForgetPasswordFlowScreen> {
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
            6,
            controller: _wizardController,
            //!On Back Press
            onBackPress: (currentPage) {
              if (currentPage == 0) {
                return popScreen(context);
              }
              switch (currentPage) {
                case otpId:
                  commonProvider.resetCountdown("otp_timer_forgetPassword");
                  break;

                case newCredentialId:
                  // commonProvider.resetCountdown("otp_timer_forgetPassword");
                  commonProvider.startCountdown("otp_timer_forgetPassword",
                      duration: 120);
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
                case accountNumber:
                case mobileNumberId:
                case selectVerification:
                  commonProvider.startCountdown("otp_timer_forgetPassword",
                      duration: 120);
                  _wizardController.updateWizardPage(nextPage);
                  break;
                case otpId:
                  _wizardController.updateWizardPage(nextPage);
                  commonProvider.resetCountdown("otp_timer_forgetPassword");
                  break;
                case newCredentialId:
                  // navigateToScreen(context, ScreenRoutes.toSignInScreen);
                  break;
                default:
                  _wizardController.updateWizardPage(nextPage);
              }
            },

            //! ALL WIZARDS ARE STRTS FROM HERE
            //* All Wizard Items
            children: <WizardItem>[
              //! Wizard 1 : Account Details
              WizardItem(
                  title: "Verify Your Identity",
                  subtitle:
                      "Enter your National ID (NID) number to begin the password reset process.",
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
              //! Wizard 2

              WizardItem(
                  title: "Confirm Your Account",
                  subtitle:
                      "Enter your bank account number linked to your NID for verification.",
                  defaulButton: true,
                  buttonTitle: "Next",
                  children: [
                    // ColumnSpacer(size)
                    CustomLableTextField(
                      autovalidate: true,
                      validator: (input) =>
                          ValidationService.validateIsNotEmptyField(
                              input, "Account Number"),
                      nidOrPassportController,
                      hint: "Account Number",
                    ),
                    ColumnSpacer(0.4)
                  ]),
              //! Wizard 3: Account Details
              WizardItem(
                  title: "Mobile number",
                  subtitle:
                      "What phone number would you like to use on the account",
                  defaulButton: true,
                  buttonTitle: "Next",
                  children: [
                    MobileInputField(
                      mobileNumberController,
                      autovalidate: true,
                      validator: (input) => ValidationService.validateMobile(
                        input,
                      ),
                    ),
                    ColumnSpacer(0.4)
                  ]),

              //! Wizard 4: Account Details
              WizardItem(
                  title: "Select Verification Method",
                  subtitle:
                      "Choose where you’d like to receive the One-Time Password (OTP) for verification.",
                  defaulButton: true,
                  buttonTitle: "Next",
                  children: [
                    CustomRadioButton(
                      // final radioProvider = Provider.of<RadioButtonProvider>(context);
                      // radioProvider.getSelectedOption("forgetpsw_verification_method_radio")

                      groupKey: "forgetpsw_verification_method_radio",
                      options: [
                        "Mobile Number",
                        "Registered Email",
                      ],
                    ),
                    ColumnSpacer(0.3)
                  ]),

              //!Wizard 5:Enter OTP
              WizardItem(
                  title: "Verification",
                  subtitle:
                      "Enter the 5-digit verification code we have sent to ${mobileNumberController.text}",
                  defaulButton: true,
                  buttonTitle: "Next",
                  children: [
                    CustomPinCodeField(
                      controller: otpNumberController,
                      validator: (value) =>
                          ValidationService.validateOTPField(value),
                      cursorColor: AppColors.primaryBlueColor,
                      activeColor: AppColors.onBoardSubTextStyleColor,
                      inactiveColor: AppColors.onBoardSubTextStyleColor,
                      selectedColor: AppColors.onBoardSubTextStyleColor,
                      backgroundColor: AppColors.white,
                      fieldWidth: 40.w,
                      fieldHeight: 40.h,
                    ),
                    ColumnSpacer(0.01),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Your code will expire in ${commonProvider.getCountdown("otp_timer_forgetPassword")} s",
                          style: commonTextStyle.copyWith(
                              color: AppColors.secondarySubBlackColor),
                        )),
                    ColumnSpacer(0.04),
                    Row(
                      children: [
                        Text(
                          "Didn't Receive Code?",
                          style: commonTextStyle.copyWith(
                              color: AppColors.secondarySubBlackColor),
                        ),
                        GestureDetector(
                          onTap: commonProvider
                                  .isTimerActive("otp_timer_forgetPassword")
                              ? null
                              : () {
                                  commonProvider.startCountdown(
                                      "otp_timer_forgetPassword",
                                      duration: 120);
                                },
                          child: Text(
                            " Resend",
                            style: commonTextStyle.copyWith(
                                fontWeight: FontWeight.w600,
                                color: commonProvider.isTimerActive(
                                        "otp_timer_forgetPassword")
                                    ? AppColors.primarySubBlackColor
                                    : AppColors.primaryBlueColor),
                          ),
                        ),
                      ],
                    ),
                    ColumnSpacer(0.3)
                  ]),

              //! Wizard 6 : Create Neww Crentials
              WizardItem(
                  title: "Create new credentials",
                  subtitle:
                      "Enter the username and password you would like to use into oneapp.",
                  defaulButton: true,
                  buttonTitle: "Next",
                  children: [
                    CustomLableTextField(
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
                      onChanged: (value) {
                        Provider.of<ValidationProvider>(context, listen: false)
                            .validatePassword(value);
                      },
                    ),
                    const ColumnSpacer(0.005),
                    Padding(
                      padding: const EdgeInsets.only(left: UI.PADDING),
                      child: Text(
                        "You’ll need this password to login to oneapp.",
                        style: commonTextStyle.copyWith(
                            fontSize: 12.sp,
                            color: AppColors.primarySubBlackColor),
                      ),
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
                    PasswordValidationWidget(),
                    const ColumnSpacer(0.18),
                  ]),
            ],
          ),
        );
      },
    );
  }
}
