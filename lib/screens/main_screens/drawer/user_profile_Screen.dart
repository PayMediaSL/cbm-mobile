// ignore_for_file: must_be_immutable

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants.dart';
import 'package:app/helpers/constants/ui_constants.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/widgets/image/custom_avatar.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeMainLayout(
        backgroundColor: AppColors.SecondarysubGreyColor,
        isBgContainer1: true,
        isBgContainer2: true,
        isBgContainer1Height: ScreenUtils.height * 0.15,
        onBackIconAvailable: true,
        onBackTap: () {
          popScreen(
            context,
          );
        },
        children: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ColumnSpacer(0.04),
                  Center(child: _buildProfileImageName()),
                  ColumnSpacer(0.03),
                  Container(
                    height: ScreenUtils.height * 0.1,
                    padding: EdgeInsets.symmetric(
                        vertical: 10.sp, horizontal: 15.sp),
                    width: ScreenUtils.width,
                    decoration: BoxDecoration(
                      color: AppColors.primaryWhiteColor,
                      borderRadius: BorderRadius.circular(UI.borderRadius),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SWITCH ACCOUNT",
                          style: commonTextStyle_black_500_12sp.copyWith(
                              color: AppColors.primarySubBlackColor),
                        ),
                        ColumnSpacer(0.005),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(),
                                RowSpacer(0.05),
                                Text(
                                  "Sajeewa Dissanayake",
                                  style: commonTextStyle.copyWith(
                                      color: AppColors.primaryBlackColor),
                                )
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                _showBottomSheet(context);
                              },
                              child: CircleAvatar(
                                radius: 15.sp,
                                backgroundColor: AppColors
                                    .homeLifestyleEducation
                                    .withOpacity(0.2),
                                child: ClipOval(
                                  child: SizedBox(
                                    width: 18.sp,
                                    height: 18.sp,
                                    child: Image.asset(
                                      ImageAsset().iconExchange,
                                      color: AppColors.primarySubBlackColor,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  ColumnSpacer(0.01),
                  Container(
                    height: ScreenUtils.height * 0.5,
                    padding: EdgeInsets.symmetric(
                        vertical: 10.sp, horizontal: 15.sp),
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
                          //! User Details
                          Text(
                            "USER DETAIL",
                            style: commonTextStyle_black_500_12sp,
                          ),
                          ColumnSpacer(0.005),
                          _buildVerificationRow(
                              ImageAsset().userImage, "Name", "test"),
                          _buildVerificationRow(ImageAsset().iconImageMail,
                              "Email", "cypher@gmail.com"),
                          _buildVerificationRow(ImageAsset().iconImageCalendar,
                              "BirthDay", "1993-2-23"),

                          Divider(),
                          ColumnSpacer(0.01),
                          Text(
                            "CONTACT DETAIL",
                            style: commonTextStyle_black_500_12sp.copyWith(
                                color: AppColors.primarySubBlackColor),
                          ),

                          ColumnSpacer(0.005),
                          _buildVerificationRow(ImageAsset().iconImageBill,
                              "Mobile No", "sdsdsdsdsd"),
                          _buildVerificationRow(
                              ImageAsset().iconImageBill, "NIC", "235755656"),
                          _buildVerificationRow(
                              ImageAsset().homeImage, "Address", "076543245"),

                          Divider(),
                          ColumnSpacer(0.01),
//! Document
                          Text(
                            "YOUR DOCUMENT",
                            style: commonTextStyle_black_500_12sp.copyWith(
                                color: AppColors.primarySubBlackColor),
                          ),
                          ColumnSpacer(0.005),
                          _buildVerificationRowDocument(
                              ImageAsset().settingsIconProfile,
                              "Mobile No",
                              "Verification in Progress"),
                          _buildVerificationRowDocument(
                              ImageAsset().iconImageMail,
                              "Email",
                              "Verification in Progress"),
                          _buildVerificationRowDocument(
                              ImageAsset().iconImageBill,
                              "NIC Front",
                              "Verification in Progress"),
                          _buildVerificationRowDocument(
                              ImageAsset().iconImageBill,
                              "NIC Back",
                              "Verification in Progress"),
                          _buildVerificationRowDocument(ImageAsset().cashImg,
                              "Selfie", "Verification in Progress"),
                          _buildVerificationRowDocument(ImageAsset().homeImage,
                              "Proof of Address", "Verification in Progress"),
                          _buildVerificationRowDocument(
                              ImageAsset().penToolImage,
                              "Signature",
                              "Verification in Progress"),
                          _buildVerificationRow(
                              ImageAsset().settingsIconInfo, "Vesrsion", "3.1"),
                        ],
                      ),
                    ),
                  )
                ])));
  }

  Widget _buildProfileImageName() {
    return Column(
      children: [
        // Stack for profile image and camera icon
        Stack(
          children: [
            // Circle Avatar
            CustomCircleAvatar(
              radius: 50.sp,
              backgroundColor: AppColors.primaryBlueColor,
            ),
            // CircleAvatar(
            //   //Need to Fetch Profile Image
            //   radius: 50.sp,
            //   backgroundColor: Colors.blue[200],
            // ),
            // Camera Icon
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryBlueColor,
                    shape: BoxShape.circle,
                    // border: Border.all(color: Colors.white, width: 2),
                    border: UI_Border.defaultBorder(
                        width: 2, color: AppColors.primaryWhiteColor)),
                padding: const EdgeInsets.all(5),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
            ),
          ],
        ),
        ColumnSpacer(0.006),
        // Name and Username
        Text("Sajeewa Dissanayake", style: homeScreenTitleStyle),
        ColumnSpacer(0.001),
        Text("sajeewa93",
            style: commonTextStyle.copyWith(
                color: AppColors.primarySubBlackColor)),
      ],
    );
  }

  Widget _buildVerificationRow(
    String image,
    String title,
    String subtitle,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15.sp, // The overall size of the CircleAvatar
                  backgroundColor:
                      AppColors.homeLifestyleEducation.withOpacity(0.2),
                  child: ClipOval(
                    child: SizedBox(
                      width: 18.sp,
                      height: 18.sp,
                      child: Image.asset(
                        image,
                        color: AppColors.primarySubBlackColor,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                RowSpacer(0.02),
                Text(
                  title,
                  style: commonTextStyle.copyWith(
                      color: AppColors.primarySubBlackColor),
                ),
              ],
            ),
            Text(
              subtitle,
              style:
                  commonTextStyle.copyWith(color: AppColors.primaryBlackColor),
            ),
          ],
        ),
        ColumnSpacer(0.005),
      ],
    );
  }

  Widget _buildVerificationRowDocument(
    String image,
    String title,
    String subtitle,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15.sp, // The overall size of the CircleAvatar
                  backgroundColor:
                      AppColors.homeLifestyleEducation.withOpacity(0.2),
                  child: ClipOval(
                    child: SizedBox(
                      width: 18.sp,
                      height: 18.sp,
                      child: Image.asset(
                        image,
                        color: AppColors.primarySubBlackColor,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                RowSpacer(0.02),
                Text(
                  title,
                  style: commonTextStyle.copyWith(
                      color: AppColors.primarySubBlackColor),
                ),
              ],
            ),
            Text(
              subtitle,
              style: commonTextStyle.copyWith(
                  fontSize: 12.sp, color: AppColors.primarySubBlackColor),
            ),
          ],
        ),
        ColumnSpacer(0.005),
      ],
    );
  }

  final List<Map<String, dynamic>> entities = List.generate(
    10,
    (index) => {
      'name': 'Entity ${index + 1}',
      'notifications': (index + 1) * 3,
      'isSelected': index == 0,
    },
  );

  bool isExpanded = false;

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 4),
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: isExpanded ? entities.length : 4,
                    itemBuilder: (context, index) {
                      final entity = entities[index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            entity['name']
                                .split(' ')
                                .map((e) => e[0])
                                .take(2)
                                .join(),
                          ),
                        ),
                        title: Text(
                          entity['name'],
                          style: commonTextStyle.copyWith(
                              color: AppColors.primaryBlackColor,
                              fontSize: 15.sp),
                        ),
                        subtitle: Row(
                          children: [
                            CircleAvatar(
                              radius: 5.sp,
                              backgroundColor: AppColors.primaryRedColor,
                            ),
                            RowSpacer(0.01),
                            Text('${entity['notifications']} notifications'),
                          ],
                        ),
                        trailing: entity['isSelected']
                            ? CircleAvatar(
                                radius: 10.sp,
                                backgroundColor: AppColors.primaryBlueColor,

                                child: Icon(
                                  Icons.check,
                                  color: AppColors.white,
                                  size: 12.sp,
                                ),
                                // backgroundImage: Ico,
                              )
                            : null,
                      );
                    },
                  ),
                  if (!isExpanded && entities.length > 4)
                    ListTile(
                      leading: CircleAvatar(
                          backgroundColor: AppColors.primaryGreyColor,
                          child: Icon(Icons.more_horiz)),
                      title: const Text('See all'),
                      onTap: () {
                        setState(() {
                          isExpanded = true;
                        });
                      },
                    ),
                  if (isExpanded)
                    ListTile(
                      leading: const Icon(Icons.arrow_upward),
                      title: const Text('Show less'),
                      onTap: () {
                        setState(() {
                          isExpanded = false;
                        });
                      },
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // void _showBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
  //     ),
  //     builder: (context) {
  //       return Padding(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             SizedBox(height: 4.sp),
  //             Container(
  //               width: 40.sp,
  //               height: 4.sp,
  //               decoration: BoxDecoration(
  //                 color: Colors.grey[300],
  //                 borderRadius: BorderRadius.circular(2),
  //               ),
  //             ),
  //             SizedBox(height: 16.sp),
  //             ListView.builder(
  //               shrinkWrap: true,
  //               itemCount: entities.length + 1,
  //               itemBuilder: (context, index) {
  //                 if (index == entities.length) {
  //                   return ListTile(
  //                     leading: CircleAvatar(
  //                         backgroundColor: AppColors.primaryGreyColor,
  //                         child: const Icon(Icons.more_horiz)),
  //                     title: const Text('See all (10)'),
  //                     onTap: () {
  //                       // Handle "See all" action
  //                     },
  //                   );
  //                 }
  //                 final entity = entities[index];
  //                 return ListTile(
  //                   leading: CircleAvatar(
  //                     child: Text(
  //                       entity['name']
  //                           .split(' ')
  //                           .map((e) => e[0])
  //                           .take(2)
  //                           .join(),
  //                     ),
  //                   ),
  //                   title: Text(
  //                     entity['name'],
  //                     style: commonTextStyle.copyWith(
  //                         color: AppColors.primaryBlackColor, fontSize: 15.sp),
  //                   ),
  //                   subtitle: Row(
  //                     children: [
  //                       CircleAvatar(
  //                         radius: 5.sp,
  //                         backgroundColor: AppColors.primaryRedColor,
  //                       ),
  //                       RowSpacer(0.01),
  //                       Text('${entity['notifications']} notifications'),
  //                     ],
  //                   ),
  //                   trailing: entity['isSelected']
  //                       ? CircleAvatar(
  //                           radius: 10.sp,
  //                           backgroundColor: AppColors.primaryBlueColor,

  //                           child: Icon(
  //                             Icons.check,
  //                             color: AppColors.white,
  //                             size: 12.sp,
  //                           ),
  //                           // backgroundImage: Ico,
  //                         )
  //                       : null,
  //                 );
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}
