// ignore_for_file: avoid_unnecessary_containers

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/povider_helper/common_provider.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/drawer/toggle_provider.dart';
import 'package:app/providers/payments/mobile_reload.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:app/screens/widgets/container/customer_curved_container.dart';
import 'package:app/screens/widgets/custom_tab/custom_tab_bar.dart';
import 'package:app/screens/widgets/main_button/main_button.dart';
import 'package:app/screens/widgets/text_fields/custom_label_with_textfield.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/services/validation_service.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ScheduledPaymentScreen extends StatelessWidget {
  ScheduledPaymentScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<Map<String, String>> savedTransfers = List.generate(
    10,
    (index) =>
        {"name": "Alan Board", "type": "Fund Transfer", "account": "123123897"},
  );

  final List<Map<String, String>> upcomingPayments = List.generate(
    10,
    (index) => {"name": "Boarding Fee", "type": "Fund Transfer"},
  );

  @override
  Widget build(BuildContext context) {
    return HomeMainLayout(
        backgroundColor: AppColors.SecondarysubGreyColor,
        isBgContainer1: true,
        isBgContainer2: true,
        isBgContainer1Height: ScreenUtils.height * 0.07,
        onBackIconAvailable: true,
        onBackTitleAvailable: true,
        onBackTap: () {
          popScreen(context);
        },
        backTitle: "Schedule Payment",
        children: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ColumnSpacer(0.03),
                const CustomTabBarwidgetCurved(
                  tabs: ['Transfer', 'Bill'],
                  tabKey: 'schedulepayment',
                ),
                ColumnSpacer(0.02),
                Consumer<TabBarProviderCurved>(
                  builder: (context, provider, _) {
                    if (provider.getSelectedIndex("schedulepayment") == 0) {
                      return transfer(context);
                    } else {
                      return bill(context);
                    }
                  },
                ),
                ColumnSpacer(0.05),
                Consumer<TabBarProviderCurved>(
                  builder: (BuildContext context,
                          TabBarProviderCurved tabProvider, Widget? child) =>
                      MainButton(
                    isMainButton: true,
                    btnOnPress: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    buttontitle:
                        tabProvider.getSelectedIndex("schedulepayment") == 0
                            ? "Confirm"
                            : "Schedule Payment",
                  ),
                )
              ]),
        ));
  }

  Widget transfer(BuildContext context) {
    return CustomCurvedContainer(
        height: ScreenUtils.height * 0.65,
        child: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Schedule your Transfers",
                  style: commonTextHeadingStyle,
                ),
                ColumnSpacer(0.001),
                Text(
                  "Schedule Transfer money to bank accounts.",
                  style: commonTextSubHeadingStyle,
                ),
                ColumnSpacer(0.013),
                LabelWithTextField(
                  suffixIcon: IconButton(
                      onPressed: () {
                        showDateTimePickerBottomSheet(
                            context, "schedule_payment_transfer_date");
                      },
                      icon: Icon(Icons.calendar_month_rounded)),
                  label: "Date",
                  controller: TextEditingController(),
                  borderRadius: 12.sp,
                  isSmallContentPadding: true,
                  hint: "12/23/14",
                  autovalidate: true,
                  validator: (input) =>
                      ValidationService.validateIsNotEmptyField(input, "Date"),
                ),
                ColumnSpacer(0.01),
                LabelWithTextField(
                  label: "Account Number",
                  controller: TextEditingController(),
                  borderRadius: 12.sp,
                  isSmallContentPadding: true,
                  hint: "e.g. ********127",
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  autovalidate: true,
                  validator: (input) => ValidationService.validateAccoutNumber(
                    input,
                  ),
                ),
                ColumnSpacer(0.01),
                LabelWithTextField(
                  label: "Account Name",
                  controller: TextEditingController(),
                  borderRadius: 12.sp,
                  isSmallContentPadding: true,
                  hint: "eg : john doe",
                  autovalidate: true,
                  validator: (input) =>
                      ValidationService.validateIsNotEmptyField(input, "Name"),
                ),
                ColumnSpacer(0.01),
                LabelWithTextField(
                  label: "Amount ",
                  controller: TextEditingController(),
                  borderRadius: 12.sp,
                  isSmallContentPadding: true,
                  hint: "eg : 100,000",
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  autovalidate: true,
                  validator: (input) =>
                      ValidationService.validateIsNotEmptyField(
                          input, "Amount"),
                ),
                ColumnSpacer(0.01),
                LabelWithDropdown(
                  label: "Billing Cycle",
                  borderRadius: 12.sp,
                  dropdownKey: "schedule_payment_billing_cycle",
                  items: ["option1", "option2", "option3"],
                  validator: (input) =>
                      ValidationService.validateIsNotEmptyField(
                          input, "Billing"),
                ),
                ColumnSpacer(0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Consumer<ToggleSwitchProvider>(
                      builder: (BuildContext context,
                              ToggleSwitchProvider value, Widget? child) =>
                          Transform.scale(
                        scale: 0.8,
                        child: CupertinoSwitch(
                          value: value.getSwitchState("switch_schedule_bill"),
                          activeColor: AppColors.primaryBlueColor,
                          trackColor:
                              AppColors.primaryBlackColor.withOpacity(0.12),
                          thumbColor: AppColors.primaryWhiteColor,
                          onChanged: (v) {
                            value.toggleSwitch("switch_schedule_bill", v);
                          },
                        ),
                      ),
                    ),
                    Text(
                      "Add to Favourite",
                      style: commonTextFieldTitleStyle,
                    ),
                  ],
                ),
              ]),
        )));
  }

  Widget bill(BuildContext context) {
    var commonProvider = getCommonProvider(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCurvedContainer(
          height: ScreenUtils.height * 0.25,
          child: SizedBox(
            height: ScreenUtils.height * 0.2,
            child: SingleChildScrollView(
              child: buildExpandableSection(
                title: "SAVED TRANSFERS",
                data: savedTransfers,
                isExpanded: commonProvider.getStates("schedulebilltransfer1"),
                maxItems: 3,
                // showArrow: true,
                onToggle: () {
                  commonProvider.toggleStates("schedulebilltransfer1");
                },
                onItemTap: (item) {
                  // Handle tap for saved transfers
                  // showItemDetails(context, item);
                },
              ),
            ),
          ),
        ),
        ColumnSpacer(0.01),
        CustomCurvedContainer(
          height: ScreenUtils.height * 0.4,
          child: SizedBox(
            height: ScreenUtils.height * 0.3,
            child: SingleChildScrollView(
              child: buildExpandableSection(
                title: "UPCOMOING PAYMENTS",
                data: upcomingPayments,
                isExpanded: commonProvider.getStates("schedulebilltransfer2"),
                maxItems: 3,
                showArrow: true,
                onToggle: () {
                  commonProvider.toggleStates("schedulebilltransfer2");
                },
                onItemTap: (item) {
                  // Handle tap for saved transfers
                  // showItemDetails(context, item);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildExpandableSection({
  required String title,
  required List<Map<String, String>> data,
  required bool isExpanded,
  required int maxItems,
  required VoidCallback onToggle,
  required Function(Map<String, String>) onItemTap,
  bool showArrow = false,
}) {
  return Column(
    children: [
      // Header Row
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: commonTextFieldTitleStyle.copyWith(fontFamily: "jost")),
          GestureDetector(
            onTap: onToggle,
            child: Text(isExpanded ? "Show less" : "View all",
                style: commonTextFieldTitleStyle.copyWith(
                    color: AppColors.primaryBlueColor)),
          ),
        ],
      ),

      Column(
        children: List.generate(
          isExpanded ? data.length : maxItems,
          (index) {
            final item = data[index];
            return InkWell(
              onTap: () => onItemTap(item),
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.account_balance_wallet),
                  backgroundColor: AppColors.bottomNavBgColor,
                ),
                title: Text(
                  item["name"] ?? "",
                  style: commonTextFieldTitleStyle.copyWith(fontFamily: "jost"),
                ),
                subtitle: Text(item["type"]!,
                    style: commonTextFieldTitleStyle.copyWith(
                        fontFamily: "jost",
                        color: AppColors.secondarysubGreyColor4)),
                trailing: showArrow
                    ? Icon(Icons.arrow_forward_ios, size: 16)
                    : Text(
                        item["account"] ?? "",
                        style: commonTextFieldTitleStyle.copyWith(
                            fontFamily: "jost"),
                      ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
