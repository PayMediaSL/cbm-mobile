// import 'package:app/helpers/colors.dart';
// import 'package:app/helpers/spacers.dart';
// import 'package:app/helpers/text_styles.dart';
// import 'package:app/models/contacts/contacts_model.dart';
// import 'package:app/providers/home_screen/contacts_data_provider.dart';
// import 'package:app/screens/widgets/text_fields/custom_search_bar.dart';
// import 'package:app/screens/widgets/text_style/font_family.dart';
// import 'package:app/services/screen_size_calculator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:grouped_list/grouped_list.dart';
// import 'package:provider/provider.dart';

// class ContactsListPage extends StatefulWidget {
//   @override
//   _ContactsListPageState createState() => _ContactsListPageState();
// }

// class _ContactsListPageState extends State<ContactsListPage> {
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(() {
//       context.read<ContactsProvider>().filterContacts(_searchController.text);
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     ScreenUtils.init(context);
//     return Consumer<ContactsProvider>(
//       builder: (context, contactsProvider, _) {
//         if (contactsProvider.isLoading) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         final contacts = _searchController.text.isEmpty
//             ? contactsProvider.contacts
//             : contactsProvider.filteredContacts;

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
//                     fontFamily: secondaryFontFamily,
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
//                 child: contacts.isEmpty
//                     ? Center(
//                         child: Text(
//                           "No contacts available",
//                           style: commonTextStyle.copyWith(
//                             fontSize: 16.sp,
//                             color: AppColors.onBoardSubTextStyleColor,
//                             fontFamily: secondaryFontFamily,
//                           ),
//                         ),
//                       )
//                     : GroupedListView<MyContact, String>(
//                         elements: contacts,
//                         groupBy: (contact) => contact.name![0].toUpperCase(),
//                         groupSeparatorBuilder: (String groupByValue) => Text(
//                           groupByValue,
//                           style: commonTextStyle.copyWith(
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w600,
//                               fontFamily: secondaryFontFamily,
//                               color: AppColors.primaryBlackColor),
//                         ),
//                         itemBuilder: (context, contact) {
//                           return Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Expanded(
//                                 child: ListTile(
//                                   leading: CircleAvatar(
//                                     child: Text(
//                                       contactsProvider
//                                           .getContactInitials(contact.name),
//                                       style: TextStyle(
//                                         color: AppColors.primaryAmberColor,
//                                         fontFamily: secondaryFontFamily,
//                                       ),
//                                     ),
//                                     backgroundColor: HexColor("#FEF9C3"),
//                                   ),
//                                   title: Text(
//                                     contact.name!,
//                                     style: commonTextStyle.copyWith(
//                                         fontSize: 16.sp,
//                                         fontFamily: secondaryFontFamily,
//                                         color: AppColors.primaryBlackColor),
//                                   ),
//                                   subtitle: Text(
//                                     contact.mobileNumber ?? 'No phone number',
//                                     style: commonTextStyle.copyWith(
//                                         fontSize: 14.sp,
//                                         fontFamily: secondaryFontFamily,
//                                         color:
//                                             AppColors.onBoardSubTextStyleColor),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 height: ScreenUtils.height * 0.035,
//                                 width: ScreenUtils.width * 0.16,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(8.sp),
//                                     color: HexColor("#F3F4F6")),
//                                 child: Center(
//                                   child: Text(
//                                     "OneApp",
//                                     style: commonTextStyle.copyWith(
//                                         fontSize: 9.sp,
//                                         color: AppColors.primaryBlackColor),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           );
//                         },
//                         itemComparator: (a, b) => a.name!.compareTo(b.name!),
//                         order: GroupedListOrder.ASC,
//                       ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
