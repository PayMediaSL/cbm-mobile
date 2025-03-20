//! On Boaarding text Style

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Common TextStyle

var commonTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.getStartedSubHeading,
    fontFamily: UIFontFamily.inter);

var commonTextHeadingStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    fontFamily: UIFontFamily.inter);

var commonTextSubHeadingStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.bottomNavIconColor,
    fontFamily: UIFontFamily.inter);

var commonTextInTheField = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    fontFamily: UIFontFamily.inter);

var commonTextFieldTitleStyle = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontFamily: UIFontFamily.inter);

//OnBoarding textStyle
var onBoardHeadingStyle = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryBlackColor,
    fontFamily: UIFontFamily.inter);

var onBoardSubHeadingStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.onBoardSubTextStyleColor,
    fontFamily: UIFontFamily.inter);

var mainButtonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryWhiteColor,
    fontFamily: UIFontFamily.inter);

//Get Started Screen

var getStartedHeadingStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryWhiteColor,
    fontFamily: UIFontFamily.inter);

var getStartedSubHeadingStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.getStartedSubHeading,
    fontFamily: UIFontFamily.inter);

var homeScreenTitleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryBlackColor,
    fontFamily: UIFontFamily.inter);
