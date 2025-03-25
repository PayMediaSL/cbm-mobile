import 'package:app/helpers/colors.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/drawer/transaction_limit_provider.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DrawerTransactionLimit extends StatelessWidget {
  const DrawerTransactionLimit({super.key});

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
        backTitle: "Transaction Limit",
        children: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ColumnSpacer(0.06),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.sp, horizontal: 10.sp),
                  width: ScreenUtils.width,
                  height: ScreenUtils.height * 0.5,
                  decoration: BoxDecoration(
                    color: AppColors.primaryWhiteColor,
                    borderRadius: BorderRadius.circular(10.sp),
                  ),

                  child: Consumer<TransactionLimitProvider>(
                    builder: (context, dataProvider, child) {
                      if (dataProvider.dataList.isEmpty) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return ListView.builder(
                        itemCount: dataProvider.dataList.length,
                        itemBuilder: (context, index) {
                          final data = dataProvider.dataList[index];

                          return Padding(
                            padding: EdgeInsets.only(bottom: 20.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: ScreenUtils.width * 0.45,
                                      child: Text(data['title']!,
                                          style:
                                              commonTextStyle_black_500_12sp),
                                    ),
                                    SizedBox(
                                      width: ScreenUtils.width * 0.3,
                                      child: Text(
                                        data['amount']!,
                                        style: commonTextStyle.copyWith(
                                            color: AppColors
                                                .secondarysubGreyColor2,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),

                  // child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         SizedBox(
                  //           width: ScreenUtils.width * 0.45,
                  //           child: Text(
                  //             "Daily limit of transfer between own accounts ",
                  //             style: commonTextStyle.copyWith(
                  //                 color: AppColors.primaryBlackColor,
                  //                 fontSize: 12.sp,
                  //                 fontWeight: FontWeight.w500),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: ScreenUtils.width * 0.3,
                  //           child: Text(
                  //             "LKR 999,999,999.00",
                  //             style: commonTextStyle.copyWith(
                  //                 color: AppColors.secondarysubGreyColor2,
                  //                 fontSize: 10.sp,
                  //                 fontWeight: FontWeight.w500),
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ],
                  // ),
                )
              ],
            )));
  }
}
