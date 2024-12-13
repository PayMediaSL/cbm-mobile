// ignore_for_file: must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/widgets/text_fields/custom_search_bar.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainHomeScreen extends StatelessWidget {
  MainHomeScreen({
    super.key,
  });

  final List<Map<String, String>> cardData = [
    {
      'availableBalance': 'John Doe',
      'accountNumber': '* 1234',
      'currentBalance': '12/25',
      'accountHold': '12/25',
    },
    {
      'availableBalance': 'John Doe',
      'accountNumber': '**** 1234',
      'currentBalance': '12/25',
      'accountHold': '12/25',
    },
    {
      'availableBalance': 'John Doe',
      'accountNumber': '**** 1234',
      'currentBalance': '12/25',
      'accountHold': '12/25',
    },
  ];
  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    ScreenUtil.init(context);
    return HomeMainLayout(
      isBgContainer1Height: ScreenUtils.height * 0.43,
      backgroundColor: AppColors.SecondarysubGreyColor,
      isBgContainer1: true,
      isBgContainer2: true,
      children: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //? Circle Avatar
              CircleAvatar(),
              SearchTextField(
                controller: TextEditingController(),
                onChanged: (value) => print("Search text: $value"),
                hintText: "Search...",
                fillColor: AppColors.onBoardActiveColor.withOpacity(0.5),
                hintTextColor: Colors.white,
                iconColor: Colors.white,
                heightFactor: 0.1,
                widthFactor: 0.4,
                borderRadius: 25.0,
              ),
              Image(
                image: AssetImage(ImageAsset().iconImageMail),
                height: 25.sp,
              ),
              Image(
                image: AssetImage(ImageAsset().iconImageNotification),
                height: 25.sp,
              ),
              Image(
                image: AssetImage(ImageAsset().iconImageLocak),
                height: 25.sp,
              ),
            ],
          ),
          ColumnSpacer(0.04),
          CarouselSlider.builder(
            disableGesture: true,
            itemCount: 3,
            options: CarouselOptions(
              height: ScreenUtils.height * 0.23,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
            ),
            itemBuilder: (context, index, realIndex) {
              final card = cardData[index];
              return VisaCardWidget(
                  availableBalance: card["availableBalance"] ?? "",
                  accountNumber: card["accountNumber"] ?? "",
                  currentBalance: card["currentBalance"] ?? "",
                  accountHold: card["accountHold"] ?? "");
            },
          ),
        ],
      ),
    );
  }
}

class VisaCardWidget extends StatelessWidget {
  final String availableBalance;
  final String accountNumber;
  final String currentBalance;
  final String accountHold;
  final void Function()? onTap1;
  final void Function()? onTap2;

  const VisaCardWidget({
    required this.availableBalance,
    required this.accountNumber,
    required this.currentBalance,
    required this.accountHold,
    this.onTap1,
    this.onTap2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    ScreenUtil.init(context);

    return Center(
      child: Container(
        width: ScreenUtils.width * 0.8,
        height: ScreenUtils.width * 0.44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Regular Saving : ${accountNumber}"),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: onTap1,
                        child: Image(
                          image: AssetImage(ImageAsset().iconImage),
                          height: 20.sp,
                        ),
                      ),
                      RowSpacer(0.03),
                      GestureDetector(
                        onTap: onTap2,
                        child: Image(
                          image: AssetImage(ImageAsset().iconImage),
                          height: 20.sp,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              //

              ColumnSpacer(0.01),
              Text(
                availableBalance,
                style: TextStyle(fontSize: 27),
              ),
              // ColumnSpacer(0.0001),
              Text("Available Balance"),
              ColumnSpacer(0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Current balance"),
                      Text(currentBalance),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Holds"),
                      Text(accountHold),
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
