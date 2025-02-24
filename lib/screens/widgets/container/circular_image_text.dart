import 'package:app/helpers/colors.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularImageWithText extends StatelessWidget {
  final String? imagePath;
  final String? label;
  final Color? circleColor;
  final double? size;
  final double? padding;

  const CircularImageWithText({
    Key? key,
    this.imagePath,
    this.label,
    this.circleColor,
    this.size, // Default size
    this.padding, // Default padding
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: size ?? ScreenUtils.width * 0.15,
          width: size ?? ScreenUtils.width * 0.15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: circleColor ?? AppColors.secondaryBlueColor.withOpacity(0.2),
          ),
          child: Padding(
            padding: EdgeInsets.all(padding ?? 12.sp),
            child: Image(
              image: AssetImage(imagePath ?? ImageAsset().iconImageQR),
            ),
          ),
        ),
        ColumnSpacer(0.005), // Adjust spacing dynamically
        Text(
          label ?? "",
          style: commonTextStyle.copyWith(color: AppColors.primaryBlackColor),
        ),
      ],
    );
  }
}
