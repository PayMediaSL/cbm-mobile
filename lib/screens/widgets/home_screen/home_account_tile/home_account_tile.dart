import 'package:app/helpers/colors.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/utils/assest_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAccountTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final String holds;
  final String? image;
  final String holdTitle;

  const HomeAccountTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.holds,
    this.holdTitle = "",
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.iconGreyColor,
                radius: 20.sp,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                      image: AssetImage(image ?? ImageAsset().iconImageMoney1)),
                ),
              ),
              RowSpacer(0.05),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: commonTextStyle.copyWith(
                        color: AppColors.primaryBlackColor, fontSize: 15.sp),
                  ),
                  Text(
                    subtitle,
                    style: commonTextStyle.copyWith(
                        color: AppColors.onBoardSubTextStyleColor),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: commonTextStyle_black_500_14.copyWith(fontSize: 15.sp),
              ),
              Text("${holdTitle} ${holds}",
                  style: commonTextStyle.copyWith(
                      color: AppColors.onBoardSubTextStyleColor)),
            ],
          ),
        ],
      ),
    );
  }
}
