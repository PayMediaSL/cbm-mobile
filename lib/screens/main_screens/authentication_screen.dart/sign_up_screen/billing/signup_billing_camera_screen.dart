import 'package:app/helpers/routes.dart';
import 'package:app/providers/other_provider/common_provider.dart';
import 'package:app/screens/main_screens/authentication_screen.dart/sign_up_screen/face_capture_camera.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupBillingCameraScreen extends StatefulWidget {
  const SignupBillingCameraScreen({super.key});

  @override
  State<SignupBillingCameraScreen> createState() =>
      _SignupBillingCameraScreenState();
}

XFile? _capturedImage;

void _handleCapturedImage(XFile image) {}

class _SignupBillingCameraScreenState extends State<SignupBillingCameraScreen> {
  @override
  Widget build(BuildContext context) {
    final commonProvider = Provider.of<CommonProvider>(context, listen: false);
    return Scaffold(
      body: Center(
        child: FaceCaptureCamera(
          isImage: true,
          assetImage: ImageAsset().iconImage,
          cameraText1:
              "Make sure the photo is not blurry and the signature is clearly visible",
          cameraText2: "Position the signature inside the frame",
          cameraLensDirection: CameraLensDirection.back,
          cameraPreviewShape: BoxShape.rectangle,
          onCapture: _handleCapturedImage,
          onTap: () {
            pushScreen(context, ScreenRoutes.toClarifyIdentityScreen);
            commonProvider.toggleState("billingproof");
          },
        ),
      ),
    );
  }
}
