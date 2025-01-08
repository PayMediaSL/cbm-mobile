import 'package:app/helpers/colors.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_editing_controllers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/widgets/container/customer_curved_container.dart';
import 'package:app/screens/widgets/main_button/main_button.dart';
import 'package:app/screens/widgets/text_fields/custom_label_with_textfield.dart';
import 'package:app/screens/widgets/visa_card/visa_card_widget.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaySpecificBill extends StatelessWidget {
  const PaySpecificBill({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeMainLayout(
        backgroundColor: AppColors.SecondarysubGreyColor,
        isBgContainer1: true,
        isBgContainer2: true,
        isBgContainer1Height: ScreenUtils.height * 0.07,
        onBackIconAvailable: true,
        onBackTitleAvailable: true,
        backTitle: " Bills",
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
                  CustomCurvedContainer(
                    height: ScreenUtils.height * 0.65,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pay New Bills",
                          style: commonTextHeadingStyle,
                        ),
                        ColumnSpacer(0.01),
                        LabelWithDropdown(
                            label: "Billing Provider",
                            borderRadius: 12.sp,
                            dropdownKey: "pay_bill_specific_telephone",
                            items: ["dialog", "mobitel", "airtel"]),
                        ColumnSpacer(0.01),
                        LabelWithTextField(
                          label: "Mobile number",
                          controller: signInPasswordController,
                          borderRadius: 13.sp,
                          isSmallContentPadding: true,
                          hint: "e.g. 07641356",
                        ),
                        ColumnSpacer(0.01),
                        LabelWithTextField(
                          label: "Amount",
                          controller: signInPasswordController,
                          borderRadius: 13.sp,
                          isSmallContentPadding: true,
                          hint: "e.g. 10,0000",
                        ),
                        ColumnSpacer(0.01),
                        LabelWithTextField(
                          label: "Description",
                          controller: signInPasswordController,
                          borderRadius: 13.sp,
                          isSmallContentPadding: true,
                          hint: "e.g. Send Money",
                        ),
                        ColumnSpacer(0.01),
                        Text(
                          "Pay From",
                          style: commonTextFieldTitleStyle,
                        ),
                        ColumnSpacer(0.005),
                        SizedBox(
                          height: ScreenUtils.width * 0.35,
                          child: PageView.builder(
                            controller: PageController(
                              initialPage: 0,
                              viewportFraction:
                                  0.8, // Adjust for card size relative to screen width
                            ),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: VisaCardWidget2(
                                  gradientColor2: Colors.black87,
                                  gradientColor1: AppColors.primaryBlueColor,
                                  cardHeight: ScreenUtils.width * 0.33,
                                  cardwidth: ScreenUtils.width * 0.6,
                                  availableBalance: "123,345,44",
                                  accountNumber: "2451344",
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  ColumnSpacer(0.1),
                  MainButton(
                    isMainButton: true,
                    btnOnPress: () {},
                    buttontitle: "Pay Now",
                  )
                ])));
  }
}
