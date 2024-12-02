//! On Boaarding text Style

import 'package:app/helpers/colors.dart';
import 'package:flutter/material.dart';

//Common TextStyle

var commonTextStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.getStartedSubHeading,
    fontFamily: 'inter');

//OnBoarding textStyle
var onBoardHeadingStyle = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryBlackColor,
    fontFamily: 'inter');

var onBoardSubHeadingStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.onBoardSubTextStyleColor,
    fontFamily: 'inter');

var mainButtonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryWhiteColor,
    fontFamily: 'inter');

//Get Started Screen

var getStartedHeadingStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryWhiteColor,
    fontFamily: 'inter');

var getStartedSubHeadingStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.getStartedSubHeading,
    fontFamily: 'inter');
