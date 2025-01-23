// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cbm_one_app/helpers/colors.dart';
import 'package:cbm_one_app/helpers/routes.dart';
import 'package:cbm_one_app/helpers/spacers.dart';
import 'package:cbm_one_app/helpers/text_styles.dart';
import 'package:cbm_one_app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:cbm_one_app/screens/widgets/transaction/transaction_details_widget.dart';
import 'package:cbm_one_app/services/screen_size_calculator.dart';
import 'package:cbm_one_app/utils/assest_image.dart';
import 'package:cbm_one_app/utils/navigation_util.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeMainLayout(
      backgroundColor: AppColors.SecondarysubGreyColor,
      isBgContainer1: true,
      isBgContainer2: true,
      isBgContainer1Height: ScreenUtils.height * 0.07,
      onBackIconAvailable: true,
      onBackTitleAvailable: true,
      onBackTap: () {},
      backTitle: "Transactions",
      children: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColumnSpacer(0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: ScreenUtils.width * 0.2,
                  height: ScreenUtils.height * 0.05,
                  decoration: BoxDecoration(
                      color: AppColors.primaryWhiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.sp),
                        bottomLeft: Radius.circular(10.sp),
                      ),
                      border:
                          Border.all(color: AppColors.textFieldBorderColor2)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Filter",
                          style: commonTextStyle.copyWith(
                              color: AppColors.primaryBlackColor),
                        ),
                        RowSpacer(0.01),
                        Image(
                          image: AssetImage(ImageAsset().iconImageFilter),
                          height: 15.sp,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: ScreenUtils.width * 0.2,
                  height: ScreenUtils.height * 0.05,
                  decoration: BoxDecoration(
                      color: AppColors.primaryWhiteColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.sp),
                        bottomRight: Radius.circular(10.sp),
                      ),
                      border:
                          Border.all(color: AppColors.textFieldBorderColor2)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sort",
                          style: commonTextStyle.copyWith(
                              color: AppColors.primaryBlackColor),
                        ),
                        RowSpacer(0.01),
                        Image(
                          image:
                              AssetImage(ImageAsset().iconImagearrowupanddown),
                          height: 15.sp,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ColumnSpacer(0.04),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 5.sp),
              decoration: BoxDecoration(
                  color: AppColors.primaryWhiteColor,
                  borderRadius: BorderRadius.circular(10.sp)),
              height: ScreenUtils.height * 0.5,
              width: ScreenUtils.width,
              child: TransactionDetailsWidget(),
            ),
            ColumnSpacer(0.03),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 5.sp),
              decoration: BoxDecoration(
                  color: AppColors.primaryWhiteColor,
                  borderRadius: BorderRadius.circular(10.sp)),
              height: ScreenUtils.height * 0.43,
              width: ScreenUtils.width,
              child: SpendingChartPage(),
            ),
            ColumnSpacer(0.03),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
              decoration: BoxDecoration(
                color: AppColors.primaryWhiteColor,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              height: ScreenUtils.height * 0.1,
              width: ScreenUtils.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                itemCount: legendItems.length, // Dynamic number of items
                itemBuilder: (context, index) {
                  final item = legendItems[index];
                  return Row(
                    children: [
                      LegendItem(
                        color: item['color'],
                        label: item['label'],
                        value: item['value'],
                      ),
                      SizedBox(width: 12.sp), // Add spacing between items
                    ],
                  );
                },
              ),
            )

            // Container(
            //   padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 5.sp),
            //   decoration: BoxDecoration(
            //       color: AppColors.primaryWhiteColor,
            //       borderRadius: BorderRadius.circular(10.sp)),
            //   height: ScreenUtils.height * 0.1,
            //   width: ScreenUtils.width,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       LegendItem(
            //         color: Colors.purple,
            //         label: "Food and beverage",
            //         value: "231,856.00",
            //       ),
            //       LegendItem(
            //         color: Colors.orange,
            //         label: "Entertainment",
            //         value: "231,856.00",
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

//! Old Code

class SpendingChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top buttons and dropdown
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DaysDropdown(),
                Row(
                  children: [
                    TextButton(
                        style: ButtonStyle(
                            shape:
                                WidgetStateProperty.all(RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: AppColors
                                          .secondarysubGreyColor3, // your color here
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10)))),
                        onPressed: () {},
                        child: Text(
                          "eStatement",
                          style: commonTextStyle.copyWith(
                              fontSize: 11.sp,
                              color: AppColors.primaryBlackColor),
                        )),
                    RowSpacer(0.01),
                    TextButton(
                        style: ButtonStyle(
                            shape:
                                WidgetStateProperty.all(RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: AppColors
                                          .secondarysubGreyColor3, // your color here
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10)))),
                        onPressed: () {
                          pushScreen(context, ScreenRoutes.toMyBudgetScreen);
                        },
                        child: Text(
                          "My Budget",
                          style: commonTextStyle.copyWith(
                              fontSize: 11.sp,
                              color: AppColors.primaryBlackColor),
                        ))
                  ],
                ),
              ],
            ),
            ColumnSpacer(0.02),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: ScreenUtils.height * 0.3,
                  width: ScreenUtils.width,
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 10,
                      centerSpaceRadius: 90,
                      sections: [
                        PieChartSectionData(
                          value: 25,
                          color: Colors.purple,
                          radius: 25,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          value: 25,
                          color: Colors.orange,
                          radius: 25,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          value: 25,
                          color: Colors.green,
                          radius: 25,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          value: 25,
                          color: Colors.grey,
                          radius: 25,
                          showTitle: false,
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Total Spent",
                        style: commonTextStyle.copyWith(
                            color: AppColors.secondarysubGreyColor3,
                            fontSize: 11.sp)),
                    ColumnSpacer(0.001),
                    Text("12,345,532.00",
                        style: commonTextStyle.copyWith(
                            color: AppColors.primaryBlackColor)),
                  ],
                ),
              ],
            ),

            // Legend
          ],
        ));
  }
}

class DaysDropdown extends StatefulWidget {
  @override
  _DaysDropdownState createState() => _DaysDropdownState();
}

class _DaysDropdownState extends State<DaysDropdown> {
  // List of dropdown options
  final List<String> dropdownItems = [
    "Last 7 days",
    "Last 30 days",
    "Last Year"
  ];

  // Initial selected value
  String selectedValue = "Last 7 days";

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      icon: Icon(
        Icons.arrow_drop_down_rounded,
        color: AppColors.secondarysubGreyColor3,
      ), // Dropdown icon
      iconSize: 25,
      underline: SizedBox(), // Removes the default underline
      style: commonTextStyle.copyWith(color: AppColors.secondarysubGreyColor3),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
      },
      items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

final List<Map<String, dynamic>> legendItems = [
  {
    "color": Colors.purple,
    "label": "Food and beverage",
    "value": "231,856.00",
  },
  {
    "color": Colors.orange,
    "label": "Entertainment",
    "value": "231,856.00",
  },
  {
    "color": Colors.green,
    "label": "Travel",
    "value": "150,000.00",
  },
  // Add more items as needed
];

class LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final String value;

  const LegendItem({
    required this.color,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 8,
          backgroundColor: color,
        ),
        SizedBox(width: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: commonTextStyle.copyWith(
                  color: AppColors.secondarysubGreyColor3, fontSize: 11.sp),
            ),
            Text(
              value,
              style:
                  commonTextStyle.copyWith(color: AppColors.primaryBlackColor),
            ),
          ],
        ),
      ],
    );
  }
}
