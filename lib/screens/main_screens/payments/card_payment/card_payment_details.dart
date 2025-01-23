// ignore_for_file: must_be_immutable

import 'package:cbm_one_app/helpers/colors.dart';
import 'package:cbm_one_app/helpers/constants.dart';
import 'package:cbm_one_app/helpers/spacers.dart';
import 'package:cbm_one_app/helpers/text_editing_controllers.dart';
import 'package:cbm_one_app/helpers/text_styles.dart';
import 'package:cbm_one_app/providers/other_provider/common_provider.dart';
import 'package:cbm_one_app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:cbm_one_app/screens/widgets/main_button/main_button.dart';
import 'package:cbm_one_app/screens/widgets/text_fields/custom_label_with_textfield.dart';
import 'package:cbm_one_app/screens/widgets/visa_card/visa_card_widget.dart';
import 'package:cbm_one_app/services/screen_size_calculator.dart';
import 'package:cbm_one_app/services/validation_service.dart';
import 'package:cbm_one_app/utils/log_util.dart';
import 'package:cbm_one_app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CardPaymentDetails extends StatelessWidget {
  CardPaymentDetails({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // late PageController _pageController;

  final List<Map<String, String>> cardData = [
    {
      'availableBalance': 'John Doe',
      'accountNumber': '1',
      'currentBalance': '12/25',
      'accountHold': '12/25',
      'isWallet': 'false',
    },
    {
      'availableBalance': 'John Doe',
      'accountNumber': '2',
      'currentBalance': '12/25',
      'accountHold': '12/25',
      'isWallet': 'true',
    },
    {
      'availableBalance': 'John Doe',
      'accountNumber': '3',
      'currentBalance': '12/25',
      'accountHold': '12/25',
      'isWallet': 'false',
    },
    {
      'availableBalance': 'John Doe',
      'accountNumber': '3',
      'currentBalance': '12/25',
      'accountHold': '12/25',
      'isWallet': 'false',
    },
  ];

  final List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return HomeMainLayout(
        backgroundColor: AppColors.SecondarysubGreyColor,
        isBgContainer1: true,
        isBgContainer2: true,
        isBgContainer1Height: ScreenUtils.height * 0.07,
        onBackIconAvailable: true,
        onBackTitleAvailable: true,
        backTitle: "Card Payment",
        onBackTap: () {
          popScreen(context);
        },
        children: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ColumnSpacer(0.05),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.sp, horizontal: 10.sp),
                    height: ScreenUtils.height * 0.7,
                    width: ScreenUtils.width,
                    decoration: BoxDecoration(
                        color: AppColors.primaryWhiteColor,
                        borderRadius: BorderRadius.circular(UI.borderRadius)),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Payment Details",
                              style: commonTextStyle.copyWith(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryBlackColor),
                            ),
                            ColumnSpacer(0.01),

                            LabelWithDropdown(
                                autovalidate: true,
                                validator: (value) =>
                                    ValidationService.validateIsNotEmptyField(
                                        value, "Payment"),
                                label: "Pay to",
                                borderRadius: 12.sp,
                                dropdownKey: "card_payment_pay_to",
                                items: ["option1", "option2", "option3"]),

                            //!?Readfing Drop Down Value
                            // String selectedValue1 = context.read<DropdownProvider>().getSelectedValue('dropdown1');
                            // String selectedValue2 = context.read<DropdownProvider>().getSelectedValue('dropdown2');
                            // print("Selected Value 1: $selectedValue1");
                            // print("Selected Value 2: $selectedValue2");

                            ColumnSpacer(0.01),
                            LabelWithTextField(
                                autovalidate: true,
                                validator: (input) =>
                                    ValidationService.validateIsNotEmptyField(
                                        input, "Amount"),
                                keyboardType: TextInputType.number,
                                label: "Amount ",
                                controller: cardPaymentAmountController,
                                borderRadius: 12.sp,
                                isSmallContentPadding: true,
                                hint: "eg : 30000"),
                            ColumnSpacer(0.01),
                            LabelWithDropdown(
                                autovalidate: true,
                                validator: (value) =>
                                    ValidationService.validateIsNotEmptyField(
                                        value, "Card Number"),
                                label: "Card Number",
                                borderRadius: 12.sp,
                                dropdownKey: "card_payment_card_number",
                                items: ["option1", "option2", "option3"]),
                            ColumnSpacer(0.01),
                            LabelWithTextField(
                              label: "Card Holder Name ",
                              controller: cardPaymentCardHolderNameController,
                              borderRadius: 12.sp,
                              isSmallContentPadding: true,
                              hint: "eg : john doe",
                              autovalidate: true,
                              validator: (value) =>
                                  ValidationService.validateIsNotEmptyField(
                                      value, "Card Holder Name"),
                            ),
                            ColumnSpacer(0.01),
                            LabelWithTextField(
                              label: "Description ",
                              controller: cardPaymentDescriptionController,
                              borderRadius: 12.sp,
                              isSmallContentPadding: true,
                              hint: "eg : Card Payment",
                              autovalidate: true,
                              validator: (value) =>
                                  ValidationService.validateIsNotEmptyField(
                                      value, "Description"),
                            ),
                            ColumnSpacer(0.01),
                            Text(
                              "Pay From",
                              style: commonTextStyle.copyWith(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryBlackColor),
                            ),
                            ColumnSpacer(0.006),
                            Consumer<CommonProvider>(
                              builder: (BuildContext context,
                                      CommonProvider commonProvider,
                                      Widget? child) =>
                                  SizedBox(
                                height: ScreenUtils.width * 0.4,
                                child: PageView.builder(
                                  controller: PageController(
                                    initialPage: commonProvider.currentIndex,
                                    viewportFraction:
                                        0.8, // Card occupies 80% of screen width
                                  ),
                                  onPageChanged: (index) {
                                    commonProvider.updateIndex(index);
                                    // _printCardDetails(cardData[index]);

                                    // _printCardDetails(cardData[
                                    //     index]);
                                  },
                                  itemCount: cardData.length,
                                  itemBuilder: (context, index) {
                                    final card = cardData[index];

                                    if (index == commonProvider.currentIndex) {
                                      _printCardDetails(cardData[
                                          commonProvider.currentIndex]);
                                    }
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: VisaCardWidget2(
                                        gradientColor2: Colors.black87,
                                        gradientColor1:
                                            AppColors.primaryBlueColor,
                                        cardHeight: ScreenUtils.width * 0.33,
                                        cardwidth: ScreenUtils.width * 0.6,
                                        availableBalance:
                                            card["availableBalance"] ?? "",
                                        accountNumber:
                                            card["accountNumber"] ?? "",
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ColumnSpacer(0.03),
                  MainButton(
                    isMainButton: true,
                    buttontitle: "Proceed to payment",
                    btnOnPress: () {
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, proceed with submission
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Form is valid!')),
                        );
                      }
                    },
                  )
                ])));
  }

  void _printCardDetails(Map<String, String> card) {
    printLog('Selected Card Details:');
    card.forEach((key, value) {
      printLog('$key: $value');
    });
  }
}
