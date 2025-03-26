// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/other_provider/expandable_tile_provider.dart';
import 'package:app/providers/payments/mobile_reload.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/widgets/container/circular_image_text.dart';
import 'package:app/screens/widgets/container/customer_curved_container.dart';
import 'package:app/screens/widgets/custom_tab/custom_tab_bar.dart';
import 'package:app/screens/widgets/icons/custom_icons.dart';
import 'package:app/screens/widgets/visa_card/visa_card_widget.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SavedCardScreen extends StatelessWidget {
  SavedCardScreen({super.key});

  final List<Map<String, dynamic>> transactions = [
    {
      "title": "Purchase Pickme",
      "amount": -3670.00,
      "type": "Debit",
      "date": "24/01/2024 "
    },
    {
      "title": "Allowance June 2024",
      "amount": 2543.00,
      "type": "Credit",
      "date": "24/05/2024 "
    },
    {
      "title": "Purchase Pickme",
      "amount": -3670.00,
      "type": "Debit",
      "date": "24/10/2024 "
    },
    {
      "title": "Purchase Pickme",
      "amount": -3670.00,
      "type": "Debit",
      "date": "24/09/2024 "
    },
    {
      "title": "Allowance June 2024",
      "amount": 2543.00,
      "type": "Credit",
      "date": "24/10/2024 "
    },
    {
      "title": "Allowance June 2024",
      "amount": 2543.00,
      "type": "Credit",
      "date": "24/10/2024 "
    },
    {
      "title": "Purchase Pickme",
      "amount": -3670.00,
      "type": "Debit",
      "date": "24/11/2024 "
    },
  ];
  final List<Map<String, String>> loanData = [
    {"label": "Original loan amount", "value": "200,000.00"},
    {"label": "Outstanding balance", "value": "sdsd"},
    {"label": "Current interest rate", "value": "sdsd"},
    {"label": "Next payment amount", "value": "sdsd"},
    {"label": "Next payment date", "value": "sdsd"},
    {"label": "Overdue amount", "value": "sdsd"},
    {"label": "Debit account", "value": "sdsd"},
    {"label": "Product Name", "value": "sdsd"},
    {"label": "Granted date", "value": "sdsd"},
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
        backTitle: "Saved Cards",
        onBackTap: () {
          popScreen(context);
        },
        children: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ColumnSpacer(0.05),
              SizedBox(
                height: ScreenUtils.width * 0.5,
                child: PageView.builder(
                  controller: PageController(
                    initialPage: 0,
                    viewportFraction:
                        0.9, // Adjust for card size relative to screen width
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: VisaCardWidget3(
                        gradientColor2: Colors.black87,
                        gradientColor1: AppColors.primaryBlueColor,
                        cardHeight: ScreenUtils.width * 0.5,
                        cardwidth: ScreenUtils.width * 1,
                        availableBalance: "123,345,44",
                        accountNumber: "2451344",
                        rightTopWidget: Image(
                          image: AssetImage(
                            ImageAsset().comBankLogo,
                          ),
                          height: ScreenUtils.height * 0.03,
                        ),
                        // isOverdue: true,
                        balancetext: "Available balance",
                        rowleftText: "Current balance",
                        rowleftTextValue: "20,000",
                        rowrightText: "Holds",
                        rowrightTextValue: "2300",
                        // dueValue: "3000",
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ColumnSpacer(0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularImageWithText(
                          label: "Transfer",
                        ),
                        RowSpacer(0.08),
                        CircularImageWithText(
                          label: "Pay Bills",
                        ),
                        RowSpacer(0.08),
                        CircularImageWithText(
                          label: "Link a Card",
                        ),
                        RowSpacer(0.08),
                        CircularImageWithText(
                          label: "Info",
                        ),
                      ],
                    ),
                    const ColumnSpacer(0.03),
                    const CustomTabBarwidgetCurved(
                      tabs: [
                        'Transactions',
                        ' Info',
                      ],
                      tabKey: 'card_service_detail',
                    ),
                    ColumnSpacer(0.02),
                    Consumer<TabBarProviderCurved>(
                      builder: (context, provider, _) {
                        if (provider.getSelectedIndex("card_service_detail") ==
                            0) {
                          return _transaction(context);
                        } else {
                          return _info();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ]));
  }

  Widget _transaction(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);

    // Group transactions by month
    // Group transactions by month
    final Map<String, List<Map<String, dynamic>>> groupedTransactions = {};

    for (var transaction in transactions) {
      try {
        final dateString = (transaction["date"] as String?)?.trim();
        if (dateString != null && dateString.isNotEmpty) {
          final transactionDate = DateFormat("dd/MM/yyyy").parse(dateString);
          final monthYear = DateFormat("MMMM yyyy").format(transactionDate);
          if (!groupedTransactions.containsKey(monthYear)) {
            groupedTransactions[monthYear] = [];
          }
          groupedTransactions[monthYear]?.add(transaction);
        }
      } catch (e) {
        // Handle errors gracefully
      }
    }

    return CustomCurvedContainer(
      height: ScreenUtils.height * 0.4,
      child: ListView(
        children: groupedTransactions.entries.map((entry) {
          final monthYear = entry.key;
          final transactionsInMonth = entry.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Month Header
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  monthYear,
                  style: commonTextStyle.copyWith(
                    fontSize: 15.sp,
                    color: AppColors.secondarysubGreyColor2,
                  ),
                ),
              ),
              // Transaction List for the current month
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: transactionsInMonth.length,
                itemBuilder: (context, index) {
                  final transaction = transactionsInMonth[index];

                  // Get the current expanded index for this month
                  final expandedIndex = transactionProvider
                      .getExpandedTransactionIndex(monthYear);

                  return InkWell(
                    onTap: () {
                      // Toggle expansion for this transaction within the month
                      transactionProvider.toggleTransactionExpansion(
                          monthYear, index);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      decoration: BoxDecoration(
                          color: expandedIndex == index
                              ? AppColors.bottomNavBgColor
                              : Colors.transparent),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: ScreenUtils.height * 0.05,
                                width: ScreenUtils.height * 0.05,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: transaction["type"] == "Debit"
                                      ? AppColors.primaryRedShadeColor
                                      : AppColors.primaryGreenShadeColor,
                                ),
                                child: Center(
                                  child: Icon(
                                    transaction["type"] == "Debit"
                                        ? NavigationIcons.arrowBackward
                                        : NavigationIcons.arrowForward,
                                    color: transaction["type"] == "Debit"
                                        ? AppColors.primaryRedColor
                                        : AppColors.primaryGreenColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width:
                                      16.0), // Space between leading and text
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      transaction["title"],
                                      style: commonTextStyle.copyWith(
                                          color: AppColors.primaryBlackColor),
                                    ),
                                    Text(
                                      transaction["date"],
                                      style: commonTextStyle.copyWith(
                                          fontSize: 12.sp,
                                          color: AppColors
                                              .onBoardSubTextStyleColor),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "${transaction["amount"] > 0 ? "+" : ""}${transaction["amount"].toStringAsFixed(2)}",
                                    style: commonTextStyle.copyWith(
                                      color: transaction["amount"] > 0
                                          ? AppColors.primaryGreenColor
                                          : AppColors.primaryRedColor,
                                    ),
                                  ),
                                  Text(
                                    "${transaction["type"]}",
                                    style: commonTextStyle.copyWith(
                                        fontSize: 10.sp,
                                        color:
                                            AppColors.onBoardSubTextStyleColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          if (expandedIndex == index)
                            Padding(
                              padding: EdgeInsets.only(left: 55.sp),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Reference Number',
                                          style:
                                              commonTextHeadingStyle.copyWith(
                                                  fontSize: 12.sp,
                                                  color: AppColors
                                                      .onBoardSubTextStyleColor,
                                                  fontWeight: FontWeight.w400)),
                                      // RowSpacer(0.1),
                                      Text('asasa',
                                          style:
                                              commonTextHeadingStyle.copyWith(
                                                  fontSize: 12.sp,
                                                  color: AppColors
                                                      .onBoardSubTextStyleColor,
                                                  fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Running Balance',
                                          style:
                                              commonTextHeadingStyle.copyWith(
                                                  fontSize: 12.sp,
                                                  color: AppColors
                                                      .onBoardSubTextStyleColor,
                                                  fontWeight: FontWeight.w400)),
                                      // RowSpacer(0.14),
                                      Text('asas',
                                          style:
                                              commonTextHeadingStyle.copyWith(
                                                  fontSize: 12.sp,
                                                  color: AppColors
                                                      .onBoardSubTextStyleColor,
                                                  fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _info() {
    return CustomCurvedContainer(
      height: ScreenUtils.height * 0.4,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: ScreenUtils.width * 0.12,
                width: ScreenUtils.width * 0.12,
                decoration: BoxDecoration(
                  color: AppColors.SecondarysubGreyColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.share),
              ),
            ),
            ColumnSpacer(0.01),
            //! If Data Comes From Modify use  ListView.builder
            ListView.builder(
              shrinkWrap: true,
              itemCount: loanData.length,
              itemBuilder: (context, index) {
                final item = loanData[index];
                return textWithDivider(item["label"]!,
                    item["value"]!); // Use "!" to ensure the non-null values
              },
            )
          ],
        ),
      ),
    );
  }

  Widget textWithDivider(String leftText, String rightText) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              leftText,
              style:
                  commonTextInTheField, // Make sure to define this style somewhere in your code
            ),
            Text(
              rightText,
              style: commonTextInTheField,
            ),
          ],
        ),
        Divider(
          color: AppColors
              .secondarysubGreyColor5, // Define this color in your app's theme
        ),
      ],
    );
  }
}
