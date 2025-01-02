import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_editing_controllers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/widgets/main_button/main_button.dart';
import 'package:app/screens/widgets/text_fields/custom_text_field.dart';
import 'package:app/screens/widgets/visa_card/visa_card_widget.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/drop_down/custom_drop_down_field.dart';

class CardPaymentDetails extends StatelessWidget {
  CardPaymentDetails({super.key});
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
                          Text(
                            "Pay to",
                            style: commonTextStyle.copyWith(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryBlackColor),
                          ),
                          ColumnSpacer(0.006),

                          CustomDropdown(
                            borderradius: 13.sp,
                            dropdownKey:
                                'dropdown1', // Unique key for first dropdown
                            items: ['Option 1', 'Option 2', 'Option 3'],
                          ),

                          //!?Readfing Drop Down Value

                          // String selectedValue1 = context.read<DropdownProvider>().getSelectedValue('dropdown1');
                          // String selectedValue2 = context.read<DropdownProvider>().getSelectedValue('dropdown2');
                          // print("Selected Value 1: $selectedValue1");
                          // print("Selected Value 2: $selectedValue2");

                          ColumnSpacer(0.01),
                          Text(
                            "Amount",
                            style: commonTextStyle.copyWith(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryBlackColor),
                          ),
                          ColumnSpacer(0.006),
                          CustomLableTextField(
                            isSmallContentPadding: true,
                            borderradius: 13.sp,
                            inputFormatters: [],
                            emailrController,
                            hint: "RS.3000",
                          ),
                          ColumnSpacer(0.01),
                          Text(
                            "Card Number",
                            style: commonTextStyle.copyWith(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryBlackColor),
                          ),
                          ColumnSpacer(0.006),
                          CustomDropdown(
                            borderradius: 13.sp,
                            dropdownKey:
                                'dropdown2', // Unique key for first dropdown
                            items: ['Option 1', 'Option 2', 'Option 3'],
                          ),
                          ColumnSpacer(0.01),
                          Text(
                            "Card HolderName",
                            style: commonTextStyle.copyWith(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryBlackColor),
                          ),
                          ColumnSpacer(0.006),
                          CustomLableTextField(
                            isSmallContentPadding: true,
                            borderradius: 13.sp,
                            inputFormatters: [],
                            emailrController,
                            hint: "eg: John Doe",
                          ),
                          ColumnSpacer(0.01),
                          Text(
                            "Description",
                            style: commonTextStyle.copyWith(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryBlackColor),
                          ),
                          ColumnSpacer(0.006),
                          CustomLableTextField(
                            isSmallContentPadding: true,
                            borderradius: 13.sp,
                            inputFormatters: [],
                            emailrController,
                            hint: "Card Payment",
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
                          SizedBox(
                            height: ScreenUtils.width * 0.4,
                            child: PageView.builder(
                              controller: PageController(
                                viewportFraction:
                                    0.8, // Adjust for card size relative to screen width
                              ),
                              itemCount: cardData.length,
                              itemBuilder: (context, index) {
                                final card = cardData[index];
                                return Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: VisaCardWidget2(
                                    gradientColor2: Colors.black87,
                                    gradientColor1: AppColors.primaryBlueColor,
                                    cardHeight: ScreenUtils.width * 0.33,
                                    cardwidth: ScreenUtils.width * 0.6,
                                    availableBalance:
                                        card["availableBalance"] ?? "",
                                    accountNumber: card["accountNumber"] ?? "",
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ColumnSpacer(0.03),
                  MainButton(
                    isMainButton: true,
                    buttontitle: "Proceed to payment",
                    btnOnPress: () {},
                  )
                ])));
  }
}
