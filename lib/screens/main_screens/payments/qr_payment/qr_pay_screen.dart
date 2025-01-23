// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cbm_one_app/helpers/colors.dart';
import 'package:cbm_one_app/helpers/constants.dart';
import 'package:cbm_one_app/helpers/routes.dart';
import 'package:cbm_one_app/helpers/spacers.dart';
import 'package:cbm_one_app/helpers/text_editing_controllers.dart';
import 'package:cbm_one_app/helpers/text_styles.dart';
import 'package:cbm_one_app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:cbm_one_app/screens/widgets/main_button/main_button.dart';
import 'package:cbm_one_app/screens/widgets/text_fields/custom_text_field.dart';
import 'package:cbm_one_app/screens/widgets/visa_card/visa_card_widget.dart';
import 'package:cbm_one_app/services/screen_size_calculator.dart';
import 'package:cbm_one_app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QrPayScreen extends StatelessWidget {
  QrPayScreen({super.key});

  final List<Map<String, String>> cardData = [
    {
      'availableBalance': 'John Doe',
      'accountNumber': '1',
      'currentBalance': '12/25',
      'accountHold': '12/25',
      'isWallet': 'false',
    },
    {
      'availableBalance': 'John Doe',
      'accountNumber': '2',
      'currentBalance': '12/25',
      'accountHold': '12/25',
      'isWallet': 'true',
    },
    {
      'availableBalance': 'John Doe',
      'accountNumber': '3',
      'currentBalance': '12/25',
      'accountHold': '12/25',
      'isWallet': 'false',
    },
    {
      'availableBalance': 'John Doe',
      'accountNumber': '3',
      'currentBalance': '12/25',
      'accountHold': '12/25',
      'isWallet': 'false',
    },
  ];

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
        backTitle: "QR Pay",
        children: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ColumnSpacer(0.05),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.sp, horizontal: 10.sp),
                    height: ScreenUtils.height * 0.08,
                    width: ScreenUtils.width,
                    decoration: BoxDecoration(
                        color: AppColors.primaryWhiteColor,
                        borderRadius: BorderRadius.circular(UI.borderRadius)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "PAID BY QR TO",
                          style: commonTextStyle.copyWith(
                              fontFamily: "jost",
                              color: AppColors.bottomNavIconColor),
                        ),
                        ColumnSpacer(0.005),
                        Row(
                          children: [
                            Text(
                              "MERCHANT NAME:",
                              style: commonTextStyle.copyWith(
                                  fontFamily: "jost",
                                  color: AppColors.onBoardSubTextStyleColor),
                            ),
                            RowSpacer(0.01),
                            Text(
                              "TYest",
                              style: commonTextStyle.copyWith(
                                  fontFamily: "jost", color: AppColors.black),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  ColumnSpacer(0.04),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 15.sp, horizontal: 15.sp),
                    height: ScreenUtils.height * 0.6,
                    width: ScreenUtils.width,
                    decoration: BoxDecoration(
                        color: AppColors.primaryWhiteColor,
                        borderRadius: BorderRadius.circular(UI.borderRadius)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      //TODO Need to add Controller for Each
                      children: [
                        Text(
                          "Amount",
                          style: commonTextStyle.copyWith(
                              fontFamily: "jost",
                              fontSize: 15.sp,
                              color: AppColors.primaryBlackColor),
                        ),
                        ColumnSpacer(0.006),
                        CustomLableTextField(
                          inputFormatters: [],
                          emailrController,
                          hint: "RS.3000",
                        ),
                        ColumnSpacer(0.01),
                        Text(
                          "Description",
                          style: commonTextStyle.copyWith(
                              fontFamily: "jost",
                              fontSize: 15.sp,
                              color: AppColors.primaryBlackColor),
                        ),
                        ColumnSpacer(0.006),
                        CustomLableTextField(
                          inputFormatters: [],
                          emailrController,
                          hint: "QR Payment",
                        ),
                        ColumnSpacer(0.01),
                        Text(
                          "Pay From",
                          style: commonTextStyle.copyWith(
                              fontFamily: "jost",
                              fontSize: 15.sp,
                              color: AppColors.primaryBlackColor),
                        ),
                        ColumnSpacer(0.01),
                        SizedBox(
                          height: ScreenUtils.width * 0.4,
                          child: PageView.builder(
                            controller: PageController(
                              viewportFraction:
                                  0.8, // Adjust for card size relative to screen width
                            ),
                            itemCount: cardData.length,
                            itemBuilder: (context, index) {
                              final card = cardData[index];
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        8.0), // Add spacing between cards
                                child: VisaCardWidget2(
                                  gradientColor2: Colors.black87,
                                  gradientColor1: AppColors.primaryBlueColor,
                                  cardHeight: ScreenUtils.width * 0.33,
                                  cardwidth: ScreenUtils.width * 0.6,
                                  availableBalance:
                                      card["availableBalance"] ?? "",
                                  accountNumber: card["accountNumber"] ?? "",
                                ),
                              );
                            },
                          ),
                        ),
                        // SingleChildScrollView(
                        //   scrollDirection:
                        //       Axis.horizontal, // Horizontal scrolling
                        //   child: Row(
                        //     children: List.generate(
                        //       cardData.length,
                        //       (index) {
                        //         final card = cardData[index];
                        //         return Row(
                        //           children: [
                        //             VisaCardWidget2(
                        //               gradientColor1:
                        //                   AppColors.primaryBlueColor,
                        //               cardHeight: ScreenUtils.width * 0.33,
                        //               cardwidth: ScreenUtils.width * 0.6,
                        //               availableBalance:
                        //                   card["availableBalance"] ?? "",
                        //               accountNumber:
                        //                   card["accountNumber"] ?? "",
                        //             ),
                        //             // Add a separator after every card except the last one

                        //             RowSpacer(
                        //                 0.02), // Separator with 10px spacing
                        //           ],
                        //         );
                        //       },
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  ColumnSpacer(0.02),
                  MainButton(
                    isMainButton: true,
                    btnOnPress: () {
                      pushScreen(context, ScreenRoutes.toQrGenerateSreen);
                    },
                    buttontitle: "Confirm Payment",
                  )
                ])));
  }
}
