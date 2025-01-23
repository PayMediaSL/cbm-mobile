import 'package:cbm_one_app/providers/home_screen/home_screen_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

HomeScreenDataProvider getHomeScreenProvider(BuildContext context) {
  return Provider.of<HomeScreenDataProvider>(context, listen: false);
}
