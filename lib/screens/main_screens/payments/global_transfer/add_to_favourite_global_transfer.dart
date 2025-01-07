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
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToFavouriteGlobalTransferScreen extends StatelessWidget {
  const AddToFavouriteGlobalTransferScreen({super.key});

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
                            controller: signInPasswordController,
                            borderRadius: 13.sp,
                            isSmallContentPadding: true,
                            hint: "e.g. *******364",
                          ),
                          ColumnSpacer(0.01),
                          LabelWithTextField(
                            label: "Recipient’s name",
                            controller: signInPasswordController,
                            borderRadius: 13.sp,
                            isSmallContentPadding: true,
                            hint: "e.g. John Doe",
                          ),
                          ColumnSpacer(0.01),
                          LabelWithTextField(
                            label: "Recipient’s address / country",
                            controller: signInPasswordController,
                            borderRadius: 13.sp,
                            isSmallContentPadding: true,
                            hint: "e.g. France",
                          ),
                          ColumnSpacer(0.01),
                          LabelWithDropdown(
                              label: "Recipient’s code option",
                              borderRadius: 13.sp,
                              dropdownKey: "global_favorite_receipient_code",
                              items: ["option1", "option2", "option3"]),
                          ColumnSpacer(0.01),
                          LabelWithTextField(
                            label: "Recipient’s bank country",
                            controller: signInPasswordController,
                            borderRadius: 13.sp,
                            isSmallContentPadding: true,
                            hint: "e.g. France",
                          ),
                          ColumnSpacer(0.01),
                          LabelWithTextField(
                            label: "Recipient’s bank name",
                            controller: signInPasswordController,
                            borderRadius: 13.sp,
                            isSmallContentPadding: true,
                            hint: "e.g. Deuche Bank",
                          ),
                          ColumnSpacer(0.01),
                          LabelWithTextField(
                            label: "Recipient’s bank address",
                            controller: signInPasswordController,
                            borderRadius: 13.sp,
                            isSmallContentPadding: true,
                            hint: "e.g. Deuche Bank, France",
                          ),
                          ColumnSpacer(0.01),
                        ],
                      ),
                    ),
                  ),
                  ColumnSpacer(0.1),
                  MainButton(
                    isMainButton: true,
                    btnOnPress: () {
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
