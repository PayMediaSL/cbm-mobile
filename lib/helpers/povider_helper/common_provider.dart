import 'package:app/providers/other_provider/common_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

CommonProvider getCommonProvider(BuildContext context) {
  return Provider.of<CommonProvider>(context, listen: true);
}
