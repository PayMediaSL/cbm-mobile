import 'package:app/screens/main_screens/authentication_screen/forget_psw_screen.dart';
import 'package:app/screens/main_screens/authentication_screen/sign_in_screen/pin_signin_screen.dart';
import 'package:app/screens/main_screens/authentication_screen/sign_in_screen/sign_in_option_screen.dart';
import 'package:app/screens/main_screens/authentication_screen/sign_up_screen/about_you/about_you_screen.dart';
import 'package:app/screens/main_screens/authentication_screen/sign_up_screen/billing/signup_billing_camera_screen.dart';
import 'package:app/screens/main_screens/authentication_screen/sign_up_screen/billing/signup_billing_screen.dart';
import 'package:app/screens/main_screens/authentication_screen/sign_up_screen/clarify_you_identity_screen.dart';
import 'package:app/screens/main_screens/authentication_screen/sign_up_screen/finished_up_screen.dart';
import 'package:app/screens/main_screens/authentication_screen/sign_up_screen/nid_upload/nid_back_camera_screen.dart';
import 'package:app/screens/main_screens/authentication_screen/sign_up_screen/nid_upload/nid_front_camera_screen.dart';
import 'package:app/screens/main_screens/authentication_screen/sign_up_screen/nid_upload/nid_screen.dart';
import 'package:app/screens/main_screens/authentication_screen/sign_up_screen/sign_up_screen.dart';
import 'package:app/screens/main_screens/authentication_screen/sign_up_screen/face_image_upoad/signup_selfie_camera_screen.dart';
import 'package:app/screens/main_screens/authentication_screen/sign_up_screen/face_image_upoad/signup_selfie_screen.dart';
import 'package:app/screens/main_screens/authentication_screen/sign_up_screen/signature/signup_signature_camera_screen.dart';
import 'package:app/screens/main_screens/authentication_screen/sign_up_screen/signature/signup_signature_screen.dart';
import 'package:app/screens/main_screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:app/screens/main_screens/drawer/change_password_screen.dart';
import 'package:app/screens/main_screens/drawer/details_update.dart';
import 'package:app/screens/main_screens/drawer/help_screen.dart';
import 'package:app/screens/main_screens/drawer/info_screen.dart';
import 'package:app/screens/main_screens/drawer/invite_friends.dart';
import 'package:app/screens/main_screens/drawer/security_and_safety.dart';
import 'package:app/screens/main_screens/drawer/settings_screen.dart';
import 'package:app/screens/main_screens/drawer/transaction_limit.dart';
import 'package:app/screens/main_screens/drawer/user_profile_Screen.dart';
import 'package:app/screens/main_screens/eslips_screen/e_slips_screen.dart';
import 'package:app/screens/main_screens/lifestyle/lifestyle_ecommerce.dart';
import 'package:app/screens/main_screens/lifestyle/lifestyle_education.dart';
import 'package:app/screens/main_screens/lifestyle/lifestyle_entertainment.dart';
import 'package:app/screens/main_screens/lifestyle/lifestyle_food.dart';
import 'package:app/screens/main_screens/lifestyle/lifestyle_gaming.dart';
import 'package:app/screens/main_screens/lifestyle/lifestyle_health.dart';
import 'package:app/screens/main_screens/lifestyle/lifestyle_insurance.dart';
import 'package:app/screens/main_screens/lifestyle/lifestyle_transport.dart';
import 'package:app/screens/main_screens/notification/notification_screen.dart';
import 'package:app/screens/main_screens/on_boarding_screen/on_boarding_Screen.dart';
import 'package:app/screens/main_screens/payments/payments_screen.dart';
import 'package:app/screens/main_screens/payments/qr_payment/qr_generate.dart';
import 'package:app/screens/main_screens/payments/qr_payment/qr_pay_screen.dart';
import 'package:app/screens/main_screens/payments/qr_payment/qr_scan_payment.dart';
import 'package:app/screens/main_screens/splash_screen/splash_screen.dart';
import 'package:app/screens/test_screen.dart';
import 'package:app/utils/log_util.dart';
import 'package:flutter/material.dart';

import '../screens/main_screens/authentication_screen/sign_in_screen/sign_in_screen.dart';

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

  // Draweerrr
  static const String toDrawerSettingScreen = "toDrawerSettingScreen";
  static const String toDrawerDetailsUpdate = "toDrawerDetailsUpdate";
  static const String toDrawerSecuritySafety = "toDrawerSecuritySafety";
  static const String toDrawerChangePassword = "toDrawerChangePassword";
  static const String toDrawerInfoScreen = "toDrawerInfoScreen";
  static const String toDrawerHelpScreen = "toDrawerHelpScreen";
  static const String toDrawerTransactionLimit = "toDrawerTransactionLimit";
  static const String toDrawerInviteFriends = "toDrawerInviteFriends";
  static const String toDrawerUserProfile = "toDrawerUserProfile";

  // PAyment

  static const String toPaymentScreen = "toPaymentScreen";
  static const String toQRScreenScan = "toQRScreenScan";
  static const String toQrPaySreen = "toQrPaySreen";
  static const String toQrGenerateSreen = "toQrGenerateSreen";

  // Notifications

  static const String toNotificationScreen = "toNotificationScreen";

  //? Life Styele

  static const String toLifeStyleFood = "toLifeStyleFood";
  static const String toLifeStyleEntertainment = "toLifeStyleEntertainment";
  static const String toLifeStyleHealth = "toLifeStyleHealth";
  static const String toLifeStyleInsurance = "toLifeStyleInsurance";
  static const String toLifeStyleGaming = "toLifeStyleGaming";
  static const String toLifeStyleEcommerce = "toLifeStyleEcommerce";
  static const String toLifeStyleTransport = "toLifeStyleTransport";
  static const String toLifeStyleEducation = "toLifeStyleEducation";

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
      //?Sign Up NID Screen
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

