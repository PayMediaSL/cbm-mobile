import 'dart:io';

import 'package:cbm_one_app/utils/platform_util.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';

import 'log_util.dart';

class SecurityUtil {
  // static const platform = MethodChannel('security.vishwa/tools');
  Future<bool> isDebug() async {
    bool isDebugging = true; // await AppSecurityPlugin().isDebuggerAttached();
    return isDebugging;
  }

  Future<bool> isRooted() async {
    bool isRootedDevice = Platform.isIOS
        ? true // await AppSecurityPlugin().isRooted()
        : await _isRooted();

    return isRootedDevice;
  }

  Future<bool> _isRooted() async {
    bool jailBroken;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      jailBroken = await FlutterJailbreakDetection.jailbroken;
      if (!jailBroken) {
        printLog("checking JB/Root");
        jailBroken = await PlatformUtil.checkForRoot();
      }
    } catch (e) {
      printLog(e.toString(), e, 1);
      jailBroken = false;
    }

    return jailBroken;
  }
}
