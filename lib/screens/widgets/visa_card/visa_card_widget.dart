// ignore_for_file: must_be_immutable

import 'package:cbm_one_app/helpers/colors.dart';
import 'package:cbm_one_app/helpers/povider_helper/common_provider.dart';
import 'package:cbm_one_app/helpers/spacers.dart';
import 'package:cbm_one_app/helpers/text_styles.dart';
import 'package:cbm_one_app/services/screen_size_calculator.dart';
import 'package:cbm_one_app/utils/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VisaCardWidget extends StatelessWidget {
  final String availableBalance;
  final String accountNumber;
  final String currentBalance;
  final String accountHold;
  final void Function()? onTap1;
  final void Function()? onTap2;
  final void Function()? onTapAccounts;
  final void Function()? onTapAddMoney;
  final void Function()? onTapLastCard;
  final int? maskindex;
  final double? cardHeight;
  final double? cardwidth;

  bool isWallet;
  final Color? gradientColor1;
  final Color? gradientColor2;
  final bool isLastCard;

  VisaCardWidget({
    required this.availableBalance,
    required this.accountNumber,
    required this.currentBalance,
    required this.accountHold,
    this.onTap1,
    this.onTap2,
    this.isWallet = false,
    this.onTapAccounts,
    this.onTapAddMoney,
    this.gradientColor1,
    this.gradientColor2,
    this.isLastCard = false,
    this.onTapLastCard,
    this.maskindex,
    this.cardHeight,
    this.cardwidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    ScreenUtil.init(context);
    var commonProvider = getCommonProvider(context);

    return Center(
      child: Container(
        width: cardwidth ?? ScreenUtils.width,
        height: cardHeight ?? ScreenUtils.width * 0.44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              gradientColor1 ?? Colors.black,
              gradientColor2 ?? Colors.blue
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: isLastCard
            ? Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 40.sp, horizontal: 25.sp),
                child: GestureDetector(
                  onTap: onTapLastCard,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        color: AppColors.primaryWhiteColor),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.sp, vertical: 10.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: ScreenUtils.height * 0.1,
                              width: ScreenUtils.width * 0.4,
                              child: Text(
                                "Link your other bank account to add money to your wallet",
                                style: commonTextStyle.copyWith(
                                    color: AppColors.primaryBlackColor),
                              )),
                          Icon(Icons.add_circle_outlined),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 12.sp, horizontal: 15.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isWallet
                              ? "Wallet"
                              : "Regular Saving : ${accountNumber}",
                          style: commonTextStyle.copyWith(
                              color: AppColors.primaryWhiteColor),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  commonProvider
                                      .toggleStates("masknumber_$maskindex");
                                },
                                child: Icon(
                                  !commonProvider
                                          .getStates("masknumber_$maskindex")
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColors.primaryWhiteColor,
                                )),
                            RowSpacer(0.03),
                            GestureDetector(
                                onTap: onTap1,
                                child: Icon(
                                  Icons.share,
                                  color: AppColors.primaryWhiteColor,
                                )),
                          ],
                        ),
                      ],
                    ),
                    //

                    ColumnSpacer(0.01),
                    Text(
                      "RS  ${!commonProvider.getStates("masknumber_$maskindex") ? maskNumber(availableBalance) : availableBalance}",
                      style: commonTextStyle.copyWith(
                          fontSize: 26.sp,
                          fontFamily: "spacegrotsek",
                          color: AppColors.primaryWhiteColor),
                    ),
                    // ColumnSpacer(0.0001),
                    Text(
                      "Available Balance",
                      style: commonTextStyle.copyWith(
                          color: AppColors.primaryWhiteColor),
                    ),
                    isWallet ? ColumnSpacer(0.02) : ColumnSpacer(0.01),

                    isWallet
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: onTapAccounts,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryWhiteColor,
                                      borderRadius:
                                          BorderRadius.circular(20.sp)),
                                  width: ScreenUtils.width * 0.23,
                                  height: ScreenUtils.height * 0.04,
                                  child: Center(
                                      child: Text(
                                    "Accounts",
                                    style: commonTextStyle.copyWith(
                                        color: AppColors.primaryBlackColor),
                                  )),
                                ),
                              ),
                              RowSpacer(0.02),
                              GestureDetector(
                                onTap: onTapAddMoney,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryWhiteColor,
                                      borderRadius:
                                          BorderRadius.circular(20.sp)),
                                  width: ScreenUtils.width * 0.30,
                                  height: ScreenUtils.height * 0.04,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Row(
                                      children: [
                                        Icon(Icons.add_circle_outlined),
                                        Text(
                                          "Add Money",
                                          style: commonTextStyle.copyWith(
                                              color:
                                                  AppColors.primaryBlackColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Current balance",
                                    style: commonTextStyle.copyWith(
                                        color: AppColors.primaryWhiteColor),
                                  ),
                                  Text(
                                    currentBalance,
                                    style: commonTextStyle.copyWith(
                                        color: AppColors.primaryWhiteColor),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Holds",
                                    style: commonTextStyle.copyWith(
                                        color: AppColors.primaryWhiteColor),
                                  ),
                                  Text(
                                    accountHold,
                                    style: commonTextStyle.copyWith(
                                        color: AppColors.primaryWhiteColor),
                                  ),
                                ],
                              ),
                            ],
                          )
                  ],
                ),
              ),
      ),
    );
  }
}

//! Visa Card 2

