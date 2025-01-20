import 'package:cbm_one_app/routes.dart';
import 'package:cbm_one_app/utils/log_util.dart';
import 'package:flutter/material.dart';

void grabFocus(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

void popScreen(BuildContext context, {result}) {
  _onNavigateBack();
  Navigator.of(context).pop(result);
}

Future pushScreen(BuildContext context, String route,
    {Object? arguments}) async {
  return await Navigator.of(context).pushNamed(
    route,
    arguments: arguments,
  );
}

Future pushReplacementScreen(BuildContext context, String route,
    {Object? arguments}) async {
  return await Navigator.of(context).pushReplacementNamed(
    route,
    arguments: arguments,
  );
}

void moveToScreen(BuildContext context, String route, {Object? arguments}) {
  Navigator.of(context).pushNamedAndRemoveUntil(
    route,
    (route) => false,
    arguments: arguments,
  );
}

void popUntilScreen(BuildContext context, String routeName) {
  _onNavigateBack(route: routeName);
  Navigator.of(context).popUntil((route) {
    return route.settings.name == routeName;
  });
}

void pushAndPopUntilScreen(
    BuildContext context, String pushName, String popUntilName,
    {Object? arguments}) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    pushName,
    (route) => route.settings.name == popUntilName,
    arguments: arguments,
  );
}

void moveToHome(BuildContext context) {
  moveToScreen(context, ScreenRoutes.toHomeScreen);
}

void moveToSplash(BuildContext context) {
  moveToScreen(context, ScreenRoutes.toSplashScreen);
}

void _onNavigateBack({String? route}) {
  printLog(route);
}
