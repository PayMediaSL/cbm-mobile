// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/routes.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainDrawerScreen extends StatelessWidget {
  const MainDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return HomeMainLayout(
      backgroundColor: AppColors.SecondarysubGreyColor,
      isBgContainer1: true,
      isBgContainer2: true,
      isBgContainer1Height: ScreenUtils.height * 0.15,
      onBackIconAvailable: true,
      onBackTap: () {},
      children: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColumnSpacer(0.04),
            Center(child: _buildProfileImageName()),
            ColumnSpacer(0.05),
            Text(
              "Account Settings",
              style: commonTextStyle.copyWith(
                  fontSize: 14.sp, color: AppColors.primarySubBlackColor),
            ),
            Divider(),
            // ColumnSpacer(0.01),
            //! Account Summary
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 25.sp),
              decoration: BoxDecoration(
                  color: AppColors.primaryWhiteColor,
                  borderRadius: BorderRadius.circular(10.sp)),
              child: Column(
                children: [
                  _buildSectionTitle(ImageAsset().settingsIconProfile,
                      "My Profile", true, test),
                  _buildSectionTitle(ImageAsset().settingsIconSecurity,
                      "Security & Safety", true, () {
                    pushScreen(context, ScreenRoutes.toDrawerSecuritySafety);
                  }),
                  _buildSectionTitle(ImageAsset().settingsIconTransactionLimit,
                      "Transaction Limits", true, test),
                  _buildSectionTitle(ImageAsset().settingsIconDetailsupdate,
                      "Detail Update", true, () {
                    pushScreen(context, ScreenRoutes.toDrawerDetailsUpdate);
                  }),
                  _buildSectionTitle(ImageAsset().settingsIconNewAccount,
                      "Open a New Account", false, test),
                ],
              ),
            ),
            //! General
            ColumnSpacer(0.02),
            Text(
              "General",
              style: commonTextStyle.copyWith(
                  fontSize: 14.sp, color: AppColors.primarySubBlackColor),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 25.sp),
              decoration: BoxDecoration(
                  color: AppColors.primaryWhiteColor,
                  borderRadius: BorderRadius.circular(10.sp)),
              child: Column(
                children: [
                  _buildSectionTitle(
                      ImageAsset().settingsIconSetting, "Settings", true, () {
                    pushScreen(context, ScreenRoutes.toDrawerSettingScreen);
                  }),
                  _buildSectionTitle(
                      ImageAsset().settingsIconSetting, "Help", true, test),
                  _buildSectionTitle(ImageAsset().settingsIconInviteFriend,
                      "Invite Friends", true, test),
                  _buildSectionTitle(
                      ImageAsset().settingsIconSetting, "Info", true, test),
                ],
              ),
            ),
            ColumnSpacer(0.02),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 25.sp),
              decoration: BoxDecoration(
                  color: AppColors.primaryWhiteColor,
                  borderRadius: BorderRadius.circular(10.sp)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        image: AssetImage(ImageAsset().settingsIconLogout),
                        height: 22.sp,
                      ),
                      RowSpacer(0.04),
                      Text(
                        "Log out",
                        style: commonTextStyle.copyWith(
                            color: AppColors.primaryRedColor, fontSize: 14.sp),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void test() {}

// Drawer Prifle Image
  Widget _buildProfileImageName() {
    return Column(
      children: [
        // Stack for profile image and camera icon
        Stack(
          children: [
            // Circle Avatar
            CircleAvatar(
              radius: 50.sp,
              backgroundColor: Colors.blue[200],
              // child: Text(
              //   "SD",
              //   style: TextStyle(
              //     color: AppColors.primaryBlueColor,
              //     fontSize: 24,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ),
            // Camera Icon
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryBlueColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                padding: const EdgeInsets.all(5),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
            ),
          ],
        ),
        ColumnSpacer(0.006),
        // Name and Username
        Text("Sajeewa Dissanayake", style: homeScreenTitleStyle),
        ColumnSpacer(0.001),
        Text("sajeewa93",
            style: commonTextStyle.copyWith(
                color: AppColors.primarySubBlackColor)),
      ],
    );
  }

  _buildSectionTitle(
    String image,
    String title,
    bool padding,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(image),
            height: 30.sp,
          ),
          RowSpacer(0.04),
          Text(
            title,
            style: commonTextStyle.copyWith(
                color: AppColors.primarySubBlackColor, fontSize: 15.sp),
          ),
          padding ? ColumnSpacer(0.05) : ColumnSpacer(0)
        ],
      ),
    );
  }
}
