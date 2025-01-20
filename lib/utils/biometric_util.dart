import 'dart:io';

import 'package:cbm_one_app/models/enums/auth_method.dart';
import 'package:cbm_one_app/providers/app_language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class BiometricUtil {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      final supported = await _auth.isDeviceSupported();
      if (!supported) {
        return false;
      }

      final biometrics = await _auth.canCheckBiometrics;
      if (!biometrics) {
        return false;
      }

      final list = await getAvailableBiometrics();
      return Platform.isIOS
          ? list.isNotEmpty
          : (list.length == 1
              ? list.contains(BiometricType.weak)
              : list.isNotEmpty);
    } on PlatformException {
      return false;
    }
  }

  Future<List<AuthMethod>> getAvailableAuthMethods() async {
    List<AuthMethod> authMethods = [AuthMethod.password];

    final hasBiometrics = await BiometricUtil.hasBiometrics();
    if (hasBiometrics) {
      authMethods.add(AuthMethod.fingerprint);
      bool hasFaceId = await BiometricUtil.hasFaceId();
      if (hasFaceId) {
        authMethods.add(AuthMethod.faceId);
      }
    }

    return authMethods;
  }

  Future<bool> requestBiometric(BuildContext context) async {
    List<AuthMethod> methods = await getAvailableAuthMethods();
    final biometricMethods = [AuthMethod.fingerprint, AuthMethod.faceId];

    if (methods.any((element) => biometricMethods.contains(element))) {
      final result = await _auth.authenticate(
        localizedReason: getLangStr(context, 'request_biometric'),
        options: const AuthenticationOptions(biometricOnly: true),
      );
      return result;
    }
    return false;
  }

  static Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      final list = await _auth.getAvailableBiometrics();
      return list;
    } on PlatformException {
      return <BiometricType>[];
    }
  }

  static Future<bool> hasFaceId() async {
    List<BiometricType> available = await getAvailableBiometrics();
    return available.contains(BiometricType.face);
  }
}
