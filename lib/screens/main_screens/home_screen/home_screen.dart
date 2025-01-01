// ignore_for_file: must_be_immutable, prefer_const_literals_to_create_immutables, use_super_parameters, sized_box_for_whitespace

import 'dart:math';

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/povider_helper/common_provider.dart';
import 'package:app/helpers/routes.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/home_screen/contacts_data_provider.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/screen_layouts/tab_bar/tab_bar_layout.dart';
import 'package:app/screens/widgets/home_screen/graph_screen/graph_screen.dart';
import 'package:app/screens/widgets/home_screen/home_account_tile/home_account_tile.dart';
import 'package:app/screens/widgets/home_screen/home_contatcs/home_contacts.dart';
import 'package:app/screens/widgets/home_screen/home_quick_access/home_quick_access.dart';
import 'package:app/screens/widgets/text_fields/custom_search_bar.dart';
import 'package:app/screens/widgets/visa_card/visa_card_widget.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
    {
      'availableBalance': 'John Doe',
      'accountNumber': '3',
      'currentBalance': '12/25',
      'accountHold': '12/25',
      'isWallet': 'false',
    },
  ];

  // Dummy list with 5 account data
  final List<Map<String, String>> accountData = [
    {
      "title": "Account 1",
      "subtitle": "Account 12345",
      "amount": "12000",
      "holds": "00"
    },
    {
      "title": "Account 2",
      "subtitle": "Account 67890",
      "amount": "10000",
      "holds": "50"
    },
    {
      "title": "Account 3",
      "subtitle": "Account 45678",
      "amount": "8000",
      "holds": "10"
    },
    {
      "title": "Account 4",
      "subtitle": "Account 98765",
      "amount": "15000",
      "holds": "20"
    },
    {
      "title": "Account 5",
      "subtitle": "Account 24680",
      "amount": "20000",
      "holds": "30"
    },
  ];
  final List<Map<String, String>> LifeStyle = [
    {
      "title": "Food",
      "image": ImageAsset().iconImageFood,
    },
    {
      "title": "Entertainment",
      "image": ImageAsset().iconImageEntertainment,
    },
    {
      "title": "Health",
      "image": ImageAsset().iconImageHealth,
    },
    {
      "title": "Insurance",
      "image": ImageAsset().iconImageInsurance,
    },
    {
      "title": "Gaming",
      "image": ImageAsset().iconImageGaming,
    },
    {
      "title": "Ecommerce",
      "image": ImageAsset().iconImageEcommerce,
    },
    {
      "title": "Transport",
      "image": ImageAsset().iconImageTransport,
    },
    {
      "title": "Education",
      "image": ImageAsset().iconImageEducation,
    },
  ];

  final List<Map<String, String>> doMore = [
    {
      "title": "Open new fixed deposit in seconds",
      "image": ImageAsset().doMoreImg1,
    },
    {
      "title": "Connect your bank accounts easily",
      "image": ImageAsset().doMoreImg2,
    },
    {
      "title": "Need Funds? Apply for a quick loan",
      "image": ImageAsset().doMoreImg3,
    },
    {
      "title": "Create new savings goals and save more!",
      "image": ImageAsset().doMoreImg4,
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

                GestureDetector(
                  onTap: () {
                    // print("jhajajajajjaa");
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const NotificationScreen()),
                    // );
                    pushScreen(context, ScreenRoutes.toNotificationScreen);
                  },
                  child: Image(
                    image: AssetImage(ImageAsset().iconImageNotification),
                    height: 25.sp,
                  ),
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
                    maskindex: index,
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

            ColumnSpacer(0.02),
            //!Tab Item
            Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryWhiteColor,
                  borderRadius: BorderRadius.circular(15.sp)),
              height: ScreenUtils.height * 0.5,
              width: ScreenUtils.width,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ReusableTabBarLayout(
                    tabs: ["Account", "Cards", "Deposit", "Loan"],
                    tabViews: [
                      _buildAccountTab(),
                      _buildCardsTab(),
                      _buildDepositTab(),
                      _buildLoanTab()
                    ],
                  )),
            ),
            ColumnSpacer(0.02),

            //! Send Money
            Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryWhiteColor,
                  borderRadius: BorderRadius.circular(15.sp)),
              height: ScreenUtils.height * 0.2,
              width: ScreenUtils.width,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 5.sp, horizontal: 15.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Send Money",
                      style: homeScreenTitleStyle,
                    ),
                    ColumnSpacer(0.01),
                    Consumer<ContactsProvider>(
                      builder: (context, provider, child) {
                        if (provider.isLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (provider.contacts.isEmpty) {
                          return const Center(child: Text("No contacts found"));
                        }
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.14,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: provider.contacts.length,
                            itemBuilder: (context, index) {
                              // Generate initials for contact
                              String initials = provider.getContactInitials(
                                  provider.contacts[index].name);
                              // Randomly select a color from the available colors
                              Color containerColor = _getRandomColor();
                              return ContactItem(
                                bank: "BOC",
                                initials: initials,
                                contactName:
                                    provider.contacts[index].name ?? "",
                                containerColor: containerColor,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            ColumnSpacer(0.02),

            //! Life Style
            // Container(
            //   decoration: BoxDecoration(
            //       color: AppColors.primaryWhiteColor,
            //       borderRadius: BorderRadius.circular(15.sp)),
            //   height: ScreenUtils.height * 0.3,
            //   width: ScreenUtils.width,
            // )

            Container(
              height: ScreenUtils.height * 0.28,
              width: ScreenUtils.width,
              decoration: BoxDecoration(
                color: AppColors.primaryWhiteColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.sp, horizontal: 15.sp),
                    child: Text(
                      "Life Style",
                      style: homeScreenTitleStyle,
                    ),
                  ),
                  ColumnSpacer(0.015),
                  Container(
                    height: ScreenUtils.height * 0.2,
                    width: ScreenUtils.width,
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        // crossAxisSpacing: 2.0,
                        // mainAxisSpacing: 8.0,
                      ),
                      itemCount: LifeStyle.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                print(index);
                                if (LifeStyle[index]["title"] == "Food") {
                                  pushScreen(
                                      context, ScreenRoutes.toLifeStyleFood);
                                } else if (LifeStyle[index]["title"] ==
                                    "Entertainment") {
                                  pushScreen(context,
                                      ScreenRoutes.toLifeStyleEntertainment);
                                } else if (LifeStyle[index]["title"] ==
                                    "Health") {
                                  pushScreen(
                                      context, ScreenRoutes.toLifeStyleHealth);
                                } else if (LifeStyle[index]["title"] ==
                                    "Insurance") {
                                  pushScreen(context,
                                      ScreenRoutes.toLifeStyleInsurance);
                                } else if (LifeStyle[index]["title"] ==
                                    "Gaming") {
                                  pushScreen(
                                      context, ScreenRoutes.toLifeStyleGaming);
                                } else if (LifeStyle[index]["title"] ==
                                    "Ecommerce") {
                                  pushScreen(context,
                                      ScreenRoutes.toLifeStyleEcommerce);
                                } else if (index == 6) {
                                  pushScreen(context,
                                      ScreenRoutes.toLifeStyleTransport);
                                } else if (LifeStyle[index]["title"] ==
                                    "Education") {
                                  pushScreen(context,
                                      ScreenRoutes.toLifeStyleEducation);
                                }
                              },
                              child: CircleAvatar(
                                backgroundColor: _getBackgroundColor(index),
                                radius: 20.sp,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image(
                                      image: AssetImage(LifeStyle[index]
                                              ["image"] ??
                                          ImageAsset().iconImageMoney1)),
                                ),
                              ),
                            ),
                            SizedBox(height: 5.0.sp),
                            SizedBox(
                              child: Text(
                                LifeStyle[index]["title"] ?? "",
                                // style: Theme.of(context)
                                //     .textTheme
                                //     .displaySmall
                                //     ?.copyWith(fontSize: 11.sp)

                                style: commonTextStyle.copyWith(
                                    fontSize: 11.sp, color: AppColors.black),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            ColumnSpacer(0.02),
            Container(
              height: ScreenUtils.height * 0.4,
              width: ScreenUtils.width,
              decoration: BoxDecoration(
                color: AppColors.primaryWhiteColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.sp, horizontal: 15.sp),
                    child: Text(
                      "Balance Summary",
                      style: homeScreenTitleStyle,
                    ),
                  ),
                  BalanceSummaryChart(),
                ],
              ),
            ),
            //! Do morwe with one app

            ColumnSpacer(0.02),
            Container(
              height: ScreenUtils.height * 0.22,
              width: ScreenUtils.width,
              decoration: BoxDecoration(
                color: AppColors.primaryWhiteColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.sp, horizontal: 15.sp),
                    child: Text(
                      "Do more with oneapp",
                      style: homeScreenTitleStyle,
                    ),
                  ),
                  ColumnSpacer(0.015),
                  SizedBox(
                    height: ScreenUtils.height * 0.13,
                    width: ScreenUtils.width,
                    child: CarouselSlider.builder(
                      disableGesture: true,
                      itemCount: cardData.length,
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayAnimationDuration: Duration(milliseconds: 300),
                        height: ScreenUtils.height * 0.25,
                        enlargeCenterPage: true,
                        enableInfiniteScroll:
                            false, // Disable infinite scroll to prevent looping
                      ),
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          width: ScreenUtils.width * 0.7,
                          decoration: BoxDecoration(
                              color: _getBackgroundColor2(index),
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(doMore[index]["image"] ??
                                    ImageAsset().billingImage),
                                height: ScreenUtils.height * 0.07,
                              ),
                              Container(
                                // color: Colors.blue,
                                height: ScreenUtils.height * 0.05,
                                width: ScreenUtils.width * 0.4,
                                child: Text(
                                  doMore[index]["title"] ?? "",
                                  style: homeScreenTitleStyle.copyWith(
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor2(int index) {
    List<Color> colors = [
      AppColors.doDoMoreColor1,
      AppColors.doDoMoreColor2,
      AppColors.doDoMoreColor3,
      AppColors.doDoMoreColor4,
    ];
    return colors[index % colors.length];
  }

  Color _getBackgroundColor(int index) {
    List<Color> colors = [
      AppColors.homeLifestyleFood,
      AppColors.homeLifestyleEntertainment,
      AppColors.homeLifestyleHealth,
      AppColors.homeLifestyleInsurance,
      AppColors.homeLifestyleGaming,
      AppColors.homeLifestyleEcommerce,
      AppColors.homeLifestyleTrabsport,
      AppColors.homeLifestyleEducation,
    ];
    return colors[index % colors.length];
  }

  Color _getRandomColor() {
    final random = Random();
    return Colors.primaries[random.nextInt(Colors.primaries.length)];
  }

//! Build Accountsssssssss
  Widget _buildAccountTab() {
    var commonProvider = getCommonProvider(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0.sp, horizontal: 10.0.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //! SAvings Account
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Savings Accounts", style: homeScreenTitleStyle),
              GestureDetector(
                onTap: () {
                  commonProvider.toggleStates("homesavingsaccountviewall");
                },
                child: Text(
                  commonProvider.getStates("homesavingsaccountviewall")
                      ? "View Less"
                      : "View All",
                  style: commonTextStyle.copyWith(
                      decoration: TextDecoration.underline,
                      color: AppColors.primaryBlackColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          ColumnSpacer(0.01),
          Container(
            height: ScreenUtils.height * 0.15,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  commonProvider.getStates("homesavingsaccountviewall")
                      ? accountData.length
                      : 2,
                  (index) => HomeAccountTile(
                    holdTitle: "Holds",
                    title: accountData[index]["title"]!,
                    subtitle: accountData[index]["subtitle"]!,
                    amount: accountData[index]["amount"]!,
                    holds: accountData[index]["holds"]!,
                  ),
                ),
              ),
            ),
          ),

          ColumnSpacer(0.01),

//! Current Accounts
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Current Accounts", style: homeScreenTitleStyle),
              GestureDetector(
                onTap: () {
                  commonProvider.toggleStates("homecurrentaccountviewall");
                },
                child: Text(
                  commonProvider.getStates("homecurrentaccountviewall")
                      ? "View Less"
                      : "View All",
                  style: commonTextStyle.copyWith(
                      decoration: TextDecoration.underline,
                      color: AppColors.primaryBlackColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          ColumnSpacer(0.01),
          Container(
            height: ScreenUtils.height * 0.15,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  commonProvider.getStates("homecurrentaccountviewall")
                      ? accountData.length
                      : 2,
                  (index) => HomeAccountTile(
                    holdTitle: "Holds",
                    image: ImageAsset().iconArrowLeftRight,
                    title: accountData[index]["title"]!,
                    subtitle: accountData[index]["subtitle"]!,
                    amount: accountData[index]["amount"]!,
                    holds: accountData[index]["holds"]!,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //! Build Cardssssssss

  Widget _buildCardsTab() {
    var commonProvider = getCommonProvider(context);
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0.sp, horizontal: 10.0.sp),
        child: Container(
          height: ScreenUtils.height * 0.4,
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //! Credits Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Credits Cards", style: homeScreenTitleStyle),
                  GestureDetector(
                    onTap: () {
                      commonProvider.toggleStates("homecreditcardviewall");
                    },
                    child: Text(
                      commonProvider.getStates("homecreditcardviewall")
                          ? "View Less"
                          : "View All",
                      style: commonTextStyle.copyWith(
                          decoration: TextDecoration.underline,
                          color: AppColors.primaryBlackColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              // ColumnSpacer(0.01),
              Container(
                height: ScreenUtils.height * 0.2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // Horizontal scrolling
                  child: Row(
                    children: List.generate(
                      commonProvider.getStates("homecreditcardviewall")
                          ? cardData.length
                          : 2,
                      (index) {
                        final card = cardData[index];
                        return Row(
                          children: [
                            VisaCardWidget2(
                              cardHeight: ScreenUtils.width * 0.33,
                              cardwidth: ScreenUtils.width * 0.6,
                              availableBalance: card["availableBalance"] ?? "",
                              accountNumber: card["accountNumber"] ?? "",
                            ),
                            // Add a separator after every card except the last one
                            if (index !=
                                (commonProvider
                                            .getStates("homecreditcardviewall")
                                        ? cardData.length
                                        : 2) -
                                    1)
                              RowSpacer(0.02), // Separator with 10px spacing
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),

              //! Prepaid Card

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Prepaid Cards", style: homeScreenTitleStyle),
                  GestureDetector(
                    onTap: () {
                      commonProvider.toggleStates("homeprepaidcardviewall");
                    },
                    child: Text(
                      commonProvider.getStates("homeprepaidcardviewall")
                          ? "View Less"
                          : "View All",
                      style: commonTextStyle.copyWith(
                          decoration: TextDecoration.underline,
                          color: AppColors.primaryBlackColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              // ColumnSpacer(0.01),
              Container(
                height: ScreenUtils.height * 0.2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // Horizontal scrolling
                  child: Row(
                    children: List.generate(
                      commonProvider.getStates("homeprepaidcardviewall")
                          ? cardData.length
                          : 2,
                      (index) {
                        final card = cardData[index];
                        return Row(
                          children: [
                            VisaCardWidget2(
                              gradientColor1: Colors.red,
                              cardHeight: ScreenUtils.width * 0.33,
                              cardwidth: ScreenUtils.width * 0.6,
                              availableBalance: card["availableBalance"] ?? "",
                              accountNumber: card["accountNumber"] ?? "",
                            ),
                            // Add a separator after every card except the last one
                            if (index !=
                                (commonProvider
                                            .getStates("homeprepaidcardviewall")
                                        ? cardData.length
                                        : 2) -
                                    1)
                              RowSpacer(0.02), // Separator with 10px spacing
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),

              //! Debit card

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Debit Cards", style: homeScreenTitleStyle),
                  GestureDetector(
                    onTap: () {
                      commonProvider.toggleStates("homedebitcardviewall");
                    },
                    child: Text(
                      commonProvider.getStates("homedebitcardviewall")
                          ? "View Less"
                          : "View All",
                      style: commonTextStyle.copyWith(
                          decoration: TextDecoration.underline,
                          color: AppColors.primaryBlackColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              // ColumnSpacer(0.01),
              Container(
                height: ScreenUtils.height * 0.2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // Horizontal scrolling
                  child: Row(
                    children: List.generate(
                      commonProvider.getStates("homedebitcardviewall")
                          ? cardData.length
                          : 2,
                      (index) {
                        final card = cardData[index];
                        return Row(
                          children: [
                            VisaCardWidget2(
                              gradientColor1: Colors.grey,
                              cardHeight: ScreenUtils.width * 0.33,
                              cardwidth: ScreenUtils.width * 0.6,
                              availableBalance: card["availableBalance"] ?? "",
                              accountNumber: card["accountNumber"] ?? "",
                            ),
                            // Add a separator after every card except the last one
                            if (index !=
                                (commonProvider
                                            .getStates("homedebitcardviewall")
                                        ? cardData.length
                                        : 2) -
                                    1)
                              RowSpacer(0.02), // Separator with 10px spacing
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }

  //! Build Depositssssss

  Widget _buildDepositTab() {
    var commonProvider = getCommonProvider(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0.sp, horizontal: 10.0.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //! Timw Account
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Time Deposite ", style: homeScreenTitleStyle),
              GestureDetector(
                onTap: () {
                  commonProvider.toggleStates("homedepositeTimesviewall");
                },
                child: Text(
                  commonProvider.getStates("homedepositeTimesviewall")
                      ? "View Less"
                      : "View All",
                  style: commonTextStyle.copyWith(
                      decoration: TextDecoration.underline,
                      color: AppColors.primaryBlackColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          ColumnSpacer(0.01),
          Container(
            height: ScreenUtils.height * 0.15,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  commonProvider.getStates("homedepositeTimesviewall")
                      ? accountData.length
                      : 2,
                  (index) => HomeAccountTile(
                    image: ImageAsset().userImage,
                    holdTitle: "NIP",
                    title: accountData[index]["title"]!,
                    subtitle: accountData[index]["subtitle"]!,
                    amount: accountData[index]["amount"]!,
                    holds: accountData[index]["holds"]!,
                  ),
                ),
              ),
            ),
          ),

          ColumnSpacer(0.01),

//! Savings Goals
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Savings Goals", style: homeScreenTitleStyle),
              GestureDetector(
                onTap: () {
                  commonProvider.toggleStates("homedepositeSavingsviewall");
                },
                child: Text(
                  commonProvider.getStates("homedepositeSavingsviewall")
                      ? "View Less"
                      : "View All",
                  style: commonTextStyle.copyWith(
                      decoration: TextDecoration.underline,
                      color: AppColors.primaryBlackColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          ColumnSpacer(0.01),
          Container(
            height: ScreenUtils.height * 0.15,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  commonProvider.getStates("homedepositeSavingsviewall")
                      ? accountData.length
                      : 2,
                  (index) => HomeAccountTile(
                    image: ImageAsset().userImage,
                    title: accountData[index]["title"]!,
                    subtitle: "Remaining Balance",
                    amount: accountData[index]["amount"]!,
                    holds: accountData[index]["holds"]!,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //! Build Loans

  Widget _buildLoanTab() {
    var commonProvider = getCommonProvider(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0.sp, horizontal: 10.0.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //! term loan
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Term Loan ", style: homeScreenTitleStyle),
              GestureDetector(
                onTap: () {
                  commonProvider.toggleStates("homeLoanTermviewall");
                },
                child: Text(
                  commonProvider.getStates("homeLoanTermviewall")
                      ? "View Less"
                      : "View All",
                  style: commonTextStyle.copyWith(
                      decoration: TextDecoration.underline,
                      color: AppColors.primaryBlackColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          ColumnSpacer(0.01),
          Container(
            height: ScreenUtils.height * 0.15,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  commonProvider.getStates("homeLoanTermviewall")
                      ? accountData.length
                      : 2,
                  (index) => HomeAccountTile(
                    image: ImageAsset().userImage,
                    holdTitle: "NIP",
                    title: accountData[index]["title"]!,
                    subtitle: accountData[index]["subtitle"]!,
                    amount: accountData[index]["amount"]!,
                    holds: accountData[index]["holds"]!,
                  ),
                ),
              ),
            ),
          ),

          ColumnSpacer(0.01),

//! Leasing Goals
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Leasing", style: homeScreenTitleStyle),
              GestureDetector(
                onTap: () {
                  commonProvider.toggleStates("homeLoanLeasingviewall");
                },
                child: Text(
                  commonProvider.getStates("homeLoanLeasingviewall")
                      ? "View Less"
                      : "View All",
                  style: commonTextStyle.copyWith(
                      decoration: TextDecoration.underline,
                      color: AppColors.primaryBlackColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          ColumnSpacer(0.01),
          Container(
            height: ScreenUtils.height * 0.15,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  commonProvider.getStates("homeLoanLeasingviewall")
                      ? accountData.length
                      : 2,
                  (index) => HomeAccountTile(
                    holdTitle: "NIP",
                    image: ImageAsset().userImage,
                    title: accountData[index]["title"]!,
                    subtitle: accountData[index]["subtitle"]!,
                    amount: accountData[index]["amount"]!,
                    holds: accountData[index]["holds"]!,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
