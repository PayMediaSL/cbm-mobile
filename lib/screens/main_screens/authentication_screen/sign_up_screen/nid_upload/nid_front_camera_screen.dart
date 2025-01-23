// ignore_for_file: non_constant_identifier_names

import 'package:cbm_one_app/helpers/routes.dart';
import 'package:cbm_one_app/screens/main_screens/authentication_screen/sign_up_screen/face_capture_camera.dart';
import 'package:cbm_one_app/utils/assest_image.dart';
import 'package:cbm_one_app/utils/navigation_util.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class NIDFrontCameraScreen extends StatefulWidget {
  const NIDFrontCameraScreen({super.key});

  @override
  State<NIDFrontCameraScreen> createState() => _NIDFrontCameraScreenState();
}

XFile? _capturedImage;

void _handleCapturedImage(XFile image) {}

class _NIDFrontCameraScreenState extends State<NIDFrontCameraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FaceCaptureCamera(
          assetImage: ImageAsset().iconImage,
          cameraText1:
              "Make sure the photo is not blurry and all details are clearly visible",
          cameraText2: "Position the front of your ID inside the frame",
          cameraLensDirection: CameraLensDirection.back,
          cameraPreviewShape: BoxShape.rectangle,
          onCapture: _handleCapturedImage,
          onTap: () {
            pushScreen(context, ScreenRoutes.toNidBackCameraScreen);
          },
        ),
      ),
    );
  }
}
