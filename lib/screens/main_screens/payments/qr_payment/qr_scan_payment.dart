// import 'package:app/providers/payments/qr_payment_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:qr_flutter/qr_flutter.dart';

// class QRScanScreen extends StatelessWidget {
//   const QRScanScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final qrData = Provider.of<QRCodeProvider>(context).data;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('QR Pay'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Container(
//         width: double.infinity,
//         color: Colors.grey[900], // Background color similar to the design
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: 10,
//                     offset: const Offset(0, 5),
//                   ),
//                 ],
//               ),
//               child: QrImageView(
//                 data: qrData,
//                 version: QrVersions.auto,
//                 size: 200.0,
//                 gapless: false,
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'Hold the phone still to Scan the QR code within the box above',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Provider.of<QRCodeProvider>(context, listen: false)
//                     .updateQRData("https://updated-example.com");
//               },
//               child: const Text("Refresh QR Code"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//! Scan QR Code

// ignore_for_file: must_be_immutable
import 'package:app/helpers/colors.dart';
import 'package:app/helpers/routes.dart';
import 'package:app/helpers/spacers.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/payments/qr_payment_provider.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:app/utils/navigation_util.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

class QrScannerScreen extends StatelessWidget {
  late MobileScannerController controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.unrestricted,
    autoStart: true,
  );
  bool isNavigating = false;

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.of(context).size.center(Offset.zero),
      width: ScreenUtils.width * 0.7,
      height: ScreenUtils.height * 0.35,
    );

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: ScreenUtils.height,
              width: ScreenUtils.width,
              color: Colors.black87,
            ),

            // Mobile scanner with centered scan window
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 20.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.primaryWhiteColor,
                      ),
                      Text(
                        "QR Pay",
                        style: commonTextStyle.copyWith(fontSize: 16.sp),
                      ),
                    ],
                  ),
                  const Divider(),
                  const ColumnSpacer(0.02),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.flash_auto,
                            color: AppColors.white,
                          ),
                          RowSpacer(0.04),
                          Icon(
                            Icons.copy,
                            color: AppColors.white,
                          )
                        ],
                      ),
                      Icon(
                        Icons.close,
                        color: AppColors.white,
                      )
                    ],
                  ),
                  const ColumnSpacer(0.2),
                  Center(
                    child: SizedBox(
                      width: scanWindow.width,
                      height: scanWindow.height,
                      child: MobileScanner(
                        startDelay: true,
                        // fit: BoxFit.fitHeight,
                        // scanWindow: scanWindow,
                        controller: controller,
                        errorBuilder: (context, error, child) {
                          return ScannerErrorWidget(error: error);
                        },
                        onScannerStarted: (arguments) {},
                        onDetect: (BarcodeCapture barcodeCapture) {
                          if (barcodeCapture.barcodes.isNotEmpty) {
                            String barcodeValue =
                                barcodeCapture.barcodes.first.rawValue ?? '';
                            if (barcodeValue.isNotEmpty && !isNavigating) {
                              isNavigating = true;

                              // Update the QR data in the provider
                              Provider.of<QrScannerState>(context,
                                      listen: false)
                                  .updateQrData(barcodeValue);
                              controller.dispose();
                              pushReplacementScreen(
                                  context, ScreenRoutes.toQrPaySreen);

                              Future.delayed(Duration(seconds: 1), () {
                                isNavigating =
                                    false; // Reset to allow next scan
                              });
                            }
                          }
                        },
                        // onDetect: (BarcodeCapture barcodeCapture) {
                        //   if (barcodeCapture.barcodes.isNotEmpty) {
                        //     String barcodeValue =
                        //         barcodeCapture.barcodes.first.rawValue ?? '';
                        //     if (barcodeValue.isNotEmpty && !isNavigating) {
                        //       isNavigating = true;

                        //       Provider.of<QrScannerState>(context,
                        //               listen: false)
                        //           .updateQrData(barcodeValue);

                        //     }
                        //   }
                        // },

                        //   if (barcodeCapture.barcodes.isNotEmpty) {
                        //     String barcodeValue =
                        //         barcodeCapture.barcodes.first.rawValue ?? '';
                        //     if (barcodeValue.isNotEmpty) {
                        //       Provider.of<QrScannerState>(context,
                        //               listen: false)
                        //           .updateQrData(barcodeValue);

                        //       pushScreen(context, ScreenRoutes.toQrPaySreen);
                        //     }
                        //   }
                        // },
                      ),
                    ),
                  ),
                  const ColumnSpacer(0.06),
                  ColumnSpacer(0.1),
                  Text(
                    "Hold the phone still to Scan the QR code within the box above",
                    style: commonTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        fontFamily: "jost",
                        fontSize: 16.sp,
                        color: AppColors.primaryWhiteColor),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Consumer<QrScannerState>(
//   builder: (BuildContext context, QrScannerState value,
//           Widget? child) =>
//       GestureDetector(
//     onTap: () {
//       pushScreen(context, ScreenRoutes.toQrPaySreen);
//     },
//     child: Text(
//       value.qrData,
//       style: commonTextStyle.copyWith(
//           fontWeight: FontWeight.w500,
//           fontFamily: "jost",
//           fontSize: 16.sp,
//           color: AppColors.primaryWhiteColor),
//     ),
//   ),
// ),

class ScannerErrorWidget extends StatelessWidget {
  const ScannerErrorWidget({Key? key, required this.error}) : super(key: key);

  final MobileScannerException error;

  @override
  Widget build(BuildContext context) {
    String errorMessage;

    switch (error.errorCode) {
      case MobileScannerErrorCode.controllerUninitialized:
        errorMessage = 'Controller not ready.';
        break;
      case MobileScannerErrorCode.permissionDenied:
        errorMessage = 'Permission denied';
        break;
      case MobileScannerErrorCode.unsupported:
        errorMessage = 'Scanning is unsupported on this device';
        break;
      default:
        errorMessage = 'Generic Error';
        break;
    }

    return ColoredBox(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Icon(Icons.error, color: Colors.white),
            ),
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              error.errorDetails?.message ?? '',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
