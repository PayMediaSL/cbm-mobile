import 'package:app/helpers/routes.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/screens/screen_layouts/authentication_layout/authentication_layout.dart';
import 'package:app/screens/widgets/container/re_usable_container.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../providers/other_provider/common_provider.dart';

class ClarifyYourIdentityScreen extends StatelessWidget {
  const ClarifyYourIdentityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    ScreenUtil.init(context);
    final commonProvider = Provider.of<CommonProvider>(context, listen: false);
    return AuthenticationLayout(
      isAppBar: true,
      onBackButtonTap: () {
        popScreen(context);
      },
      isContainer1: true,
      isContainer2: true,
      isBodyLeadingAvailable: true,
      isBodyLeadingIcon: true,
      isHeadingAvailable: true,
      isSubHeadingAvailable: true,
      useImage: true,
      imageName: ImageAsset().authBg,
      headerText: commonProvider.isProgressComplete
          ? "All done"
          : "Let’s clarify your identity",
      headerSubText: commonProvider.isProgressComplete
          ? "You’re all caught up here."
          : "We’ll keep your information secure and confidential.",
      defaultButton: true,
      buttontitle: "Next",
      onTap: () {
        pushScreen(context, ScreenRoutes.toSignUpFinishedUp);
      },
      isLinearProgress: true,
      container2CustomWidget: Column(
        children: [
          // LinearProgressIndicator(
          //   value: commonProvider.progress,
          //   backgroundColor: Colors.grey[300],
          //   color: Colors.blue,
          // ),
          ClarifyIdentityContainer(
            isCompleted: commonProvider.getStates("aboutyou"),
            title: "About you",
            description: "Your citizenship and personal details.",
            imagePath: ImageAsset().userImage,
            onTap: () {
              pushScreen(context, ScreenRoutes.toAboutYouScreen);
              // commonProvider.updateState("aboutyou", true);
            },
          ),
          ColumnSpacer(0.01),
          ClarifyIdentityContainer(
            isCompleted: commonProvider.getStates("identity"),
            title: "Your identity",
            description: "Checking to make sure you and your ID match.",
            imagePath: ImageAsset().profileImage,
            onTap: () {
              pushScreen(context, ScreenRoutes.toSignUpSelfieScreen);
            },
            // route: route
          ),
          ColumnSpacer(0.01),
          ClarifyIdentityContainer(
            isCompleted: commonProvider.getStates("signature"),
            title: "Your signature",
            description:
                "Processing of transactions and services that require your authorization.",
            imagePath: ImageAsset().penToolImage,
            // route: route
            onTap: () {
              pushScreen(context, ScreenRoutes.toSignatureScreen);
            },
          ),
          ColumnSpacer(0.01),
          ClarifyIdentityContainer(
            isCompleted: commonProvider.getStates("billingproof"),
            title: "Billing proof",
            description:
                "Checking to make sure you are an permanent residence.",
            imagePath: ImageAsset().homeImage,
            onTap: () {
              pushScreen(context, ScreenRoutes.toSignUpBillingScreen);
            },
            // route: route
          ),
        ],
      ),
    );
  }
}