class VisaCardWidget2 extends StatelessWidget {
  final String availableBalance;
  final String accountNumber;
  final void Function()? onTap1;
  final void Function()? onTap2;
  final void Function()? onTapAccounts;
  final void Function()? onTapAddMoney;
  final void Function()? onTapLastCard;
  final int? maskindex;
  final double? cardHeight;
  final double? cardwidth;

  bool isWallet;
  final Color? gradientColor1;
  final Color? gradientColor2;
  final bool isLastCard;
  final bool isCards;

  VisaCardWidget2({
    required this.availableBalance,
    required this.accountNumber,
    this.onTap1,
    this.onTap2,
    this.isWallet = false,
    this.onTapAccounts,
    this.onTapAddMoney,
    this.gradientColor1,
    this.gradientColor2,
    this.isLastCard = false,
    this.onTapLastCard,
    this.maskindex,
    this.cardHeight,
    this.cardwidth,
    this.isCards = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    ScreenUtil.init(context);
    // var commonProvider = getCommonProvider(context);

    return Center(
        child: Container(
      width: cardwidth ?? ScreenUtils.width,
      height: cardHeight ?? ScreenUtils.width * 0.44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            gradientColor1 ?? Colors.teal,
            gradientColor2 ?? Colors.black
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${accountNumber}",
                  style: commonTextStyle.copyWith(
                      fontSize: 15.sp,
                      fontFamily: "spacegrotsek",
                      color: AppColors.primaryWhiteColor),
                ),
                Text(
                  "Commercial",
                  style: commonTextStyle.copyWith(
                      color: AppColors.primaryWhiteColor),
                ),
              ],
            ),
            ColumnSpacer(0.035),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rs ${availableBalance}",
                  style: commonTextStyle.copyWith(
                      fontSize: 17.sp,
                      fontFamily: "spacegrotsek",
                      color: AppColors.primaryWhiteColor),
                ),
                ColumnSpacer(0.001),
                Text(
                  "Available Balance",
                  style: commonTextStyle.copyWith(
                      color: AppColors.primaryWhiteColor),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

//! Visa Card 3

class VisaCardWidget3 extends StatelessWidget {
  final String availableBalance;
  final String accountNumber;
  final void Function()? onTap1;
  final void Function()? onTap2;
  final void Function()? onTapAccounts;
  final void Function()? onTapAddMoney;
  final void Function()? onTapLastCard;
  final int? maskindex;
  final double? cardHeight;
  final double? cardwidth;
  final String? balancetext;
  final String? rowleftText;
  final String? rowleftTextValue;
  final String? rowrightText;
  final String? rowrightTextValue;
  final String? dueValue;
  final Widget? rightTopWidget;

  bool isWallet;
  final Color? gradientColor1;
  final Color? gradientColor2;
  final bool isLastCard;
  final bool isCards;
  final bool isOverdue;

  VisaCardWidget3({
    required this.availableBalance,
    required this.accountNumber,
    this.onTap1,
    this.onTap2,
    this.isWallet = false,
    this.onTapAccounts,
    this.onTapAddMoney,
    this.gradientColor1,
    this.gradientColor2,
    this.isLastCard = false,
    this.onTapLastCard,
    this.maskindex,
    this.cardHeight,
    this.cardwidth,
    this.isCards = true,
    this.balancetext,
    this.rowleftText,
    this.rowleftTextValue,
    this.rowrightText,
    this.rowrightTextValue,
    this.isOverdue = false,
    this.dueValue,
    this.rightTopWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    ScreenUtil.init(context);
    // var commonProvider = getCommonProvider(context);

    return Center(
        child: Container(
      width: cardwidth ?? ScreenUtils.width,
      height: cardHeight ?? ScreenUtils.width * 0.44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            gradientColor1 ?? Colors.teal,
            gradientColor2 ?? Colors.black
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${accountNumber}",
                  style: commonTextStyle.copyWith(
                      fontSize: 15.sp,
                      fontFamily: "spacegrotsek",
                      color: AppColors.primaryWhiteColor),
                ),
                isOverdue
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Over due",
                            style: commonTextStyle.copyWith(
                                color: AppColors.primaryRedColor),
                          ),
                          Text(
                            dueValue ?? "0.00",
                            style: commonTextStyle.copyWith(
                                color: AppColors.primaryAmberColor),
                          ),
                        ],
                      )
                    : rightTopWidget ?? SizedBox()
              ],
            ),
            ColumnSpacer(0.03),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rs ${availableBalance}",
                  style: commonTextStyle.copyWith(
                      fontSize: 17.sp,
                      fontFamily: "spacegrotsek",
                      color: AppColors.primaryWhiteColor),
                ),
                ColumnSpacer(0.001),
                Text(
                  balancetext ?? "Available Balance",
                  style: commonTextStyle.copyWith(
                      color: AppColors.primaryWhiteColor),
                ),
              ],
            ),
            ColumnSpacer(isOverdue ? 0.02 : 0.035),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rowleftText ?? "Next Payment",
                      style: commonTextStyle.copyWith(
                          color: AppColors.primaryWhiteColor),
                    ),
                    ColumnSpacer(0.001),
                    Text(
                      rowleftTextValue ?? "3300",
                      style: commonTextStyle.copyWith(
                          color: AppColors.primaryWhiteColor),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rowrightText ?? "Next Payment Date",
                      style: commonTextStyle.copyWith(
                          color: AppColors.primaryWhiteColor),
                    ),
                    ColumnSpacer(0.001),
                    Text(
                      rowrightTextValue ?? "24/12",
                      style: commonTextStyle.copyWith(
                          color: AppColors.primaryWhiteColor),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
