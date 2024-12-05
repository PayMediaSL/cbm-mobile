// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_editing_controllers.dart';
import 'package:app/providers/value_notifier/value_notifier.dart';
import 'package:app/screens/screen_layouts/wizard_layout/wizard_layout.dart';
import 'package:app/screens/widgets/text_fields/custom_text_field.dart';
import 'package:app/screens/widgets/text_fields/mobile_input_field.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

final _wizardController = WizardLayoutController();
final _progressNotifier = GenericValueNotifier<bool>(false);

int identityDetailsId = 0;
int mobileNumberId = 0;

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    ScreenUtils.init(context);
    return ValueListenableBuilder(
      valueListenable: _progressNotifier,
      builder: (BuildContext context, value, Widget? child) {
        return Stack(
          children: [
            WizardLayout(4,
                //!On Back Press
                onBackPress: (currentPage) {
              if (currentPage == 0) {
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
              int nextPage = page + 1;
              if (page == identityDetailsId) {
                _wizardController.updateWizardPage(nextPage);
              } else if (page == mobileNumberId) {
                _wizardController.updateWizardPage(nextPage);
              }
            },

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
                        MobileInputField(nidOrPassportController),
                        // CustomLableTextField(
                        //   nidOrPassportController,
                        //   hint: "Mobile Number",
                        // ),
                        ColumnSpacer(0.4)
                      ])
                ],
                controller: _wizardController)
          ],
        );
      },
    );
  }
}
