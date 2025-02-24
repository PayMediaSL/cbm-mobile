// ignore_for_file: sort_child_properties_last

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/models/contacts/contacts_model.dart';
import 'package:app/providers/home_screen/contacts_data_provider.dart';
import 'package:app/providers/other_provider/common_provider.dart';
import 'package:app/providers/payments/mobile_reload.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/widgets/main_button/main_button.dart';
import 'package:app/screens/widgets/text_fields/custom_search_bar.dart';
import 'package:app/screens/widgets/text_fields/custom_text_field.dart';
import 'package:app/screens/widgets/visa_card/visa_card_widget.dart';

import 'package:app/services/screen_size_calculator.dart';
import 'package:app/services/validation_service.dart';
import 'package:app/utils/log_util.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_tab/custom_tab_bar.dart';

class MobileReloadScreen extends StatelessWidget {
  MobileReloadScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  void _showContactsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: false,
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return ContactsListPage(); // Pass contacts to bottom sheet
      },
    );
  }

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
        backTitle: "Mobile Reload",
        children: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
            child: Consumer<TabBarProvider>(
              builder: (BuildContext context, TabBarProvider tabProvider,
                      Widget? child) =>
                  Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ColumnSpacer(0.07),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.sp, horizontal: 10.sp),
                        height: tabProvider.selectedIndex == 1
                            ? ScreenUtils.height * 0.25
                            : ScreenUtils.height * 0.7,
                        width: ScreenUtils.width,
                        decoration: BoxDecoration(
                          color: AppColors.primaryWhiteColor,
                          borderRadius: BorderRadius.circular(UI.borderRadius),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "OneApp Mobile Reload",
                                style: commonTextStyle.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black),
                              ),
                              ColumnSpacer(0.004),
                              Text(
                                "Reload from your OneApp account to Mobile number",
                                style: commonTextStyle.copyWith(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primarySubBlackColor),
                              ),
                              ColumnSpacer(0.03),

                              CustomTabBarwidget(
                                tabs: const ["New number", "Saved contacts"],
                              ),
                              ColumnSpacer(0.03),
                              // Content based on the selected tab
                              Consumer<TabBarProvider>(
                                builder: (context, provider, _) {
                                  if (provider.selectedIndex == 0) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Mobile number",
                                          style: commonTextStyle.copyWith(
                                              fontSize: 13.sp,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        ColumnSpacer(0.005),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: CustomLableTextField(
                                                isSmallContentPadding: true,
                                                borderradius: 13.sp,
                                                TextEditingController(),
                                                hint: "eg: 07543128978",
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                autovalidate: true,
                                                validator: (value) =>
                                                    ValidationService
                                                        .validateUserMobileNumber(
                                                  value,
                                                ),
                                              ),
                                            ),
                                            RowSpacer(
                                                0.02), // Space between the TextField and button
                                            Container(
                                              height: ScreenUtils.height * 0.05,
                                              width: ScreenUtils.width * 0.25,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: AppColors
                                                          .primaryBlackColor),
                                                  color: AppColors
                                                      .primaryWhiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          UI.borderRadius)),
                                              child: Center(
                                                child: Text(
                                                  "Save Contact",
                                                  style:
                                                      commonTextStyle.copyWith(
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              AppColors.black),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),

                                        ColumnSpacer(0.015),
                                        Text(
                                          "Amount",
                                          style: commonTextStyle.copyWith(
                                              fontSize: 13.sp,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        ColumnSpacer(0.005),
                                        CustomLableTextField(
                                          isSmallContentPadding: true,
                                          borderradius: 13.sp,
                                          TextEditingController(),
                                          hint: "eg: 20000",
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          autovalidate: true,
                                          validator: (input) =>
                                              ValidationService
                                                  .validateIsNotEmptyField(
                                                      input, "Amount"),
                                        ),
                                        ColumnSpacer(0.015),
                                        Text(
                                          "Description",
                                          style: commonTextStyle.copyWith(
                                              fontSize: 13.sp,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        ColumnSpacer(0.005),
                                        CustomLableTextField(
                                          isSmallContentPadding: true,
                                          borderradius: 13.sp,
                                          inputFormatters: [],
                                          TextEditingController(),
                                          hint: "eg: Payment",
                                          autovalidate: true,
                                          validator: (input) =>
                                              ValidationService
                                                  .validateIsNotEmptyField(
                                                      input, "Payment"),
                                        ),
                                        ColumnSpacer(0.015),
                                        Text(
                                          "Pay From",
                                          style: commonTextStyle.copyWith(
                                              fontSize: 13.sp,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        ColumnSpacer(0.005),
                                        Consumer<CommonProvider>(
                                          builder: (BuildContext context,
                                                  CommonProvider commonProvider,
                                                  Widget? child) =>
                                              SizedBox(
                                            height: ScreenUtils.width * 0.4,
                                            child: PageView.builder(
                                              controller: PageController(
                                                initialPage:
                                                    commonProvider.currentIndex,
                                                viewportFraction:
                                                    0.8, // Card occupies 80% of screen width
                                              ),
                                              onPageChanged: (index) {
                                                commonProvider
                                                    .updateIndex(index);
                                              },
                                              itemCount: cardData.length,
                                              itemBuilder: (context, index) {
                                                final card = cardData[index];
                                                return Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                                  child: VisaCardWidget2(
                                                    gradientColor2:
                                                        Colors.black87,
                                                    gradientColor1: AppColors
                                                        .primaryBlueColor,
                                                    cardHeight:
                                                        ScreenUtils.width *
                                                            0.33,
                                                    cardwidth:
                                                        ScreenUtils.width * 0.6,
                                                    availableBalance: card[
                                                            "availableBalance"] ??
                                                        "",
                                                    accountNumber:
                                                        card["accountNumber"] ??
                                                            "",
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        // TextFormField()
                                      ],
                                    );
                                  } else {
                                    Future.delayed(Duration.zero, () {
                                      if (provider.selectedIndex == 1) {
                                        _showContactsBottomSheet(context);
                                      }
                                      // _showContactsBottomSheet(context);
                                    });
                                    return Container();
                                    // return const Center(
                                    //     child: Text("Saved contacts content"));
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      ColumnSpacer(
                          tabProvider.selectedIndex == 1 ? 0.45 : 0.04),
                      MainButton(
                        isMainButton: true,
                        buttontitle: "Confirm Payment",
                        btnOnPress: () {
                          if (_formKey.currentState!.validate()) {
                            printLog("Validated>>>>>>>>>");
                          }
                        },
                      )
                    ]),
              ),
            )));
  }
}

class ContactsListPage extends StatefulWidget {
  @override
  _ContactsListPageState createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      context.read<ContactsProvider>().filterContacts(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactsProvider>(
      builder: (context, contactsProvider, _) {
        if (contactsProvider.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final contacts = _searchController.text.isEmpty
            ? contactsProvider.contacts
            : contactsProvider.filteredContacts;

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 20.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Search Contact",
                style: commonTextStyle.copyWith(
                    fontSize: 17.sp,
                    color: AppColors.primaryBlackColor,
                    fontFamily: "jost",
                    fontWeight: FontWeight.w500),
              ),
              ColumnSpacer(0.01),
              SearchTextField(
                controller: _searchController,
                hintText: "Search by name or number",
                fillColor: HexColor("#F8FAFC"),
                hintTextColor: AppColors.onBoardSubTextStyleColor,
                iconColor: AppColors.onBoardSubTextStyleColor,
                heightFactor: 0.11,
                widthFactor: 0.8,
                borderRadius: 8.0.sp,
                isBorderAvilable: true,
              ),
              ColumnSpacer(0.02),
              Expanded(
                child: contacts.isEmpty
                    ? Center(
                        child: Text(
                          "No contacts available",
                          style: commonTextStyle.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.onBoardSubTextStyleColor,
                            fontFamily: "jost",
                          ),
                        ),
                      )
                    : GroupedListView<MyContact, String>(
                        elements: contacts,
                        groupBy: (contact) => contact.name![0].toUpperCase(),
                        groupSeparatorBuilder: (String groupByValue) => Text(
                          groupByValue,
                          style: commonTextStyle.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "jost",
                              color: AppColors.primaryBlackColor),
                        ),
                        itemBuilder: (context, contact) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    child: Text(
                                      contactsProvider
                                          .getContactInitials(contact.name),
                                      style: TextStyle(
                                        color: Colors.amber,
                                        fontFamily: "jost",
                                      ),
                                    ),
                                    backgroundColor: HexColor("#FEF9C3"),
                                  ),
                                  title: Text(
                                    contact.name!,
                                    style: commonTextStyle.copyWith(
                                        fontSize: 16.sp,
                                        fontFamily: "jost",
                                        color: AppColors.primaryBlackColor),
                                  ),
                                  subtitle: Text(
                                    contact.mobileNumber ?? 'No phone number',
                                    style: commonTextStyle.copyWith(
                                        fontSize: 14.sp,
                                        fontFamily: "jost",
                                        color:
                                            AppColors.onBoardSubTextStyleColor),
                                  ),
                                ),
                              ),
                              Container(
                                height: ScreenUtils.height * 0.035,
                                width: ScreenUtils.width * 0.16,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.sp),
                                    color: HexColor("#F3F4F6")),
                                child: Center(
                                  child: Text(
                                    "OneApp",
                                    style: commonTextStyle.copyWith(
                                        fontSize: 9.sp, color: AppColors.black),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                        itemComparator: (a, b) => a.name!.compareTo(b.name!),
                        order: GroupedListOrder.ASC,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}


// class ContactsListPage extends StatefulWidget {
//   @override
//   _ContactsListPageState createState() => _ContactsListPageState();
// }

// class _ContactsListPageState extends State<ContactsListPage> {
//   TextEditingController _searchController = TextEditingController();
//   List<MyContact> _filteredContacts = [];

//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(() {
//       _filterContacts(_searchController.text);
//     });
//   }

//   void _filterContacts(String query) {  
//     final contactsProvider = context.read<ContactsProvider>();
//     final allContacts = contactsProvider.contacts;
//     setState(() {
//       _filteredContacts = allContacts.where((contact) {
//         final nameLower = contact.name!.toLowerCase();
//         final numberLower = contact.mobileNumber?.toLowerCase() ?? '';
//         final queryLower = query.toLowerCase();

//         return nameLower.contains(queryLower) ||
//             numberLower.contains(queryLower);
//       }).toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ContactsProvider>(
//       builder: (context, contactsProvider, _) {
//         if (contactsProvider.isLoading) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }

//         final contacts = _filteredContacts.isEmpty
//             ? contactsProvider.contacts
//             : _filteredContacts;

//         if (contacts.isEmpty) {
//           return Center(
//             child: Text("No contacts found"),
//           );
//         }

//         return Padding(
//           padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 20.sp),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Search Contact",
//                 style: commonTextStyle.copyWith(
//                     fontSize: 17.sp,
//                     color: AppColors.primaryBlackColor,
//                     fontFamily: "jost",
//                     fontWeight: FontWeight.w500),
//               ),
//               ColumnSpacer(0.01),
//               SearchTextField(
//                 controller: _searchController,
//                 hintText: "Search by name or number",
//                 fillColor: HexColor("#F8FAFC"),
//                 hintTextColor: AppColors.onBoardSubTextStyleColor,
//                 iconColor: AppColors.onBoardSubTextStyleColor,
//                 heightFactor: 0.11,
//                 widthFactor: 0.8,
//                 borderRadius: 8.0.sp,
//                 isBorderAvilable: true,
//               ),
//               ColumnSpacer(0.02),
//               Expanded(
//                 child: GroupedListView<MyContact, String>(
//                   elements: contacts,
//                   groupBy: (contact) => contact.name![0].toUpperCase(),
//                   groupSeparatorBuilder: (String groupByValue) => Text(
//                     groupByValue,
//                     style: commonTextStyle.copyWith(
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w600,
//                         fontFamily: "jost",
//                         color: AppColors.primaryBlackColor),
//                   ),
//                   itemBuilder: (context, contact) {
//                     return Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           child: ListTile(
//                             leading: CircleAvatar(
//                               child: Text(
//                                 contactsProvider
//                                     .getContactInitials(contact.name),
//                                 style: TextStyle(
//                                   color: Colors.amber,
//                                   fontFamily: "jost",
//                                 ),
//                               ),
//                               backgroundColor: HexColor("#FEF9C3"),
//                             ),
//                             title: Text(
//                               contact.name!,
//                               style: commonTextStyle.copyWith(
//                                   fontSize: 16.sp,
//                                   fontFamily: "jost",
//                                   color: AppColors.primaryBlackColor),
//                             ),
//                             subtitle: Text(
//                               contact.mobileNumber ?? 'No phone number',
//                               style: commonTextStyle.copyWith(
//                                   fontSize: 14.sp,
//                                   fontFamily: "jost",
//                                   color: AppColors.onBoardSubTextStyleColor),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           height: ScreenUtils.height * 0.035,
//                           width: ScreenUtils.width * 0.16,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8.sp),
//                               color: HexColor("#F3F4F6")),
//                           child: Center(
//                             child: Text(
//                               "OneApp",
//                               style: commonTextStyle.copyWith(
//                                   fontSize: 9.sp, color: AppColors.black),
//                             ),
//                           ),
//                         )
//                       ],
//                     );
//                   },
//                   itemComparator: (a, b) => a.name!.compareTo(b.name!),
//                   order: GroupedListOrder.ASC,
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }



