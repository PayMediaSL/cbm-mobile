import 'dart:async';

import 'package:app/helpers/parameters.dart';
import 'package:app/models/user.dart';
import 'package:app/utils/log_util.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  String? token;
  String? fcmToken;
  String? refreshToken;
  String? appVersion;
  String? buildNumber;
  String? sequenceId;
  User? user;
  int loginMethod = 0;

  String? biometricChallege;
  BuildContext? context;
  String? username;
  bool _isExploreApp = false;
  Timer? _timer;
  Timer? _tokenExpireTimer;
  DateTime? tokenExpiredTime;
  DateTime? refreshTokenExpiredTIme;

  bool get isExploreApp => _isExploreApp;

  set isExploreApp(bool isExploreApp) {
    _isExploreApp = isExploreApp;
    notifyListeners();
  }

  void appTimeout(BuildContext? ctx) {
    if (context != null) {
      // refreshToken = null;
      // token = null;
      // fcmToken = null;
      // moveToSplash(context!);
      // DateTime nowTime = DateTime.now();
      _timer = Timer(
        Duration(seconds: Environment.timeoutWaitSeconds),
        () {
          if (_timer != null) {
            // moveToSplash(ctx!);
          } else {
            printLog('Timer is null *********** 0');
          }
        },
      );

      printLog('called timeout');
    } else {
      printLog("App context is null");
    }
  }

  void processLoginResponse(Map responseData) {
    user = User.fromJson(responseData['user']);
    token = responseData['access_token'];
    refreshToken = responseData['refresh_token'];
  }
}
