// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants/ui_constants.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/screens/screen_layouts/authentication_layout/authentication_layout.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ESlipsScreen extends StatelessWidget {
  const ESlipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    ScreenUtil.init(context);
    return AuthenticationLayout(
      isAppBar: true,
      isContainer1: true,
      isContainer2: true,
      isBodyLeadingAvailable: true,
      useImage: true,
      imageName: ImageAsset().authBg,
      isHeadingAvailable: true,
      isSubHeadingAvailable: true,
      headerText: "e-Slips",
      headerSubText: "Deposit your cash or cheque without filling a slip.",
      container2CustomWidget: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.sp, horizontal: 20.sp),
        child: Column(
          children: [
            //! Cash Deposites
            Container(
              height: ScreenUtils.height * 0.13,
              width: ScreenUtils.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primaryWhiteColor,
                  border: UI_Border.defaultBorder()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding:
                          EdgeInsets.all(UI_Padding.PRIMARY_COMMON_PADDING_3),
                      child: Image.asset(ImageAsset().cashImg)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cash Deposits",
                        style: commonTextStyle_black_500_16sp,
                      ),
                      SizedBox(
                        width: ScreenUtils.width * 0.58,
                        child: Text("Deposit your cash without filling a slip",
                            style: commonTextStyle.copyWith(
                                color: AppColors.onBoardSubTextStyleColor)),
                      )
                    ],
                  )
                ],
              ),
            ),

            ColumnSpacer(0.02),
            //! Cheque Deposites
            Container(
              height: ScreenUtils.height * 0.13,
              width: ScreenUtils.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primaryWhiteColor,
                  border: UI_Border.defaultBorder()
                  // border: Border.all(
                  //   color: AppColors.primaryGreyColor2,
                  //   style: BorderStyle.solid,
                  //   width: 1.0,
                  // ),
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.all(20),
                      child: Image.asset(ImageAsset().chequeImg)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cheque Deposits",
                        style: commonTextStyle_black_500_16sp,
                      ),
                      SizedBox(
                        width: ScreenUtils.width * 0.58,
                        child: Text(
                            "Deposit your Cheque without filling a slip",
                            style: commonTextStyle.copyWith(
                                color: AppColors.onBoardSubTextStyleColor)),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
