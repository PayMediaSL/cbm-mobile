import 'package:app/helpers/colors.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/payments/mobile_reload.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomTabBarwidget extends StatelessWidget {
  final List<String> tabs;

  const CustomTabBarwidget({
    super.key,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TabBarProvider>(context);
    return Container(
      height: ScreenUtils.height * 0.05,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                provider.updateIndex(index);
              },
              child: Container(
                height: ScreenUtils.height * 0.4,
                decoration: BoxDecoration(
                  color: provider.selectedIndex == index
                      ? Colors.white
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(tabs[index],
                      style: commonTextStyle.copyWith(
                        color: provider.selectedIndex == index
                            ? Colors.black
                            : Colors.grey,
                      )),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

// CustomTabBarWidget with tabKey //! Curved Blue
class CustomTabBarwidgetCurved extends StatelessWidget {
  final List<String> tabs;
  final String tabKey; // Unique key for each instance
  final TabBarProvider? provider;

  const CustomTabBarwidgetCurved({
    super.key,
    required this.tabs,
    required this.tabKey, // Unique key for each instance
    this.provider,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TabBarProviderCurved>(context);
    return Container(
      height: ScreenUtils.height * 0.05,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        // color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                provider.updateIndex(index, tabKey);
              },
              child: Container(
                height: ScreenUtils.height * 0.4,
                decoration: BoxDecoration(
                  color: provider.getSelectedIndex(tabKey) == index
                      ? AppColors.mainButtonBgColor
                      : AppColors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    tabs[index],
                    style: commonTextStyle.copyWith(
                        color: provider.getSelectedIndex(tabKey) == index
                            ? Colors.white
                            : Colors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
