// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/payments/mobile_reload.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/widgets/container/circular_image_text.dart';
import 'package:app/screens/widgets/container/customer_curved_container.dart';
import 'package:app/screens/widgets/custom_tab/custom_tab_bar.dart';
import 'package:app/screens/widgets/icons/custom_icons.dart';
import 'package:app/screens/widgets/visa_card/visa_card_widget.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoanDetailsScreen extends StatelessWidget {
  LoanDetailsScreen({super.key});

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
        backTitle: "Loan Details",
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
                        isOverdue: true,
                        balancetext: "Out Standing",
                        rowleftText: "Next Payment",
                        rowleftTextValue: "20,000",
                        rowrightText: "Next Payment Date",
                        rowrightTextValue: "23/05/2024",
                        dueValue: "3000",
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
                          label: "Loan Schedule",
                        ),
                        RowSpacer(0.1),
                        CircularImageWithText(
                          label: "Make a Payment",
                        ),
                      ],
                    ),
                    const ColumnSpacer(0.03),
                    const CustomTabBarwidgetCurved(
                      tabs: [
                        'Transactions',
                        'Loan Info',
                      ],
                      tabKey: 'loan_service_detail',
                    ),
                    ColumnSpacer(0.02),
                    Consumer<TabBarProviderCurved>(
                      builder: (context, provider, _) {
                        if (provider.getSelectedIndex("loan_service_detail") ==
                            0) {
                          return _transaction();
                        } else {
                          return _loan();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ]));
  }

  Widget _transaction() {
    // Group transactions by month
    final Map<String, List<Map<String, dynamic>>> groupedTransactions = {};

    for (var transaction in transactions) {
      try {
        final dateString = transaction["date"].trim();
        final transactionDate = DateFormat("dd/MM/yyyy").parse(dateString);
        final monthYear = DateFormat("MMMM").format(transactionDate);
        if (!groupedTransactions.containsKey(monthYear)) {
          groupedTransactions[monthYear] = [];
        }
        groupedTransactions[monthYear]?.add(transaction);
      } catch (e) {}
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
              Text(monthYear,
                  style: commonTextStyle.copyWith(
                      fontSize: 15.sp,
                      color: AppColors.secondarysubGreyColor2)),
              SizedBox(
                child: ListView.builder(
                  shrinkWrap:
                      true, // This ensures the ListView doesn't take up too much space
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: transactionsInMonth.length,
                  itemBuilder: (context, index) {
                    final transaction = transactionsInMonth[index];
                    return ListTile(
                      leading: Container(
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
                      title: Text(
                        transaction["title"],
                        style: commonTextStyle.copyWith(
                            color: AppColors.primaryBlackColor),
                      ),
                      subtitle: Text(
                        transaction["date"],
                        style: commonTextStyle.copyWith(
                            fontSize: 12.sp,
                            color: AppColors.onBoardSubTextStyleColor),
                      ),
                      trailing: Column(
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
                                color: AppColors.onBoardSubTextStyleColor),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _loan() {
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

            ListView.builder(
              shrinkWrap: true,
              itemCount: loanData.length,
              itemBuilder: (context, index) {
                final item = loanData[index];
                return textWithDivider(item["label"]!,
                    item["value"]!); // Use "!" to ensure the non-null values
              },
            )
            // textWithDivider("Original loan amount", "200,000.00"),
            // textWithDivider("Outstanding balance", "sdsd"),
            // textWithDivider("Current interest rate", "sdsd"),
            // textWithDivider("Next payment amount", "sdsd"),
            // textWithDivider("Next payment date", "sdsd"),
            // textWithDivider("Overdue amount", "sdsd"),
            // textWithDivider("Debit account", "sdsd"),
            // textWithDivider("Product Name", "sdsd"),
            // textWithDivider("Granted date", "sdsd"),
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
              style: commonTextInTheField,
            ),
            Text(
              rightText,
              style: commonTextInTheField,
            ),
          ],
        ),
        Divider(
          color: AppColors.secondarysubGreyColor5,
        ),
      ],
    );
  }
}
