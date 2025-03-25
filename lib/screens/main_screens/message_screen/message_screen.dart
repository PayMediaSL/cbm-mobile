import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants/ui_constants.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/payments/mobile_reload.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/widgets/container/customer_curved_container.dart';
import 'package:app/screens/widgets/custom_tab/custom_tab_bar.dart';
import 'package:app/screens/widgets/text_style/font_family.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MainMessageScreen extends StatelessWidget {
  MainMessageScreen({super.key});

  final List<Map<String, String>> inboxitem = List.generate(
    10,
    (index) => {
      "icon": ImageAsset().iconImageMail,
      "title": "Be Vigilant! Stay Safe!",
      "message": "Be aware, don't fall to pray to financial scams.",
      "date": "05/24",
    },
  );
  final List<Map<String, String>> senditem = List.generate(
    10,
    (index) => {
      "icon": ImageAsset().iconImageSend,
      "title": "Be Vigilant! Stay Safe!",
      "message": "Be aware, don't fall to pray to financial scams.",
      "date": "05/24",
    },
  );

  final List<Map<String, String>> draftsitem = List.generate(
    10,
    (index) => {
      "icon": ImageAsset().iconMessgae,
      "title": "Be Vigilant! Stay Safe!",
      "message": "Be aware, don't fall to pray to financial scams.",
      "date": "05/24",
    },
  );

  final List<Map<String, String>> trashitem = List.generate(
    10,
    (index) => {
      "icon": ImageAsset().iconDelete,
      "title": "Be Vigilant! Stay Safe!",
      "message": "Be aware, don't fall to pray to financial scams.",
      "date": "05/24",
    },
  );

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
        backTitle: "Messages",
        children: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ColumnSpacer(0.03),
                  const CustomTabBarwidgetCurved(
                    tabs: ['Inbox', 'Send Items', "Drafts", "Trash"],
                    tabKey: 'messages',
                  ),
                  ColumnSpacer(0.02),
                  Consumer<TabBarProviderCurved>(
                    builder: (context, provider, _) {
                      if (provider.getSelectedIndex("messages") == 0) {
                        return inbox();
                      } else if (provider.getSelectedIndex("messages") == 1) {
                        return sendItem();
                      } else if (provider.getSelectedIndex("messages") == 2) {
                        return drafts();
                      } else {
                        return trash();
                      }
                    },
                  ),
                  ColumnSpacer(0.1),

                  // Compose Button
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondarySubBlueColor2,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8.0), // Rounded corners
                        ),
                      ),
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white, // Icon color
                        size: 20.0,
                      ),
                      label: Text("Compose",
                          style: commonTextSubHeadingStyle.copyWith(
                              color: AppColors.white)),
                    ),
                  )
                ])));
  }

  Widget inbox() {
    return CustomCurvedContainer(
      height: ScreenUtils.height * 0.6,
      child: ListView.builder(
        // padding: const EdgeInsets.all(16.0),
        itemCount: inboxitem.length,
        itemBuilder: (context, index) {
          final message = inboxitem[index];
          return MessageTile(
            iconColor: AppColors.secondarySubBlueColor2,
            icon: message['icon'] ?? "",
            iconBackgroundColor: AppColors.bottomNavBgColor,
            title: message['title'] ?? "",
            message: message['message'] ?? "",
            date: message['date'] ?? "",
          );
        },
      ),
    );
  }

  Widget sendItem() {
    return CustomCurvedContainer(
      height: ScreenUtils.height * 0.6,
      child: ListView.builder(
        // padding: const EdgeInsets.all(16.0),
        itemCount: senditem.length,
        itemBuilder: (context, index) {
          final message = senditem[index];
          return MessageTile(
            iconColor: AppColors.secondarySubBlueColor2,
            icon: message['icon'] ?? "",
            iconBackgroundColor: AppColors.bottomNavBgColor,
            title: message['title'] ?? "",
            message: message['message'] ?? "",
            date: message['date'] ?? "",
          );
        },
      ),
    );
  }

  Widget drafts() {
    return CustomCurvedContainer(
      height: ScreenUtils.height * 0.6,
      child: ListView.builder(
        // padding: const EdgeInsets.all(16.0),
        itemCount: draftsitem.length,
        itemBuilder: (context, index) {
          final message = draftsitem[index];
          return MessageTile(
            iconColor: AppColors.secondarySubBlueColor2,
            icon: message['icon'] ?? "",
            iconBackgroundColor: AppColors.bottomNavBgColor,
            title: message['title'] ?? "",
            message: message['message'] ?? "",
            date: message['date'] ?? "",
          );
        },
      ),
    );
  }

  Widget trash() {
    return CustomCurvedContainer(
      height: ScreenUtils.height * 0.6,
      child: ListView.builder(
        // padding: const EdgeInsets.all(16.0),
        itemCount: trashitem.length,
        itemBuilder: (context, index) {
          final message = trashitem[index];
          return MessageTile(
            shadeavailable: false,
            iconColor: AppColors.primaryRedColor,
            icon: message['icon'] ?? "",
            iconBackgroundColor: Colors.red.shade100,
            title: message['title'] ?? "",
            message: message['message'] ?? "",
            date: message['date'] ?? "",
          );
        },
      ),
    );
  }
}

class MessageTile extends StatefulWidget {
  final String icon;
  final Color iconBackgroundColor;
  final Color iconColor;
  final String title;
  final String message;
  final String date;
  final bool shadeavailable;

  const MessageTile({
    Key? key,
    this.shadeavailable = true,
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
    required this.title,
    required this.message,
    required this.date,
  }) : super(key: key);

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  bool isRead = false; // Indicates if the message has been tapped.

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isRead = true;
        });
      },
      child: Container(
        height: ScreenUtils.height * 0.1,
        padding: EdgeInsets.symmetric(horizontal: 5.sp),
        margin: EdgeInsets.symmetric(vertical: 5.sp),
        decoration: BoxDecoration(
          color: widget.shadeavailable
              ? isRead
                  ? Colors.transparent
                  : AppColors.bottomNavBgColor
              : null,
          borderRadius: BorderRadius.circular(12.0),
          // border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12.sp),
              decoration: BoxDecoration(
                  color: widget.iconBackgroundColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(
                      UI_Borderradius.COMMON_BORDER_RADIUS)),
              // child: Icon(
              //   widget.icon,
              //   color: AppColors.primaryBlueColor,
              // ),
              child: Image(
                image: AssetImage(widget.icon),
                height: 25.sp,
                color: widget.iconColor,
                // color: AppColors.secondarySubBlueColor2,
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.title,
                      style: commonTextFieldTitleStyle.copyWith(
                          fontFamily: secondaryFontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp)),
                  // const SizedBox(height: 4.0),
                  Text(widget.message,
                      style: commonTextFieldTitleStyle.copyWith(
                          fontFamily: secondaryFontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp)),
                ],
              ),
            ),
            RowSpacer(0.02),
            Text(widget.date,
                style: commonTextFieldTitleStyle.copyWith(
                    fontFamily: secondaryFontFamily,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondarysubGreyColor4,
                    fontSize: 9.sp)),
          ],
        ),
      ),
    );
  }
}
