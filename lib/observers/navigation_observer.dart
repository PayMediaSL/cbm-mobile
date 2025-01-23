import 'package:flutter/material.dart';

class AppNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    changeStatusBarColor(route);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    changeStatusBarColor(previousRoute);
  }

  void changeStatusBarColor(Route? route) {
    /*if (route?.settings.name == ScreenRoutes.toHomeScreen) {
      FlutterStatusbarcolor.setStatusBarColor(AppColors.transparent);
      FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
      FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    } else {
      if (route?.settings.name == ScreenRoutes.toSidebarScreen) {
        FlutterStatusbarcolor.setStatusBarColor(AppColors.grey2);
      } else {
        FlutterStatusbarcolor.setStatusBarColor(AppColors.transparent);
      }
      FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
      FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    }*/
  }
}
