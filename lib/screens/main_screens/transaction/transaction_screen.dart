// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/transaction/transaction_data_provider.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeMainLayout(
      backgroundColor: AppColors.SecondarysubGreyColor,
      isBgContainer1: true,
      isBgContainer2: true,
      isBgContainer1Height: ScreenUtils.height * 0.1,
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
            ColumnSpacer(0.07),
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
            ColumnSpacer(0.07),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 5.sp),
              decoration: BoxDecoration(
                  color: AppColors.primaryWhiteColor,
                  borderRadius: BorderRadius.circular(10.sp)),
              height: ScreenUtils.height * 0.5,
              width: ScreenUtils.width,
              child: TransactionDetailsWidget(),
            )
          ],
        ),
      ),
    );
  }
}

//! Transaction Details
class TransactionDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionDataProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
      itemCount: transactionProvider.transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactionProvider.transactions[index];
        final swipeOffset = transactionProvider.swipeOffsets[index] ?? 0.0;
        bool isExpanded = transactionProvider.expandedState[index] ?? false;
        const double maxSwipeOffsetFactor = 0.2;
        const double swipeThresholdFactor = 0.125;

        // Only allow swipe if transaction type is 'Debit'
        if (transaction["type"] == "Debit") {
          return GestureDetector(
            onHorizontalDragUpdate: (details) {
              transactionProvider.updateSwipeOffset(
                index,
                (transactionProvider.getSwipeOffset(index) ?? 0.0) +
                    details.primaryDelta!,
                screenWidth,
                maxSwipeOffsetFactor,
              );
            },
            onHorizontalDragEnd: (details) {
              transactionProvider.resetSwipeOffset(
                index,
                swipeThresholdFactor,
                screenWidth,
                maxSwipeOffsetFactor,
              );
            },
            child: GestureDetector(
              onTap: () {
                transactionProvider.toggleExpandedState(index);
              },
              child: Stack(
                children: [
                  // Background layer with the delete icon
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: ScreenUtils.width * 0.2,
                      height: ScreenUtils.height * 0.09,
                      decoration: BoxDecoration(
                        color: AppColors.bottomNavBgColor,
                      ),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage(ImageAsset().iconImageDollarBill),
                            height: 20.sp,
                          ),
                          ColumnSpacer(0.003),
                          Text(
                            "Split Bill",
                            style: commonTextStyle.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.primaryBlackColor),
                          )
                        ],
                      )),
                    ),
                  ),
                  AnimatedContainer(
                    width: ScreenUtils.width,
                    height: isExpanded
                        ? ScreenUtils.height * 0.14
                        : ScreenUtils.height * 0.09,
                    duration: const Duration(milliseconds: 200),
                    transform: Matrix4.translationValues(swipeOffset, 0.0, 0.0),
                    margin: EdgeInsets.zero, // Remove the vertical margin
                    decoration: BoxDecoration(
                      color: isExpanded
                          ? AppColors.bottomNavBgColor
                          : AppColors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListTile(
                          leading: Container(
                            height: ScreenUtils.height * 0.05,
                            width: ScreenUtils.height * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: transaction["type"] == "Debit"
                                  ? AppColors.primaryRedShadeColor
                                  : AppColors.primaryGreenShadeColor,
                            ),
                            child: Center(
                              child: Icon(
                                transaction["type"] == "Debit"
                                    ? Icons.arrow_back
                                    : Icons.arrow_forward,
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
                        ),
                        isExpanded
                            ? Flexible(
                                flex: 1,
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(70.sp, 0, 20.sp, 0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Running Balance",
                                              style: commonTextStyle.copyWith(
                                                  fontSize: 11.sp,
                                                  color: AppColors
                                                      .secondarysubGreyColor2),
                                            ),
                                            Text(
                                              "Running Balance",
                                              style: commonTextStyle.copyWith(
                                                  fontSize: 11.sp,
                                                  color: AppColors
                                                      .secondarysubGreyColor2),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "Test",
                                              style: commonTextStyle.copyWith(
                                                  fontSize: 11.sp,
                                                  color: AppColors
                                                      .secondarysubGreyColor2),
                                            ),
                                            Text(
                                              "12536",
                                              style: commonTextStyle.copyWith(
                                                  fontSize: 11.sp,
                                                  color: AppColors
                                                      .secondarysubGreyColor2),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox.shrink()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          //! For Credit or other types, return a non-swipeable ListTile
          return GestureDetector(
            onTap: () {
              transactionProvider.toggleExpandedState(index);
            },
            child: Container(
              decoration: BoxDecoration(
                color:
                    isExpanded ? AppColors.bottomNavBgColor : AppColors.white,
              ),
              width: ScreenUtils.width,
              height: isExpanded
                  ? ScreenUtils.height * 0.14
                  : ScreenUtils.height * 0.09,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Container(
                      height: ScreenUtils.height * 0.05,
                      width: ScreenUtils.height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        color: transaction["type"] == "Debit"
                            ? AppColors.primaryRedShadeColor
                            : AppColors.primaryGreenShadeColor,
                      ),
                      child: Center(
                        child: Icon(
                          transaction["type"] == "Debit"
                              ? Icons.arrow_back
                              : Icons.arrow_forward,
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
                  ),
                  isExpanded
                      ? Flexible(
                          flex: 1,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(70.sp, 0, 20.sp, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Running Balance",
                                        style: commonTextStyle.copyWith(
                                            fontSize: 11.sp,
                                            color: AppColors
                                                .secondarysubGreyColor2),
                                      ),
                                      Text(
                                        "Running Balance",
                                        style: commonTextStyle.copyWith(
                                            fontSize: 11.sp,
                                            color: AppColors
                                                .secondarysubGreyColor2),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Test",
                                        style: commonTextStyle.copyWith(
                                            fontSize: 11.sp,
                                            color: AppColors
                                                .secondarysubGreyColor2),
                                      ),
                                      Text(
                                        "12536",
                                        style: commonTextStyle.copyWith(
                                            fontSize: 11.sp,
                                            color: AppColors
                                                .secondarysubGreyColor2),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink()
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final List<Map<String, dynamic>> transactions = [
    {
      "title": "Purchase Pickme",
      "amount": -3670.00,
      "type": "Debit",
      "date": "24-Jul 10:53"
    },
    {
      "title": "Allowance June 2024",
      "amount": 2543.00,
      "type": "Credit",
      "date": "24-Jul 10:53"
    },
    {
      "title": "Purchase Pickme",
      "amount": -3670.00,
      "type": "Debit",
      "date": "24-Jul 10:53"
    },
    {
      "title": "Purchase Pickme",
      "amount": -3670.00,
      "type": "Debit",
      "date": "24-Jul 10:53"
    },
    {
      "title": "Allowance June 2024",
      "amount": 2543.00,
      "type": "Credit",
      "date": "24-Jul 10:53"
    },
    {
      "title": "Allowance June 2024",
      "amount": 2543.00,
      "type": "Credit",
      "date": "24-Jul 10:53"
    },
    {
      "title": "Purchase Pickme",
      "amount": -3670.00,
      "type": "Debit",
      "date": "24-Jul 10:53"
    },
  ];

  Map<int, double> swipeOffsets = {};

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    const double maxSwipeOffsetFactor = 0.2;
    const double swipeThresholdFactor = 0.125;

    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        final swipeOffset = swipeOffsets[index] ?? 0.0;

        // Only allow swipe if transaction type is 'Debit'
        if (transaction["type"] == "Debit") {
          return GestureDetector(
            onHorizontalDragUpdate: (details) {
              setState(() {
                swipeOffsets[index] =
                    (swipeOffsets[index] ?? 0.0) + details.delta.dx;
                swipeOffsets[index] = swipeOffsets[index]!
                    .clamp(-screenWidth * maxSwipeOffsetFactor, 0.0);
              });
            },
            onHorizontalDragEnd: (details) {
              setState(() {
                if (swipeOffsets[index]! <
                    -screenWidth * swipeThresholdFactor) {
                  swipeOffsets[index] = -screenWidth * maxSwipeOffsetFactor;
                } else {
                  swipeOffsets[index] = 0.0;
                }
              });
            },
            child: Stack(
              children: [
                // Background layer with the delete icon
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: ScreenUtils.width * 0.2,
                    height: ScreenUtils.height * 0.09,
                    decoration: BoxDecoration(
                      color: AppColors.bottomNavBgColor,
                    ),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(ImageAsset().iconImageDollarBill),
                          height: 20.sp,
                        ),
                        ColumnSpacer(0.003),
                        Text(
                          "Split Bill",
                          style: commonTextStyle.copyWith(
                              fontSize: 12.sp,
                              color: AppColors.primaryBlackColor),
                        )
                      ],
                    )),
                  ),
                ),
                AnimatedContainer(
                  width: ScreenUtils.width,
                  height: ScreenUtils.height * 0.09,
                  duration: const Duration(milliseconds: 200),
                  transform: Matrix4.translationValues(swipeOffset, 0.0, 0.0),
                  margin: EdgeInsets.zero, // Remove the vertical margin
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: ListTile(
                    leading: Container(
                      height: ScreenUtils.height * 0.05,
                      width: ScreenUtils.height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        color: transaction["type"] == "Debit"
                            ? AppColors.primaryRedShadeColor
                            : AppColors.primaryGreenShadeColor,
                      ),
                      child: Center(
                        child: Icon(
                          transaction["type"] == "Debit"
                              ? Icons.arrow_back
                              : Icons.arrow_forward,
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
                  ),
                ),
              ],
            ),
          );
        } else {
          // For Credit or other types, return a non-swipeable ListTile
          return ListTile(
            leading: Container(
              height: ScreenUtils.height * 0.05,
              width: ScreenUtils.height * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: transaction["type"] == "Debit"
                    ? AppColors.primaryRedShadeColor
                    : AppColors.primaryGreenShadeColor,
              ),
              child: Center(
                child: Icon(
                  transaction["type"] == "Debit"
                      ? Icons.arrow_back
                      : Icons.arrow_forward,
                  color: transaction["type"] == "Debit"
                      ? AppColors.primaryRedColor
                      : AppColors.primaryGreenColor,
                ),
              ),
            ),
            title: Text(
              transaction["title"],
              style:
                  commonTextStyle.copyWith(color: AppColors.primaryBlackColor),
            ),
            subtitle: Text(
              transaction["date"],
              style: commonTextStyle.copyWith(
                  fontSize: 12.sp, color: AppColors.onBoardSubTextStyleColor),
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
        }
      },
    );
  }
}

//! Old Code

// class _TransactionScreenState extends State<TransactionScreen> {
//   final List<Map<String, dynamic>> transactions = [
//     {
//       "title": "Purchase Pickme",
//       "amount": -3670.00,
//       "type": "Debit",
//       "date": "24-Jul 10:53"
//     },
//     {
//       "title": "Allowance June 2024",
//       "amount": 2543.00,
//       "type": "Credit",
//       "date": "24-Jul 10:53"
//     },
//     {
//       "title": "Purchase Pickme",
//       "amount": -3670.00,
//       "type": "Debit",
//       "date": "24-Jul 10:53"
//     },
//     {
//       "title": "Purchase Pickme",
//       "amount": -3670.00,
//       "type": "Debit",
//       "date": "24-Jul 10:53"
//     },
//     {
//       "title": "Purchase Pickme",
//       "amount": -3670.00,
//       "type": "Debit",
//       "date": "24-Jul 10:53"
//     },
//     {
//       "title": "Purchase Pickme",
//       "amount": -3670.00,
//       "type": "Debit",
//       "date": "24-Jul 10:53"
//     },
//   ];

//   Map<int, double> swipeOffsets = {};

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     const double maxSwipeOffsetFactor = 0.2;
//     const double swipeThresholdFactor = 0.125;

//     return ListView.builder(
//       itemCount: transactions.length,
//       itemBuilder: (context, index) {
//         final transaction = transactions[index];
//         final swipeOffset = swipeOffsets[index] ?? 0.0;

//         return GestureDetector(
//           onHorizontalDragUpdate: (details) {
//             setState(() {
//               swipeOffsets[index] =
//                   (swipeOffsets[index] ?? 0.0) + details.delta.dx;
//               swipeOffsets[index] = swipeOffsets[index]!
//                   .clamp(-screenWidth * maxSwipeOffsetFactor, 0.0);
//             });
//           },
//           onHorizontalDragEnd: (details) {
//             setState(() {
//               if (swipeOffsets[index]! < -screenWidth * swipeThresholdFactor) {
//                 swipeOffsets[index] = -screenWidth * maxSwipeOffsetFactor;
//               } else {
//                 swipeOffsets[index] = 0.0;
//               }
//             });
//           },
//           child: Stack(
//             children: [
//               // Background layer with the delete icon
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: Container(
//                   width: ScreenUtils.width * 0.2,
//                   height: ScreenUtils.height * 0.09,
//                   decoration: BoxDecoration(
//                     color: AppColors.bottomNavBgColor,
//                   ),
//                   child: Center(
//                       child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image(
//                         image: AssetImage(ImageAsset().iconImageDollarBill),
//                         height: 20.sp,
//                       ),
//                       ColumnSpacer(0.003),
//                       Text(
//                         "Split Bill",
//                         style: commonTextStyle.copyWith(
//                             fontSize: 12.sp,
//                             color: AppColors.primaryBlackColor),
//                       )
//                     ],
//                   )),
//                 ),
//               ),
//               AnimatedContainer(
//                 width: ScreenUtils.width,
//                 height: ScreenUtils.height * 0.09,
//                 duration: const Duration(milliseconds: 200),
//                 transform: Matrix4.translationValues(swipeOffset, 0.0, 0.0),
//                 margin: EdgeInsets.zero, // Remove the vertical margin
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                 ),
//                 child: ListTile(
//                   leading: Container(
//                     height: ScreenUtils.height * 0.05,
//                     width: ScreenUtils.height * 0.05,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10.sp),
//                       color: transaction["type"] == "Debit"
//                           ? AppColors.primaryRedShadeColor
//                           : AppColors.primaryGreenShadeColor,
//                     ),
//                     child: Center(
//                       child: Icon(
//                         transaction["type"] == "Debit"
//                             ? Icons.arrow_back
//                             : Icons.arrow_forward,
//                         color: transaction["type"] == "Debit"
//                             ? AppColors.primaryRedColor
//                             : AppColors.primaryGreenColor,
//                       ),
//                     ),
//                   ),
//                   title: Text(
//                     transaction["title"],
//                     style: commonTextStyle.copyWith(
//                         color: AppColors.primaryBlackColor),
//                   ),
//                   subtitle: Text(
//                     transaction["date"],
//                     style: commonTextStyle.copyWith(
//                         fontSize: 12.sp,
//                         color: AppColors.onBoardSubTextStyleColor),
//                   ),
//                   trailing: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         "${transaction["amount"] > 0 ? "+" : ""}${transaction["amount"].toStringAsFixed(2)}",
//                         style: commonTextStyle.copyWith(
//                           color: transaction["amount"] > 0
//                               ? AppColors.primaryGreenColor
//                               : AppColors.primaryRedColor,
//                         ),
//                       ),
//                       Text(
//                         "${transaction["type"]}",
//                         style: commonTextStyle.copyWith(
//                             fontSize: 10.sp,
//                             color: AppColors.onBoardSubTextStyleColor),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
