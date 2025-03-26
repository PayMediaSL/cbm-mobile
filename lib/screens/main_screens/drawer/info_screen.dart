// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/drawer/info_provider.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/widgets/icons/custom_icons.dart';
import 'package:app/screens/widgets/text_fields/custom_search_bar.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DrawerInfoScreen extends StatelessWidget {
  const DrawerInfoScreen({super.key});

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
      backTitle: "Info",
      children: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColumnSpacer(0.04),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
              width: ScreenUtils.width,
              // height: ScreenUtils.height * 0.35,
              decoration: BoxDecoration(
                color: AppColors.primaryWhiteColor,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Locate Branch",
                        style: commonTextStyle_black_500_16sp,
                      ),
                      //TODO need to add Controller
                      SearchTextField(
                        controller: TextEditingController(),
                        onChanged: (value) => print("Search text: $value"),
                        hintText: "Search Branch ",
                        fillColor: HexColor("#F8FAFC"),
                        hintTextColor: AppColors.onBoardSubTextStyleColor,
                        iconColor: AppColors.onBoardSubTextStyleColor,
                        heightFactor: 0.11,
                        widthFactor: 0.5,
                        borderRadius: 8.0.sp,
                        isBorderAvilable: true,
                      ),
                    ],
                  ),
                  ColumnSpacer(0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: ScreenUtils.height * 0.06,
                        width: ScreenUtils.width * 0.14,
                        decoration: BoxDecoration(
                          color: AppColors.bottomNavBgColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Icon(
                          UtilityIcons.location,
                          size: 30.sp,
                        ),
                      ),
                      RowSpacer(0.06),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Search on the Map",
                            style: commonTextStyle.copyWith(
                                color: AppColors.primaryBlackColor),
                          ),
                          SizedBox(
                            width: ScreenUtils.width * 0.6,
                            child: Text(
                              "You can find thw locate Branches using this Map",
                              style: commonTextStyle.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColors.primarySubBlackColor),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            //?Exchange Rate
            ColumnSpacer(0.02),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 10.sp),
              width: ScreenUtils.width,
              height: ScreenUtils.height * 0.32,
              decoration: BoxDecoration(
                color: AppColors.primaryWhiteColor,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: SingleChildScrollView(
                child: RateSection(
                  title: 'Exchange Rates',
                  rates: context
                      .watch<DrawerInfoProvider>()
                      .getDisplayedRates("api1"),
                  columnLabels: [
                    '',
                    'Digital Banking',
                    'Currency Buying',
                    'Cheque Buying'
                  ],
                  dataKeys: ['currency', 'digital', 'buying', 'cheque'],
                  toggleKey: 'api1',
                ),
              ),
            ),
            ColumnSpacer(0.02),

            //? Lending Limits

            Container(
              padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 10.sp),
              width: ScreenUtils.width,
              height: ScreenUtils.height * 0.32,
              decoration: BoxDecoration(
                color: AppColors.primaryWhiteColor,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: SingleChildScrollView(
                child: RateSection(
                  title: 'Lending Rates',
                  rates: context
                      .watch<DrawerInfoProvider>()
                      .getDisplayedRates("api2"),
                  columnLabels: [
                    '',
                    'Digital Banking',
                    'Currency Buying',
                    'Cheque Buying'
                  ],
                  dataKeys: [
                    'currency_code',
                    'digital_rate',
                    'buying_rate',
                    'cheque_rate'
                  ],
                  toggleKey: 'api2',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RateSection extends StatelessWidget {
  final String title;
  final List<Map<String, String>> rates;
  final List<String> columnLabels;
  final List<String> dataKeys;
  final String toggleKey;

  RateSection({
    required this.title,
    required this.rates,
    required this.columnLabels,
    required this.dataKeys,
    required this.toggleKey,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerInfoProvider>(
      builder: (context, rateProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: commonTextStyle_black_500_16sp,
                ),
                TextButton(
                  onPressed: () {
                    rateProvider.toggleView(toggleKey);
                  },
                  child: Text(
                    rateProvider.getShowAll(toggleKey)
                        ? 'Show less'
                        : 'View all',
                    style: commonTextStyle.copyWith(
                        color: AppColors.secondarySubBlueColor2,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 8.0),
            Table(
              columnWidths: {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(3),
                2: FlexColumnWidth(3),
                3: FlexColumnWidth(3),
              },
              children: [
                TableRow(
                  children: columnLabels
                      .map((label) => _buildTableCell(label, isHeading: true))
                      .toList(),
                ),
                ...rateProvider.getShowAll(toggleKey)
                    ? rates.map((rate) => _buildRateRow(rate)).toList()
                    : rates.take(4).map((rate) => _buildRateRow(rate)).toList(),
              ],
            ),
          ],
        );
      },
    );
  }

  // Reusable method to build a row
  TableRow _buildRateRow(Map<String, String> rate) {
    return TableRow(
      children: dataKeys
          .asMap()
          .map((index, key) {
            // Apply a different style for the first column (index == 0) if needed
            return MapEntry(
              index,
              _buildTableCell(rate[key] ?? 'N/A',
                  isHeading: false, isFirstColumn: index == 0),
            );
          })
          .values
          .toList(),
    );
  }

  Widget _buildTableCell(String text,
      {bool isHeading = false, bool isFirstColumn = false}) {
    // Define text styles for headings, values, and first column
    TextStyle textStyle = isHeading
        ? commonTextStyle.copyWith(
            color: AppColors.onBoardSubTextStyleColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500)
        : isFirstColumn
            ? commonTextStyle.copyWith(
                color: AppColors.onBoardSubTextStyleColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500)
            : commonTextStyle_black_500_12sp;

    // Return the text widget wrapped in a Container to center it
    return Padding(
      padding: EdgeInsets.all(8.sp),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          text,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
  // // Reusable method to build a row
}
