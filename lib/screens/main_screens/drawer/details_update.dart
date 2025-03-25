import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants/ui_constants.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_editing_controllers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/widgets/text_fields/custom_row_text_field.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class DrawerDetailsUpdate extends StatelessWidget {
  const DrawerDetailsUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeMainLayout(
      backgroundColor: AppColors.SecondarysubGreyColor,
      isBgContainer1: true,
      isBgContainer2: true,
      isBgContainer1Height: ScreenUtils.height * 0.07,
      onBackIconAvailable: true,
      onBackTitleAvailable: true,
      onBackTap: () {
        popScreen(context);
      },
      backTitle: "Details Update",
      children: Padding(
        padding: EdgeInsets.symmetric(
            vertical: UI_Padding.PRIMARY_COMMON_PADDING,
            horizontal: UI_Padding.PRIMARY_COMMON_PADDING),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColumnSpacer(0.05),
            Container(
              padding: EdgeInsets.only(
                  top: UI_Padding.PRIMARY_COMMON_PADDING_2,
                  left: UI_Padding.PRIMARY_COMMON_PADDING,
                  bottom: UI_Padding.PRIMARY_COMMON_PADDING),
              // height: ScreenUtils.height * 0.1,
              width: ScreenUtils.width,
              decoration: BoxDecoration(
                  color: AppColors.primaryWhiteColor,
                  borderRadius: BorderRadius.circular(
                      UI_Borderradius.COMMON_BORDER_RADIUS)),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "USER DETAIL",
                    style: commonTextStyle.copyWith(
                        color: AppColors.textFieldHintColor,
                        fontWeight: FontWeight.w500),
                  ),
                  ColumnSpacer(0.01),
                  CustomTextFieldRow(
                    controller: drawerNameController,
                    icon: Icons.person_outline_rounded,
                    label: 'Name',
                    hintText: 'Ragnar lothbrok',
                  ),
                  ColumnSpacer(0.01),
                  CustomTextFieldRow(
                    controller: drawerNameController,
                    icon: Icons.email_outlined,
                    label: 'Email',
                    hintText: 'ragnar@gmail.com',
                  ),
                  ColumnSpacer(0.01),
                  CustomTextFieldRow(
                    controller: drawerNameController,
                    icon: Icons.calendar_month_outlined,
                    label: 'Birthday',
                    hintText: '12-23-2024',
                  ),
                  ColumnSpacer(0.02),
                  Text(
                    "CONTACT DETAIL",
                    style: commonTextStyle.copyWith(
                        color: AppColors.textFieldHintColor,
                        fontWeight: FontWeight.w500),
                  ),
                  ColumnSpacer(0.01),
                  CustomTextFieldRow(
                    controller: drawerNameController,
                    icon: Icons.phone_outlined,
                    label: 'Mobile',
                    hintText: '+94627534886',
                  ),
                  CustomTextFieldRow(
                    controller: drawerNameController,
                    icon: Icons.person,
                    label: 'NIC',
                    hintText: '769345774v',
                  ),
                  CustomTextFieldRow(
                    maxLines: 4,
                    height: ScreenUtils.height * 0.1,
                    controller: drawerNameController,
                    icon: Icons.person_outline_rounded,
                    label: 'Address',
                    hintText: 'Colombo 06',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
