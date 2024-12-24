import 'package:app/helpers/colors.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableGridView extends StatelessWidget {
  final List<Map<String, String>> items; // List of items (title and image path)
  final void Function(int) onTap; // Callback for tap action

  const ReusableGridView({
    Key? key,
    required this.items,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // padding: EdgeInsets.symmetric(vertical: 20.sp),
      height: ScreenUtils.height * 0.5,
      width: ScreenUtils.width,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5.0.sp,
          mainAxisSpacing: 5.0.sp,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => onTap(index), // Call the callback on tap
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.sp, horizontal: 8.sp),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(item["image"] ?? ImageAsset().authBg),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  height: ScreenUtils.height * 0.2,
                  width: ScreenUtils.height * 0.2,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      item["title"]!,
                      style: commonTextStyle.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryWhiteColor),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
