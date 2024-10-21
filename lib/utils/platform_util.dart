import 'package:flutter/services.dart';

class PlatformUtil {
  static const _platform = MethodChannel('security.upay/tools');

  static Future<bool> checkForRoot() async {
    return await _platform.invokeMethod('checkForRoot');
  }
}
