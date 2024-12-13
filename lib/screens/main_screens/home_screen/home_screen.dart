// ignore_for_file: must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/widgets/text_fields/custom_search_bar.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainHomeScreen extends StatelessWidget {
  MainHomeScreen({
    super.key,
  });

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
          ColumnSpacer(0.05),
          VisaCardWidget(
              cardHolder: "cardHolder",
              cardNumber: "cardNumber",
              expiryDate: "expiryDate")
        ],
      ),
    );
  }
}

class VisaCardWidget extends StatelessWidget {
  final String cardHolder;
  final String cardNumber;
  final String expiryDate;

  const VisaCardWidget({
    required this.cardHolder,
    required this.cardNumber,
    required this.expiryDate,
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
                  Text("Regular Saving : 890077565"),
                  Row(
                    children: [
                      Image(
                        image: AssetImage(ImageAsset().iconImage),
                        height: 20.sp,
                      ),
                      RowSpacer(0.03),
                      Image(
                        image: AssetImage(ImageAsset().iconImage),
                        height: 20.sp,
                      )
                    ],
                  ),
                ],
              ),
              //

              ColumnSpacer(0.01),
              Text(
                "Rs 4,433,000.00",
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
                      Text("data"),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Holds"),
                      Text("data"),
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
