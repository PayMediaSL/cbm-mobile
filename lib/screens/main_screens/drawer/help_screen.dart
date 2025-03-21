// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/drawer/help_provider.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/widgets/text_fields/custom_search_bar.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DrawerHelpScreen extends StatelessWidget {
  const DrawerHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final faqProvider = Provider.of<DrawerHelpDataProvider>(context);
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
      backTitle: "Help",
      children: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColumnSpacer(0.04),
            Text(
              "Hi, How can we help you?",
              style: commonTextStyle.copyWith(
                  color: AppColors.primaryBlackColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500),
            ),
            ColumnSpacer(0.02),
            //TODO Need to add Controllers
            SearchTextField(
              controller: TextEditingController(),
              onChanged: (value) => print("Search text: $value"),
              hintText: "Search Your Problems",
              fillColor: HexColor("#F8FAFC"),
              hintTextColor: AppColors.onBoardSubTextStyleColor,
              iconColor: AppColors.onBoardSubTextStyleColor,
              heightFactor: 0.11,
              widthFactor: 0.8,
              borderRadius: 8.0.sp,
              isBorderAvilable: true,
            ),
            ColumnSpacer(0.02),
//! FAQ>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
              width: ScreenUtils.width,
              height: 300,
              decoration: BoxDecoration(
                color: AppColors.primaryWhiteColor,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "FAQ",
                    style: commonTextStyle.copyWith(
                        color: AppColors.primaryBlackColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  ColumnSpacer(0.02),
                  Expanded(
                    child: ListView.builder(
                      itemCount: faqProvider.faqList.length,
                      itemBuilder: (context, index) {
                        final faq = faqProvider.faqList[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Row for question and Expand icon
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Q. ${faq['question']}",
                                  style: commonTextStyle.copyWith(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primaryBlackColor),
                                ),
                                InkWell(
                                  onTap: () {
                                    faqProvider.toggleExpanded(index);
                                  },
                                  child: Icon(
                                    faqProvider.expandedStatus[index] ?? false
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: faqProvider.expandedStatus[index] ??
                                            false
                                        ? AppColors.secondarySubBlueColor2
                                        : AppColors.onBoardSubTextStyleColor,
                                  ),
                                ),
                              ],
                            ),

                            // If the question is expanded, show the answers
                            if (faqProvider.expandedStatus[index] ?? false)
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, bottom: 8.0, right: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: faq['answers']
                                      .map<Widget>((answer) => Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                '• ',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  answer,
                                                  style: commonTextStyle.copyWith(
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors
                                                          .onBoardSubTextStyleColor),
                                                ),
                                              ),
                                            ],
                                          ))
                                      .toList(),
                                ),
                              ),
                            if (index < faqProvider.faqList.length - 1)
                              SizedBox(height: 20.sp),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            ColumnSpacer(0.02),
            //! Education>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            // Education
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
              width: ScreenUtils.width,
              height: ScreenUtils.height * 0.35,
              decoration: BoxDecoration(
                color: AppColors.primaryWhiteColor,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Education",
                      style: commonTextStyle.copyWith(
                          color: AppColors.primaryBlackColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    ColumnSpacer(0.01),
                    Consumer<DrawerHelpDataProvider>(
                        builder: (context, provider, child) {
                      return Column(
                        children: provider.tipsList.map((tip) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      tip['tipHeading']!,
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Color(0xFF64748B),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 6.0),
                                    SizedBox(
                                      width: ScreenUtils.width * 0.5,
                                      child: Text(
                                        tip['message']!,
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: AppColors.primaryBlackColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(height: 4.0),
                                    SizedBox(
                                      width: ScreenUtils.width * 0.5,
                                      child: Text(
                                        "Detailed explanation or any further info can go here.",
                                        style: TextStyle(
                                            fontSize: 9.sp,
                                            color: Color(0xFF64748B),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: ScreenUtils.height * 0.08,
                                  width: ScreenUtils.width * 0.18,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset(
                                      tip['image']!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
