class Stage {
  static const String local = "local";
  static const String dev = "dev";
  static const String bankDev = "bankDev";
  static const String uat = "uat";
  static const String prod = "prod";
  static const String qa = "qa";
  static const String dev3 = "dev3";

  static bool isProd(String stage) => stage == prod;
  static bool isUat(String stage) => stage == uat;
  static bool isBankDev(String stage) => stage == bankDev;
  static bool isDev(String stage) => stage == dev;
  static bool isLocal(String stage) => stage == local;
  static bool isQa(String stage) => stage == qa;
}

enum Env {
  local,
  dev,
  qa,
  uat,
  prod;

  String get getAppName {
    switch (this) {
      case Env.local:
        return 'CBM_OneApp_Local';
      case Env.dev:
        return 'CBM_OneApp_DEV';
      case Env.qa:
        return 'CBM_OneApp_QA';
      case Env.uat:
        return 'CBM_OneApp_UAT';
      case Env.prod:
        return 'CBM_OneApp_PROD';
    }
  }

  String get baseURL {
    switch (this) {
      case Env.local:
        return '';
      case Env.dev:
        return '';
      case Env.qa:
        return '';
      case Env.uat:
        return '';
      case Env.prod:
        return '';
    }
  }

  String get authURL {
    switch (this) {
      case Env.local:
        return '$baseURL:8081/api/auth/';
      case (Env.dev || Env.uat || Env.prod || Env.qa):
        return '$baseURL/auth/';
    }
  }

  String get paymentUrl {
    switch (this) {
      case Env.local:
        return '$baseURL:8084/api/payment/';
      case (Env.dev || Env.uat || Env.prod || Env.qa):
        return '$baseURL/payment/';
    }
  }

  String get walletUrl {
    switch (this) {
      case Env.local:
        return '$baseURL:8082/api/wallet/';
      case (Env.dev || Env.uat || Env.prod || Env.qa):
        return '$baseURL/wallet/';
    }
  }

  String get notificationUrl {
    switch (this) {
      case Env.local:
        return '$baseURL:8082/api/wallet/';
      case (Env.dev || Env.uat || Env.prod || Env.qa):
        return '$baseURL/notification/';
    }
  }

  int get timeoutSeconds {
    switch (this) {
      case Env.local:
        return 1800;
      case Env.dev:
        return 1800;
      case Env.prod:
        return 180;
      case Env.uat:
        return 1800;
      case Env.qa:
        return 1800;
    }
  }

  bool get isLocal => this == Env.local;
  bool get isDev => this == Env.dev;
  bool get isProd => this == Env.prod;
  bool get isQa => this == Env.qa;
  bool get isUat => this == Env.uat;
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
  static const int error = 400; // Bad Request
  static const int unautherized = 401; //token expired
  static const int sessionExpired = 402;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int requestTimeOut = 408;
  static const int debuggerAttached = 422;
  static const int deviceError = 423;
  static const int exception = 500; // Internal Server Error
  static const int serviceUnavailable = 503;
  static const int invalidSslCertificate = 526;
}

class ErrorMessages {
  ErrorMessages._();

  static const String unexpectedError =
      "Please try again. If the problem persists please contact customer support";
  static const String invalidTransferType = "Invalid transfer type";
}

class UI {
  UI._();

  static const double actionBarHeight = 75.0;
  static const double padding = 8.0;
  static const double borderRadius = 10.0;
  static const double borderRadiusButton = 17.0;
  static const double borderRadiusTextField = 20.0;
  static const double padding2 = padding * 2;
  static const double fontSize = 14.0;
  static const int animationDuration = 200;

  static double getPadding(double times) => padding * times;
  static double getRadius(double times) => borderRadius * times;
  static double getFontSize(double times) => fontSize * times;

  //Padding
  static const double PADDING = 8.0;
  static const double PADDING_2X = PADDING * 2;
  static const double PADDING_3X = PADDING * 3;
  static const double PADDING_4X = PADDING * 4;
  static const double PADDING_8X = PADDING * 8;
  static const double PADDING_12X = PADDING * 12;
  static const double PADDING_16X = PADDING * 16;
  static const double PADDING_32X = PADDING * 32;
}

class ScenarioCodes {
  static const String success = "0000";
  static const String successTitle = "SUCCESS";
  static const String newDevice = "DeviceNotRegistered";
}
