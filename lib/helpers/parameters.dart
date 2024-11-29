import 'package:flutter/foundation.dart';

import 'constants.dart';

class Environment {
  // All checks & logs should be false in PROD stage
  static bool enableLogs = false;
  static bool bypassDeviceCheck = false;
  static bool bypassSslCheck = false;
  static bool bypassLcSdkCheck = false;

  // App stage
  static String appStage = Stage.uat;

  // App config
  static String appName =
      "MyApp${Stage.isProd(appStage) ? "" : (Stage.isUat(appStage) ? " - UAT" : " - DEV")}";
  static int timeoutPreSeconds =
      Stage.isProd(appStage) ? 150 : (kDebugMode ? 120 : 150);
  static int timeoutWaitSeconds = 30;

  static int otpLength = 6;
}

class Constants {
  static const String encoding = "application/octet-stream";
  static const String justPayConsent =
      "I hereby authorize to debit this bank account not exceeding the value of the transaction amount (inclusive of the convenience fees as applicable) indicated during a transaction. Further understand that should the debtor be someone other than myself, will not be concerned or required to inquire whether the debtor's name on the record of the party to be credited is the same as that herein stated by me.";
  static String publicKey = Stage.isProd(Environment.appStage)
      ? ""
      : "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyeEtnbbx6TKQFaX3yqWKFmCAKfaNb4txC4d34XDxKxzulxPbSVe9jWA0Ygo7S9+jIONP/GyKIA+x8NXz3XrxoDvv+zN28xD6WUXXix2S+l/2b9rEjVd16VjWHFUzspZl8zXUaVwZ6y+rUnQ1T8B0dBQ9hQYdrxanBF78ruLVPLc0OUfELSshHYbAqQfKZU+cDajrXqDCzsJnThjGpGMJFonPtMybKD71ubbguIGU4t1kFO9LcjRkIQclOFYT6Tjv/d3A8biFpRGFAGlcC9Y0Olp+L2hfbAi8KqBVy/jZJm126muKOBJamgZnAGFCu49PZHzBROEjU9upMXXWCok9FQIDAQAB";
  static List<String> sslFingerprints = Stage.isProd(Environment.appStage)
      ? [""]
      : ["30c10a56ee852abd7b986a1775319b66dd78ab009062c78282955c37d10317af"];
  static String hmacSecret = Stage.isProd(Environment.appStage)
      ? ""
      // : "g4n7247cg56rv51fv2vstbem71pzn2l2b9vkwqv65ezq5o44bj0dknfxugunap12";
      : "tR0YSPUH01V7OFlZDNMO67opxPF6DUKI5Hkl922sRsGj7HCIJpK8W8ssY7Qap0fC";
}

class ApiUrl {
  static String baseUrl = Stage.isProd(Environment.appStage)
      ? ""
      : (Stage.isDev(Environment.appStage)
          ? "https://testpay.upay.lk/api/"
          : (Stage.isUat(Environment.appStage)
              ? "https://testpayqa.upay.lk/api/"
              : "http://192.168.8.104:8080/api/"));

  static String authService = "auth/";
  static String appConfigService = "config/";
  static String contentService = "content/";

  static String checkUpdates = "${baseUrl + appConfigService}check-update";

  // RESOURCE
  static String imageUrl = "$baseUrl${contentService}resources/";

  // AUTH
  static String loginInit = "${baseUrl + authService}user/login/init";
  static String login = "${baseUrl + authService}user/login/mobile";
  static String verifyDeviceOtp = "${baseUrl + authService}user/device-verify";
  static String refreshToken = "${baseUrl + authService}user/refresh-token";
  static String initForgotPassword =
      "${baseUrl + authService}user/forgot/password";
  static String verifyForgotPwOtp =
      "${baseUrl + authService}user/forgot/password/verify";
  static String resetPassword =
      "${baseUrl + authService}user/mobile/change/password";
  static String updateLoginMethod = "${baseUrl + authService}user/login-switch";
  static String updateTransactionAuthLimit =
      "${baseUrl + authService}user/auth-limit-change";
  // REGISTER
  static String registerValidate =
      "${baseUrl + authService}user/register/validate";
  static String resendOtp = "${baseUrl + authService}user/register/validate";
  static String registerVerify = "${baseUrl + authService}user/register/verify";
  static String register = "${baseUrl + authService}user/register";

  //LOGIN
  static String newDeviceAndForgotPasswordResendOtp =
      "${baseUrl + authService}user/resend-otp";

  // HOME
  static String getBanners = "${baseUrl + contentService}banners";
  static String getPointsBalance = "${baseUrl + authService}user/point-balance";

  static String getDeviceList = "${baseUrl + authService}user/device-list";
}
