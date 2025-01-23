import 'package:cbm_one_app/helpers/colors.dart';
import 'package:cbm_one_app/helpers/spacers.dart';
import 'package:cbm_one_app/helpers/text_editing_controllers.dart';
import 'package:cbm_one_app/helpers/text_styles.dart';
import 'package:cbm_one_app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:cbm_one_app/services/screen_size_calculator.dart';
import 'package:cbm_one_app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColumnSpacer(0.05),
            Container(
              padding: EdgeInsets.only(top: 15.sp, left: 10.sp, bottom: 10.sp),
              // height: ScreenUtils.height * 0.1,
              width: ScreenUtils.width,
              decoration: BoxDecoration(
                  color: AppColors.primaryWhiteColor,
                  borderRadius: BorderRadius.circular(10.sp)),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "USER DETAIL",
                    style: commonTextStyle.copyWith(
                        color: HexColor("#94A3B8"),
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
                        color: HexColor("#94A3B8"),
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

class CustomTextFieldRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String hintText;
  final TextEditingController controller;
  final double? height;
  final int maxLines;

  const CustomTextFieldRow({
    Key? key,
    required this.icon,
    required this.label,
    required this.hintText,
    required this.controller,
    this.height, // Default height
    this.maxLines = 1, // Default to single-line TextField
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.primarySubBlackColor),
            SizedBox(width: 8.sp),
            Text(label,
                style: commonTextStyle.copyWith(
                    color: AppColors.primarySubBlackColor)),
          ],
        ),
        SizedBox(
          height: height ?? ScreenUtils.height * 0.06,
          width: ScreenUtils.width * 0.6,
          child: Transform.scale(
            scale: 0.8, // Adjust scaling if needed
            child: TextField(
              controller: controller,
              maxLines: maxLines,
              textAlign: TextAlign.right, // Align entered text to the right
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                  borderSide: BorderSide(color: AppColors.textFieldBorderColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                  borderSide: BorderSide(color: AppColors.textFieldBorderColor),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
