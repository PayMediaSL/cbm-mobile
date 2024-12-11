import 'package:app/helpers/routes.dart';
import 'package:app/screens/screen_layouts/description_layout.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupBillingScreen extends StatelessWidget {
  const SignupBillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    ScreenUtil.init(context);
    // final commonProvider = Provider.of<CommonProvider>(context, listen: false);

    return DescriptionLayout(
      onMainButtonTap: () {
        pushScreen(context, ScreenRoutes.toSignUpBillingCameraScreen);
      },
      onBackButtonTap: () {
        popScreen(context);
      },
      isImage: true,
      imageName: ImageAsset().billingImage,
      headerText: "Let’s clarify your identity",
      headerSubText:
          "We can only accept a photo of your bill. That means, no scans or photocopies.",
      description1: "Make sure you are in a well-lit room",
      description2: "Put your bill on a plain dark surface",
      description3: "Check there’s no glare on your bill",
      description4: "Check we can see your bill clearly",
    );
  }
}
