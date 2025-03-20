// ignore_for_file: must_be_immutable

import 'package:app/helpers/constants/ui_constants.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/screens/widgets/icons/custom_icons.dart';
import 'package:app/utils/assest_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/other_provider/common_provider.dart';
import 'package:app/screens/widgets/drop_down/custom_language_dropdown.dart';
import 'package:app/screens/widgets/main_button/main_button.dart';
import 'package:app/services/screen_size_calculator.dart';
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
    this.isLinearProgress = false,
    this.imageName,
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
    this.defaultButtonBottomWidget,
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
  bool isLinearProgress;
  final Widget? defaultButtonBottomWidget;

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
  final String? imageName;
  final String buttontitle;
  final List<Widget> children;

  final void Function()? onBackButtonTap;

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    ScreenUtil.init(context);
    final commonProvider = Provider.of<CommonProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: backgroundColor ?? AppColors.primaryWhiteColor,
        appBar: isAppBar
            ? AppBar(
                toolbarHeight: UI_Padding.PADDING_0,
                backgroundColor:
                    appbarbackgroundColor ?? AppColors.primaryBlueColor,
                elevation: UI_Padding.PADDING_0,
                leading: isLeading
                    ? isLeadingBackButton
                        ? IconButton(
                            icon: CustomLeadingArrowBackIcon(
                              color: AppColors.primaryWhiteColor,
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
                    isLinearProgress
                        ? LinearProgressIndicator(
                            value: commonProvider.progress,
                            backgroundColor: AppColors.primaryGreyColor2,
                            color: AppColors.primaryBlueColor,
                          )
                        : SizedBox.shrink(),
                    isContainer1 ? _buildContainer1() : SizedBox.shrink(),
                    isContainer2 ? _buildContainer2() : SizedBox.shrink()
                  ],
                ),
        )));
  }

  Widget _buildContainer1() {
    return Container(
      width: container1Width ?? ScreenUtils.width,
      height: container1Height ?? ScreenUtils.height * 0.3,
      decoration: BoxDecoration(
        color: useImage ? null : AppColors.primaryBlueColor,
        image: useImage
            ? DecorationImage(
                image: AssetImage(imageName ?? ImageAsset().authBg),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: UI.PADDING_4X, vertical: UI.PADDING),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLeadingIcon(),
            Spacer(),
            _buildHeaderText(),
          ],
        ),
      ),
    );
  }

  Widget _buildLeadingIcon() {
    if (!isBodyLeadingAvailable) return SizedBox.shrink();
    return isBodyLeadingIcon
        ? GestureDetector(
            onTap: onBackButtonTap,
            child: CustomLeadingArrowBackIcon(
              color: AppColors.primaryWhiteColor,
            ),
          )
        : Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //   height: ScreenUtils.height * 0.048,
              //   width: ScreenUtils.width * 0.2,
              //   decoration: BoxDecoration(
              //     color: AppColors.SecondarysubGreyColor,
              //     borderRadius: BorderRadius.circular(
              //         UI_Borderradius.AUTH_LEADING_WIDGET_BORDERRADIUS),
              //   ),
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(
              //         horizontal: UI_Padding.AUTH_LEADING_WIDGET_HORIZONTAL),
              //     child: Row(
              //       children: [
              //         CustomInfoIcon(),
              //         SizedBox(width: ScreenUtils.width * 0.02),
              //         Text("Info",
              //             style: commonTextStyle.copyWith(
              //                 color: AppColors.primarySubBlackColor)),
              //       ],
              //     ),
              //   ),
              // ),
              CustomLanguageDropdown(
                dheight: ScreenUtils.height * 0.048,
                dwidth: ScreenUtils.width * 0.3,
              ),
            ],
          );
  }

  Widget _buildHeaderText() {
    return Padding(
      padding: EdgeInsets.only(bottom: UI_Padding.AUTHLAYOUT_BOTTOM_PADDING),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isHeadingAvailable
              ? Text(headerText, style: getStartedHeadingStyle)
              : SizedBox.shrink(),
          ColumnSpacer(0.01),
          isSubHeadingAvailable
              ? Text(headerSubText,
                  style: getStartedSubHeadingStyle.copyWith(
                      color: AppColors.primaryWhiteColor))
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _buildContainer2() {
    return Container(
        child: defaultButton
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: UI_Padding.AUTHLAYOUT_HORIZONTAL_PADDING,
                        vertical: UI_Padding.AUTHLAYOUT_VERTICAL_PADDING),
                    child: container2CustomWidget!,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        MainButton(
                          buttontitle: buttontitle,
                          isPaddingNeeded: true,
                          btnOnPress: onTap,
                          isMainButton: true,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            // : container2CustomWidget,
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: UI_Padding.AUTHLAYOUT_HORIZONTAL_PADDING,
                        vertical: UI_Padding.AUTHLAYOUT_VERTICAL_PADDING),
                    child: container2CustomWidget!,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        MainButton(
                          buttontitle: buttontitle,
                          isPaddingNeeded: true,
                          btnOnPress: onTap,
                          isMainButton: true,
                        ),
                        ColumnSpacer(0.02),
                        if (defaultButtonBottomWidget != null)
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    UI_Padding.AUTHLAYOUT_HORIZONTAL_PADDING),
                            child: defaultButtonBottomWidget!,
                          ),
                      ],
                    ),
                  ),
                ],
              ));
  }
}
