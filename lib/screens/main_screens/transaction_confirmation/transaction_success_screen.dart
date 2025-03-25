// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/widgets/container/customer_curved_container.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionSuccessScreen extends StatelessWidget {
  const TransactionSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeMainLayout(
        backgroundColor: AppColors.primaryBlueColor,
        isBgContainer1: true,
        isBgContainer2: true,
        isBgContainer1Height: ScreenUtils.height * 0.07,
        onBackIconAvailable: true,
        onBackTitleAvailable: true,
        backTitle: "Receipt",
        onBackTap: () {
          popScreen(context);
        },
        children: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ColumnSpacer(0.05),
                  CustomCurvedContainer(
                    height: ScreenUtils.height * 0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "One App",
                              style: commonTextHeadingStyle.copyWith(
                                  fontWeight: FontWeight.w800, fontSize: 20.sp),
                            ),
                            Image(
                              image: AssetImage(ImageAsset().comBankLogo),
                              height: ScreenUtils.height * 0.03,
                            )
                          ],
                        ),
                        ColumnSpacer(0.02),
                        Center(
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage(ImageAsset().successCheck),
                                height: ScreenUtils.height * 0.05,
                              ),
                              Text(
                                "Payment Success!",
                                style: commonTextHeadingStyle.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 23.sp),
                              ),
                              Text(
                                "Your payment was sent to Alan Walker",
                                style: commonTextHeadingStyle.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                        ColumnSpacer(0.02),
                        buildRow(
                            "Amount",
                            "30000",
                            commonTextHeadingStyle.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.primarySubBlackColor),
                            commonTextHeadingStyle.copyWith(
                              fontWeight: FontWeight.w800,
                            )),
                        buildRow(
                            "Bank Charge",
                            "30.00",
                            commonTextHeadingStyle.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primarySubBlackColor),
                            commonTextHeadingStyle.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w800,
                            )),
                        Divider(),
                        ColumnSpacer(0.003),
                        buildRow("Recipient name", "Anna Walker", null, null),
                        buildRow(
                            "Recipient account number", "3475638", null, null),
                        buildRow("Recipient reference", "QRT Pay", null, null),
                        Divider(),
                        ColumnSpacer(0.003),
                        buildRow("Sender account number", "638847", null, null),
                        buildRow("Sender name", "tets", null, null),
                        Divider(),
                        ColumnSpacer(0.003),
                        buildRow(
                            "Transfer date & time", "20244:06 PM", null, null),
                        buildRow("Payment date", "2024/04/03", null, null),
                        buildRow("Status", "Completed", null, null),
                        Divider(),
                        ColumnSpacer(0.003),
                        buildRow("Bank reference number", "O400003035724", null,
                            null),
                      ],
                    ),
                  ),
                  ColumnSpacer(0.01),
                  CustomCurvedContainer(
                    height: ScreenUtils.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.download),
                            RowSpacer(0.01),
                            Text(
                              "Download",
                              style: commonTextSubHeadingStyle,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.share),
                            RowSpacer(0.01),
                            Text(
                              "Share",
                              style: commonTextSubHeadingStyle,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.share),
                            RowSpacer(0.01),
                            Text(
                              "Splitt Bill",
                              style: commonTextSubHeadingStyle,
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ])));
  }

  Widget buildRow(
    String key,
    String value,
    TextStyle? keyStyle,
    TextStyle? valueStyle,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: ScreenUtils.width * 0.45,
              child: Text(
                key,
                style: keyStyle ??
                    commonTextStyle_black_500_16sp.copyWith(
                      fontSize: 14.sp,
                    ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(value,
                    style: valueStyle ??
                        commonTextHeadingStyle.copyWith(fontSize: 14.sp)),
              ),
            ),
          ],
        ),
        ColumnSpacer(0.003)
      ],
    );
  }
}
