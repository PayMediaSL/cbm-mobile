// ignore_for_file: must_be_immutable, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/screens/widgets/drop_down/custom_language_dropdown.dart';
import 'package:app/screens/widgets/main_button/main_button.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthenticationLayout extends StatelessWidget {
  AuthenticationLayout({
    super.key,
    this.isAppBar = false,
    this.isLeading = false,
    this.isContainer1 = false,
    this.isContainer2 = false,
    this.isLeadingBackButton = false,
    this.isBodyLeadingIcon = false,
    this.isCustomizeWidget = false,
    this.isHeadingAvailable = false,
    this.isSubHeadingAvailable = false,
    this.isBodyLeadingAvailable = false,
    this.isListChildren = false,
    this.useImage = false,
    this.defaultButton = false,
    this.imageName = "",
    this.backgroundColor,
    this.onTap,
    this.appbarbackgroundColor,
    this.widget,
    this.secondWidget,
    this.container2CustomWidget,
    this.container1Height,
    this.container1Width,
    this.headerText = "",
    this.headerSubText = "",
    this.buttontitle = "",
    this.children = const <Widget>[],
    this.onBackButtonTap,
  });

  bool isAppBar;
  bool isLeading;
  bool isLeadingBackButton;
  bool isContainer1;
  bool isContainer2;
  bool isBodyLeadingIcon;
  bool isCustomizeWidget;
  bool isHeadingAvailable;
  bool isSubHeadingAvailable;
  bool isBodyLeadingAvailable;
  bool useImage;
  bool isListChildren;
  bool defaultButton;

  final Color? backgroundColor;
  final Color? appbarbackgroundColor;
  final void Function()? onTap;
  final Widget? widget;
  final Widget? secondWidget;
  final Widget? container2CustomWidget;
  final double? container1Height;
  final double? container1Width;
  final String headerText;
  final String headerSubText;
  final String imageName;
  final String buttontitle;
  final List<Widget> children;
  final void Function()? onBackButtonTap; // Optional onTap

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.primaryWhiteColor,
      appBar: isAppBar
          ? AppBar(
              backgroundColor: appbarbackgroundColor,
              elevation: 0,
              leading: isLeading
                  ? isLeadingBackButton
                      ? IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 18,
                          ),
                          onPressed: onBackButtonTap,
                        )
                      : SizedBox.shrink()
                  : SizedBox.shrink(),
            )
          : null,
      body: SafeArea(
          child: SingleChildScrollView(
        child: isCustomizeWidget
            ? widget
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isContainer1
                      ? Container(
                          width: container1Width ?? ScreenUtils.width,
                          height: container1Height ?? ScreenUtils.height * 0.3,
                          decoration: BoxDecoration(
                            color: useImage ? null : AppColors.primaryBlueColor,
                            image: useImage
                                ? DecorationImage(
                                    image: AssetImage(
                                        imageName), // Replace with your image path
                                    fit: BoxFit
                                        .cover, // Cover the entire container
                                  )
                                : null,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: UI.PADDING_4X,
                                vertical: UI.PADDING),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                isBodyLeadingAvailable
                                    ? isBodyLeadingIcon
                                        ? GestureDetector(
                                            onTap: onBackButtonTap,
                                            child: Icon(
                                              Icons.arrow_back,
                                              color:
                                                  AppColors.primaryWhiteColor,
                                            ),
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              //! Info
                                              Container(
                                                height:
                                                    ScreenUtils.height * 0.048,
                                                width: ScreenUtils.width * 0.2,
                                                decoration: BoxDecoration(
                                                  color: HexColor("#E5E7EB"),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.info_outline),
                                                      SizedBox(
                                                        width:
                                                            ScreenUtils.width *
                                                                0.02,
                                                      ),
                                                      Text(
                                                        "Info",
                                                        style: commonTextStyle
                                                            .copyWith(
                                                                color: HexColor(
                                                                    "#475569")),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              //! Drop Down
                                              CustomLanguageDropdown(
                                                dheight:
                                                    ScreenUtils.height * 0.048,
                                                dwidth: ScreenUtils.width * 0.3,
                                                // dropdownHeight: 60.0,

                                                // fillColor: Colors.blue[50]!,
                                                // borderColor: Colors.blue,
                                              ),
                                            ],
                                          )
                                    : SizedBox.shrink(),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: UI.PADDING_2X),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      isHeadingAvailable
                                          ? Text(
                                              headerText,
                                              style: getStartedHeadingStyle,
                                            )
                                          : SizedBox.shrink(),
                                      SizedBox(
                                        height: ScreenUtils.height * 0.01,
                                      ),
                                      isSubHeadingAvailable
                                          ? Text(headerSubText,
                                              style: getStartedSubHeadingStyle
                                                  .copyWith(
                                                      color: AppColors
                                                          .primaryWhiteColor))
                                          : SizedBox.shrink(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  isContainer2
                      ? Container(
                          child: defaultButton
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.sp, vertical: 20.sp),
                                      child: container2CustomWidget!,
                                    ),
                                    // ColumnSpacer(0.5),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: MainButton(
                                        buttontitle: buttontitle,
                                        isPaddingNeeded: true,
                                        btnOnPress: onTap,
                                        isMainButton: true,
                                      ),
                                    )
                                  ],
                                )
                              : container2CustomWidget,
                        )
                      : SizedBox.shrink()
                ],
              ),
      )),
    );
  }
}
