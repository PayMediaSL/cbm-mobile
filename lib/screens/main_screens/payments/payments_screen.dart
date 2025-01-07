// ignore_for_file: must_be_immutable

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/povider_helper/common_provider.dart';
import 'package:app/helpers/routes.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  bool isGridView = true; // Toggle between Grid and List view
  //  ImageAsset().iconImageGlobe,
  //   ImageAsset().iconImageSend,
  //   ImageAsset().iconImageBill,
  //   ImageAsset().iconImageQR,
  //   ImageAsset().iconImageFavara,
  //   ImageAsset().iconImageCard,
  //   ImageAsset().iconImageReload,
  //   ImageAsset().iconImageCalendar,

  final List<Map<String, String>> items = [
    {
      'title': 'Global Transfers',
      "subtitle": "Transfer money across accounts worldwide",
      "image": ImageAsset().iconImageGlobe
    },
    {
      'title': 'Local Transfers',
      "subtitle": "Transfer money across accounts within the country",
      "image": ImageAsset().iconImageSend
    },
    {
      'title': 'Pay Bills',
      "subtitle": "Pay your utility bills",
      "image": ImageAsset().iconImageBill
    },
    {
      'title': 'QR Pay',
      "subtitle": "Scan the QR code to make payments",
      "image": ImageAsset().iconImageQR
    },
    {
      'title': 'Favara Pay',
      "subtitle": "Make payments through FAVARA portal",
      "image": ImageAsset().iconImageFavara
    },
    {
      'title': 'Mobile Reload',
      "subtitle": "Settle your credit card bills",
      "image": ImageAsset().iconImageReload
    },
    {
      'title': 'Card payment',
      "subtitle": "Transfer credit to your mobile number",
      "image": ImageAsset().iconImageCard
    },
    {
      'title': 'Scheduled Payment',
      "subtitle": "Add money to your wallet",
      "image": ImageAsset().iconImageCalendar
    },
  ];

  @override
  Widget build(BuildContext context) {
    var commonProvider = getCommonProvider(context);
    var isGridView = commonProvider.getStates("gridview");
    return HomeMainLayout(
      backgroundColor: AppColors.SecondarysubGreyColor,
      isBgContainer1: true,
      isBgContainer2: true,
      isBgContainer1Height: ScreenUtils.height * 0.07,
      onBackIconAvailable: true,
      onBackTitleAvailable: true,
      onBackTap: () {},
      backTitle: "Payments",
      children: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColumnSpacer(0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    commonProvider.setStates("gridview", false);
                  },
                  child: Container(
                    height: ScreenUtils.height * 0.045,
                    width: ScreenUtils.height * 0.045,
                    decoration: BoxDecoration(
                        color: !isGridView
                            ? AppColors.secondarySubBlueColor2
                            : AppColors.transparent,
                        border: Border.all(
                            color: !isGridView
                                ? AppColors.transparent
                                : AppColors.onBoardActiveColor),
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(8.sp)),
                    child: Icon(
                      Icons.menu_rounded,
                      color: !isGridView
                          ? AppColors.primaryWhiteColor
                          : AppColors.primarySubBlackColor,
                    ),
                  ),
                ),
                RowSpacer(0.03),
                GestureDetector(
                  onTap: () {
                    commonProvider.setStates("gridview", true);
                  },
                  child: Container(
                    height: ScreenUtils.height * 0.045,
                    width: ScreenUtils.height * 0.045,
                    decoration: BoxDecoration(
                        color: isGridView
                            ? AppColors.secondarySubBlueColor2
                            : AppColors.transparent,
                        border: Border.all(
                            color: isGridView
                                ? AppColors.transparent
                                : AppColors.onBoardActiveColor),
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(8.sp)),
                    child: Icon(
                      Icons.grid_view,
                      color: isGridView
                          ? AppColors.primaryWhiteColor
                          : AppColors.primarySubBlackColor,
                    ),
                  ),
                ),
              ],
            ),
            ColumnSpacer(0.03),
            Container(
              width: ScreenUtils.width,
              // height: isGridView
              //     ? ScreenUtils.height * 0.55
              //     : ScreenUtils.height * 0.6,

              height: isGridView
                  ? ScreenUtils.height * 0.43
                  : ScreenUtils.height * 0.6,
              padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 10.sp),
              decoration: BoxDecoration(
                  color: AppColors.primaryWhiteColor,
                  borderRadius: BorderRadius.circular(10.sp)),
              child: Expanded(
                child: isGridView
                    ? GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              _navigateToScreen(context, index);
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 25.sp,
                                  backgroundColor: AppColors.bottomNavBgColor,
                                  child: Image(
                                    image: AssetImage(items[index]['image'] ??
                                        ImageAsset().iconImageGlobe),
                                    height: 27.sp,
                                  ),
                                ),
                                SizedBox(height: 5.sp),
                                Text(
                                  items[index]['title']!,
                                  textAlign: TextAlign.center,
                                  style: commonTextStyle.copyWith(
                                      fontSize: 13.sp,
                                      color: AppColors.primarySubBlackColor),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              _navigateToScreen(context, index);
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 25.sp,
                                backgroundColor: _getBackgroundColor(index),
                                child: Image(
                                  image: AssetImage(items[index]['image'] ??
                                      ImageAsset().iconImageGlobe),
                                  height: 27.sp,
                                ),
                              ),
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items[index]['title']!,
                                    style: commonTextStyle.copyWith(
                                        fontSize: 15.sp,
                                        color: AppColors.primaryBlackColor),
                                  ),
                                  Text(
                                    items[index]['subtitle']!,
                                    style: commonTextStyle.copyWith(
                                        color:
                                            AppColors.onBoardSubTextStyleColor),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, int index) {
    switch (index) {
      case 0:
        // Navigate to QR Screen
        pushScreen(context, ScreenRoutes.toGlobalTransferMain);
        break;
      case 1:
        pushScreen(context, ScreenRoutes.toLocalTransferMainScreen);
        break;
      case 2:
        pushScreen(context, ScreenRoutes.toMainMessageScreen);
        break;

      case 3:
        pushScreen(context, ScreenRoutes.toQRScreenScan);
        break;
      case 4:
        pushScreen(context, ScreenRoutes.toDrawerDetailsUpdate);
        break;
      case 5:
        pushScreen(context, ScreenRoutes.toMobileReload);
        break;
      case 6:
        pushScreen(context, ScreenRoutes.toallBankSDetails);
        break;
      case 7:
        pushScreen(context, ScreenRoutes.toMySchedulesPayment);
        break;

      default:
        // Fallback navigation or error
        break;
    }
  }

  Color _getBackgroundColor(int index) {
    List<Color> colors = [
      AppColors.paymentGlobalTransferColor,
      AppColors.paymentDomesticTransferColor,
      AppColors.paymentPaybillColor,
      AppColors.paymentQRPayColor,
      AppColors.paymentfavraPayColor,
      AppColors.paymentcardPaymentcolor,
      AppColors.paymentMobileReload,
      AppColors.paymentSchedulePayment,
    ];
    return colors[index % colors.length];
  }

  // AssetImage _getBackgroundImage(int index) {
  //   List<String> imagePaths = [
  //     ImageAsset().iconImageGlobe,
  //     ImageAsset().iconImageSend,
  //     ImageAsset().iconImageBill,
  //     ImageAsset().iconImageQR,
  //     ImageAsset().iconImageFavara,
  //     ImageAsset().iconImageCard,
  //     ImageAsset().iconImageReload,
  //     ImageAsset().iconImageCalendar,
  //   ];
  //   return AssetImage(imagePaths[index % imagePaths.length]);
  // }
}
