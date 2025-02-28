// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cbm_one_app/helpers/colors.dart';
import 'package:cbm_one_app/helpers/spacers.dart';
import 'package:cbm_one_app/helpers/text_styles.dart';
import 'package:cbm_one_app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:cbm_one_app/screens/widgets/container/customer_curved_container.dart';
import 'package:cbm_one_app/screens/widgets/main_button/main_button.dart';
import 'package:cbm_one_app/screens/widgets/text_fields/custom_label_with_textfield.dart';
import 'package:cbm_one_app/services/screen_size_calculator.dart';
import 'package:cbm_one_app/services/validation_service.dart';
import 'package:cbm_one_app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToFavouriteLocalTransferScreen extends StatelessWidget {
  AddToFavouriteLocalTransferScreen({super.key});

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
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ColumnSpacer(0.05),
                    CustomCurvedContainer(
                      height: ScreenUtils.height * 0.37,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Receipient Details",
                              style: commonTextHeadingStyle,
                            ),
                            ColumnSpacer(0.01),

                            LabelWithDropdown(
                              label: "Recipient’s bank",
                              borderRadius: 12.sp,
                              dropdownKey: "local_transfer_favourite_bank",
                              items: ["option1", "option2", "option3"],
                              autovalidate: true,
                              validator: (value) =>
                                  ValidationService.validateIsNotEmptyField(
                                      value, "Bank"),
                            ),
                            ColumnSpacer(0.01),

                            LabelWithTextField(
                              label: "Receipient's account number",
                              controller: TextEditingController(),
                              borderRadius: 12.sp,
                              isSmallContentPadding: true,
                              hint: "eg:234563354",
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              autovalidate: true,
                              validator: (value) =>
                                  ValidationService.validateAccoutNumber(
                                value,
                              ),
                            ),
                            ColumnSpacer(0.01),
                            LabelWithTextField(
                              label: "Recipient’s name",
                              controller: TextEditingController(),
                              borderRadius: 12.sp,
                              isSmallContentPadding: true,
                              hint: "eg : john doe",
                              autovalidate: true,
                              validator: (value) =>
                                  ValidationService.validateIsNotEmptyField(
                                      value, "Name"),
                            ),

                            // Text(
                            //   "Receipient's Bank",
                            //   style: commonTextFieldTitleStyle,
                            // ),
                            // ColumnSpacer(0.005),
                            // CustomDropdown(
                            //   borderradius: 13.sp,
                            //   dropdownKey: 'localtransferFavourites',
                            //   items: ['Option 1', 'Option 2', 'Option 3'],
                            // ),
                            // ColumnSpacer(0.01),
                            // Text(
                            //   "Receipient's account number",
                            //   style: commonTextFieldTitleStyle,
                            // ),
                            // ColumnSpacer(0.005),
                            // CustomLableTextField(
                            //   signInPasswordController,
                            //   borderradius: 12.sp,
                            //   isSmallContentPadding: true,
                            //   hint: "e.g : 234563354",
                            // ),
                            // ColumnSpacer(0.01),
                            // Text(
                            //   "Receipient's name",
                            //   style: commonTextFieldTitleStyle,
                            // ),
                            // ColumnSpacer(0.005),
                            // CustomLableTextField(
                            //   signInPasswordController,
                            //   borderradius: 12.sp,
                            //   isSmallContentPadding: true,
                            //   hint: "e.g : john doe",
                            // ),
                          ],
                        ),
                      ),
                    ),
                    ColumnSpacer(0.3),
                    MainButton(
                      isMainButton: true,
                      btnOnPress: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Form is valid!')),
                          );
                        }
                      },
                      buttontitle: "Add to Favourite",
                    )
                  ]),
            )));
  }
}
