import 'package:app/helpers/colors.dart';
import 'package:app/helpers/routes.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/other_provider/common_provider.dart';
import 'package:app/screens/screen_layouts/authentication_layout/authentication_layout.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUpSelfieScreen extends StatelessWidget {
  const SignUpSelfieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    ScreenUtil.init(context);
    final commonProvider = Provider.of<CommonProvider>(context, listen: false);

    return AuthenticationLayout(
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
      defaultButton: true,
      headerText: "Let’s take a selfie",
      headerSubText: "Your selfie will let us know it’s really you.",
      onTap: () {
        commonProvider.toggleState("identity");
        pushScreen(context, ScreenRoutes.toClarifyIdentityScreen);
        // popScreen(context);
      },
      buttontitle: "Im ready",
      container2CustomWidget: Column(
        children: [
          Image(
            image: AssetImage(ImageAsset().selfieImage),
            height: ScreenUtils.height * 0.25,
            width: ScreenUtils.width,
          ),
          ColumnSpacer(0.02),
          Row(
            children: [
              Image(
                image: AssetImage(ImageAsset().checkmarkImage),
                height: ScreenUtils.height * 0.03,
              ),
              RowSpacer(0.02),
              SizedBox(
                width: ScreenUtils.width * 0.8,
                child: Text(
                  "Make sure you are in a well-lit room",
                  style: commonTextStyle.copyWith(
                      fontSize: 16.sp, color: AppColors.primarySubBlackColor),
                ),
              )
            ],
          ),
          ColumnSpacer(0.01),
          Row(
            children: [
              Image(
                image: AssetImage(ImageAsset().checkmarkImage),
                height: ScreenUtils.height * 0.03,
              ),
              RowSpacer(0.02),
              SizedBox(
                width: ScreenUtils.width * 0.8,
                child: Text(
                  "Make sure we can see you clearly",
                  style: commonTextStyle.copyWith(
                      fontSize: 16.sp, color: AppColors.primarySubBlackColor),
                ),
              )
            ],
          ),
          ColumnSpacer(0.01),
          Row(
            children: [
              Image(
                image: AssetImage(ImageAsset().checkmarkImage),
                height: ScreenUtils.height * 0.03,
              ),
              RowSpacer(0.02),
              SizedBox(
                width: ScreenUtils.width * 0.8,
                child: Text(
                  "Remove anything that hides your face (glasses are fine)",
                  style: commonTextStyle.copyWith(
                      fontSize: 16.sp, color: AppColors.primarySubBlackColor),
                ),
              )
            ],
          ),
          ColumnSpacer(0.01),
          Row(
            children: [
              Image(
                image: AssetImage(ImageAsset().checkmarkImage),
                height: ScreenUtils.height * 0.03,
              ),
              RowSpacer(0.02),
              SizedBox(
                width: ScreenUtils.width * 0.8,
                child: Text(
                  "Look straight at the camera and smile",
                  style: commonTextStyle.copyWith(
                      fontSize: 16.sp, color: AppColors.primarySubBlackColor),
                ),
              )
            ],
          ),
          ColumnSpacer(0.02),
        ],
      ),
    );
  }
}
