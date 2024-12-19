import 'package:app/helpers/colors.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/home_screen/drawer/toggle_provider.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DrawerSettingsScreen extends StatelessWidget {
  const DrawerSettingsScreen({super.key});

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
      backTitle: "Settings",
      children: Column(
        children: [
          ColumnSpacer(0.1),
          _buildTile(context, "Dark Mode",
              ImageAsset().settingsIconDetailsupdate, true),
          ColumnSpacer(0.02),
          _buildTile(context, "Notifications",
              ImageAsset().settingsIconDetailsupdate, false),
          ColumnSpacer(0.02),
          _buildTile(context, "Font Settings",
              ImageAsset().settingsIconSecurity, false),
          ColumnSpacer(0.02),
          _buildTile(context, "Language Settings",
              ImageAsset().settingsIconInviteFriend, false),
          ColumnSpacer(0.02),
          _buildTile(context, "Terms and Conditons",
              ImageAsset().settingsIconInviteFriend, false),
          ColumnSpacer(0.02),
          _buildTile(context, "Privacy policy",
              ImageAsset().settingsIconInviteFriend, false),
        ],
      ),
    );
  }
  //String title, String image

  Widget _buildTile(
    BuildContext context,
    String title,
    String image,
    bool toggle,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        height: ScreenUtils.height * 0.08,
        width: ScreenUtils.width,
        decoration: BoxDecoration(
            color: AppColors.primaryWhiteColor,
            borderRadius: BorderRadius.circular(10.sp)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.secondarySubBlueColor,
                  backgroundImage: AssetImage(image),
                ),
                RowSpacer(0.03),
                Text(
                  title,
                  style: commonTextStyle.copyWith(
                      color: AppColors.primarySubBlackColor, fontSize: 15.sp),
                )
              ],
            ),

            toggle
                ? Consumer<ToggleSwitchProvider>(
                    builder: (BuildContext context, ToggleSwitchProvider value,
                            Widget? child) =>
                        CupertinoSwitch(
                            value: value.getSwitchState("switch_darktheme"),
                            activeColor: AppColors.primarySubBlackColor,
                            trackColor:
                                AppColors.primaryBlackColor.withOpacity(0.12),
                            thumbColor: HexColor("#FEF7FF"),
                            onChanged: (v) {
                              value.toggleSwitch("switch_darktheme", v);

                              // value.toggleSwitch(v);
                            }),
                  )
                : GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.primarySubBlackColor,
                    ))
            // Switch(
            //   dragStartBehavior: DragStartBehavior.start,
            //   value: commonProvider.getState("toggleDarkMode"),
            //   onChanged: (value) {
            //     commonProvider.toggleState("toggleDarkMode");
            //     // print(value);
            //   },
            //   focusColor: Colors.red,
            //   inactiveThumbColor: HexColor("#FEF7FF"),
            //   inactiveTrackColor: HexColor("#1D1B20").withOpacity(0.12),
            //   activeTrackColor: Colors.lightGreenAccent,
            //   // activeColor: Colors.green,

            //   hoverColor: Colors.red,
            // )
            // GestureDetector(
            //     onTap: () {},
            //     child: Icon(
            //       Icons.arrow_forward_ios_rounded,
            //       color: AppColors.primarySubBlackColor,
            //     ))
          ],
        ),
      ),
    );
  }
}
