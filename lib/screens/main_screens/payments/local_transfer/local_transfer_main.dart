import 'package:app/helpers/colors.dart';
import 'package:app/helpers/povider_helper/common_provider.dart';
import 'package:app/helpers/routes.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_editing_controllers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/drawer/toggle_provider.dart';
import 'package:app/providers/other_provider/common_provider.dart';
import 'package:app/providers/payments/mobile_reload.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:app/screens/widgets/container/customer_curved_container.dart';
import 'package:app/screens/widgets/custom_tab/custom_tab_bar.dart';
import 'package:app/screens/widgets/drop_down/custom_drop_down_field.dart';
import 'package:app/screens/widgets/favourite/favorite_widget.dart';
import 'package:app/screens/widgets/icons/custom_icons.dart';
import 'package:app/screens/widgets/main_button/main_button.dart';
import 'package:app/screens/widgets/text_fields/custom_label_with_textfield.dart';
import 'package:app/screens/widgets/text_fields/custom_text_field.dart';
import 'package:app/screens/widgets/visa_card/visa_card_widget.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/services/validation_service.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LocalTransferMainScreen extends StatelessWidget {
  LocalTransferMainScreen({super.key});

  final GlobalKey<FormState> _formKeyOwnAccount = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyOtherBank = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyOneAppUser = GlobalKey<FormState>();

  final List<Map<String, String>> favorites = [
    {
      "bank": "BOC",
      "name": "Janu",
    },
    {
      "bank": "Cargills",
      "name": "test",
    },
    {
      "bank": "Commercial",
      "name": "404ven0m",
    },
    {
      "bank": "DFCC",
      "name": "Strix",
    },
    {
      "bank": "HNB",
      "name": "qwe",
    },
  ];

  @override
  Widget build(BuildContext context) {
    //TODO NEED TO ADD CONTROLLER FOR TEXT FORM FIELDS
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
                  ColumnSpacer(0.02),
                  Consumer<TabBarProviderCurved>(
                    builder: (context, provider, _) {
                      if (provider.getSelectedIndex("localtransfer") == 0) {
                        return ownAccountTransfer();
                      } else if (provider.getSelectedIndex("localtransfer") ==
                          1) {
                        return otherBankTransfer(context);
                      } else {
                        return oneAppUserTransfer(context);
                      }
                    },
                  ),
                  ColumnSpacer(0.07),
                  MainButton(
                    isMainButton: true,
                    btnOnPress: () {
                      if (_formKeyOwnAccount.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Form is valid!')),
                        );
                        pushScreen(context,
                            ScreenRoutes.toTransactionConfirmationScreen);
                      }
                      if (_formKeyOtherBank.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Form is valid!')),
                        );
                        pushScreen(context,
                            ScreenRoutes.toTransactionConfirmationScreen);
                      }
                      if (_formKeyOneAppUser.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Form is valid!')),
                        );
                        pushScreen(context,
                            ScreenRoutes.toTransactionConfirmationScreen);
                      }
                    },
                    buttontitle: "Proceed to Payment",
                  )
                ])));
  }

  Widget ownAccountTransfer() {
    return CustomCurvedContainer(
      height: ScreenUtils.height * 0.65,
      child: SingleChildScrollView(
        child: Form(
          key: _formKeyOwnAccount,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Own Account Transfer",
                style: commonTextHeadingStyle,
              ),
              ColumnSpacer(0.001),
              Text(
                "Transfer money between your bank accounts",
                style: commonTextSubHeadingStyle,
              ),
              ColumnSpacer(0.01),
              Text(
                "Payment Details",
                style: commonTextHeadingStyle,
              ),
              ColumnSpacer(0.013),
              Text(
                "Amount",
                style: commonTextFieldTitleStyle,
              ),
              ColumnSpacer(0.005),
              CustomLableTextField(
                localTransferOwnAccountAmountController,
                hint: "e.g : 10,00,000",
                autovalidate: true,
                validator: (input) =>
                    ValidationService.validateIsNotEmptyField(input, "Amount"),
              ),
              ColumnSpacer(0.01),
              Text(
                "Pay From",
                style: commonTextFieldTitleStyle,
              ),
              ColumnSpacer(0.001),
              Consumer<CommonProvider>(
                builder: (BuildContext context, CommonProvider commonProvider,
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
              ),
              Text(
                "Pay To",
                style: commonTextFieldTitleStyle,
              ),
              ColumnSpacer(0.001),
              Consumer<CommonProvider>(
                builder: (BuildContext context, CommonProvider commonProvider,
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  //! Widget Other Bank Transfer

  Widget otherBankTransfer(BuildContext context) {
    var commonProvider = getCommonProvider(context);
    return CustomCurvedContainer(
      height: ScreenUtils.height * 0.65,
      child: SingleChildScrollView(
        child: Form(
          key: _formKeyOtherBank,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Other Bank Transfer",
                style: commonTextHeadingStyle,
              ),
              ColumnSpacer(0.001),
              Text(
                "Transfer money between your bank accounts",
                style: commonTextSubHeadingStyle,
              ),
              ColumnSpacer(0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Favourites",
                    style: commonTextHeadingStyle,
                  ),
                  GestureDetector(
                    onTap: () {
                      commonProvider.toggleStates("localtransferfavourite");
                    },
                    child: Text(
                      commonProvider.getStates("localtransferfavourite")
                          ? "viewless"
                          : "viewall",
                      style: commonTextSubHeadingStyle.copyWith(
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              ColumnSpacer(0.02),
              SizedBox(
                height: ScreenUtils.height * 0.12,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // Always include the "Add" card
                  itemCount: commonProvider.getStates("localtransferfavourite")
                      ? favorites.length + 1
                      : (favorites.length >= 3 ? 3 : favorites.length) + 1,
                  itemBuilder: (context, index) {
                    if (index == favorites.length ||
                        (!commonProvider.getStates("localtransferfavourite") &&
                            index ==
                                (favorites.length >= 3
                                    ? 3
                                    : favorites.length))) {
                      return _buildFavoriteCard(
                        'Add',
                        '',
                        ImageAsset().authBg,
                        onTap: () {
                          pushScreen(context,
                              ScreenRoutes.toLocalTransferAddtoFavourite);
                          // Perform Add action
                        },
                      );
                    } else {
                      return _buildFavoriteCard(
                        favorites[index]["name"].toString(),
                        favorites[index]["bank"].toString(),
                        ImageAsset().authBg,
                      );
                    }
                  },
                ),
              ),
              ColumnSpacer(0.02),
              Text(
                "Payment Details",
                style: commonTextHeadingStyle,
              ),
              ColumnSpacer(0.01),
              Text(
                "Pay From",
                style: commonTextFieldTitleStyle,
              ),
              ColumnSpacer(0.001),
              Consumer<CommonProvider>(
                builder: (BuildContext context, CommonProvider commonProvider,
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
                      if (index == commonProvider.currentIndex) {
                        //print
                      }
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
              ),
              ColumnSpacer(0.01),
              LabelWithDropdown(
                label: "Recipient’s bank",
                dropdownKey: "local_transfer_main_bank",
                items: ["option1", "option2", "option3"],
                autovalidate: true,
                validator: (value) =>
                    ValidationService.validateIsNotEmptyField(value, "Bank"),
              ),
              ColumnSpacer(0.01),

              LabelWithTextField(
                label: "Receipient's account number",
                controller: TextEditingController(),
                hint: "234563354",
                autovalidate: true,
                validator: (value) =>
                    ValidationService.validateAccoutNumber(value),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              ColumnSpacer(0.01),
              LabelWithTextField(
                label: "Recipient’s name",
                controller: TextEditingController(),
                hint: "eg : john doe",
                autovalidate: true,
                validator: (value) =>
                    ValidationService.validateIsNotEmptyField(value, "Name"),
              ),

              ColumnSpacer(0.01),

              LabelWithTextField(
                label: "Amount",
                controller: TextEditingController(),
                hint: "eg:10,000",
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                autovalidate: true,
                validator: (value) =>
                    ValidationService.validateIsNotEmptyField(value, "Amount"),
              ),

              ColumnSpacer(0.01),
              Text(
                "Date",
                style: commonTextFieldTitleStyle,
              ),
              ColumnSpacer(0.005),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomLableTextField(
                      TextEditingController(),
                      borderradius: 12.sp,
                      hint: "mm/dd/yyyy",
                      suffixIcon: IconButton(
                          onPressed: () {
                            showDateTimePickerBottomSheet(
                                context, "local_payment_otherbank_date");
                          },
                          icon: Icon(
                            UtilityIcons.calendar,
                            color: AppColors.textFieldHintColor,
                          )),
                      autovalidate: true,
                      validator: (value) =>
                          ValidationService.validateIsNotEmptyField(
                              value, "Date"),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Consumer<ToggleSwitchProvider>(
                        builder: (BuildContext context,
                                ToggleSwitchProvider value, Widget? child) =>
                            Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                            value: value.getSwitchState(
                                "switch_localtransfer_recurring"),
                            activeColor: AppColors.primaryBlueColor,
                            trackColor:
                                AppColors.primaryBlackColor.withOpacity(0.12),
                            thumbColor: AppColors.primaryWhiteColor,
                            onChanged: (v) {
                              value.toggleSwitch(
                                  "switch_localtransfer_recurring", v);
                            },
                          ),
                        ),
                      ),
                      // RowSpacer(0.1),
                      Text(
                        "Recurring",
                        style: commonTextFieldTitleStyle,
                      ),
                    ],
                  )
                ],
              ),
              ColumnSpacer(0.01),
              //?

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Repeat EveryDay",
                    style: commonTextFieldTitleStyle,
                  ),
                  RowSpacer(0.16),
                  Text(
                    "Until Date",
                    style: commonTextFieldTitleStyle,
                  ),
                ],
              ),
              ColumnSpacer(0.005),

              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomDropdown(
                    hint: "Day",
                    dropdownwidth: ScreenUtils.width * 0.2,
                    borderradius: 13.sp,
                    dropdownKey: 'local_transfer_day',
                    items: ['1', '2', '3'],
                    autovalidate: true,
                    validator: (value) =>
                        ValidationService.validateIsNotEmptyFieldRequired(
                            value, "*"),
                  ),
                  RowSpacer(0.01),
                  CustomDropdown(
                    hint: "month",
                    dropdownwidth: ScreenUtils.width * 0.24,
                    borderradius: 13.sp,
                    dropdownKey: 'local_transfer_month',
                    items: ['1', '2', '3'],
                    autovalidate: true,
                    validator: (value) =>
                        ValidationService.validateIsNotEmptyFieldRequired(
                            value, "*"),
                  ),
                  RowSpacer(0.01),
                  Expanded(
                    child: CustomLableTextField(
                      TextEditingController(),
                      borderradius: 12.sp,
                      hint: "mm/dd/yyyy",
                      suffixIcon: IconButton(
                          onPressed: () {
                            showDateTimePickerBottomSheet(
                                context, "local_payment_otherbank_until_date");
                          },
                          icon: Icon(
                            UtilityIcons.calendar,
                            color: AppColors.textFieldHintColor,
                          )),
                      autovalidate: true,
                      validator: (value) =>
                          ValidationService.validateIsNotEmptyFieldRequired(
                              value, "*"),
                    ),
                  ),
                ],
              ),

              ColumnSpacer(0.01),
              LabelWithTextField(
                label: "Personal note",
                controller: TextEditingController(),
                hint: "e.g. Transferred refreshment charges to Jane",
                autovalidate: true,
                validator: (value) =>
                    ValidationService.validateIsNotEmptyField(value, "Note"),
              ),

              ColumnSpacer(0.01),
              LabelWithTextField(
                label: "Note to recipient",
                controller: TextEditingController(),
                hint: "e.g. Transferred refreshment charges",
                autovalidate: true,
                validator: (value) =>
                    ValidationService.validateIsNotEmptyField(value, "Note"),
              ),
            ],
          ),
        ),
      ),
    );
  }
  //! One App User

  Widget oneAppUserTransfer(BuildContext context) {
    var commonProvider = getCommonProvider(context);
    return CustomCurvedContainer(
      height: ScreenUtils.height * 0.65,
      child: SingleChildScrollView(
        child: Form(
          key: _formKeyOwnAccount,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "One App Account Transfer",
                style: commonTextHeadingStyle,
              ),
              ColumnSpacer(0.001),
              Text(
                "Transfer money between your bank accounts",
                style: commonTextSubHeadingStyle,
              ),
              ColumnSpacer(0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Recently Used",
                    style: commonTextHeadingStyle,
                  ),
                  GestureDetector(
                    onTap: () {
                      commonProvider.toggleStates("localtransferfavourite2");
                    },
                    child: Text(
                      commonProvider.getStates("localtransferfavourite2")
                          ? "viewless"
                          : "viewall",
                      style: commonTextSubHeadingStyle.copyWith(
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              ColumnSpacer(0.02),
              SizedBox(
                height: ScreenUtils.height * 0.12,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // Always include the "Add" card
                  itemCount: commonProvider.getStates("localtransferfavourite2")
                      ? favorites.length + 1
                      : (favorites.length >= 3 ? 3 : favorites.length) + 1,
                  itemBuilder: (context, index) {
                    if (index == favorites.length ||
                        (!commonProvider.getStates("localtransferfavourite2") &&
                            index ==
                                (favorites.length >= 3
                                    ? 3
                                    : favorites.length))) {
                      return FavoriteCard(
                        name: 'Add',
                        details: '',
                        image: ImageAsset().authBg,
                        onTap: () {
                          pushScreen(context,
                              ScreenRoutes.toLocalTransferAddtoFavourite);
                          // Perform Add action
                        },
                      );
                    } else {
                      return FavoriteCard(
                        name: favorites[index]["name"].toString(),
                        details: favorites[index]["bank"].toString(),
                        image: ImageAsset().authBg,
                      );
                    }
                  },
                ),
              ),
              // SizedBox(
              //   height: ScreenUtils.height * 0.12,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     // Always include the "Add" card
              //     itemCount: commonProvider.getStates("localtransferfavourite")
              //         ? favorites.length + 1
              //         : (favorites.length >= 3 ? 3 : favorites.length) + 1,
              //     itemBuilder: (context, index) {
              //       if (index == favorites.length ||
              //           (!commonProvider.getStates("localtransferfavourite") &&
              //               index ==
              //                   (favorites.length >= 3 ? 3 : favorites.length))) {
              //         return _buildFavoriteCard(
              //           'Add',
              //           '',
              //           ImageAsset().authBg,
              //           onTap: () {
              //             // Perform Add action
              //           },
              //         );
              //       } else {
              //         return _buildFavoriteCard(
              //           favorites[index]["name"].toString(),
              //           favorites[index]["bank"].toString(),
              //           ImageAsset().authBg,
              //         );
              //       }
              //     },
              //   ),
              // ),
              ColumnSpacer(0.02),
              Text(
                "Payment Details",
                style: commonTextHeadingStyle,
              ),
              ColumnSpacer(0.01),
              LabelWithTextField(
                label: "Mobile Number",
                controller: TextEditingController(),
                borderRadius: 12.sp,
                hint: "e.g. 0765342345",
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                autovalidate: true,
                validator: (value) =>
                    ValidationService.validateUserMobileNumber(
                  value,
                ),
              ),
              ColumnSpacer(0.01),
              LabelWithTextField(
                label: "Amount",
                controller: TextEditingController(),
                borderRadius: 12.sp,
                hint: "e.g. 10,0000",
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                autovalidate: true,
                validator: (value) =>
                    ValidationService.validateIsNotEmptyField(value, "Amount"),
              ),
              ColumnSpacer(0.01),
              LabelWithTextField(
                label: "Personal note",
                controller: TextEditingController(),
                borderRadius: 12.sp,
                hint: "e.g. Transferred refreshment charges to Jane",
                autovalidate: true,
                validator: (value) =>
                    ValidationService.validateIsNotEmptyField(value, "Note"),
              ),
              ColumnSpacer(0.01),
              LabelWithTextField(
                label: "Note to recipient",
                controller: TextEditingController(),
                borderRadius: 12.sp,
                hint: "e.g. Transferred refreshment charges",
                autovalidate: true,
                validator: (value) =>
                    ValidationService.validateIsNotEmptyField(value, "Note"),
              ),
              ColumnSpacer(0.01),

              // Text(
              //   "Mobile Number",
              //   style: commonTextFieldTitleStyle,
              // ),
              // ColumnSpacer(0.005),
              // CustomLableTextField(
              //   signInPasswordController,
              //   borderradius: 12.sp,
              //   isSmallContentPadding: true,
              //   hint: "e.g : 0754314567",
              // ),
              // ColumnSpacer(0.01),
              // Text(
              //   "Amount",
              //   style: commonTextFieldTitleStyle,
              // ),
              // ColumnSpacer(0.005),
              // CustomLableTextField(
              //   signInPasswordController,
              //   borderradius: 12.sp,
              //   isSmallContentPadding: true,
              //   hint: "e.g : 10,00,000",
              // ),
              // ColumnSpacer(0.01),
              // Text(
              //   "Personal Notes",
              //   style: commonTextFieldTitleStyle,
              // ),
              // ColumnSpacer(0.005),
              // CustomLableTextField(
              //   signInPasswordController,
              //   borderradius: 12.sp,
              //   isSmallContentPadding: true,
              //   hint: "e.g. Transferred refreshment charges to Jane",
              // ),
              // ColumnSpacer(0.01),
              // Text(
              //   "Notes to Receipients",
              //   style: commonTextFieldTitleStyle,
              // ),
              // ColumnSpacer(0.005),
              // CustomLableTextField(
              //   signInPasswordController,
              //   borderradius: 12.sp,
              //   isSmallContentPadding: true,
              //   hint: "e.g. Transferred refreshment charges to Jane",
              // ),
            ],
          ),
        ),
      ),
    );
  }

//! Favourites Card
  Widget _buildFavoriteCard(String name, String details, String image,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: ScreenUtils.width * 0.2,
        // margin: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: name == "Add" ? null : AssetImage(image),
              backgroundColor: name == "Add"
                  ? AppColors.iconGreyColor
                  : AppColors.transparent,
              child: Icon(name == "Add" ? BaseIcons.add : null,
                  size: 30, color: AppColors.primaryBlackColor),
            ),
            Text(
              name,
              style: commonTextStyle.copyWith(
                  color: AppColors.primaryBlackColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            if (details.isNotEmpty)
              Text(
                details,
                style: commonTextStyle_black_500_12sp.copyWith(
                  color: AppColors.bottomNavIconColor,
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
