class Stage {
  static const String local = "local";
  static const String dev = "dev";
  static const String uat = "uat";
  static const String prod = "prod";

  static bool isProd(String stage) => stage == prod;
  static bool isUat(String stage) => stage == uat;
  static bool isDev(String stage) => stage == dev;
  static bool isLocal(String stage) => stage == local;
}

class Keys {
  static const appLanguage = "appLanguage";
  static const splashUrl = "splashUrl";
  static const keyLabel = "app_name";
  static const username = "username";
  static const mobile = "mobile";
  static const publicKey = "publicKey";
}

class BiometricCode {
  static const String errorLockout = '7';
  static const String cancelled = '10';
  static const String negtiveBtnClick = '13';
}

class ApiResponseCodes {
  static const int noNetwork = 0;
  static const int success = 200;
  static const int error = 400;
  static const int tokenExpired = 401;
  static const int sessionExpired = 402;
  static const int forbidden = 403;
  static const int requestTimeOut = 408;
  static const int debuggerAttached = 422;
  static const int deviceError = 423;
  static const int exception = 500;
  static const int serviceUnavailable = 503;
  static const int invalidSslCertificate = 526;
}

class ErrorMessages {
  ErrorMessages._();

  static const String unexpectedError = "Please try again. If the problem persists please contact customer support";
  static const String invalidTransferType = "Invalid transfer type";
}

class Ui {
  Ui._();

  static const double actionBarHeight = 75.0;
  static const double padding = 8.0;
  static const double borderRadius = 8.0;
  static const double padding2 = padding * 2;
  static const double fontSize = 14.0;
  static const int animationDuration = 200;

  static getPadding(double times) => padding * times;
  static getRadius(double times) => borderRadius * times;
  static getFontSize(double times) => fontSize * times;
}

class ScenarioCodes {
  static const String success = "0000";
  static const String successTitle = "SUCCESS";
  static const String newDevice = "DeviceNotRegistered";
}
