// ignore_for_file: sort_child_properties_last

import 'package:cbm_one_app/helpers/colors.dart';
import 'package:cbm_one_app/helpers/spacers.dart';
import 'package:cbm_one_app/helpers/text_styles.dart';
import 'package:cbm_one_app/models/contacts/contacts_model.dart';
import 'package:cbm_one_app/providers/home_screen/contacts_data_provider.dart';
import 'package:cbm_one_app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:cbm_one_app/services/screen_size_calculator.dart';
import 'package:cbm_one_app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

class DrawerInviteFriendsScreen extends StatelessWidget {
  const DrawerInviteFriendsScreen({super.key});

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
        backTitle: "Invite Friends",
        children: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ColumnSpacer(0.06),
                Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 20.sp, horizontal: 15.sp),
                    width: ScreenUtils.width,
                    decoration: BoxDecoration(
                      color: AppColors.primaryWhiteColor,
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: ScreenUtils.height * 0.06,
                          width: ScreenUtils.width * 0.14,
                          decoration: BoxDecoration(
                            color: AppColors.bottomNavBgColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Icon(
                            Icons.share,
                            size: 30.sp,
                          ),
                        ),
                        RowSpacer(0.06),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Share Link",
                              style: commonTextStyle.copyWith(
                                  color: AppColors.primaryBlackColor),
                            ),
                            SizedBox(
                              width: ScreenUtils.width * 0.6,
                              child: Text(
                                "Invite a friend via share link",
                                style: commonTextStyle.copyWith(
                                    fontSize: 12.sp,
                                    color: AppColors.primarySubBlackColor),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
                ColumnSpacer(0.02),
                Text(
                  "From Contact",
                  style: commonTextStyle.copyWith(
                      color: AppColors.primaryBlackColor),
                ),
                ColumnSpacer(0.01),
                Container(
                  height: ScreenUtils.height * 0.6,
                  padding:
                      EdgeInsets.symmetric(vertical: 20.sp, horizontal: 15.sp),
                  width: ScreenUtils.width,
                  decoration: BoxDecoration(
                    color: AppColors.primaryWhiteColor,
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: ContactsListPage(),
                ),
              ],
            )));
  }
}

class ContactsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ContactsProvider>(
      builder: (context, contactsProvider, _) {
        if (contactsProvider.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final contacts = contactsProvider.contacts;

        if (contacts.isEmpty) {
          return Center(
            child: Text("No contacts found"),
          );
        }

        return GroupedListView<MyContact, String>(
          elements: contacts,
          groupBy: (contact) => contact.name![0].toUpperCase(),
          groupSeparatorBuilder: (String groupByValue) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              groupByValue,
              style: commonTextStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: "jost",
                  color: AppColors.primaryBlackColor),
            ),
          ),
          itemBuilder: (context, contact) {
            return ListTile(
              leading: CircleAvatar(
                child: Text(
                  contactsProvider.getContactInitials(contact.name),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "jost",
                  ),
                ),
                backgroundColor: _getAvatarColor(contact.name),
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
                    color: AppColors.onBoardSubTextStyleColor),
              ),
            );
          },
          itemComparator: (a, b) => a.name!.compareTo(b.name!),
          order: GroupedListOrder.ASC,
        );
      },
    );
  }

  Color _getAvatarColor(String? name) {
    if (name == null || name.isEmpty) return Colors.grey;
    int charCode = name.codeUnitAt(0);
    return Colors.primaries[charCode % Colors.primaries.length];
  }
}
