import 'package:cbm_one_app/screens/splash_screen.dart';
import 'package:cbm_one_app/utils/log_util.dart';
import 'package:flutter/material.dart';

class ScreenRoutes {
  // Init
  static const String toSplashScreen = "toSplashScreen";
  static const String toHomeScreen = "toHomeScreen";
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Route<dynamic> routeSettings = getMaterialPageRoute(settings);
    printLog(routeSettings.settings.name);
    return routeSettings;
  }

  static Route<dynamic> getMaterialPageRoute(RouteSettings settings) {
    // Data to be passed to screens

    var data = settings.arguments;
    printLog("Navigating to screen -> ${settings.name}");
    switch (settings.name) {
      case ScreenRoutes.toSplashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
    }
  }
}
