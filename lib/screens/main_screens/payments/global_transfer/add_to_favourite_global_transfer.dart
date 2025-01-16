// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_editing_controllers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/widgets/container/customer_curved_container.dart';
import 'package:app/screens/widgets/main_button/main_button.dart';
import 'package:app/screens/widgets/text_fields/custom_label_with_textfield.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/services/validation_service.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToFavouriteGlobalTransferScreen extends StatelessWidget {
  AddToFavouriteGlobalTransferScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return HomeMainLayout(
        backgroundColor: AppColors.SecondarysubGreyColor,
        isBgContainer1: true,
        isBgContainer2: true,
        isBgContainer1Height: ScreenUtils.height * 0.07,
        onBackIconAvailable: true,
        onBackTitleAvailable: true,
        backTitle: "Add to Favorites",
        onBackTap: () {
          popScreen(context);
        },
        children: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ColumnSpacer(0.05),
                  CustomCurvedContainer(
                    height: ScreenUtils.height * 0.6,
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Receipient Details",
                              style: commonTextHeadingStyle,
                            ),
                            ColumnSpacer(0.01),
                            LabelWithTextField(
                              label: "Recipient’s account number",
                              controller:
                                  globalTransferFavouriteAccountController,
                              borderRadius: 13.sp,
                              isSmallContentPadding: true,
                              hint: "e.g. *******364",
                              autovalidate: true,
                              validator: (value) =>
                                  ValidationService.validateIsNotEmptyField(
                                      value, "Account Number"),
                            ),
                            ColumnSpacer(0.01),
                            LabelWithTextField(
                              label: "Recipient’s name",
                              controller: globalTransferFavouriteNameController,
                              borderRadius: 13.sp,
                              isSmallContentPadding: true,
                              hint: "e.g. John Doe",
                              autovalidate: true,
                              validator: (value) =>
                                  ValidationService.validateIsNotEmptyField(
                                      value, "Name"),
                            ),
                            ColumnSpacer(0.01),
                            LabelWithTextField(
                              label: "Recipient’s address / country",
                              controller:
                                  globalTransferFavouriteAddressCountryController,
                              borderRadius: 13.sp,
                              isSmallContentPadding: true,
                              hint: "e.g. France",
                              autovalidate: true,
                              validator: (value) =>
                                  ValidationService.validateIsNotEmptyField(
                                      value, "Country/Address"),
                            ),
                            ColumnSpacer(0.01),
                            LabelWithDropdown(
                              label: "Recipient’s code option",
                              borderRadius: 13.sp,
                              dropdownKey: "global_favorite_receipient_code",
                              items: ["option1", "option2", "option3"],
                              autovalidate: true,
                              validator: (value) =>
                                  ValidationService.validateIsNotEmptyField(
                                      value, "Code"),
                            ),
                            ColumnSpacer(0.01),
                            LabelWithTextField(
                              label: "Recipient’s bank country",
                              controller:
                                  globalTransferFavouriteBankCountryController,
                              borderRadius: 13.sp,
                              isSmallContentPadding: true,
                              hint: "e.g. France",
                              autovalidate: true,
                              validator: (value) =>
                                  ValidationService.validateIsNotEmptyField(
                                      value, "Bank Country"),
                            ),
                            ColumnSpacer(0.01),
                            LabelWithTextField(
                              label: "Recipient’s bank name",
                              controller:
                                  globalTransferFavouriteBankNameController,
                              borderRadius: 13.sp,
                              isSmallContentPadding: true,
                              hint: "e.g. Deuche Bank",
                              autovalidate: true,
                              validator: (value) =>
                                  ValidationService.validateIsNotEmptyField(
                                      value, "Bank Name"),
                            ),
                            ColumnSpacer(0.01),
                            LabelWithTextField(
                              label: "Recipient’s bank address",
                              controller:
                                  globalTransferFavouriteBankAddressController,
                              borderRadius: 13.sp,
                              isSmallContentPadding: true,
                              hint: "e.g. Deuche Bank, France",
                              autovalidate: true,
                              validator: (value) =>
                                  ValidationService.validateIsNotEmptyField(
                                      value, "Bank Address"),
                            ),
                            ColumnSpacer(0.01),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ColumnSpacer(0.1),
                  MainButton(
                    isMainButton: true,
                    btnOnPress: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Form is valid!')),
                        );
                      }
                      // String selectedValue1 = Provider.of<DropdownProvider>(
                      //         context,
                      //         listen: false)
                      //     .getSelectedValue('global_favorite_receipient_code');
                      // print(selectedValue1);
                      // String selectedValue2 = context.read<DropdownProvider>().getSelectedValue('dropdown2');
                      // print("Selected Value 1: $selectedValue1");
                      // print("Selected Value 2: $selectedValue2");
                    },
                    buttontitle: "Add to Favourite",
                  )
                ])));
  }
}
