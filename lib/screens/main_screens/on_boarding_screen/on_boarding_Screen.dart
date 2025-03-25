// ignore_for_file: avoid_unnecessary_containers, unnecessary_string_interpolations

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/routes.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  int currentPageIndex = 0; // Track the current page index
  final int totalPages = 4; // Total number of pages

  Widget _buildImage(
    String assetName,
  ) {
    return Container(
        height: ScreenUtils.height * 0.62,
        width: ScreenUtils.width,
        color: AppColors.primaryBlueColor,
        child: Image.asset(
          '$assetName',
          alignment: Alignment.bottomRight,
          // height: 89,
          width: ScreenUtils.width * 0.35,
          // height: ScreenUtils.height,
        ));
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: AppColors.primaryWhiteColor,

      // Global Header with Skip Button and Progress Indicator
      globalHeader: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                totalPages,
                (index) => Expanded(
                  child: Container(
                    height: 6.0,
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    color: index == currentPageIndex
                        ? AppColors
                            .onBoardActiveColor // Highlight only the current page
                        : AppColors.primaryWhiteColor
                            .withOpacity(0.1), // Other pages remain grey
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  // introKey.currentState?.skipToEnd();
                  navigateToScreen(context, ScreenRoutes.toSignInOptionScreen);
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryWhiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // Pages
      pages: [
        _buildPage(
          title: "All your accounts in one app",
          body: "Manage all your bank accounts seamlessly within a single app.",
          imageAsset: ImageAsset().onBoardImage1,
        ),
        _buildPage(
          title: "Easy fund transfers",
          body: "Send money locally or internationally with just a few taps.",
          imageAsset: ImageAsset().onBoardImage2,
        ),
        _buildPage(
          title: "Smart wealth management",
          body: "Track, manage, and grow your wealth with our intuitive tools.",
          imageAsset: ImageAsset().onBoardImage3,
        ),
        _buildPage(
          title: "Access all your cards",
          body:
              "Keep all your debit and credit cards organized in one secure place.",
          imageAsset: ImageAsset().onBoardImage4,
        ),
      ],

      // Callbacks
      onChange: (index) {
        //! Need To change Once State Managment Fixed
        setState(() {
          currentPageIndex = index;
        });
      },
      onDone: () {
        // Perform any action when onboarding is completed
      },

      showSkipButton: false,
      showNextButton: false,
      showDoneButton: false,
      dotsDecorator: const DotsDecorator(
        color: Colors.transparent, // Make default dots invisible
        activeColor: Colors.transparent,
        size: Size.zero,
        activeSize: Size.zero,
      ),
      dotsContainerDecorator: const BoxDecoration(
        color: Colors.transparent,
      ),
    );
  }

  //! Page View Model

  PageViewModel _buildPage(
      {required String title,
      required String body,
      required String imageAsset}) {
    return PageViewModel(
      titleWidget: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: onBoardHeadingStyle,
        ),
      ),
      bodyWidget: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          body,
          style: onBoardSubHeadingStyle,
        ),
      ),
      image: _buildImage(imageAsset),
      decoration: PageDecoration(
        imageFlex: 0,
        titlePadding: const EdgeInsets.only(left: 16, top: 16),
        bodyPadding: const EdgeInsets.only(left: 16, top: 10),
        pageColor: AppColors.primaryWhiteColor,
        imagePadding: EdgeInsets.zero,
      ),
    );
  }
}
