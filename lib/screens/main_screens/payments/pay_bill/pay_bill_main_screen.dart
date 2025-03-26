// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants/ui_constants.dart';
import 'package:app/helpers/povider_helper/common_provider.dart';
import 'package:app/helpers/routes.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/providers/paybill_provider/pay_bill_provider.dart';
import 'package:app/providers/payments/mobile_reload.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/widgets/container/customer_curved_container.dart';
import 'package:app/screens/widgets/custom_tab/custom_tab_bar.dart';
import 'package:app/screens/widgets/favourite/favorite_widget.dart';
import 'package:app/screens/widgets/icons/custom_icons.dart';
import 'package:app/screens/widgets/image/custom_avatar.dart';
import 'package:app/screens/widgets/main_button/main_button.dart';
import 'package:app/screens/widgets/text_style/font_family.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../helpers/text_styles.dart';

class PayBillMainScreen extends StatelessWidget {
  PayBillMainScreen({super.key});
  bool isGridView = true;
  final List<Map<String, String>> favorites = [
    {
      "bank": "***4733",
      "name": "Janu",
    },
    {
      "bank": "***4733",
      "name": "test",
    },
    {
      "bank": "***4733",
      "name": "404ven0m",
    },
    {
      "bank": "***4733",
      "name": "Strix",
    },
    {
      "bank": "***4733",
      "name": "qwe",
    },
  ];
  final List<Map<String, String>> items = [
    {'title': 'Telephone', "image": ImageAsset().iconImageGlobe},
    {'title': 'TV & WiFi', "image": ImageAsset().iconImageSend},
    {'title': 'Electricity', "image": ImageAsset().iconImageBill},
    {'title': 'Water', "image": ImageAsset().iconImageQR},
    {'title': 'Mobile Wallet', "image": ImageAsset().iconImageFavara},
    {'title': 'Leasing', "image": ImageAsset().iconImageReload},
    {'title': 'Education', "image": ImageAsset().iconImageCard},
    {'title': 'Insurance', "image": ImageAsset().iconImageCalendar},
    {'title': 'Sports ', "image": ImageAsset().iconImageCalendar},
    {'title': 'Travel', "image": ImageAsset().iconImageCalendar},
    {'title': 'CreditCard', "image": ImageAsset().iconImageCalendar},
    {'title': 'Corporate', "image": ImageAsset().iconImageCalendar},
    {'title': 'Clubs', "image": ImageAsset().iconImageCalendar},
    {'title': 'Donations', "image": ImageAsset().iconImageCalendar},
    {'title': 'others', "image": ImageAsset().iconImageCalendar},
  ];
  final List<Map<String, dynamic>> billData = [
    {
      'title': 'My mobile bill',
      'phone': '077 888 8888',
      'provider': 'Dialog',
      'account': '098433',
      'runningBalance': 'LKR 2,000',
      'transactionNumber': 'TXN12345',
    },
    {
      'title': 'Home telephone bill',
      'phone': '011 888 8888',
      'provider': 'SLT',
      'account': '765312',
      'runningBalance': 'LKR 5,000',
      'transactionNumber': 'TXN67890',
    },
    {
      'title': 'Anna’s mobile bill',
      'phone': '071 888 8888',
      'provider': 'Mobitel',
      'account': '453540',
      'runningBalance': 'LKR 1,500',
      'transactionNumber': 'TXN11223',
    },
    {
      'title': 'Anna’s mobile bill',
      'phone': '071 888 8888',
      'provider': 'Mobitel',
      'account': '453540',
      'runningBalance': 'LKR 1,500',
      'transactionNumber': 'TXN11223',
    },
    {
      'title': 'Anna’s mobile bill',
      'phone': '071 888 8888',
      'provider': 'Mobitel',
      'account': '453540',
      'runningBalance': 'LKR 1,500',
      'transactionNumber': 'TXN11223',
    },
    {
      'title': 'Anna’s mobile bill',
      'phone': '071 888 8888',
      'provider': 'Mobitel',
      'account': '453540',
      'runningBalance': 'LKR 1,500',
      'transactionNumber': 'TXN11223',
    },
    {
      'title': 'Anna’s mobile bill',
      'phone': '071 888 8888',
      'provider': 'Mobitel',
      'account': '453540',
      'runningBalance': 'LKR 1,500',
      'transactionNumber': 'TXN11223',
    },
    {
      'title': 'Anna’s mobile bill',
      'phone': '071 888 8888',
      'provider': 'Mobitel',
      'account': '453540',
      'runningBalance': 'LKR 1,500',
      'transactionNumber': 'TXN11223',
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
        backTitle: "Pay Bills",
        onBackTap: () {
          popScreen(context);
        },
        children: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ColumnSpacer(0.03),
                  const CustomTabBarwidgetCurved(
                    tabs: [
                      'Pay Bill',
                      'Bill Payment History',
                    ],
                    tabKey: 'paybills',
                  ),
                  ColumnSpacer(0.02),
                  Consumer<TabBarProviderCurved>(
                    builder: (context, provider, _) {
                      if (provider.getSelectedIndex("paybills") == 0) {
                        return payBills(context);
                      } else {
                        return billPaymentHistory();
                      }
                    },
                  ),
                  ColumnSpacer(0.02),
                  Consumer<TabBarProviderCurved>(
                      builder: (BuildContext context,
                              TabBarProviderCurved value, Widget? child) =>
                          value.getSelectedIndex("paybills") == 0
                              ? MainButton(
                                  isMainButton: true,
                                  btnOnPress: () {
                                    pushScreen(context,
                                        ScreenRoutes.toPaySpecificBillScreen);
                                  },
                                  buttontitle: "Proceed to Payment",
                                )
                              : SizedBox())
                ])));
  }

  Widget payBills(BuildContext context) {
    var commonProvider = getCommonProvider(context);
    var isGridView = commonProvider.getStates("paybillgridview");
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCurvedContainer(
          height: ScreenUtils.height * 0.21,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Saved Billers",
                style: commonTextHeadingStyle,
              ),
              ColumnSpacer(0.02),
              SizedBox(
                height: ScreenUtils.height * 0.12,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // Always include the "Add" card
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    return FavoriteCard(
                      name: favorites[index]["name"].toString(),
                      details: favorites[index]["bank"].toString(),
                      image: ImageAsset().authBg,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        ColumnSpacer(0.01),
        CustomCurvedContainer(
          height: ScreenUtils.height * 0.5,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add new Biller",
                      style: commonTextHeadingStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            commonProvider.setStates("paybillgridview", false);
                          },
                          child: Container(
                            height: ScreenUtils.height * 0.045,
                            width: ScreenUtils.height * 0.045,
                            decoration: BoxDecoration(
                                color: !isGridView
                                    ? AppColors.secondarySubBlueColor2
                                    : AppColors.transparent,
                                border: UI_Border.dynamicGridBorder(
                                    isGridView: isGridView),
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(8.sp)),
                            child: Icon(
                              AppIcons.menu,
                              color: !isGridView
                                  ? AppColors.primaryWhiteColor
                                  : AppColors.primarySubBlackColor,
                            ),
                          ),
                        ),
                        RowSpacer(0.03),
                        GestureDetector(
                          onTap: () {
                            commonProvider.setStates("paybillgridview", true);
                          },
                          child: Container(
                            height: ScreenUtils.height * 0.045,
                            width: ScreenUtils.height * 0.045,
                            decoration: BoxDecoration(
                                color: isGridView
                                    ? AppColors.secondarySubBlueColor2
                                    : AppColors.transparent,
                                border: UI_Border.dynamicGridBorder(
                                    isGridView: !isGridView),
                                // border: Border.all(
                                //     color: isGridView
                                //         ? AppColors.transparent
                                //         : AppColors.onBoardActiveColor),
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(8.sp)),
                            child: Icon(
                              AppIcons.gridView,
                              color: isGridView
                                  ? AppColors.primaryWhiteColor
                                  : AppColors.primarySubBlackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // ColumnSpacer(0.02),
                Container(
                  width: ScreenUtils.width,
                  // height: isGridView
                  //     ? ScreenUtils.height * 0.55
                  //     : ScreenUtils.height * 0.6,

                  height: ScreenUtils.height * 0.45,
                  padding:
                      EdgeInsets.symmetric(vertical: 25.sp, horizontal: 10.sp),
                  decoration: BoxDecoration(
                      color: AppColors.primaryWhiteColor,
                      borderRadius: BorderRadius.circular(10.sp)),
                  child: Expanded(
                    child: isGridView
                        ? GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
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
                                    CustomCircleAvatar(
                                      radius: 25.sp,
                                      backgroundColor:
                                          AppColors.bottomNavBgColor,
                                      imagePath: items[index]['image'] ??
                                          ImageAsset().iconImageGlobe,
                                    ),
                                    // CircleAvatar(
                                    //   radius: 25.sp,
                                    //   backgroundColor:
                                    //       AppColors.bottomNavBgColor,
                                    // child: Image(
                                    //   image: AssetImage(items[index]
                                    //           ['image'] ??
                                    //       ImageAsset().iconImageGlobe),
                                    //   height: 27.sp,
                                    // ),
                                    // ),
                                    SizedBox(height: 5.sp),
                                    Text(
                                      items[index]['title']!,
                                      textAlign: TextAlign.center,
                                      style: commonTextStyle.copyWith(
                                          fontSize: 12.sp,
                                          color:
                                              AppColors.primarySubBlackColor),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : ListView.separated(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  _navigateToScreen(context, index);
                                },
                                child: ListTile(
                                  leading: Container(
                                    width: ScreenUtils.width * 0.15,
                                    height: ScreenUtils.width * 0.15,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(8.sp),
                                        color: AppColors.bottomNavBgColor),
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 13.sp, horizontal: 13.sp),
                                        child: Image(
                                          image: AssetImage(items[index]
                                                  ['image'] ??
                                              ImageAsset().iconImageGlobe),
                                        )),
                                  ),
                                  title: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        items[index]['title']!,
                                        style: commonTextStyle.copyWith(
                                            // fontSize: 14.sp,
                                            color: AppColors.primaryBlackColor),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return ColumnSpacer(0.02);
                            },
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget billPaymentHistory() {
    // Ensure `billData` is initialized
    if (billData.isEmpty) {
      return Center(
        child: Text("No bills available."),
      );
    }
    return CustomCurvedContainer(
      height: ScreenUtils.height * 0.6,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: ScreenUtils.width * 0.2,
                height: ScreenUtils.height * 0.05,
                decoration: BoxDecoration(
                    color: AppColors.primaryWhiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.sp),
                      bottomLeft: Radius.circular(10.sp),
                    ),
                    border: Border.all(color: AppColors.textFieldBorderColor2)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Filter",
                        style: commonTextStyle.copyWith(
                            color: AppColors.primaryBlackColor),
                      ),
                      RowSpacer(0.01),
                      Image(
                        image: AssetImage(ImageAsset().iconImageFilter),
                        height: 15.sp,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: ScreenUtils.width * 0.2,
                height: ScreenUtils.height * 0.05,
                decoration: BoxDecoration(
                    color: AppColors.primaryWhiteColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.sp),
                      bottomRight: Radius.circular(10.sp),
                    ),
                    border: Border.all(color: AppColors.textFieldBorderColor2)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sort",
                        style: commonTextStyle.copyWith(
                            color: AppColors.primaryBlackColor),
                      ),
                      RowSpacer(0.01),
                      Image(
                        image: AssetImage(ImageAsset().iconImagearrowupanddown),
                        height: 15.sp,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          ColumnSpacer(0.01),
          SizedBox(
            height: ScreenUtils.height * 0.5,
            child: ListView.builder(
              itemCount: billData.length,
              itemBuilder: (context, index) {
                return Consumer<PayBillProvider>(
                  builder: (context, provider, child) {
                    provider.initializeState(billData.length);

                    final isExpanded = provider.isExpanded(index);
                    final bill = billData[index];

                    return ExpandableTile(
                      title: bill['title'],
                      phone: bill['phone'],
                      provider: bill['provider'],
                      account: bill['account'],
                      runningBalance: bill['runningBalance'],
                      transactionNumber: bill['transactionNumber'],
                      isExpanded: isExpanded,
                      onTap: () => provider.toggleExpansion(index),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToScreen(BuildContext context, int index) {
    switch (index) {
      case 0:
        // Navigate to QR Screen
        pushScreen(context, ScreenRoutes.toQRScreenScan);
        break;
      case 1:
        pushScreen(context, ScreenRoutes.toDrawerDetailsUpdate);
        break;
      case 2:
        pushScreen(context, ScreenRoutes.toAboutYouScreen);
        break;

      case 3:
        pushScreen(context, ScreenRoutes.toQRScreenScan);
        break;
      case 4:
        pushScreen(context, ScreenRoutes.toDrawerDetailsUpdate);
        break;
      case 5:
        pushScreen(context, ScreenRoutes.toAboutYouScreen);
        break;
      case 6:
        pushScreen(context, ScreenRoutes.toallBankSDetails);
        break;
      case 7:
        pushScreen(context, ScreenRoutes.toQRScreenScan);
        break;

      default:
        // Fallback navigation or error
        break;
    }
  }
}

class ExpandableTile extends StatelessWidget {
  final String title;
  final String phone;
  final String provider;
  final String account;
  final String runningBalance;
  final String transactionNumber;
  final bool isExpanded;
  final VoidCallback onTap;

  const ExpandableTile({
    Key? key,
    required this.title,
    required this.phone,
    required this.provider,
    required this.account,
    required this.runningBalance,
    required this.transactionNumber,
    required this.isExpanded,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 5.sp),
        margin: EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          color: isExpanded ? Colors.blue[50] : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    width: ScreenUtils.width * 0.12,
                    height: ScreenUtils.width * 0.12,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8.sp),
                        color: AppColors.bottomNavBgColor),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.sp, horizontal: 10.sp),
                      child:
                          Image(image: AssetImage(ImageAsset().checkmarkImage)),
                    )),
                RowSpacer(0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: commonTextHeadingStyle.copyWith(
                            fontFamily: secondaryFontFamily,
                            fontWeight: FontWeight.w400)),
                    Text(
                      phone,
                      style: commonTextHeadingStyle.copyWith(
                          fontSize: 13.sp,
                          color: AppColors.onBoardSubTextStyleColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(provider,
                        style: commonTextHeadingStyle.copyWith(
                            fontSize: 14.sp, fontWeight: FontWeight.w400)),
                    Text(
                      account,
                      style: commonTextHeadingStyle.copyWith(
                          fontSize: 11.sp,
                          color: AppColors.onBoardSubTextStyleColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
            if (isExpanded) ...[
              ColumnSpacer(0.02),
              Padding(
                padding: EdgeInsets.only(left: 55.sp),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Reference Number',
                            style: commonTextHeadingStyle.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.onBoardSubTextStyleColor,
                                fontWeight: FontWeight.w400)),
                        // RowSpacer(0.1),
                        Text('$transactionNumber',
                            style: commonTextHeadingStyle.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.onBoardSubTextStyleColor,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Running Balance',
                            style: commonTextHeadingStyle.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.onBoardSubTextStyleColor,
                                fontWeight: FontWeight.w400)),
                        // RowSpacer(0.14),
                        Text('$runningBalance',
                            style: commonTextHeadingStyle.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.onBoardSubTextStyleColor,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
