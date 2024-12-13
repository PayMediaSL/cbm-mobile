import 'package:app/screens/main_screens/authentication_screen.dart/forget_psw_screen.dart';
import 'package:app/screens/main_screens/authentication_screen.dart/sign_in_screen/pin_signin_screen.dart';
import 'package:app/screens/main_screens/authentication_screen.dart/sign_in_screen/sign_in_option_screen.dart';
import 'package:app/screens/main_screens/authentication_screen.dart/sign_up_screen/about_you/about_you_screen.dart';
import 'package:app/screens/main_screens/authentication_screen.dart/sign_up_screen/billing/signup_billing_camera_screen.dart';
import 'package:app/screens/main_screens/authentication_screen.dart/sign_up_screen/billing/signup_billing_screen.dart';
import 'package:app/screens/main_screens/authentication_screen.dart/sign_up_screen/clarify_you_identity_screen.dart';
import 'package:app/screens/main_screens/authentication_screen.dart/sign_up_screen/finished_up_screen.dart';
import 'package:app/screens/main_screens/authentication_screen.dart/sign_up_screen/nid_upload/nid_back_camera_screen.dart';
import 'package:app/screens/main_screens/authentication_screen.dart/sign_up_screen/nid_upload/nid_front_camera_screen.dart';
import 'package:app/screens/main_screens/authentication_screen.dart/sign_up_screen/nid_upload/nid_screen.dart';
import 'package:app/screens/main_screens/authentication_screen.dart/sign_up_screen/sign_up_screen.dart';
import 'package:app/screens/main_screens/authentication_screen.dart/sign_up_screen/face_image_upoad/signup_selfie_camera_screen.dart';
import 'package:app/screens/main_screens/authentication_screen.dart/sign_up_screen/face_image_upoad/signup_selfie_screen.dart';
import 'package:app/screens/main_screens/authentication_screen.dart/sign_up_screen/signature/signup_signature_camera_screen.dart';
import 'package:app/screens/main_screens/authentication_screen.dart/sign_up_screen/signature/signup_signature_screen.dart';
import 'package:app/screens/main_screens/eslips_screen/e_slips_screen.dart';
import 'package:app/screens/main_screens/on_boarding_screen/on_boarding_Screen.dart';
import 'package:app/screens/main_screens/splash_screen/splash_screen.dart';
import 'package:app/utils/log_util.dart';
import 'package:flutter/material.dart';

import '../screens/main_screens/authentication_screen.dart/sign_in_screen/sign_in_screen.dart';

class ScreenRoutes {
  // Init
  static const String toSplashScreen = "toSplashScreen";
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
  static const String toClarifyIdentityScreen = "toClarifyIdentityScreen";
  static const String toAboutYouScreen = "toAboutYouScreen";

  //Selfie
  static const String toSignUpSelfieScreen = "toSignUpSelfieScreen";
  static const String toSignUpSelfieCamera = "toSignUpSelfieCamera";

// NID
  static const String toNidScreen = "toNidScreen";
  static const String toNidFrontCameraScreen = "toNidFrontCameraScreen";
  static const String toNidBackCameraScreen = "toNidBackCameraScreen";

  //Signature
  static const String toSignatureScreen = "toSignatureScreen";
  static const String toSignatureCameraScreen = "toSignatureCameraScreen";

  // Billing

  static const String toSignUpBillingScreen = "toSignUpBillingScreen";
  static const String toSignUpBillingCameraScreen =
      "toSignUpBillingCameraScreen";

// Signup Finished up
  static const String toSignUpFinishedUp = "toSignUpFinishedUp";

  // HomeScreen

  static const String toBottomNavigationScreen = "toBottomNavigationScreen";
  static const String toHomeScreen = "toHomeScreen";

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

      case ScreenRoutes.toClarifyIdentityScreen:
        return MaterialPageRoute(
          builder: (_) => ClarifyYourIdentityScreen(),
          settings: settings,
        );

      case ScreenRoutes.toAboutYouScreen:
        return MaterialPageRoute(
          builder: (_) => AboutYouScreen(),
          settings: settings,
        );
//? Signup Selfie Screen
      case ScreenRoutes.toSignUpSelfieScreen:
        return MaterialPageRoute(
          builder: (_) => SignUpSelfieScreen(),
          settings: settings,
        );
      case ScreenRoutes.toSignUpSelfieCamera:
        return MaterialPageRoute(
          builder: (_) => SignUpSelfieCameraScreen(),
          settings: settings,
        );
//?NID Screen
      case ScreenRoutes.toNidScreen:
        return MaterialPageRoute(
          builder: (_) => NidScreen(),
          settings: settings,
        );

      case ScreenRoutes.toNidFrontCameraScreen:
        return MaterialPageRoute(
          builder: (_) => NIDFrontCameraScreen(),
          settings: settings,
        );
      case ScreenRoutes.toNidBackCameraScreen:
        return MaterialPageRoute(
          builder: (_) => NIDBackCameraScreen(),
          settings: settings,
        );

//? Signup signature Screen
      case ScreenRoutes.toSignatureScreen:
        return MaterialPageRoute(
          builder: (_) => SignupSignatureScreen(),
          settings: settings,
        );
      case ScreenRoutes.toSignatureCameraScreen:
        return MaterialPageRoute(
          builder: (_) => SignUpSignatureCameraScreen(),
          settings: settings,
        );

//? Signup Billing Screen
      case ScreenRoutes.toSignUpBillingScreen:
        return MaterialPageRoute(
          builder: (_) => SignupBillingScreen(),
          settings: settings,
        );
      case ScreenRoutes.toSignUpBillingCameraScreen:
        return MaterialPageRoute(
          builder: (_) => SignupBillingCameraScreen(),
          settings: settings,
        );

      //* Finished up
      case ScreenRoutes.toSignUpFinishedUp:
        return MaterialPageRoute(
          builder: (_) => FinishedUpScreen(),
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
      // case ScreenRoutes.test:
      //   return MaterialPageRoute(
      //     builder: (_) => TestScreen(),
      //     settings: settings,
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
    }
  }
}
