// ignore_for_file: must_be_immutable, prefer_const_literals_to_create_immutables, use_super_parameters

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/screen_layouts/tab_bar/tab_bar_layout.dart';
import 'package:app/screens/widgets/home_quick_access/home_quick_access.dart';
import 'package:app/screens/widgets/text_fields/custom_search_bar.dart';
import 'package:app/screens/widgets/visa_card/visa_card_widget.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainHomeScreen extends StatefulWidget {
  MainHomeScreen({
    super.key,
  });

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  final List<Map<String, String>> cardData = [
    {
      'availableBalance': 'John Doe',
      'accountNumber': '1',
      'currentBalance': '12/25',
      'accountHold': '12/25',
      'isWallet': 'false',
    },
    {
      'availableBalance': 'John Doe',
      'accountNumber': '2',
      'currentBalance': '12/25',
      'accountHold': '12/25',
      'isWallet': 'true',
    },
    {
      'availableBalance': 'John Doe',
      'accountNumber': '3',
      'currentBalance': '12/25',
      'accountHold': '12/25',
      'isWallet': 'false',
    },
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    ScreenUtil.init(context);

    return HomeMainLayout(
      isBgContainer1Height: ScreenUtils.height * 0.38,
      backgroundColor: AppColors.SecondarysubGreyColor,
      isBgContainer1: true,
      isBgContainer2: true,
      children: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        child: Column(
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
            ColumnSpacer(0.02),
            //! Visa Cards
            CarouselSlider.builder(
              disableGesture: true,
              itemCount: cardData.length + 1,
              options: CarouselOptions(
                height: ScreenUtils.height * 0.25,
                enlargeCenterPage: true,
                enableInfiniteScroll:
                    false, // Disable infinite scroll to prevent looping
              ),
              itemBuilder: (context, index, realIndex) {
                if (index == cardData.length) {
                  return VisaCardWidget(
                    availableBalance: "",
                    accountNumber: "",
                    currentBalance: "",
                    accountHold: "",
                    isLastCard: true,
                    onTapLastCard: () {},
                  );
                } else {
                  final card = cardData[index];
                  bool isWallet = card["isWallet"] == 'true';
                  return VisaCardWidget(
                    availableBalance: card["availableBalance"] ?? "",
                    accountNumber: card["accountNumber"] ?? "",
                    currentBalance: card["currentBalance"] ?? "",
                    accountHold: card["accountHold"] ?? "",
                    isWallet: isWallet,
                  );
                }
              },
            ),

            //! Quick access || In Seperate Widget
            ColumnSpacer(0.03),
            QuickAccessWidget(),
            ColumnSpacer(0.03),

            Transform.scale(
              // scaleY: 0.1,
              scale: 1.05,
              child: Image(
                image: AssetImage(ImageAsset().home_sn_HomeImage),
              ),
            ),
            // Container(
            //   height: ScreenUtils.height * 0.15,
            //   width: ScreenUtils.width,
            //   decoration: BoxDecoration(
            //     color: Colors.red,
            //     image: DecorationImage(
            //       image: AssetImage(ImageAsset().home_sn_HomeImage),
            //       fit: BoxFit
            //           .contain, // Makes the image cover the entire container
            //     ),
            //   ),
            // ),
            ColumnSpacer(0.02),
            //!Tab Item
            Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryWhiteColor,
                  borderRadius: BorderRadius.circular(15.sp)),
              height: ScreenUtils.height * 0.4,
              width: ScreenUtils.width,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ReusableTabBarLayout(
                    tabs: ["Account", "Cards", "Deposit", "Loan"],
                    tabViews: [
                      Center(child: Text("Account Content")),
                      Center(child: Text("Cards Content")),
                      Center(
                        child: Text("Deposit Content"),
                      ),
                      Center(
                        child: Text("Loan Content"),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
