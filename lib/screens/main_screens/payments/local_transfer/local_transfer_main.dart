import 'package:app/helpers/colors.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/providers/payments/mobile_reload.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/widgets/custom_tab/custom_tab_bar.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LocalTransferMainScreen extends StatelessWidget {
  const LocalTransferMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeMainLayout(
        backgroundColor: AppColors.SecondarysubGreyColor,
        isBgContainer1: true,
        isBgContainer2: true,
        isBgContainer1Height: ScreenUtils.height * 0.07,
        onBackIconAvailable: true,
        onBackTitleAvailable: true,
        backTitle: "Local Transfer",
        onBackTap: () {
          popScreen(context);
        },
        children: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ColumnSpacer(0.03),
                  const CustomTabBarwidgetCurved(
                    tabs: ['Own Account', 'Other Bank', 'One App User'],
                    tabKey: 'localtransfer',
                  ),
                  Consumer<TabBarProviderCurved>(
                    builder: (context, provider, _) {
                      if (provider.getSelectedIndex("localtransfer") == 0) {
                        return Text("sdsds");
                      } else {
                        return Text("janu");

                        // if (provider.getSelectedIndex("localtransfer") == 1) {}
                        // _showContactsBottomSheet(context);

                        // return const Center(
                        //     child: Text("Saved contacts content"));
                      }
                    },
                  ),
                ])));
  }

  Widget buildAccountTab() {
    return Container();
  }

  Widget buildAccountTab2() {
    return Container();
  }
}
