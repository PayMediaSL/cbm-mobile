// ignore_for_file: prefer_const_constructors
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_editing_controllers.dart';
import 'package:app/screens/screen_layouts/authentication_layout/authentication_layout.dart';
import 'package:app/screens/widgets/text_fields/custom_text_field.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return AuthenticationLayout(
      isContainer1: true,
      isBodyLeadingAvailable: true,
      container1Height: ScreenUtils.height * 0.3,
      isHeadingAvailable: true,
      headerText: "Enter your Flash app credentials",
      isContainer2: true,
      container2CustomWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // TextField(
            //   controller: controller,
            // ),
            SizedBox(
              height: ScreenUtils.height * 0.02,
            ),

            CustomLableTextField(signInEmailController),
            ColumnSpacer(0.02),
            CustomLableTextField(signInEmailController),
          ],
        ),
      ),
    );
  }
}
