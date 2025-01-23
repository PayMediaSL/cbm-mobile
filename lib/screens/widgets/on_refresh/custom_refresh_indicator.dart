import 'package:cbm_one_app/helpers/colors.dart';
import 'package:flutter/material.dart';

class CustomRefreshIndicator extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;

  const CustomRefreshIndicator({
    Key? key,
    required this.child,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.primaryBlueColor,
      backgroundColor: AppColors.white,
      displacement: 100,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
