import 'package:app/helpers/colors.dart';
import 'package:app/providers/bottom_navigation/bottom_navigation_bar_provider.dart';
import 'package:app/screens/main_screens/drawer/main_drawer_screen.dart';
import 'package:app/screens/main_screens/home_screen/home_screen.dart';
import 'package:app/screens/main_screens/payments/payments_screen.dart';
import 'package:app/screens/main_screens/transaction/transaction_screen.dart';
import 'package:app/screens/widgets/bottom_nav_Item/custom_bottom_navitem.dart';
import 'package:app/screens/widgets/on_refresh/custom_refresh_indicator.dart';
import 'package:app/utils/log_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomBavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return Scaffold(
      drawer: MainDrawerScreen(),
      body: PersistentTabView(
        context,
        controller: PersistentTabController(
          initialIndex: bottomNavProvider.currentIndex,
        ),
        screens: _buildScreens(),
        items: _navBarsItems(bottomNavProvider),
        confineToSafeArea: true,
        backgroundColor: Colors.white, // Background color of the bottom nav bar
        handleAndroidBackButtonPress: true, // Handle back button
        resizeToAvoidBottomInset: true, // Resize screen when keyboard appears
        stateManagement: true, // State management
        navBarStyle:
            NavBarStyle.style3, // Choose the style of the bottom nav bar
        onItemSelected: (index) {
          bottomNavProvider.updateIndex(index);
        },
      ),
    );

    // PersistentTabView(
    //   context,
    //   controller: PersistentTabController(
    //     initialIndex: bottomNavProvider.currentIndex,
    //   ),
    //   screens: _buildScreens(),
    //   items: _navBarsItems(bottomNavProvider),
    //   confineToSafeArea: true,
    //   backgroundColor: Colors.white, // Background color of the bottom nav bar
    //   handleAndroidBackButtonPress: true, // Handle back button
    //   resizeToAvoidBottomInset: true, // Resize screen when keyboard appears
    //   stateManagement: true, // State management
    //   navBarStyle: NavBarStyle.style3, // Choose the style of the bottom nav bar
    //   onItemSelected: (index) {
    //     bottomNavProvider.updateIndex(index);
    //   },
    // );
  }

  List<Widget> _buildScreens() {
    return [
      CustomRefreshIndicator(
        onRefresh: () async {
          printLog("Refreshing Home Screen");
        },
        child: MainHomeScreen(),
      ),
      CustomRefreshIndicator(
        onRefresh: () async {
          printLog("Refreshing Payment Screen");
        },
        child: PaymentScreen(),
      ),
      Center(child: Text("Lifestyle Screen")),
      CustomRefreshIndicator(
        onRefresh: () async {
          printLog("Refreshing Transactioin Screen");
        },
        child: TransactionsScreen(),
      ),
      Center(child: Text("Menu Screen")),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BottomNavProvider provider) {
    return [
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.primaryBlueColor,
        icon: CustomNavBarItem(
          label: "Home",
          icon: Icons.home,
          isActive: provider.currentIndex == 0,
        ),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.primaryBlueColor,
        icon: CustomNavBarItem(
          label: "Payments",
          icon: Icons.payment,
          isActive: provider.currentIndex == 1,
        ),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.primaryBlueColor,
        icon: CustomNavBarItem(
          label: "Lifestyle",
          icon: Icons.style,
          isActive: provider.currentIndex == 2,
        ),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.primaryBlueColor,
        icon: CustomNavBarItem(
          label: "Transactions",
          icon: Icons.account_balance_wallet,
          isActive: provider.currentIndex == 3,
        ),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.primaryBlueColor,
        icon: CustomNavBarItem(
          label: "Menu",
          icon: Icons.menu,
          isActive: provider.currentIndex == 4,
        ),
      ),
    ];
  }
}

// // ignore_for_file: must_be_immutable

// import 'dart:ui';

// import 'package:app/helpers/colors.dart';
// import 'package:app/providers/bottom_navigation/bottom_navigation_bar_provider.dart';
// import 'package:app/services/screen_size_calculator.dart';
// import 'package:app/utils/assest_image.dart';
// import 'package:app/utils/device_info_util.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';

// class BottomBavigationScreen extends StatelessWidget {
//   BottomBavigationScreen({super.key});

//   Widget? currentScreen;

//   bool floatingButtonTapped = false;

//   Future<String> deviceModel() async {
//     Map deviceInfo = await DeviceInfoUtil().getDeviceInfo();
//     String appVersion = deviceInfo['app_version'];
//     return appVersion;
//   }

//   @override
//   Widget build(BuildContext context) {
//     ScreenUtils.init(context);
//     ScreenUtil.init(context);

//     // final model = Provider.of<BottomNavBarIndeXModel>(context, listen: false);

//     return GestureDetector(
//       child: RefreshIndicator(
//         color: AppColors.primaryBlueColor,
//         backgroundColor: AppColors.white,
//         displacement: 100,
//         triggerMode: RefreshIndicatorTriggerMode.onEdge,
//         onRefresh: () async {},
//         child: Consumer<BottomNavBarProvider>(
//             builder: (BuildContext context, model, Widget? child) {
//           return FutureBuilder(
//               future: deviceModel(),
//               builder: (context, snapshot) {
//                 return Scaffold(
//                   body: SafeArea(
//                     top: false,
//                     bottom: false,
//                     child: model.currentScreen,
//                   ),
//                   floatingActionButtonLocation:
//                       FloatingActionButtonLocation.centerDocked,
//                   bottomNavigationBar: _buildBottomAppBar(),
//                 );
//               });
//         }),
//       ),
//     );
//   }

