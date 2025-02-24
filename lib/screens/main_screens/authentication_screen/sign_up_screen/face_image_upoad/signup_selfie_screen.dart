import 'package:app/helpers/routes.dart';
import 'package:app/screens/screen_layouts/description_layout.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpSelfieScreen extends StatelessWidget {
  const SignUpSelfieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    ScreenUtil.init(context);
    // final commonProvider = Provider.of<CommonProvider>(context, listen: false);

    return DescriptionLayout(
      onMainButtonTap: () {
        pushScreen(context, ScreenRoutes.toSignUpSelfieCamera);
      },
      onBackButtonTap: () {
        popScreen(context);
      },
      isImage: true,
      imageName: ImageAsset().selfieImage,
      headerText: "Let’s take a selfie",
      headerSubText: "Your selfie will let us know it’s really you.",
      description1: "Make sure you are in a well-lit room",
      description2: "Make sure we can see you clearly",
      description3: "Remove anything that hides your face (glasses are fine)",
      description4: "Look straight at the camera and smile",
    );
  }
}
