import 'package:cbm_one_app/helpers/routes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//* Utility function to remove focus from the current input field.
void dismissKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}

void grabFocus(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

//* Focuses the next available input field, or dismisses the keyboard if none exists.
void focusNextField(BuildContext context) {
  try {
    FocusScope.of(context).nextFocus();
  } catch (e) {
    dismissKeyboard(context);
  }
}

//* Checks whether the current screen can be popped from the navigation stack.
bool canPop(BuildContext context) {
  return Navigator.of(context).canPop();
}

//* Pops the current screen and optionally returns a result.
void popScreen(BuildContext context, {Object? result}) {
  Navigator.of(context).pop(result);
  _clearToastAndSnackBars(context);
}

//* Pushes a new screen onto the navigation stack.
Future pushScreen(BuildContext context, String route,
    {Object? arguments}) async {
  _clearToastAndSnackBars(context);
  return await Navigator.of(context).pushNamed(
    route,
    arguments: arguments,
  );
}

//* Replaces the current screen with a new one.
Future pushReplacementScreen(BuildContext context, String route,
    {Object? arguments}) async {
  _clearToastAndSnackBars(context);
  return await Navigator.of(context).pushReplacementNamed(
    route,
    arguments: arguments,
  );
}

//* Clears the navigation stack and navigates to the specified screen.
void navigateToScreen(BuildContext context, String route, {Object? arguments}) {
  Navigator.of(context).pushNamedAndRemoveUntil(
    route,
    (_) => false,
    arguments: arguments,
  );
  _clearToastAndSnackBars(context);
}

//* Pops screens until the specified route is found.
void popUntilScreen(BuildContext context, String routeName) {
  Navigator.of(context).popUntil((route) {
    return route.settings.name == routeName;
  });
  _clearToastAndSnackBars(context);
}

//* Pushes a new screen and pops back to a specific screen in the navigation stack.
void pushAndPopUntilScreen(
    BuildContext context, String pushName, String popUntilName,
    {Object? arguments}) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    pushName,
    (route) => route.settings.name == popUntilName,
    arguments: arguments,
  );
  _clearToastAndSnackBars(context);
}

// A reusable function for navigating to any screen
void navigateToSpecificScreen(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

// A reusable function for navigating to any named screen
Future navigateToNamedScreen(BuildContext context, String routeName,
    {Object? arguments}) {
  return Navigator.pushNamed(
    context,
    routeName,
    arguments: arguments,
  );
}

//* Moves to the Home screen.
void moveToHome(BuildContext context) {
  navigateToScreen(context, ScreenRoutes.toHomeScreen);
  _clearToastAndSnackBars(context);
}

//* Moves to the Splash screen.
void moveToSplash(BuildContext context) {
  navigateToScreen(context, ScreenRoutes.toSplashScreen);
  _clearToastAndSnackBars(context);
}

//* Clears all toasts and snack bars from the screen.
void _clearToastAndSnackBars(BuildContext context) async {
  await Fluttertoast.cancel();
  if (!context.mounted) return;
  ScaffoldMessenger.of(context).clearSnackBars();
}
