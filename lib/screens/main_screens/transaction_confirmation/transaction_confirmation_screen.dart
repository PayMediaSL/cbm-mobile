// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cbm_one_app/helpers/colors.dart';
import 'package:cbm_one_app/helpers/routes.dart';
import 'package:cbm_one_app/helpers/spacers.dart';
import 'package:cbm_one_app/helpers/text_styles.dart';
import 'package:cbm_one_app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:cbm_one_app/screens/widgets/container/customer_curved_container.dart';
import 'package:cbm_one_app/screens/widgets/main_button/main_button.dart';
import 'package:cbm_one_app/services/screen_size_calculator.dart';
import 'package:cbm_one_app/utils/navigation_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionConfirmationScreen extends StatelessWidget {
  const TransactionConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeMainLayout(
        backgroundColor: AppColors.SecondarysubGreyColor,
        isBgContainer1: true,
        isBgContainer2: true,
        isBgContainer1Height: ScreenUtils.height * 0.07,
        onBackIconAvailable: true,
        onBackTitleAvailable: true,
        backTitle: "Transaction Confirmation",
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
                  height: ScreenUtils.height * 0.55,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Transaction Details",
                        style: commonTextHeadingStyle,
                      ),
                      ColumnSpacer(0.005),
                      Text(
                        "You’re about to make the following transaction. Please make sure all details are correct.",
                        style:
                            commonTextSubHeadingStyle.copyWith(fontSize: 12.sp),
                      ),
                      ColumnSpacer(0.03),
                      buildRow("Sender account number", "80******42"),
                      buildRow("Recipient bank", "commercial;"),
                      buildRow("Recipient name", "Chris"),
                      buildRow("Recipient account number", "44657657"),
                      buildRow("Transfer amount", "20000"),
                      buildRow("Bank charges", "30.00"),
                      buildRow("Payment Date", "2024/08/23"),
                      buildRow("Personal note", "Uchicha Sasuke "),
                      buildRow("Note to recipient", "asdas3"),
                    ],
                  ),
                ),
                ColumnSpacer(0.17),
                Text(
                  "Edit details",
                  style: commonTextSubHeadingStyle.copyWith(fontSize: 16.sp),
                ),
                ColumnSpacer(0.01),
                MainButton(
                  isMainButton: true,
                  btnOnPress: () {
                    pushScreen(
                        context, ScreenRoutes.toTransactionSuccessScreen);
                  },
                  buttontitle: "Confirm and Send",
                )
              ],
            )));
  }

  Widget buildRow(String key, String value) {
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
                style: commonTextFieldTitleStyle.copyWith(fontSize: 14.sp),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(value, style: commonTextSubHeadingStyle),
              ),
            ),
          ],
        ),
        ColumnSpacer(0.01)
      ],
    );
  }
}
