import 'package:app/helpers/colors.dart';
import 'package:app/helpers/routes.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_editing_controllers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/other_provider/common_provider.dart';
import 'package:app/screens/screen_layouts/authentication_layout/authentication_layout.dart';
import 'package:app/screens/widgets/text_fields/custom_text_field.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/services/validation_service.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AboutYouScreen extends StatelessWidget {
  AboutYouScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    ScreenUtil.init(context);
    final commonProvider = Provider.of<CommonProvider>(context, listen: false);
    return AuthenticationLayout(
      isAppBar: true,
      onBackButtonTap: () {
        popScreen(context);
      },
      isContainer1: true,
      isContainer2: true,
      isBodyLeadingAvailable: true,
      isBodyLeadingIcon: true,
      isHeadingAvailable: true,
      isSubHeadingAvailable: true,
      useImage: true,
      imageName: ImageAsset().authBg,
      headerText: "Tell us a little about you",
      headerSubText:
          "Enter your first, last, and other names exactly as they appear in your national ID. ",
      defaultButton: true,
      buttontitle: "Next",
      onTap: () {
        if (_formKey.currentState!.validate()) {
          commonProvider.toggleStates("aboutyou");
          commonProvider.updateStateProgress("aboutyou", true);
          pushScreen(context, ScreenRoutes.toClarifyIdentityScreen);
        }
      },
      container2CustomWidget: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomLableTextField(
              firstNameController,
              hint: "First name",
              autovalidate: true,
              validator: (input) => ValidationService.validateIsNotEmptyField(
                  input, "First name"),
            ),
            ColumnSpacer(0.02),
            CustomLableTextField(
              lastNameController,
              hint: "Last name",
              autovalidate: true,
              validator: (input) =>
                  ValidationService.validateIsNotEmptyField(input, "Last name"),
            ),
            ColumnSpacer(0.03),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "Optional",
                style: commonTextStyle.copyWith(
                    color: AppColors.secondarySubBlackColor,
                    fontFamily: "exo2"),
              ),
            ),
            CustomLableTextField(
              otherNameController,
              hint: "Other name",
            ),
            ColumnSpacer(0.02),
            CustomLableTextField(
              suffixIcon: IconButton(
                onPressed: () async {
                  //! Need to change the Date Picker Once Date Picker UI --> Finalized
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    context
                        .read<CommonProvider>()
                        .setSelectedDate("sss", pickedDate);
                    final formattedDate =
                        "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";
                    dateOfBirthController.text = formattedDate;
                  }
                },
                icon: Icon(
                  Icons.calendar_month,
                  color: AppColors.primaryGreyColor2,
                ),
              ),
              dateOfBirthController,
              hint: "Date of birth (DD/MM/YYYY)",
              autovalidate: true,
              validator: (input) =>
                  ValidationService.validateIsNotEmptyField(input, "Date "),
              readOnly: true,
            ),

            // CustomLableTextField(
            //   suffixIcon: IconButton(
            //       onPressed: () async {
            //         final pickedDate = await showDatePicker(
            //           context: context,
            //           initialDate: DateTime.now(),
            //           firstDate: DateTime(2000),
            //           lastDate: DateTime(2100),
            //         );
            //         if (pickedDate != null) {
            //           // Update the selected date in the provider
            //           context
            //               .read<CommonProvider>()
            //               .setSelectedDate("sss", pickedDate);
            //         }
            //       },
            //       icon: Icon(
            //         Icons.calendar_month,
            //         color: AppColors.primaryGreyColor2,
            //       )),
            //   dateOfBirthController,
            //   hint: "Date of birth (DD/MM/YYYY)",
            // ),
            ColumnSpacer(0.14),
          ],
        ),
      ),
    );
  }
}
