// ignore_for_file: must_be_immutable, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/screens/screen_layouts/authentication_layout/authentication_layout.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionLayout extends StatelessWidget {
  DescriptionLayout(
      {super.key,
      this.headerText = "",
      this.headerSubText = "",
      this.buttontitle = "",
      this.description1 = "",
      this.description2 = "",
      this.description3 = "",
      this.description4 = "",
      this.description5 = "",
      this.isImage = false,
      this.imageName = "",
      this.onBackButtonTap,
      this.onMainButtonTap});

  final bool isImage;
  final String imageName;
  final String headerText;
  final String headerSubText;
  final String buttontitle;
  final String description1;
  final String description2;
  final String description3;
  final String description4;
  final String description5;
  final void Function()? onBackButtonTap; // Optional onTap
  final void Function()? onMainButtonTap;

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    ScreenUtil.init(context);

    return AuthenticationLayout(
      isAppBar: true,
      onBackButtonTap: onBackButtonTap,
      isContainer1: true,
      isContainer2: true,
      isBodyLeadingAvailable: true,
      isBodyLeadingIcon: true,
      isHeadingAvailable: true,
      isSubHeadingAvailable: true,
      useImage: true,
      imageName: ImageAsset().authBg,
      defaultButton: true,
      headerText: headerText,
      headerSubText: headerSubText,
      onTap: onMainButtonTap,
      buttontitle: "Im ready",
      container2CustomWidget: Column(
        children: [
          isImage
              ? Image(
                  image: AssetImage(imageName),
                  height: ScreenUtils.height * 0.25,
                  width: ScreenUtils.width,
                )
              : SizedBox.shrink(),
          ColumnSpacer(0.02),
          Row(
            children: [
              Image(
                image: AssetImage(ImageAsset().checkmarkImage),
                height: ScreenUtils.height * 0.03,
              ),
              RowSpacer(0.02),
              SizedBox(
                width: ScreenUtils.width * 0.8,
                child: Text(
                  description1,
                  style: commonTextStyle.copyWith(
                      fontSize: 16.sp, color: AppColors.primarySubBlackColor),
                ),
              )
            ],
          ),
          ColumnSpacer(0.01),
          Row(
            children: [
              Image(
                image: AssetImage(ImageAsset().checkmarkImage),
                height: ScreenUtils.height * 0.03,
              ),
              RowSpacer(0.02),
              SizedBox(
                width: ScreenUtils.width * 0.8,
                child: Text(
                  description2,
                  style: commonTextStyle.copyWith(
                      fontSize: 16.sp, color: AppColors.primarySubBlackColor),
                ),
              )
            ],
          ),
          ColumnSpacer(0.01),
          Row(
            children: [
              Image(
                image: AssetImage(ImageAsset().checkmarkImage),
                height: ScreenUtils.height * 0.03,
              ),
              RowSpacer(0.02),
              SizedBox(
                width: ScreenUtils.width * 0.8,
                child: Text(
                  description3,
                  style: commonTextStyle.copyWith(
                      fontSize: 16.sp, color: AppColors.primarySubBlackColor),
                ),
              )
            ],
          ),
          ColumnSpacer(0.01),
          Row(
            children: [
              Image(
                image: AssetImage(ImageAsset().checkmarkImage),
                height: ScreenUtils.height * 0.03,
              ),
              RowSpacer(0.02),
              SizedBox(
                width: ScreenUtils.width * 0.8,
                child: Text(
                  description4,
                  style: commonTextStyle.copyWith(
                      fontSize: 16.sp, color: AppColors.primarySubBlackColor),
                ),
              )
            ],
          ),
          ColumnSpacer(0.02),
        ],
      ),
    );
  }
}
