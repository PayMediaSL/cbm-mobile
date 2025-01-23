import 'package:cbm_one_app/helpers/colors.dart';
import 'package:cbm_one_app/helpers/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteCard extends StatelessWidget {
  final String name;
  final String details;
  final String image;
  final VoidCallback? onTap;

  const FavoriteCard({
    Key? key,
    required this.name,
    required this.details,
    required this.image,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width:
            MediaQuery.of(context).size.width * 0.2, // ScreenUtils.width * 0.2
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: name == "Add" ? null : AssetImage(image),
              backgroundColor: name == "Add"
                  ? AppColors.iconGreyColor
                  : AppColors.transparent,
              child: name == "Add"
                  ? Icon(Icons.add, size: 30, color: AppColors.black)
                  : null,
            ),
            Text(
              name,
              style: commonTextStyle.copyWith(
                color: AppColors.primaryBlackColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            if (details.isNotEmpty)
              Text(
                details,
                style: commonTextStyle.copyWith(
                  color: AppColors.bottomNavIconColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