//? Drawer
//* Setting Screen
      case ScreenRoutes.toDrawerSettingScreen:
        return MaterialPageRoute(
          builder: (_) => DrawerSettingsScreen(),
          settings: settings,
        );

      //* Details Update
      case ScreenRoutes.toDrawerDetailsUpdate:
        return MaterialPageRoute(
          builder: (_) => DrawerDetailsUpdate(),
          settings: settings,
        );

      //* Security Safety
      case ScreenRoutes.toDrawerSecuritySafety:
        return MaterialPageRoute(
          builder: (_) => DrawerSecuritySafety(),
          settings: settings,
        );

      //* Change Password
      case ScreenRoutes.toDrawerChangePassword:
        return MaterialPageRoute(
          builder: (_) => DrawerChangePassword(),
          settings: settings,
        );

      //* Drawer Help Screen
      case ScreenRoutes.toDrawerHelpScreen:
        return MaterialPageRoute(
          builder: (_) => DrawerHelpScreen(),
          settings: settings,
        );

      //* Drawer Info Screen
      case ScreenRoutes.toDrawerInfoScreen:
        return MaterialPageRoute(
          builder: (_) => DrawerInfoScreen(),
          settings: settings,
        );

      //* Drawer Transaction Limit  Screen
      case ScreenRoutes.toDrawerTransactionLimit:
        return MaterialPageRoute(
          builder: (_) => DrawerTransactionLimit(),
          settings: settings,
        );

      //* Drawer Invite Friends  Screen
      case ScreenRoutes.toDrawerInviteFriends:
        return MaterialPageRoute(
          builder: (_) => DrawerInviteFriendsScreen(),
          settings: settings,
        );

      //* Drawer User Profile Screen
      case ScreenRoutes.toDrawerUserProfile:
        return MaterialPageRoute(
          builder: (_) => UserProfileScreen(),
          settings: settings,
        );

//! LifeStyle

//?Food
      case ScreenRoutes.toLifeStyleFood:
        return MaterialPageRoute(
          builder: (_) => LifeStyleFoodScreen(),
          settings: settings,
        );
      case ScreenRoutes.toLifeStyleEntertainment:
        return MaterialPageRoute(
          builder: (_) => LifeStyleEntertainmentScreen(),
          settings: settings,
        );
      case ScreenRoutes.toLifeStyleHealth:
        return MaterialPageRoute(
          builder: (_) => LifeStyleHealthScreen(),
          settings: settings,
        );
      case ScreenRoutes.toLifeStyleInsurance:
        return MaterialPageRoute(
          builder: (_) => LifeStyleInsuranceScreen(),
          settings: settings,
        );
      case ScreenRoutes.toLifeStyleGaming:
        return MaterialPageRoute(
          builder: (_) => LifeStyleGamingScreen(),
          settings: settings,
        );
      case ScreenRoutes.toLifeStyleEcommerce:
        return MaterialPageRoute(
          builder: (_) => LifeStyleEcommerceScreen(),
          settings: settings,
        );
      case ScreenRoutes.toLifeStyleTransport:
        return MaterialPageRoute(
          builder: (_) => LifeStyleTransportScreen(),
          settings: settings,
        );
      case ScreenRoutes.toLifeStyleEducation:
        return MaterialPageRoute(
          builder: (_) => LifeStyleEducationeScreen(),
          settings: settings,
        );
      //! Notification Screen
      case ScreenRoutes.toNotificationScreen:
        return MaterialPageRoute(
          builder: (_) => NotificationScreen(),
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

      //! Bottom Navigation Screen

      case ScreenRoutes.toBottomNavigationScreen:
        return MaterialPageRoute(
            builder: (_) => BottomBavigationScreen(), settings: settings);

      //? Payment Screen

      case ScreenRoutes.toPaymentScreen:
        return MaterialPageRoute(
          builder: (_) => PaymentScreen(),
          settings: settings,
        );

      //? Qr Scan
      case ScreenRoutes.toQRScreenScan:
        return MaterialPageRoute(
          builder: (_) => QrScannerScreen(),
          settings: settings,
        );

      case ScreenRoutes.toQrPaySreen:
        return MaterialPageRoute(
          builder: (_) => QrPayScreen(),
          settings: settings,
        );

      case ScreenRoutes.toQrGenerateSreen:
        return MaterialPageRoute(
          builder: (_) => QrGenerateScreen(),
          settings: settings,
        );
      //!!!!!!!!!test
      case ScreenRoutes.test:
        return MaterialPageRoute(
          builder: (_) => CustomBottomNavBarExample(),
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