//   Widget _bottomBarItem({
//     required String icon,
//     required bool isActive,
//     required String deactivateIcon,
//     required VoidCallback onTap,
//     required String name,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         height: 150,
//         width: 70,
//         color: Colors.red,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Hero(
//               tag: 'bottom_icon',
//               transitionOnUserGestures: true,
//               child: Image.asset(
//                 isActive ? icon : deactivateIcon,
//                 width: ScreenUtils.width * 0.05,
//                 color: isActive
//                     ? AppColors.primaryBlueColor
//                     : AppColors.primaryGreyColor,
//               ),
//             ),
//             SizedBox(height: 4.sp),
//             Text(
//               name,
//               style: TextStyle(
//                 fontSize: 11.sp,
//                 color: isActive
//                     ? AppColors.primaryBlueColor
//                     : AppColors.primaryGreyColor,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   BottomAppBar _buildBottomAppBar() {
//     return BottomAppBar(
//       padding: EdgeInsets.only(top: 10.sp),
//       height: ScreenUtils.height * 0.08,
//       color: AppColors.white,
//       child: Stack(
//         children: [
//           Consumer<BottomNavBarProvider>(
//             builder: (context, model, child) {
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   _bottomBarItem(
//                     name: "Home",
//                     icon: ImageAsset().iconImage,
//                     isActive: (model.selectedIndex == 0),
//                     deactivateIcon: ImageAsset().iconImage,
//                     onTap: () {
//                       // model.updateIndex(0, const HomeScreen());
//                     },
//                   ),
//                   _bottomBarItem(
//                     name: "Payments",
//                     icon: ImageAsset().iconImage,
//                     isActive: (model.selectedIndex == 1),
//                     deactivateIcon: ImageAsset().iconImage,
//                     onTap: () {
//                       // model.updateIndex(1, const PaymentsScreen());
//                     },
//                   ),
//                   _bottomBarItem(
//                     name: "Lifestyle",
//                     icon: ImageAsset().iconImage,
//                     isActive: (model.selectedIndex == 2),
//                     deactivateIcon: ImageAsset().iconImage,
//                     onTap: () {
//                       // model.updateIndex(2, const LifestyleScreen());
//                     },
//                   ),
//                   _bottomBarItem(
//                     name: "Transaction",
//                     icon: ImageAsset().iconImage,
//                     isActive: (model.selectedIndex == 3),
//                     deactivateIcon: ImageAsset().iconImage,
//                     onTap: () {
//                       // model.updateIndex(3, const TransactionScreen());
//                     },
//                   ),
//                   _bottomBarItem(
//                     name: "Menu",
//                     icon: ImageAsset().iconImage,
//                     isActive: (model.selectedIndex == 4),
//                     deactivateIcon: ImageAsset().iconImage,
//                     onTap: () {
//                       // model.updateIndex(4, const MenuScreen());
//                     },
//                   ),
//                 ],
//               );
//             },
//           ),
//           // Add the active indicator bar
//           Consumer<BottomNavBarProvider>(
//             builder: (context, model, child) {
//               double indicatorWidth = ScreenUtils.width / 5;
//               return Positioned(
//                 top: 0,
//                 left: model.selectedIndex * indicatorWidth,
//                 child: Container(
//                   height: 3, // Thickness of the indicator
//                   width: indicatorWidth,
//                   color: AppColors.primaryBlueColor,
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   // BottomAppBar _buildBottomAppBar() {
//   //   return BottomAppBar(
//   //     padding: EdgeInsets.only(top: 10.sp),
//   //     // notchMargin: 12.0,
//   //     // shape: const CircularNotchedRectangle(),
//   //     height: ScreenUtils.height * 0.08,
//   //     color: AppColors.white,
//   //     child: Consumer<BottomNavBarProvider>(
//   //       builder: (context, model, child) {
//   //         return Row(
//   //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //           // mainAxisAlignment: MainAxisAlignment.center,
//   //           children: [
//   //             _bottomBarItem(
//   //               name: "Home",
//   //               icon: ImageAsset().iconImage,
//   //               isActive: (model.selectedIndex == 0),
//   //               deactivateIcon: ImageAsset().iconImage,
//   //               onTap: () {
//   //                 // model.updateIndex(1, const MyContacts());
//   //                 // model.updateIndex();
//   //               },
//   //             ),
//   //             _bottomBarItem(
//   //               name: "Payments",
//   //               icon: ImageAsset().iconImage,
//   //               isActive: (model.selectedIndex == 0),
//   //               deactivateIcon: ImageAsset().iconImage,
//   //               onTap: () {
//   //                 // model.updateIndex(1, const MyContacts());
//   //                 // model.updateIndex();
//   //               },
//   //             ),
//   //             _bottomBarItem(
//   //               name: "Lifestyle",
//   //               icon: ImageAsset().iconImage,
//   //               isActive: (model.selectedIndex == 1),
//   //               deactivateIcon: ImageAsset().iconImage,
//   //               onTap: () {},
//   //             ),
//   //             _bottomBarItem(
//   //               name: "Transaction",
//   //               icon: ImageAsset().iconImage,
//   //               isActive: (model.selectedIndex == 2),
//   //               deactivateIcon: ImageAsset().iconImage,
//   //               onTap: () {},
//   //             ),
//   //             _bottomBarItem(
//   //               name: "Menu",
//   //               icon: ImageAsset().iconImage,
//   //               isActive: (model.selectedIndex == 3),
//   //               deactivateIcon: ImageAsset().iconImage,
//   //               onTap: () {},
//   //             ),
//   //           ],
//   //         );
//   //       },
//   //     ),
//   //   );
//   // }
// }

