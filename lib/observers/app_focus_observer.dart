import 'package:app/providers/app_state_provider.dart';
import 'package:app/utils/log_util.dart';
import 'package:flutter/material.dart';

class AppFocusObserver extends WidgetsBindingObserver {
  final GlobalKey<NavigatorState> navigatorKey;

  AppFocusObserver(this.navigatorKey);

  static Route? _route;

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    final BuildContext? buildContext = navigatorKey.currentContext;
    navigatorKey.currentState?.popUntil((route) {
      _route = route;
      return true;
    });

    if (state == AppLifecycleState.paused) {
      // The app is in the background (minimized or lost focus)
      // You can trigger authentication or any other actions here.
      printLog('App defocussed');
      if ((buildContext != null) &&
          (getAppState(buildContext).context != null)) {
        // Check whether to bypass the focus lost re-authentication
        /*if (getAppState(buildContext).disableFocusAuth ?? false) {
          printLog('Defocussed re-auth not required *');
          // Reset de-focus authentication
          getAppState(buildContext).disableFocusAuth = false;
        } else {
          if (getAppState(buildContext).isBiometricEnabled == null) {
            moveToSplash(buildContext);
          } else {
            if (_route?.settings.name == ScreenRoutes.toHomeScreen) {
              getBankAccountState(buildContext).shouldLoadAccounts(true);
            }
            pushScreen(
              buildContext,
              ScreenRoutes.toAuthAppFocusScreen,
              arguments: getAppState(buildContext).isBiometricEnabled,
            );
          }
        }*/
      }
    } else if (state == AppLifecycleState.resumed) {
      /*if (null != buildContext) {
        final prefs = await SharedPreferences.getInstance();
        final String otpSenderName = prefs.getString(Keys.otpSenderName) ?? "";
        getAppState(buildContext).optSenderName = otpSenderName;
      }

      if ((null != _route?.settings.name &&
          _route?.settings.name != ScreenRoutes.toAuthBiometricScreen &&
          _route?.settings.name != ScreenRoutes.toLoginPasswordScreen)) {
        // The app is in the foreground
        // You can handle any necessary actions when the app regains focus.
        printLog('RESUME CALLED ******');

        final shouldObtainTokens = (buildContext != null) &&
            ((getAppState(buildContext).token?.isEmpty ?? true) ||
                (getAppState(buildContext).refreshToken?.isEmpty ?? true));

        printLog("Should obtain tokens again -> $shouldObtainTokens");

        if (shouldObtainTokens) {
          // Access token or refresh token is not in app memory
          // Should obtain tokens again
          moveToSplash(buildContext);
        }
      }*/
    } else {
      printLog('Other CALLED ******');
      printLog(state);
    }
  }
}
