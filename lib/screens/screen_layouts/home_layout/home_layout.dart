// ignore_for_file: must_be_immutable

import 'package:cbm_one_app/helpers/colors.dart';
import 'package:cbm_one_app/helpers/spacers.dart';
import 'package:cbm_one_app/helpers/text_styles.dart';
import 'package:cbm_one_app/services/screen_size_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeMainLayout extends StatelessWidget {
  HomeMainLayout(
      {super.key,
      this.isAppBar = false,
      this.isLeading = true,
      this.isBgContainer1 = false,
      this.isBgContainer2 = false,
      this.backgroundColor,
      this.isBgContainer1Height,
      this.isBgContainer2Height,
      this.children,
      this.onBackIconAvailable = false,
      this.onBackTitleAvailable = false,
      this.backTitle = "",
      this.onBackTap});
  bool isAppBar;
  bool isLeading;
  late bool isBgContainer1;
  late bool isBgContainer2;
  late double? isBgContainer1Height;
  late double? isBgContainer2Height;
  final Color? backgroundColor;
  final Widget? children;
  late bool onBackIconAvailable;
  late bool onBackTitleAvailable;
  late String backTitle;
  final void Function()? onBackTap;

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: AppColors.primaryBlueColor,
      ),
      backgroundColor: backgroundColor ?? AppColors.primaryWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  isBgContainer1
                      ? Container(
                          height:
                              isBgContainer1Height ?? ScreenUtils.height * 0.3,
                          width: ScreenUtils.width,
                          color: AppColors.primaryBlueColor,
                        )
                      : SizedBox.shrink(),
                  isBgContainer2
                      ? Container(
                          width: ScreenUtils.width,
                          // color: Colors.lightBlue,
                          // child: Text("sdsdsdsd"),
                        )
                      : SizedBox.shrink(),
                ],
              ),

              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    onBackIconAvailable
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: onBackTap,
                                  child: Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: AppColors.primaryWhiteColor,
                                  ),
                                ),
                                RowSpacer(0.04),
                                onBackTitleAvailable
                                    ? Text(
                                        backTitle,
                                        style: commonTextStyle.copyWith(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500),
                                      )
                                    : SizedBox.shrink()
                              ],
                            ),
                          )
                        : SizedBox.shrink(),
                    if (children != null) children!,
                  ],
                ),
              )
              //! Main Text
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              //   child: Column(
              //     children: [
              //       isLeading
              //           ? Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //               // crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 //? Circle Avatar
              //                 CircleAvatar(),
              //                 SearchTextField(
              //                   controller: TextEditingController(),
              //                   onChanged: (value) =>
              //                       print("Search text: $value"),
              //                   hintText: "Search...",
              //                   fillColor: AppColors.onBoardActiveColor
              //                       .withOpacity(0.5),
              //                   hintTextColor: Colors.white,
              //                   iconColor: Colors.white,
              //                   heightFactor: 0.1,
              //                   widthFactor: 0.4,
              //                   borderRadius: 25.0,
              //                 ),
              //                 Image(
              //                   image: AssetImage(ImageAsset().iconImageMail),
              //                   height: 25.sp,
              //                 ),
              //                 Image(
              //                   image: AssetImage(
              //                       ImageAsset().iconImageNotification),
              //                   height: 25.sp,
              //                 ),
              //                 Image(
              //                   image: AssetImage(ImageAsset().iconImageLocak),
              //                   height: 25.sp,
              //                 ),
              //               ],
              //             )
              //           : SizedBox.shrink()
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
