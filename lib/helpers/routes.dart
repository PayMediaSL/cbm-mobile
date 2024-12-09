import 'package:app/screens/main_screens/authentication_screen.dart/forget_psw_screen.dart';
import 'package:app/screens/main_screens/authentication_screen.dart/sign_in_screen/pin_signin_screen.dart';
import 'package:app/screens/main_screens/authentication_screen.dart/sign_in_screen/sign_in_option_screen.dart';
import 'package:app/screens/main_screens/authentication_screen.dart/sign_up_screen/sign_up_screen.dart';
import 'package:app/screens/main_screens/eslips_screen/e_slips_screen.dart';
import 'package:app/screens/main_screens/on_boarding_screen/on_boarding_Screen.dart';
import 'package:app/screens/main_screens/splash_screen/splash_screen.dart';
import 'package:app/screens/test_screen.dart';
import 'package:app/utils/log_util.dart';
import 'package:flutter/material.dart';

import '../screens/main_screens/authentication_screen.dart/sign_in_screen/sign_in_screen.dart';

class ScreenRoutes {
  // Init
  static const String toSplashScreen = "toSplashScreen";
  static const String toHomeScreen = "toHomeScreen";
  static const String toOnBoardScreen = "toOnBoardScreen";

  //
  //Authentication
  static const String toSignInOptionScreen = "toSignInOptionScreen";
  static const String toSignInScreen = "toSignInScreen";
  static const String toforgetPswScreen = "toforgetPswScreen";
  static const String toPinLoginScreeen = "toPinLogin";

  //! Eslips

  static const String toESlipsScreen = "toESlipsScreen";

  //! To SignmUp Screen
  static const String toSignUpScreen = "toSignUpScreen";

  static const String test = "testinggggggg";
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Route<dynamic> routeSettings = getMaterialPageRoute(settings);
    printLog(routeSettings.settings.name);
    return routeSettings;
  }

  static Route<dynamic> getMaterialPageRoute(RouteSettings settings) {
    // Data to be passed to screens

    // var data = settings.arguments;
    printLog("Navigating to screen -> ${settings.name}");
    switch (settings.name) {
      case ScreenRoutes.toSplashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
//!On board Screen
      case ScreenRoutes.toOnBoardScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingPage(),
          settings: settings,
        );

//! Sign in option Screen

      case ScreenRoutes.toSignInOptionScreen:
        return MaterialPageRoute(
          builder: (_) => const SignInOptionScreen(),
          settings: settings,
        );

//! Signin Screen
      case ScreenRoutes.toSignInScreen:
        return MaterialPageRoute(
          builder: (_) => SignInScreen(),
          settings: settings,
        );

      case ScreenRoutes.toforgetPswScreen:
        return MaterialPageRoute(
          builder: (_) => ForgetPasswordScreen(),
          settings: settings,
        );

//! SignUp Screeen

      case ScreenRoutes.toSignUpScreen:
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(),
          settings: settings,
        );

//! Pin Login
      case ScreenRoutes.toPinLoginScreeen:
        return MaterialPageRoute(
          builder: (_) => PinSignInScreen(),
          settings: settings,
        );

//!ESlips
      case ScreenRoutes.toESlipsScreen:
        return MaterialPageRoute(
          builder: (_) => ESlipsScreen(),
          settings: settings,
        );

//!!!!!!!!!test
      case ScreenRoutes.test:
        return MaterialPageRoute(
          builder: (_) => TestScreen(),
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
