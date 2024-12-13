import 'package:app/helpers/routes.dart';
import 'package:app/screens/screen_layouts/description_layout.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupSignatureScreen extends StatelessWidget {
  const SignupSignatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    ScreenUtil.init(context);
    // final commonProvider = Provider.of<CommonProvider>(context, listen: false);

    return DescriptionLayout(
      onMainButtonTap: () {
        pushScreen(context, ScreenRoutes.toSignatureCameraScreen);
      },
      onBackButtonTap: () {
        popScreen(context);
      },
      isImage: true,
      imageName: ImageAsset().signatureImage,
      headerText: "Let’s take a photo of your signature",
      headerSubText:
          "We can only accept a photo of your signature. That means, no scans or photocopies.",
      description1: "Make sure you are in a well-lit room",
      description2: "Put your signature on a plain dark surface",
      description3: "Check there’s no glare on your signature",
      description4: "Check we can see your signature clearly",
    );
  }
}
