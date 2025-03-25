import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/widgets/main_button/main_button.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBudgetScreen extends StatelessWidget {
  MyBudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeMainLayout(
        backgroundColor: AppColors.SecondarysubGreyColor,
        isBgContainer1: true,
        isBgContainer2: true,
        isBgContainer1Height: ScreenUtils.height * 0.07,
        onBackIconAvailable: true,
        onBackTitleAvailable: true,
        backTitle: "My Budget",
        onBackTap: () {
          popScreen(context);
        },
        children: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ColumnSpacer(0.05),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "1,235,432.00",
                              style: commonTextStyle.copyWith(
                                  fontSize: 16.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text("Monthly Budget",
                                style: commonTextStyle.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColors.black,
                                ))
                          ],
                        ),
                        const RowSpacer(0.05),
                        VerticalDivider(
                          color: AppColors.primaryGreyColor2,
                          thickness: 2,
                        ),
                        const RowSpacer(0.05),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "1,235,432.00",
                              style: commonTextStyle.copyWith(
                                  fontSize: 16.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text("Total Spent",
                                style: commonTextStyle.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColors.black,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  ColumnSpacer(0.05),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.sp, horizontal: 10.sp),
                    height: ScreenUtils.height * 0.5,
                    width: ScreenUtils.width,
                    decoration: BoxDecoration(
                        color: AppColors.primaryWhiteColor,
                        borderRadius: BorderRadius.circular(UI.borderRadius)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Transactions",
                            style: commonTextStyle_black_500_12sp),
                        SizedBox(
                          height: ScreenUtils.height * 0.45,
                          child: ListView.separated(
                            itemCount: transactions.length,
                            itemBuilder: (context, index) {
                              // Get transaction data
                              String image = transactions[index]['image']!;
                              String title = transactions[index]['title']!;
                              String subtitle =
                                  transactions[index]['subtitle']!;

                              // Build each row
                              return _buildTransactionRow(image, title,
                                  subtitle, _getBackgroundColor(index));
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return ColumnSpacer(0.02);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  ColumnSpacer(0.01),
                  MainButton(
                    isMainButton: true,
                    btnOnPress: () {},
                    buttontitle: "Set budget",
                  )
                ])));
  }

  final List<Map<String, String>> transactions = [
    {
      'image': ImageAsset().iconImageCard, // replace with actual asset path
      'title': 'Food and Beverages',
      'subtitle': '\$100',
    },
    {
      'image': ImageAsset().iconImageCard,
      'title': 'Entertainment',
      'subtitle': '\$200',
    },
    {
      'image': ImageAsset().iconImageCard,
      'title': 'Stores',
      'subtitle': '\$50',
    },
    {
      'image': ImageAsset().iconImageCard,
      'title': 'HealthCare',
      'subtitle': '\$50',
    },
    {
      'image': ImageAsset().iconImageCard,
      'title': 'Utilities',
      'subtitle': '\$50',
    },
    {
      'image': ImageAsset().iconImageCard,
      'title': 'Transaportation',
      'subtitle': '\$50',
    },
    {
      'image': ImageAsset().iconImageCard,
      'title': 'Others',
      'subtitle': '\$50',
    },

    // Add more transaction data as needed
  ];

  Color _getBackgroundColor(int index) {
    List<Color> colors = [
      AppColors.homeLifestyleFood,
      AppColors.homeLifestyleEntertainment,
      AppColors.homeLifestyleHealth,
      AppColors.homeLifestyleInsurance,
      AppColors.homeLifestyleGaming,
      AppColors.homeLifestyleEcommerce,
      AppColors.homeLifestyleTrabsport,
      AppColors.homeLifestyleEducation,
    ];
    return colors[index % colors.length];
  }

  Widget _buildTransactionRow(
    String image,
    String title,
    String subtitle,
    Color imagecolor,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25.sp, // The overall size of the CircleAvatar
                  backgroundColor:
                      AppColors.homeLifestyleEducation.withOpacity(0.2),
                  child: ClipOval(
                    child: Image.asset(
                      height: 22.sp,
                      image,
                      color: imagecolor,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                RowSpacer(0.02),
                Text(
                  title,
                  style: commonTextStyle.copyWith(
                      color: AppColors.primaryBlackColor),
                ),
              ],
            ),
            Text(
              subtitle,
              style:
                  commonTextStyle.copyWith(color: AppColors.textFieldHintColor),
            ),
          ],
        ),
        ColumnSpacer(0.005),
      ],
    );
  }
}
