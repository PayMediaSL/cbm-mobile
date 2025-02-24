import 'package:app/providers/drawer/toggle_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

ToggleSwitchProvider getToggleProvider(BuildContext context) {
  return Provider.of<ToggleSwitchProvider>(context, listen: true);
}
