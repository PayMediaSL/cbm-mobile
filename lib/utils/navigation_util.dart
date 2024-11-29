import 'package:flutter/material.dart';

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
}

//* Pushes a new screen onto the navigation stack.
Future<T?> pushScreen<T>(BuildContext context, String route,
    {Object? arguments}) async {
  return await Navigator.of(context).pushNamed<T>(
    route,
    arguments: arguments,
  );
}

//* Replaces the current screen with a new one.
Future<T?> pushReplacementScreen<T>(BuildContext context, String route,
    {Object? arguments}) async {
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
}

//* Pops screens until the specified route is found.
void popUntilScreen(BuildContext context, String routeName) {
  Navigator.of(context).popUntil((route) {
    return route.settings.name == routeName;
  });
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
}
