import 'package:cbm_one_app/helpers/routes.dart';
import 'package:cbm_one_app/providers/other_provider/common_provider.dart';
import 'package:cbm_one_app/screens/main_screens/authentication_screen/sign_up_screen/face_capture_camera.dart';
import 'package:cbm_one_app/utils/assest_image.dart';
import 'package:cbm_one_app/utils/navigation_util.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpSignatureCameraScreen extends StatefulWidget {
  const SignUpSignatureCameraScreen({super.key});

  @override
  State<SignUpSignatureCameraScreen> createState() =>
      _SignUpSignatureCameraScreenState();
}

XFile? _capturedImage;

void _handleCapturedImage(XFile image) {}

class _SignUpSignatureCameraScreenState
    extends State<SignUpSignatureCameraScreen> {
  @override
  Widget build(BuildContext context) {
    final commonProvider = Provider.of<CommonProvider>(context, listen: false);
    return Scaffold(
      body: Center(
        child: FaceCaptureCamera(
          assetImage: ImageAsset().iconImage,
          cameraText1:
              "Make sure the photo is not blurry and the signature is clearly visible",
          cameraText2: "Position the signature inside the frame",
          cameraLensDirection: CameraLensDirection.back,
          cameraPreviewShape: BoxShape.rectangle,
          onCapture: _handleCapturedImage,
          onTap: () {
            pushScreen(context, ScreenRoutes.toClarifyIdentityScreen);
            commonProvider.toggleStates("signature");
            commonProvider.updateStateProgress("signature", true);
          },
        ),
      ),
    );
  }
}
