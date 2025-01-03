// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_editing_controllers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/widgets/container/customer_curved_container.dart';
import 'package:app/screens/widgets/drop_down/custom_drop_down_field.dart';
import 'package:app/screens/widgets/main_button/main_button.dart';
import 'package:app/screens/widgets/text_fields/custom_text_field.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToFavouriteLocalTransferScreen extends StatelessWidget {
  const AddToFavouriteLocalTransferScreen({super.key});

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
                    height: ScreenUtils.height * 0.37,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Receipient Details",
                          style: commonTextHeadingStyle,
                        ),
                        ColumnSpacer(0.01),
                        Text(
                          "Receipient's Bank",
                          style: commonTextFieldTitleStyle,
                        ),
                        ColumnSpacer(0.005),
                        CustomDropdown(
                          borderradius: 13.sp,
                          dropdownKey: 'localtransferFavourites',
                          items: ['Option 1', 'Option 2', 'Option 3'],
                        ),
                        ColumnSpacer(0.01),
                        Text(
                          "Receipient's account number",
                          style: commonTextFieldTitleStyle,
                        ),
                        ColumnSpacer(0.005),
                        CustomLableTextField(
                          signInPasswordController,
                          borderradius: 12.sp,
                          isSmallContentPadding: true,
                          hint: "e.g : 234563354",
                        ),
                        ColumnSpacer(0.01),
                        Text(
                          "Receipient's name",
                          style: commonTextFieldTitleStyle,
                        ),
                        ColumnSpacer(0.005),
                        CustomLableTextField(
                          signInPasswordController,
                          borderradius: 12.sp,
                          isSmallContentPadding: true,
                          hint: "e.g : john doe",
                        ),
                      ],
                    ),
                  ),
                  ColumnSpacer(0.3),
                  MainButton(
                    isMainButton: true,
                    btnOnPress: () {},
                    buttontitle: "Add to Favourite",
                  )
                ])));
  }
}
