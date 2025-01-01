import 'dart:ui';

import 'package:app/helpers/colors.dart';
import 'package:app/providers/bottom_navigation/bottom_navigation_bar_provider.dart';
import 'package:app/screens/main_screens/drawer/main_drawer_screen.dart';
import 'package:app/screens/main_screens/home_screen/home_screen.dart';
import 'package:app/screens/main_screens/menu/menu_screen.dart';
import 'package:app/screens/main_screens/payments/payments_screen.dart';
import 'package:app/screens/main_screens/transaction/transaction_screen.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/device_info_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BottomBavigationScreen extends StatefulWidget {
  const BottomBavigationScreen({super.key});

  @override
  State<BottomBavigationScreen> createState() => _BottomBavigationScreenState();
}

class _BottomBavigationScreenState extends State<BottomBavigationScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<String> deviceModel() async {
    Map deviceInfo = await DeviceInfoUtil().getDeviceInfo();
    String appVersion = deviceInfo['app_version'];
    return appVersion;
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<BottomNavProvider>(context, listen: false);

    return GestureDetector(
      child: RefreshIndicator(
        color: AppColors.primaryRedShadeColor,
        backgroundColor: AppColors.white,
        displacement: 100,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async {
          if (model.selectedIndex == 0) {}
        },
        child: Consumer<BottomNavProvider>(
            builder: (BuildContext context, model, Widget? child) {
          return FutureBuilder(
              future: deviceModel(),
              builder: (context, snapshot) {
                return Scaffold(
                  body: SafeArea(
                    top: false,
                    bottom: false,
                    child: model.currentScreen,
                  ),
                  bottomNavigationBar: _buildBottomAppBar(),
                  drawerEnableOpenDragGesture: true,
                  drawer: MainDrawerScreen(),
                );
              });
        }),
      ),
    );
  }

// color: isActive ? AppColors.bottomNavBgColor : AppColors.transparent,
  Widget _bottomBarItem({
    required String icon,
    required bool isActive,
    required String deactivateIcon,
    required VoidCallback onTap,
    required String name,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: isActive ? AppColors.bottomNavBgColor : AppColors.transparent,
        // color: Colors.red,
        width: ScreenUtils.width * 0.18,
        height: ScreenUtils.width * 0.2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'bottom_icon',
              transitionOnUserGestures: true,
              child: Image.asset(
                isActive ? icon : deactivateIcon,
                width: ScreenUtils.width * 0.05,
                color: isActive
                    ? AppColors.secondarySubBlueColor2
                    : AppColors.bottomNavIconColor,
              ),
            ),
            SizedBox(height: 2.sp),
            Text(
              name,
              style: TextStyle(
                fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
                fontSize: 10.sp,
                color: isActive
                    ? AppColors.secondarySubBlueColor2
                    : AppColors.bottomNavIconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  BottomAppBar _buildBottomAppBar() {
    return BottomAppBar(
      notchMargin: 10.0,
      // shape: const CircularNotchedRectangle(),
      height: ScreenUtils.height * 0.09,
      color: AppColors.white,
      child: Consumer<BottomNavProvider>(
        builder: (context, model, child) {
          return Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _bottomBarItem(
                  name: "Home",
                  icon: ImageAsset().homeImage,
                  isActive: (model.selectedIndex == 0),
                  deactivateIcon: ImageAsset().homeImage,
                  onTap: () {
                    model.updateIndex(0, MainHomeScreen());
                  },
                ),
                _bottomBarItem(
                  name: "Payments",
                  icon: ImageAsset().bottonmIconpayment,
                  isActive: (model.selectedIndex == 1),
                  deactivateIcon: ImageAsset().bottonmIconpayment,
                  onTap: () {
                    model.updateIndex(1, PaymentScreen());
                  },
                ),
                _bottomBarItem(
                  name: "LifeStyle",
                  icon: ImageAsset().bottonmIconlifestyle,
                  isActive: (model.selectedIndex == 2),
                  deactivateIcon: ImageAsset().bottonmIconlifestyle,
                  onTap: () {
                    // model.updateIndex(2, const TransactionsScreen());
                  },
                ),
                _bottomBarItem(
                  name: "Transactions",
                  icon: ImageAsset().bottonmIcontransactions,
                  isActive: (model.selectedIndex == 3),
                  deactivateIcon: ImageAsset().bottonmIcontransactions,
                  onTap: () {
                    model.updateIndex(3, TransactionsScreen());
                  },
                ),
                _bottomBarItem(
                  name: "Menu",
                  icon: ImageAsset().bottonmIconmenu,
                  isActive: (model.selectedIndex == 4),
                  deactivateIcon: ImageAsset().bottonmIconmenu,
                  onTap: () {
                    model.updateIndex(4, MenuScreen());
                    // model.updateIndex(1, const MyContacts());
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
