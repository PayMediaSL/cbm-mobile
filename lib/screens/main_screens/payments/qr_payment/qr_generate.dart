import 'package:app/helpers/colors.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QrGenerateScreen extends StatelessWidget {
  const QrGenerateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeMainLayout(
      backgroundColor: AppColors.SecondarysubGreyColor,
      isBgContainer1: true,
      isBgContainer2: true,
      isBgContainer1Height: ScreenUtils.height * 0.07,
      onBackIconAvailable: true,
      onBackTitleAvailable: true,
      backTitle: "Generate QR",
      onBackTap: () {
        popScreen(context);
      },
      children: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColumnSpacer(0.1),
              // Center(
              //   child: QrImage(
              //     data:
              //         dataToEncode, // The data you want to encode in the QR code
              //     version:
              //         QrVersions.auto, // Adjust the QR version automatically
              //     size: 200.0, // Size of the QR code
              //     gapless: false, // Avoid gaps between QR code blocks
              //     backgroundColor: Colors.white, // Background color
              //     embeddedImage:
              //         AssetImage('assets/logo.png'), // Optional: Add a logo
              //     embeddedImageStyle: QrEmbeddedImageStyle(
              //       size: Size(40, 40), // Size of the embedded logo
              //     ),
              //   ),
              // ),
            ],
          )),
    );
  }
}
