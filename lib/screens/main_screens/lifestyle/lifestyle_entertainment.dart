// ignore_for_file: must_be_immutable

import 'package:cbm_one_app/helpers/colors.dart';
import 'package:cbm_one_app/helpers/spacers.dart';
import 'package:cbm_one_app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:cbm_one_app/screens/widgets/lifestyle/lifestyle.dart';
import 'package:cbm_one_app/services/screen_size_calculator.dart';
import 'package:cbm_one_app/utils/assest_image.dart';
import 'package:cbm_one_app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LifeStyleEntertainmentScreen extends StatelessWidget {
  LifeStyleEntertainmentScreen({super.key});

  List<Map<String, String>> gridItems = [
    {
      "title": "Item 1",
      "image": ImageAsset().authBg,
    },
    {
      "title": "Item 2",
      "image": ImageAsset().authBg,
    },
    {
      "title": "Item 3",
      "image": ImageAsset().authBg,
    },
    {
      "title": "Item 4",
      "image": ImageAsset().authBg,
    },
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
        onBackTap: () {
          popScreen(context);
        },
        backTitle: "Entertainment ",
        children: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColumnSpacer(0.07),
              ReusableGridView(items: gridItems, onTap: (index) {}),
            ],
          ),
        ));
  }
}
