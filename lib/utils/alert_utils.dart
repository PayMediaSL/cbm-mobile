import 'package:app/helpers/colors.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// Enum to define the types of alerts.
enum AlertType {
  error,
  success,
  info,
  warning,
}

/// Utility class for showing custom toasts.
class AlertUtil {
  final BuildContext context;
  late final FToast fToast;

  /// Initializes [AlertUtil] with the given [context].
  AlertUtil(this.context) {
    fToast = FToast();
    fToast.init(context);
  }

  //! Displays a custom toast message.
  ///
  //? - [alertType]: The type of alert (error, success, info, or warning).
  //? - [message]: The message to display.
  //? - [bottom]: Position from the bottom of the screen.
  //? - [seconds]: Duration of the toast.

  void showToast({
    required AlertType alertType,
    required String message,
    double bottom = 100.0,
    int seconds = 2,
  }) {
    // Determine background color and icon based on alert type.
    final Color backgroundColor;
    final IconData iconData;

    switch (alertType) {
      case AlertType.success:
        backgroundColor = AppColors.primaryBlueColor;
        iconData = Icons.check;
        break;
      case AlertType.error:
        backgroundColor = AppColors.primaryRedColor;
        iconData = Icons.error;
        break;
      case AlertType.warning:
        backgroundColor = AppColors.primaryAmberColor;
        iconData = Icons.warning_rounded;
        break;
      case AlertType.info:
        backgroundColor = AppColors.primaryBlueColor;
        iconData = Icons.info_outline;
        break;
    }

    // Show toast with custom content and positioning.
    fToast.showToast(
      positionedToastBuilder: (context, child) {
        return Positioned(
          bottom: bottom,
          left: 25.w,
          right: 25.w,
          child: child,
        );
      },
      child: _buildToastContent(
        message: message,
        backgroundColor: backgroundColor,
        iconData: iconData,
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: seconds),
    );
  }

  /// Builds the content of the custom toast.
  Widget _buildToastContent({
    required String message,
    required Color backgroundColor,
    required IconData iconData,
  }) {
    return Container(
      width: ScreenUtils.width,
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.sp),
        color: backgroundColor,
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            color: AppColors.white,
            size: 15.w,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            onTap: () {
              fToast.removeCustomToast();
            },
            child: Icon(
              Icons.close,
              color: AppColors.white,
              size: 15.w,
            ),
          ),
        ],
      ),
    );
  }
}
