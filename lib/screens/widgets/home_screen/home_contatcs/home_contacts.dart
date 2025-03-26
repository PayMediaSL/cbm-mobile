import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactItem extends StatelessWidget {
  final String initials;
  final String contactName;
  final Color containerColor;
  final String bank;

  const ContactItem({
    Key? key,
    required this.initials,
    required this.contactName,
    required this.containerColor,
    this.bank = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    ScreenUtils.init(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.06,
            decoration: BoxDecoration(
              color: containerColor, // Use the random color
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                initials,
                style: commonWhiteBoldStyle,
              ),
            ),
          ),
          ColumnSpacer(0.01),
          Column(
            children: [
              Text(contactName,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: commonTextStyle_black_500_12sp),
              Text(
                bank,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: commonTextStyle_black_500_12sp,
              ),
            ],
          )
        ],
      ),
    );
  }
}
