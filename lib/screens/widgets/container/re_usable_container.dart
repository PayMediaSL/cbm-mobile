import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants/ui_constants.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/screens/widgets/icons/custom_icons.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClarifyIdentityContainer extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final String? route;
  final bool isCompleted;
  final void Function()? onTap;

  ClarifyIdentityContainer({
    required this.title,
    required this.description,
    required this.imagePath,
    this.route,
    this.onTap,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    ScreenUtil.init(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: ScreenUtils.height * 0.12,
        width: ScreenUtils.width,
        color: isCompleted
            ? AppColors.transparent
            : AppColors.SecondarysubGreyColor,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Container(
                        width: ScreenUtils.width * 0.16,
                        height: ScreenUtils.width * 0.2,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.SecondarysubGreyColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                              UI_Padding.PRIMARY_COMMON_PADDING_2),
                          child: Image(
                            image: AssetImage(imagePath),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: ScreenUtils.width * 0.02),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: commonTextStyle_black_500_16sp,
                        ),
                        SizedBox(
                          width: ScreenUtils.width * 0.6,
                          child: Text(
                            description,
                            style: commonTextStyle.copyWith(
                              color: AppColors.secondarySubBlackColor,
                              fontSize: 14,
                            ),
                          ),
                        ),

                        // Transform.scale(
                        //   scale: 0.8,
                        //   child: Checkbox(
                        //       value: isCompleted, onChanged: (bool? value) {}),
                        // )
                      ],
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(
                        right: UI_Padding.PRIMARY_COMMON_PADDING),
                    child: ArrowIcon()),
              ],
            ),
            if (isCompleted)
              Positioned(
                top: 8,
                right: 8,
                child: Text(
                  "Completed",
                  style: commonTextStyle.copyWith(
                    color: AppColors.secondarySubBlackColor,
                  ),
                ),
              ),
            // Positioned(
            //     // top: 10,
            //     bottom: 0,
            //     right: 5,
            //     child: Row(
            //       children: [
            //         Checkbox(value: true, onChanged: (bool? value) {}),
            //         Text("Same as NIC")
            //       ],
            //     )

            // Text(
            //   "Completed",
            //   style: commonTextStyle.copyWith(
            //     color: AppColors.secondarySubBlackColor,
            //   ),
            // ),
            // ),
          ],
        ),
      ),
    );
  }
}
