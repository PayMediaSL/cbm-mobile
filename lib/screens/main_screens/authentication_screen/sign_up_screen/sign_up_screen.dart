// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants.dart';
import 'package:app/helpers/routes.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_editing_controllers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/other_provider/common_provider.dart';
import 'package:app/providers/value_notifier/value_notifier.dart';
import 'package:app/screens/screen_layouts/wizard_layout/wizard_layout.dart';
import 'package:app/screens/widgets/main_button/main_button.dart';
import 'package:app/screens/widgets/pin_field/pin_field.dart';
import 'package:app/screens/widgets/pin_field/pin_pad.dart';
import 'package:app/screens/widgets/text_fields/custom_text_field.dart';
import 'package:app/screens/widgets/text_fields/mobile_input_field.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/services/validation_service.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/common_methods.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

//! Global Keys
final _formKey = GlobalKey<FormState>();

final _wizardController = WizardLayoutController();
final _progressNotifier = GenericValueNotifier<bool>(false);
bool autoValidate = false;

//Otp PassCodce
String passcode = ''; // to store the first entered passcode
// bool isReEnter = false;

int identityDetailsId = 0;
int mobileNumberId = 1;
int otpId = 2;
int emailId = 3;
int newCredentialId = 5;
int createPasscodeId = 6;
// int clarifyIdentityId = 7;
// int aboutYouId = 8;

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    ScreenUtils.init(context);
    final commonProvider = Provider.of<CommonProvider>(context);
    return ValueListenableBuilder(
      valueListenable: _progressNotifier,
      builder: (BuildContext context, value, Widget? child) {
        return Form(
          autovalidateMode: commonProvider.getStates("autovalidate")
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          key: _formKey,
          child: WizardLayout(
            8,
            controller: _wizardController,
            //!On Back Press
            onBackPress: (currentPage) {
              if (currentPage == 0) {
              } else if (currentPage == createPasscodeId) {
                commonProvider.toggleStates("passcode");
                _wizardController.updateWizardPage(currentPage - 1);
              } else {
                if (currentPage > 0) {
                  _wizardController.updateWizardPage(currentPage - 1);
                } else {
                  popScreen(context);
                }
              }
            },
            //! OnPrimary Tap
            onPrimaryTap: (page) {
              // print("Pagesssssssssssssssss>>>>>>>>>>>>>>>");
              // print(page + 1);
              int nextPage = page + 1;
              if (page == identityDetailsId) {
                _wizardController.updateWizardPage(nextPage);
              } else if (page == mobileNumberId) {
                _wizardController.updateWizardPage(nextPage);
                commonProvider.startCountdown("otp_timer", duration: 120);
              } else if (page == otpId) {
                _wizardController.updateWizardPage(nextPage);
              } else if (page == emailId) {
                _wizardController.updateWizardPage(nextPage);
                // if (_formKey.currentState?.validate() ?? false) {
                //   _formKey.currentState?.save();
                //   _wizardController.updateWizardPage(nextPage);
                // } else {
                //   commonProvider.toggleState("autovalidate");
                // }
              } else if (page == newCredentialId) {
                _wizardController.updateWizardPage(nextPage);
                //! Need
              } else if (page == createPasscodeId) {
                if (!commonProvider.getStates("passcode")) {
                  passcode = createPinController.text;
                  createPinController.clear();
                  commonProvider.toggleStates("passcode");
                } else {
                  if (createPinController.text == passcode) {
                    //! Passcodes match, proceed to the next step
                    // _wizardController.updateWizardPage(nextPage);
                    pushScreen(context, ScreenRoutes.toClarifyIdentityScreen);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text("Passcodes do not match. Please try again.")));
                    // Show error message if passcodes don't match
                    // showError("Passcodes do not match. Please try again.");
                  }
                }
              }
              // else if (page == aboutYouId) {
              //   _wizardController.updateWizardPage(clarifyIdentityId);
              //   commonProvider.toggleState("aboutyou");
              // }
              else {
                _wizardController.updateWizardPage(nextPage);
              }

              // else if (page == mobileNumberId) {
              //   _wizardController.updateWizardPage(nextPage);
              // }
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
                      nidOrPassportController,
                      hint: "National ID / Passport Number",
                    ),
                    ColumnSpacer(0.4)
                    // Text("skdjskdjk")
                  ]),

              //! Wizard 2: Account Details
              WizardItem(
                  title: "Mobile number",
                  subtitle:
                      "What phone number would you like to use on the account",
                  defaulButton: true,
                  buttonTitle: "Next",
                  children: [
                    MobileInputField(mobileNumberController),
                    // CustomLableTextField(
                    //   nidOrPassportController,
                    //   hint: "Mobile Number",
                    // ),
                    ColumnSpacer(0.4)
                  ]),

              //!Wizard 3:Enter OTP
              WizardItem(
                  title: "Verification",
                  subtitle:
                      "Enter the 5-digit verification code we have sent to ${mobileNumberController.text}",
                  defaulButton: true,
                  buttonTitle: "Next",
                  children: [
                    PinCodeTextField(
                      controller: otpNumberController,
                      appContext: context,
                      autoDisposeControllers: false,
                      length: 5,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      textStyle:
                          TextStyle(color: AppColors.primarySubBlackColor),
                      blinkWhenObscuring: true,
                      enableActiveFill: false,
                      cursorColor: AppColors.primaryBlueColor,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          activeBorderWidth: 0,
                          inactiveBorderWidth: 0,
                          borderWidth: 0,
                          disabledBorderWidth: 0,
                          fieldHeight: 40.h,
                          fieldWidth: 40.w,
                          disabledColor: Colors.white,
                          inactiveFillColor: AppColors.white,
                          inactiveColor: AppColors.onBoardSubTextStyleColor,
                          activeColor: AppColors.onBoardSubTextStyleColor,
                          selectedColor: AppColors.onBoardSubTextStyleColor),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'PIN cannot be empty';
                        }
                        if (value.length != 5) {
                          return 'PIN must be exactly 5 digits long';
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'PIN can only contain numeric digits';
                        }
                        // Add more validation rules if needed
                        return null;
                      },
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Your code will expire in ${commonProvider.getCountdown("otp_timer")} s",
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
                          onTap: commonProvider.isTimerActive("otp_timer")
                              ? null
                              : () {
                                  commonProvider.startCountdown("otp_timer",
                                      duration: 120);
                                },
                          child: Text(
                            " Resend",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: commonProvider.isTimerActive("otp_timer")
                                    ? AppColors.primarySubBlackColor
                                    : AppColors.primaryBlueColor),
                          ),
                        ),
                      ],
                    ),
                    ColumnSpacer(0.3)
                  ]),

              //! Wizard 4: Account Details
              WizardItem(
                  title: "Email address",
                  subtitle:
                      "Enter the email address you would like to use into oneapp.",
                  defaulButton: true,
                  buttonTitle: "Next",
                  children: [
                    // MobileInputField(mobileNumberController),
                    CustomLableTextField(
                      inputFormatters: [],
                      validator: (value) =>
                          ValidationService.validateEmail(value),
                      emailrController,
                      hint: "eg:johndoe@gmail.com",
                    ),
                    ColumnSpacer(0.4)
                  ]),

              //! Wizard 5: Check Email
              WizardItem(
                  title: "Check Your Email",
                  subtitle: "We’ve sent an email to ${emailrController.text}",
                  defaulButton: false,
                  // buttonTitle: "Next",
                  children: [
                    ColumnSpacer(0.1),
                    Center(
                        child: Image(
                            height: ScreenUtils.height * 0.2,
                            image: AssetImage(ImageAsset().mailBoxImage))),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      child: Text(
                        "It has a link that will sign you into oneapp, This link must be opened on this device",
                        style: commonTextStyle.copyWith(
                            fontSize: 16,
                            color: AppColors.secondarySubBlackColor),
                      ),
                    ),
                    ColumnSpacer(0.1),
                    MainButton(
                      isMainButton: true,
                      isPaddingNeeded: true,
                      buttontitle: "Open mail App",
                      btnOnPress: () {
                        OpenEmailApp();
                      },
                    ),
                    ColumnSpacer(0.02),
                    MainButton(
                      // isMainButton: true,
                      isPaddingNeeded: true,
                      buttontitle: "I didn't  receive my email",
                      btnOnPress: () {
                        _wizardController.updateWizardPage(newCredentialId);
                      },
                    )
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
                      signInUserNameController,
                      hint: "Username",
                    ),
                    const ColumnSpacer(0.02),
                    CustomLableTextField(
                      createNewPasswordController,
                      hint: "New Password",
                      obscureText: !commonProvider.getStates("obscureText1"),
                      suffixIcon: IconButton(
                          onPressed: () {
                            commonProvider.toggleStates('obscureText1');
                          },
                          icon: Icon(
                            commonProvider.getStates('obscureText1')
                                ? Icons.visibility
                                : Icons.visibility_off,
                          )),
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
                      createRe_NewPasswordController,
                      hint: "Re-enter password",
                      obscureText: !commonProvider.getStates("obscureText2"),
                      suffixIcon: IconButton(
                          onPressed: () {
                            commonProvider.toggleStates('obscureText2');
                          },
                          icon: Icon(
                            commonProvider.getStates('obscureText2')
                                ? Icons.visibility
                                : Icons.visibility_off,
                          )),
                    ),
                    const ColumnSpacer(0.2),
                  ]),

              //! Wizard 7 : Create Pass Code

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
                        controller: createPinController, onChanged: (value) {}),
                    ColumnSpacer(0.03),
                    PinNumberPad(
                      controller: createPinController,
                      onChanged: (value) {},
                      isBiomentrics: false,
                    ),
                  ]),

              //! Wizard 8 : CLARIFYING iDENTITY
              // WizardItem(
              //   title: "Let’s clarify your identity",
              //   subtitle:
              //       "We’ll keep your information secure and confidential.",
              //   defaulButton: true,
              //   buttonTitle: "Next",
              //   children: [
              //     ClarifyIdentityContainer(
              //       isCompleted: commonProvider.getState("aboutyou"),
              //       title: "About you",
              //       description: "Your citizenship and personal details.",
              //       imagePath: ImageAsset().userImage,
              //       onTap: () {
              //         _wizardController.updateWizardPage(aboutYouId);
              //       },
              //     ),
              //     ColumnSpacer(0.01),
              //     ClarifyIdentityContainer(
              //       isCompleted: commonProvider.getState("identity"),
              //       title: "Your identity",
              //       description: "Checking to make sure you and your ID match.",
              //       imagePath: ImageAsset().profileImage,
              //       onTap: () {
              //         pushScreen(context, ScreenRoutes.toSignUpSelfieScreen);
              //       },
              //       // route: route
              //     ),
              //     ColumnSpacer(0.01),
              //     ClarifyIdentityContainer(
              //       isCompleted: commonProvider.getState("signature"),
              //       title: "Your signature",
              //       description:
              //           "Processing of transactions and services that require your authorization.",
              //       imagePath: ImageAsset().penToolImage,
              //       // route: route
              //     ),
              //     ColumnSpacer(0.01),
              //     ClarifyIdentityContainer(
              //       isCompleted: commonProvider.getState("billingproof"),
              //       title: "Billing proof",
              //       description:
              //           "Checking to make sure you are an permanent residence.",
              //       imagePath: ImageAsset().homeImage,
              //       // route: route
              //     ),
              //   ],
              // ),

              //! wizard 9 : Bio Data

              // WizardItem(
              //     title: "Tell us a little about you",
              //     subtitle:
              //         "Enter your first, last, and other names exactly as they appear in your national ID. ",
              //     defaulButton: true,
              //     buttonTitle: "Next",
              //     children: [
              //       CustomLableTextField(
              //         firstNameController,
              //         hint: "First name",
              //       ),
              //       ColumnSpacer(0.02),
              //       CustomLableTextField(
              //         lastNameController,
              //         hint: "Last name",
              //       ),
              //       ColumnSpacer(0.03),
              //       Align(
              //         alignment: Alignment.topRight,
              //         child: Text(
              //           "Optional",
              //           style: commonTextStyle.copyWith(
              //               color: AppColors.secondarySubBlackColor,
              //               fontFamily: "exo2"),
              //         ),
              //       ),
              //       CustomLableTextField(
              //         otherNameController,
              //         hint: "Other name",
              //       ),
              //       ColumnSpacer(0.02),
              //       CustomLableTextField(
              //         dateOfBirthController,
              //         hint: "Date of birth (DD/MM/YYYY)",
              //       ),
              //       ColumnSpacer(0.14),
              //     ])
            ],
          ),
        );
      },
    );
  }
}
