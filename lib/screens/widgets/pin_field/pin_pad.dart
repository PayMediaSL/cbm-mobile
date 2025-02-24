import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/log_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PinNumberPad extends StatelessWidget {
  const PinNumberPad(
      {Key? key,
      required this.controller,
      required this.onChanged,
      this.decimal = true,
      this.isFingerPrintNeeded = true,
      this.onBiometricsTap,
      this.isBiomentrics = true})
      : super(key: key);

  final bool decimal;
  final TextEditingController? controller;
  final void Function(String pin) onChanged;
  final bool isFingerPrintNeeded;
  final bool isBiomentrics;

  final void Function()? onBiometricsTap;

  final List<String> numbersList = const [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'c',
    '0',
    '.'
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return GridView.count(
      padding: EdgeInsets.only(left: 45.w, right: 45.w),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: UI.PADDING,
      mainAxisSpacing: UI.PADDING_2X,
      scrollDirection: Axis.vertical,
      crossAxisCount: 3,
      childAspectRatio: 2 / 1.55,
      children: numbersList.map((n) {
        if (n == 'c') {
          printLog('isFingerPrintNeeded ---> $isFingerPrintNeeded');
          if (!isFingerPrintNeeded) {
            return Container();
          } else {
            return GestureDetector(
                onTap: () {
                  // Trigger biometrics
                  onBiometricsTap?.call();
                },
                child: isBiomentrics
                    ? Container(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(
                          ImageAsset().fingerprint, // Need to Change
                        ),
                      )
                    : SizedBox.shrink());
          }
        }
        if (n == '.') {
          // if (controller!.text.isEmpty) return Container();
          return InkWell(
            onTap: () {
              if (controller!.text.isEmpty) return;
              String str = controller!.text;
              controller!.text = str.substring(0, str.length - 1);
              onChanged(controller!.text);
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                ImageAsset().deleteIconImage,
              ),
            ),
          );
        } else {
          return _getButtonUI(n);
        }
      }).toList(),
    );
  }

  Widget _getButtonUI(String value) {
    if (!decimal && (value == '.')) return Container();
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: Colors.transparent,
      textStyle: const TextStyle(
          color: AppColors.black, fontSize: 23, fontFamily: "interS"),
      child: InkWell(
        highlightColor: AppColors.white,
        splashColor: AppColors.white,
        onTap: () {
          if (controller!.text.length >= 6) return;
          controller!.text += value;
          onChanged(controller!.text);
        },
        child: Center(
          child: Text(
            value,
          ),
        ),
      ),
    );
  }
}
