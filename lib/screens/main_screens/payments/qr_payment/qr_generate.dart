import 'package:app/helpers/colors.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/screens/screen_layouts/home_layout/home_layout.dart';
import 'package:app/screens/widgets/main_button/main_button.dart';
import 'package:app/screens/widgets/text_style/font_family.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
      backTitle: "My QR",
      onBackTap: () {
        popScreen(context);
      },
      children: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ColumnSpacer(0.1),
              SizedBox(
                  height: ScreenUtils.height * 0.3,
                  width: ScreenUtils.width * 1,
                  child: Center(child: QrImageView(data: "sdsdsd"))),
              ColumnSpacer(0.02),
              Text(
                "Scan to get Paid",
                style: commonTextStyle.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryBlackColor,
                    fontFamily: secondaryFontFamily),
              ),
              ColumnSpacer(0.005),
              Text(
                "Hold the code inside the frame ,It will be scanned automatically,",
                style: commonTextStyle.copyWith(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryBlackColor,
                    fontFamily: secondaryFontFamily),
              ),
              ColumnSpacer(0.05),
              MainButton(
                isMainButton: true,
                btnOnPress: () {},
                buttontitle: "Request For Payment",
              )
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
