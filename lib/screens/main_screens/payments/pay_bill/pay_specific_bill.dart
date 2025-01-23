import 'package:cbm_one_app/helpers/colors.dart';
import 'package:cbm_one_app/helpers/spacers.dart';
import 'package:cbm_one_app/helpers/text_styles.dart';
import 'package:cbm_one_app/providers/other_provider/common_provider.dart';
import 'package:cbm_one_app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:cbm_one_app/screens/widgets/container/customer_curved_container.dart';
import 'package:cbm_one_app/screens/widgets/main_button/main_button.dart';
import 'package:cbm_one_app/screens/widgets/text_fields/custom_label_with_textfield.dart';
import 'package:cbm_one_app/screens/widgets/visa_card/visa_card_widget.dart';
import 'package:cbm_one_app/services/screen_size_calculator.dart';
import 'package:cbm_one_app/services/validation_service.dart';
import 'package:cbm_one_app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PaySpecificBill extends StatelessWidget {
  PaySpecificBill({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    child: Form(
                      key: _formKey,
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
                            items: ["dialog", "mobitel", "airtel"],
                            autovalidate: true,
                            validator: (value) =>
                                ValidationService.validateIsNotEmptyField(
                                    value, "Billing"),
                          ),
                          ColumnSpacer(0.01),
                          LabelWithTextField(
                            label: "Mobile number",
                            controller: TextEditingController(),
                            borderRadius: 13.sp,
                            isSmallContentPadding: true,
                            hint: "e.g. 07641356",
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            autovalidate: true,
                            validator: (value) =>
                                ValidationService.validateMobile(
                              value,
                            ),
                          ),
                          ColumnSpacer(0.01),
                          LabelWithTextField(
                            label: "Amount",
                            controller: TextEditingController(),
                            borderRadius: 13.sp,
                            isSmallContentPadding: true,
                            hint: "e.g. 10,0000",
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            autovalidate: true,
                            validator: (value) =>
                                ValidationService.validateIsNotEmptyField(
                                    value, "Amount"),
                          ),
                          ColumnSpacer(0.01),
                          LabelWithTextField(
                            label: "Description",
                            controller: TextEditingController(),
                            borderRadius: 13.sp,
                            isSmallContentPadding: true,
                            hint: "e.g. Send Money",
                            autovalidate: true,
                            validator: (value) =>
                                ValidationService.validateIsNotEmptyField(
                                    value, "Description"),
                          ),
                          ColumnSpacer(0.01),
                          Text(
                            "Pay From",
                            style: commonTextFieldTitleStyle,
                          ),
                          ColumnSpacer(0.005),
                          Consumer<CommonProvider>(
                            builder: (BuildContext context,
                                    CommonProvider commonProvider,
                                    Widget? child) =>
                                SizedBox(
                              height: ScreenUtils.width * 0.35,
                              child: PageView.builder(
                                controller: PageController(
                                  initialPage: commonProvider.currentIndex,
                                  viewportFraction:
                                      0.8, // Card occupies 80% of screen width
                                ),
                                onPageChanged: (index) {
                                  commonProvider.updateIndex(index);
                                },
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: VisaCardWidget2(
                                      gradientColor2: Colors.black87,
                                      gradientColor1:
                                          AppColors.primaryBlueColor,
                                      cardHeight: ScreenUtils.width * 0.33,
                                      cardwidth: ScreenUtils.width * 0.6,
                                      availableBalance: "123,345,44",
                                      accountNumber: "2451344",
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
                  ColumnSpacer(0.1),
                  MainButton(
                    isMainButton: true,
                    btnOnPress: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    buttontitle: "Pay Now",
                  )
                ])));
  }
}
