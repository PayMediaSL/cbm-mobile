import 'package:app/helpers/colors.dart';
import 'package:app/helpers/povider_helper/common_provider.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/widgets/main_button/main_button.dart';
import 'package:app/screens/widgets/text_fields/custom_text_field.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerChangePassword extends StatelessWidget {
  const DrawerChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    var commonProvider = getCommonProvider(context);
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
        backTitle: "Change Password",
        children: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ColumnSpacer(0.05),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.sp, horizontal: 15.sp),
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
                          "New Password",
                          style: commonTextStyle.copyWith(
                              color: AppColors.primaryBlackColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        ColumnSpacer(0.001),
                        Text(
                          "Your password must be at least 6 characters and should include a combination of numbers , letters and special characters.",
                          style: commonTextStyle.copyWith(
                              color: AppColors.textFieldHintColor,
                              fontWeight: FontWeight.w500),
                        ),
                        // TODO  {Need to add Controllers For Each}

                        ColumnSpacer(0.05),
                        CustomLableTextField(
                          TextEditingController(), // Paste Your Actual Controller
                          hint: "Enter Current Password",
                          obscureText: !commonProvider.getStates("drawerpsw1"),
                          suffixIcon: IconButton(
                              onPressed: () {
                                commonProvider.toggleStates('drawerpsw1');
                              },
                              icon: Icon(
                                commonProvider.getStates('drawerpsw1')
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              )),
                          hintFontFamily: "inter",
                        ),
                        ColumnSpacer(0.02),
                        CustomLableTextField(
                          TextEditingController(), // Paste Your Actual Controller
                          hint: "Enter new Password",
                          obscureText: !commonProvider.getStates("drawerpsw2"),
                          suffixIcon: IconButton(
                              onPressed: () {
                                commonProvider.toggleStates('drawerpsw2');
                              },
                              icon: Icon(
                                commonProvider.getStates('drawerpsw2')
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              )),
                          hintFontFamily: "inter",
                        ),
                        ColumnSpacer(0.02),
                        CustomLableTextField(
                          TextEditingController(), // Paste Your Actual Controller
                          hint: "Enter new Password",
                          obscureText: !commonProvider.getStates("drawerpsw3"),
                          suffixIcon: IconButton(
                              onPressed: () {
                                commonProvider.toggleStates('obscureText3');
                              },
                              icon: Icon(
                                commonProvider.getStates('obscureText3')
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              )),
                          hintFontFamily: "inter",
                        ),
                        ColumnSpacer(0.01),
                        Padding(
                          padding: EdgeInsets.only(left: 10.sp),
                          child: Text(
                            "Forgotten Your Password",
                            style: commonTextStyle.copyWith(
                                color: AppColors.secondarySubBlueColor2,
                                fontSize: 12.sp),
                          ),
                        ),
                        ColumnSpacer(0.025),
                        MainButton(
                          isMainButton: true,
                          btnOnPress: () {},
                          buttontitle: "Change Password",
                          borderRadius: 10.sp,
                        ),
                        ColumnSpacer(0.025),
                      ],
                    ),
                  )
                ])));
  }
}
