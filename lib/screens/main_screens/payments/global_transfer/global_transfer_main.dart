import 'package:app/helpers/colors.dart';
import 'package:app/helpers/povider_helper/common_provider.dart';
import 'package:app/helpers/routes.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_editing_controllers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/drawer/toggle_provider.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/widgets/calendar/calendar_widget.dart';
import 'package:app/screens/widgets/container/customer_curved_container.dart';
import 'package:app/screens/widgets/drop_down/custom_drop_down_field.dart';
import 'package:app/screens/widgets/favourite/favorite_widget.dart';
import 'package:app/screens/widgets/main_button/main_button.dart';
import 'package:app/screens/widgets/text_fields/custom_label_with_textfield.dart';
import 'package:app/screens/widgets/text_fields/custom_text_field.dart';
import 'package:app/screens/widgets/visa_card/visa_card_widget.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class GlobalTransferMain extends StatelessWidget {
  GlobalTransferMain({super.key});
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
    var commonProvider = getCommonProvider(context);
//TODO ADD CONTROLLER FOR TEXT FIELD
    return HomeMainLayout(
        backgroundColor: AppColors.SecondarysubGreyColor,
        isBgContainer1: true,
        isBgContainer2: true,
        isBgContainer1Height: ScreenUtils.height * 0.07,
        onBackIconAvailable: true,
        onBackTitleAvailable: true,
        backTitle: "Global Transfer",
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
                    height: ScreenUtils.height * 0.21,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                commonProvider
                                    .toggleStates("globaltransferfavourite");
                              },
                              child: Text(
                                commonProvider
                                        .getStates("globaltransferfavourite")
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
                            itemCount: commonProvider
                                    .getStates("globaltransferfavourite")
                                ? favorites.length + 1
                                : (favorites.length >= 3
                                        ? 3
                                        : favorites.length) +
                                    1,
                            itemBuilder: (context, index) {
                              if (index == favorites.length ||
                                  (!commonProvider.getStates(
                                          "globaltransferfavourite") &&
                                      index ==
                                          (favorites.length >= 3
                                              ? 3
                                              : favorites.length))) {
                                return FavoriteCard(
                                  name: 'Add',
                                  details: '',
                                  image: ImageAsset().authBg,
                                  onTap: () {
                                    pushScreen(
                                        context,
                                        ScreenRoutes
                                            .toGlobalTransferAddtoFavourite);
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
                      ],
                    ),
                  ),
                  ColumnSpacer(0.02),
                  CustomCurvedContainer(
                    height: ScreenUtils.height * 0.54,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
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
                          ColumnSpacer(0.01),
                          // Text(
                          //   "Receipient's Bank",
                          //   style: commonTextFieldTitleStyle,
                          // ),
                          // ColumnSpacer(0.005),
                          // CustomDropdown(
                          //   borderradius: 13.sp,
                          //   dropdownKey: 'localtransferFavourites',
                          //   items: ['Option 1', 'Option 2', 'Option 3'],
                          // ),
                          // ColumnSpacer(0.01),
                          //!
                          // Recipient’s account number
                          // Recipient’s name
                          // Recipient’s address / country
                          // Recipient’s code option -d
                          // Recipient’s bank country
                          // Recipient’s bank name
                          // Recipient’s bank address
                          // Amount

                          LabelWithTextField(
                              label: "Recipient’s account number",
                              controller: signInPasswordController,
                              borderRadius: 12.sp,
                              isSmallContentPadding: true,
                              hint: "e.g. *******364"),
                          ColumnSpacer(0.01),
                          LabelWithTextField(
                              label: "Recipient’s name",
                              controller: signInPasswordController,
                              borderRadius: 12.sp,
                              isSmallContentPadding: true,
                              hint: "eg: John Doe"),
                          ColumnSpacer(0.01),
                          LabelWithTextField(
                              label: "Recipient’s address / country",
                              controller: signInPasswordController,
                              borderRadius: 12.sp,
                              isSmallContentPadding: true,
                              hint: "eg: France"),
                          ColumnSpacer(0.01),
                          LabelWithDropdown(
                              label: "Recipient’s code option",
                              borderRadius: 12.sp,
                              dropdownKey:
                                  "global_transfer_main_receipient_code",
                              items: ["option1", "option2", "option3"]),

                          ColumnSpacer(0.01),
                          LabelWithTextField(
                              label: "Recipient’s bank country",
                              controller: signInPasswordController,
                              borderRadius: 12.sp,
                              isSmallContentPadding: true,
                              hint: "eg : France"),
                          ColumnSpacer(0.01),
                          LabelWithTextField(
                              label: "Recipient’s bank name",
                              controller: signInPasswordController,
                              borderRadius: 12.sp,
                              isSmallContentPadding: true,
                              hint: "e.g. Deuche Bank"),
                          ColumnSpacer(0.01),
                          LabelWithTextField(
                              label: "Recipient’s bank address",
                              controller: signInPasswordController,
                              borderRadius: 12.sp,
                              isSmallContentPadding: true,
                              hint: "e.g. Deuche Bank,France"),
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
                                  signInPasswordController,
                                  borderradius: 12.sp,
                                  isSmallContentPadding: true,
                                  hint: "mm/dd/yyyy",
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        showDateTimePickerBottomSheet(
                                            context, "global_date_1");
                                        //janu
                                      },
                                      icon: Icon(
                                        Icons.calendar_month_rounded,
                                        color: AppColors.textFieldHintColor,
                                      )),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Consumer<ToggleSwitchProvider>(
                                    builder: (BuildContext context,
                                            ToggleSwitchProvider value,
                                            Widget? child) =>
                                        Transform.scale(
                                      scale: 0.8,
                                      child: CupertinoSwitch(
                                        value: value.getSwitchState(
                                            "switch_globaltransfer_recurring"),
                                        activeColor: AppColors.primaryBlueColor,
                                        trackColor: AppColors.primaryBlackColor
                                            .withOpacity(0.12),
                                        thumbColor: AppColors.primaryWhiteColor,
                                        onChanged: (v) {
                                          value.toggleSwitch(
                                              "switch_globaltransfer_recurring",
                                              v);
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
                                dropdownKey: 'globaltransferday',
                                items: ['1', '2', '3'],
                              ),
                              RowSpacer(0.01),
                              CustomDropdown(
                                hint: "month",
                                dropdownwidth: ScreenUtils.width * 0.24,
                                borderradius: 13.sp,
                                dropdownKey: 'globaltransfermonth',
                                items: ['1', '2', '3'],
                              ),
                              RowSpacer(0.01),
                              Expanded(
                                child: CustomLableTextField(
                                  signInPasswordController,
                                  borderradius: 12.sp,
                                  isSmallContentPadding: true,
                                  hint: "mm/dd/yyyy",
                                  suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.calendar_month_rounded,
                                        color: AppColors.textFieldHintColor,
                                      )),
                                ),
                              ),
                            ],
                          ),

                          ColumnSpacer(0.01),
                          LabelWithTextField(
                              label: "Note to recipient",
                              controller: signInPasswordController,
                              borderRadius: 12.sp,
                              isSmallContentPadding: true,
                              hint:
                                  "e.g. Transferred refreshment charges to Jane"),
                          ColumnSpacer(0.01),
                          LabelWithDropdown(
                              label: "Charges",
                              borderRadius: 12.sp,
                              dropdownKey: "'global_transfer_main_charges",
                              items: ["option1", "option2", "option3"]),

                          // Text(
                          //   "Note to recipient",
                          //   style: commonTextFieldTitleStyle,
                          // ),
                          // ColumnSpacer(0.005),
                          // CustomLableTextField(
                          //   signInPasswordController,
                          //   borderradius: 12.sp,
                          //   isSmallContentPadding: true,
                          //   hint:
                          //       "e.g. Transferred refreshment charges to Jane",
                          // ),

                          // ColumnSpacer(0.01),
                          // Text(
                          //   "Charges",
                          //   style: commonTextFieldTitleStyle,
                          // ),
                          // ColumnSpacer(0.005),
                          // CustomDropdown(
                          //   borderradius: 13.sp,
                          //   dropdownKey: 'global_transfer_charges',
                          //   items: ['Option 1', 'Option 2', 'Option 3'],
                          // ),
                        ],
                      ),
                    ),
                  ),
                  ColumnSpacer(0.03),
                  MainButton(
                    isMainButton: true,
                    btnOnPress: () {},
                    buttontitle: "Proceed to Payment",
                  )
                ])));
  }

  void showDateTimePickerBottomSheet(BuildContext context, String dateKey) {
    showModalBottomSheet(
      backgroundColor: AppColors.subGreyColor,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 15.sp),
          padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 20.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13.sp),
          ),
          child: DateTimePickerWidget(dateKey: dateKey),
        );
      },
    );
  }
}

//! Print Selected Date and Time

// final dateTimeProvider = Provider.of<DateTimeProvider>(context);
// DateTime selectedDate = dateTimeProvider
//     .getSelectedDate('calendar1'); // Replace 'calendar1' with the actual key
