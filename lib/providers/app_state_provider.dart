import 'package:app/models/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

AppState getAppState(BuildContext context, [bool listen = false]) {
  return Provider.of<AppState>(context, listen: listen);
}
