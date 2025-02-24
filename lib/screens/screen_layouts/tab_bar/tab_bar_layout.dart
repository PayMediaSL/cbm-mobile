import 'package:app/helpers/colors.dart';
import 'package:app/providers/home_screen/tap_selection_provider.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabs;
  final TabSelectionProvider tabSelectionModel;

  CustomTabBar({required this.tabs, required this.tabSelectionModel});

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return SizedBox(
      height: ScreenUtils.height * 0.04,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              tabSelectionModel.setSelectedIndex(index);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0.sp, vertical: 0.0),
              margin: EdgeInsets.symmetric(horizontal: 1.0.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: tabSelectionModel.selectedIndex == index
                    ? AppColors.mainButtonBgColor
                    : AppColors.transparent,
              ),
              child: Center(
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: tabSelectionModel.selectedIndex == index
                        ? AppColors.primaryWhiteColor
                        : AppColors.primaryBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomTabView extends StatelessWidget {
  final List<Widget> tabViews;
  final int selectedIndex;

  CustomTabView({required this.tabViews, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return tabViews[selectedIndex];
  }
}

class ReusableTabBarLayout extends StatelessWidget {
  final List<String> tabs;
  final List<Widget> tabViews;

  ReusableTabBarLayout({required this.tabs, required this.tabViews});

  @override
  Widget build(BuildContext context) {
    final tabSelectionModel = Provider.of<TabSelectionProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      body: Column(
        children: [
          CustomTabBar(tabs: tabs, tabSelectionModel: tabSelectionModel),
          CustomTabView(
              tabViews: tabViews,
              selectedIndex: tabSelectionModel.selectedIndex),
        ],
      ),
    );
  }
}
