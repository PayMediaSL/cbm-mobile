import 'package:app/helpers/colors.dart';
import 'package:app/helpers/routes.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/home_screen/drawer/toggle_provider.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

// class DrawerSecuritySafety extends StatelessWidget {
//   const DrawerSecuritySafety({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return HomeMainLayout(
//       backgroundColor: AppColors.SecondarysubGreyColor,
//       isBgContainer1: true,
//       isBgContainer2: true,
//       isBgContainer1Height: ScreenUtils.height * 0.07,
//       onBackIconAvailable: true,
//       onBackTitleAvailable: true,
//       onBackTap: () {
//         popScreen(context);
//       },
//       backTitle: "Security & Safety",
//       children: Padding(
//         padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ColumnSpacer(0.05),
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
//               // height: ScreenUtils.height * 0.1,
//               width: ScreenUtils.width,
//               decoration: BoxDecoration(
//                   color: AppColors.primaryWhiteColor,
//                   borderRadius: BorderRadius.circular(10.sp)),

//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Login & Recovery",
//                     style: commonTextStyle.copyWith(
//                         color: AppColors.primaryBlackColor,
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w500),
//                   ),
//                   ColumnSpacer(0.001),
//                   Text(
//                     "Manage your passwords, login preferences and recovery methods.",
//                     style: commonTextStyle.copyWith(
//                         color: HexColor("#94A3B8"),
//                         fontWeight: FontWeight.w500),
//                   ),
//                   ColumnSpacer(0.04),

//                   //!change psw
//                   GestureDetector(
//                     onTap: () {
//                       pushScreen(context, ScreenRoutes.toDrawerChangePassword);
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text("Change Password",
//                             style: commonTextStyle.copyWith(
//                                 color: AppColors.primarySubBlackColor,
//                                 fontSize: 14.sp)),
//                         Icon(
//                           Icons.arrow_forward_ios_outlined,
//                           size: 15.sp,
//                         )
//                       ],
//                     ),
//                   ),

//                   ColumnSpacer(0.03),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text("Change PIN",
//                           style: commonTextStyle.copyWith(
//                               color: AppColors.primarySubBlackColor,
//                               fontSize: 14.sp)),
//                       Icon(
//                         Icons.arrow_forward_ios_outlined,
//                         size: 15.sp,
//                       )
//                     ],
//                   ),
//                   ColumnSpacer(0.03),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text("Two-Factor Authentication",
//                           style: commonTextStyle.copyWith(
//                               color: AppColors.primarySubBlackColor,
//                               fontSize: 14.sp)),
//                       Icon(
//                         Icons.arrow_forward_ios_outlined,
//                         size: 15.sp,
//                       )
//                     ],
//                   ),

//                   ColumnSpacer(0.03),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text("My Devices",
//                           style: commonTextStyle.copyWith(
//                               color: AppColors.primarySubBlackColor,
//                               fontSize: 14.sp)),
//                       Icon(
//                         Icons.arrow_forward_ios_outlined,
//                         size: 15.sp,
//                       )
//                     ],
//                   ),
//                   ColumnSpacer(0.03),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Enable Biometrics",
//                               style: commonTextStyle.copyWith(
//                                   color: AppColors.primarySubBlackColor,
//                                   fontSize: 14.sp)),
//                           Text("Login with biometrics effortlessly",
//                               style: commonTextStyle.copyWith(
//                                   color: AppColors.primarySubBlackColor,
//                                   fontSize: 12.sp)),
//                         ],
//                       ),
//                       Consumer<ToggleSwitchProvider>(
//                         builder: (BuildContext context,
//                                 ToggleSwitchProvider value, Widget? child) =>
//                             Transform.scale(
//                           scale: 0.8,
//                           child: CupertinoSwitch(
//                               value: value.getSwitchState("switch_biometrics"),
//                               activeColor: AppColors.primaryBlueColor,
//                               trackColor:
//                                   AppColors.primaryBlackColor.withOpacity(0.12),
//                               thumbColor: AppColors.primaryWhiteColor,
//                               onChanged: (v) {
//                                 value.toggleSwitch("switch_biometrics", v);

//                                 // value.toggleSwitch(v);
//                               }),
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
class DrawerSecuritySafety extends StatelessWidget {
  const DrawerSecuritySafety({super.key});

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
      backTitle: "Security & Safety",
      children: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColumnSpacer(0.05),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
              width: ScreenUtils.width,
              decoration: BoxDecoration(
                color: AppColors.primaryWhiteColor,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login & Recovery",
                    style: commonTextStyle.copyWith(
                        color: AppColors.primaryBlackColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  ColumnSpacer(0.001),
                  Text(
                    "Manage your passwords, login preferences and recovery methods.",
                    style: commonTextStyle.copyWith(
                        color: HexColor("#94A3B8"),
                        fontWeight: FontWeight.w500),
                  ),
                  ColumnSpacer(0.04),
                  //!change psw
                  ReusableRow(
                    title: "Change Password",
                    subtitle: "",
                    onTap: () {
                      pushScreen(context, ScreenRoutes.toDrawerChangePassword);
                    },
                  ),
                  ColumnSpacer(0.05),

                  ReusableRow(
                    title: "Change PIN",
                    subtitle: "",
                  ),
                  ColumnSpacer(0.05),

                  ReusableRow(
                    title: "Two-Factor Authentication",
                    subtitle: "",
                  ),
                  ColumnSpacer(0.05),

                  ReusableRow(
                    title: "My Devices",
                    subtitle: "",
                  ),
                  ColumnSpacer(0.05),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Enable Biometrics",
                              style: commonTextStyle.copyWith(
                                  color: AppColors.primarySubBlackColor,
                                  fontSize: 14.sp)),
                          Text("Login with biometrics effortlessly",
                              style: commonTextStyle.copyWith(
                                  color: AppColors.primarySubBlackColor,
                                  fontSize: 12.sp)),
                        ],
                      ),
                      Consumer<ToggleSwitchProvider>(
                        builder: (BuildContext context,
                                ToggleSwitchProvider value, Widget? child) =>
                            Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                            value: value.getSwitchState("switch_biometrics"),
                            activeColor: AppColors.primaryBlueColor,
                            trackColor:
                                AppColors.primaryBlackColor.withOpacity(0.12),
                            thumbColor: AppColors.primaryWhiteColor,
                            onChanged: (v) {
                              value.toggleSwitch("switch_biometrics", v);
                            },
                          ),
                        ),
                      )
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
}

class ReusableRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final GestureTapCallback? onTap;

  const ReusableRow({
    Key? key,
    required this.title,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: commonTextStyle.copyWith(
                  color: AppColors.primarySubBlackColor,
                  fontSize: 14.sp,
                ),
              ),
              if (subtitle.isNotEmpty)
                Text(
                  subtitle,
                  style: commonTextStyle.copyWith(
                    color: AppColors.primarySubBlackColor,
                    fontSize: 12.sp,
                  ),
                ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 15.sp,
          ),
        ],
      ),
    );
  }
}
