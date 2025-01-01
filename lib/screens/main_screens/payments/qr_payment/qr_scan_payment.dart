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

// ignore_for_file: must_be_immutable

import 'package:app/providers/payments/qr_payment_provider.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRCodeScannerScreen extends StatelessWidget {
  QRCodeScannerScreen({Key? key}) : super(key: key);

  late MobileScannerController controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.unrestricted,
    autoStart: true,
  );

  Future<void> onDetect(BarcodeCapture barcode) async {
    // capture = barcode;
    // printLogs('sss ${barcode.barcodes.first.displayValue}');
    // widget.isVirtualCard
    //     ? await _sendEncodedLink(barcode.barcodes.first.displayValue ?? '')
    //     : await _doQRPayment(barcode.barcodes.first.displayValue ?? '');

    // printLogs(barcode.barcodes);
    // printLogs(barcode.barcodes.first.displayValue);
    // setState(() => this.barcode = barcode.barcodes.first);
    // popScreen(context, result: barcode.barcodes.first.displayValue);
  }

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.of(context).size.center(Offset.zero),
      width: ScreenUtils.width * 0.6,
      height: ScreenUtils.height * 0.3,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Pay'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // QR Code Scanner View
          Expanded(
            flex: 4,
            child: MobileScanner(
                fit: BoxFit.fitHeight,
                scanWindow: scanWindow,
                controller: controller,
                // onScannerStarted: (arguments) {
                //   printLog('scanedddddddd onDetectonDetectonDetectonDetect');
                // },
                errorBuilder: (context, error, child) {
                  return ScannerErrorWidget(error: error);
                },
                onDetect: (barcode) async {
                  await onDetect(barcode);
                }),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Consumer<QRCodeProvider>(
                builder: (context, provider, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Scanned Data: ${provider.scannedData.isEmpty ? 'None' : provider.scannedData}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Hold the phone still to scan the QR code within the box above',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
