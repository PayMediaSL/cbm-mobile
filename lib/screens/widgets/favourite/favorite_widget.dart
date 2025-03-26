import 'package:app/helpers/colors.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/screens/widgets/icons/custom_icons.dart';
import 'package:flutter/material.dart';

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
                  ? Icon(BaseIcons.add,
                      size: 30, color: AppColors.primaryBlackColor)
                  : null,
            ),
            Text(
              name,
              style: commonTextStyle_black_500_12sp.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            if (details.isNotEmpty)
              Text(
                details,
                style: commonTextStyle_black_500_12sp,
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
