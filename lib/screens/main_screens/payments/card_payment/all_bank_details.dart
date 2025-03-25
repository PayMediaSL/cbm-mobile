import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants.dart';
import 'package:app/helpers/povider_helper/common_provider.dart';
import 'package:app/helpers/routes.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllBankDetails extends StatelessWidget {
  AllBankDetails({super.key});
  final List<Map<String, String>> favorites = [
    {
      "name": "BOC",
      "details": "***473",
    },
    {
      "name": "Cargills",
      "details": "***473",
    },
    {
      "name": "Commercial",
      "details": "***473",
    },
    {
      "name": "DFCC",
      "details": "***473",
    },
    {
      "name": "HNB",
      "details": "***473",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var commonProvider = getCommonProvider(context);

    return HomeMainLayout(
        backgroundColor: AppColors.SecondarysubGreyColor,
        isBgContainer1: true,
        isBgContainer2: true,
        isBgContainer1Height: ScreenUtils.height * 0.07,
        onBackIconAvailable: true,
        onBackTitleAvailable: true,
        backTitle: "Card Payment",
        onBackTap: () {
          popScreen(context);
        },
        children: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ColumnSpacer(0.05),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.sp, horizontal: 10.sp),
                    height: ScreenUtils.height * 0.2,
                    width: ScreenUtils.width,
                    decoration: BoxDecoration(
                        color: AppColors.primaryWhiteColor,
                        borderRadius: BorderRadius.circular(UI.borderRadius)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Favourites",
                              style: commonTextStyle.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryBlackColor),
                            ),
                            GestureDetector(
                              onTap: () {
                                commonProvider.toggleStates("bankfavourites");
                              },
                              child: Text(
                                commonProvider.getStates("bankfavourites")
                                    ? "View Less"
                                    : "View All",
                                style: commonTextStyle.copyWith(
                                    decoration: TextDecoration.underline,
                                    color: AppColors.secondarySubBlackColor),
                              ),
                            )
                          ],
                        ),
                        ColumnSpacer(0.02),
                        SizedBox(
                          height: ScreenUtils.height * 0.12,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                commonProvider.getStates("bankfavourites")
                                    ? favorites.length + 1
                                    : (favorites.length >= 2
                                        ? 2 + 1
                                        : favorites.length + 1),
                            itemBuilder: (context, index) {
                              if (index == favorites.length) {
                                return _buildFavoriteCard(
                                  'Add',
                                  '',
                                  Icons.add,
                                  onTap: () {
                                    pushScreen(context,
                                        ScreenRoutes.toCardPaymentDetail);
                                  },
                                );
                              } else {
                                return _buildFavoriteCard(
                                  favorites[index]["name"].toString(),
                                  '***473${index + 3}',
                                  Icons.credit_card,
                                );
                              }
                            },
                          ),
                        ),
                        // _buildFavoriteCard(
                        //     'Card Name', '***4733', Icons.credit_card),
                      ],
                    ),
                  ),
                  ColumnSpacer(0.05),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.sp, horizontal: 10.sp),
                    decoration: BoxDecoration(
                        color: AppColors.primaryWhiteColor,
                        borderRadius: BorderRadius.circular(UI.borderRadius)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Banks",
                          style: commonTextStyle.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryBlackColor),
                        ),
                        ColumnSpacer(0.02),
                        SizedBox(
                          height: ScreenUtils.height * 0.5,
                          child: ListView.separated(
                            scrollDirection: Axis.vertical,
                            itemCount: favorites.length,
                            itemBuilder: (context, index) {
                              return _buildBankTile(
                                favorites[index]["name"] ?? "",
                                Icons.credit_card,
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    ColumnSpacer(0.02),
                          ),
                        ),
                        // _buildFavoriteCard(
                        //     'Card Name', '***4733', Icons.credit_card),
                      ],
                    ),
                  )
                ])));
  }

  Widget _buildFavoriteCard(String name, String details, IconData icon,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: ScreenUtils.width * 0.23,
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.iconGreyColor,
              child: Icon(icon, size: 30, color: AppColors.primaryBlackColor),
            ),
            Text(
              name,
              style: commonTextStyle.copyWith(
                  color: AppColors.primaryBlackColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            if (details.isNotEmpty)
              Text(
                details,
                style: commonTextStyle_black_500_12sp.copyWith(
                  color: AppColors.bottomNavIconColor,
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBankTile(String name, IconData icon) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30.sp,
        backgroundColor: AppColors.iconGreyColor,
        child: Icon(
          icon,
          color: AppColors.primaryBlackColor,
          size: 30,
        ),
      ),
      title: Text(
        name,
        style: commonTextStyle.copyWith(
            fontSize: 15.sp, color: AppColors.primaryBlackColor),
      ),
    );
  }
}
