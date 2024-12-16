import 'package:app/helpers/colors.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/home_screen/quick_access_data_provider.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/assest_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class QuickAccessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    ScreenUtil.init(context);
    return Center(
      child: Container(
        height: ScreenUtils.height * 0.11,
        width: ScreenUtils.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Consumer<QuickAccessProvider>(
          builder: (BuildContext context, QuickAccessProvider homeProvider,
                  Widget? child) =>
              ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: homeProvider.quickAccess.length + 1,
            itemBuilder: (context, index) {
              if (index < homeProvider.quickAccess.length) {
                return _buildItem(
                  onLongTap: () {
                    _showDeleteConfirmationDialog(context, index);
                  },
                  onTap: () {},
                  icon: Image.asset(
                    homeProvider.quickAccess[index]["assetImage"] ?? '',
                  ),
                  label: homeProvider.quickAccess[index]["name"] ?? "",
                );
              } else {
                return _buildItem(
                  icon: Image.asset(ImageAsset().iconImageAdd),
                  label:
                      homeProvider.quickAccess.isEmpty ? "Tap to Add " : "More",
                  onTap: () {
                    _showMoreOptions(context);
                  },
                );
              }
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                  // width: 8.sp,
                  );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildItem({
    required Widget icon,
    required String label,
    GestureTapCallback? onTap,
    GestureTapCallback? onLongTap,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 9.sp),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.ce,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onLongPress: onLongTap,
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.secondaryBlueColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              height: ScreenUtils.height * 0.063,
              child: Padding(
                padding: EdgeInsets.all(13.0),
                child: icon,
              ),
            ),
          ),
          Text(
            label,
            style: commonTextStyle.copyWith(color: AppColors.primaryBlackColor),
          ),
        ],
      ),
    );
  }

  void _showMoreOptions(BuildContext context) {
    final homeProvider =
        Provider.of<QuickAccessProvider>(context, listen: false);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select an option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildOptionTile(
                context: context,
                label: 'Transfer',
                assetImage: ImageAsset().iconImageSend,
                homeProvider: homeProvider,
              ),
              _buildOptionTile(
                context: context,
                label: 'Bill',
                assetImage: ImageAsset().iconImageBill,
                homeProvider: homeProvider,
              ),
              _buildOptionTile(
                context: context,
                label: 'QR',
                assetImage: ImageAsset().iconImageQR,
                homeProvider: homeProvider,
              ),
              _buildOptionTile(
                context: context,
                label: 'Mobile Reload',
                assetImage: ImageAsset().iconImageReload,
                homeProvider: homeProvider,
              ),
              _buildOptionTile(
                context: context,
                label: 'AddMoney',
                assetImage: ImageAsset().iconImageMoney,
                homeProvider: homeProvider,
              ),
              _buildOptionTile(
                context: context,
                label: 'Card payment',
                assetImage: ImageAsset().iconImageCard,
                homeProvider: homeProvider,
              ),
              _buildOptionTile(
                context: context,
                label: 'Favara Pay',
                assetImage: ImageAsset().iconImageFavara,
                homeProvider: homeProvider,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOptionTile({
    required BuildContext context,
    required String label,
    required String assetImage,
    required QuickAccessProvider homeProvider,
  }) {
    bool isDisabled =
        homeProvider.quickAccess.any((item) => item['name'] == label);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Image(
              image: AssetImage(
                assetImage,
              ),
              height: ScreenUtils.height * 0.03,
            ),
            RowSpacer(0.05),
            Text(label,
                style: commonTextStyle.copyWith(
                    color:
                        // isDisabled
                        //     ? AppColors.secondarySubBlackColor.withOpacity(0.3)
                        //     :

                        AppColors.primaryBlackColor)

                // TextStyle(
                //   color: isDisabled
                //       ? Colors.grey
                //       : Colors.black, // Grey out if disabled
                // ),
                ),
          ],
        ),
        IconButton(
            onPressed: isDisabled
                ? null
                : () {
                    Navigator.pop(context);
                    homeProvider.addItem(label, assetImage);
                  },
            icon: Icon(Icons.add_circle,
                color: isDisabled
                    ? AppColors.secondarySubBlackColor.withOpacity(0.3)
                    : AppColors.primaryBlueColor))
      ],
    );

    // return ListTile(
    //   title: Text(
    //     label,
    //     style: TextStyle(
    //       color:
    //           isDisabled ? Colors.grey : Colors.black, // Grey out if disabled
    //     ),
    //   ),
    //   onTap: isDisabled
    //       ? null // Disable tap if already selected
    //       : () {
    //           Navigator.pop(context); // Close the dialog
    //           homeProvider.addItem(label, assetImage); // Add item
    //         },
    // );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Item'),
          content: Text('Are you sure you want to delete this item?'),
          actions: [
            TextButton(
              onPressed: () {
                Provider.of<QuickAccessProvider>(context, listen: false)
                    .deleteItem(index);
                Navigator.pop(context);
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }
}
