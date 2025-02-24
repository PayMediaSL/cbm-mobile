// ignore_for_file: unused_field

import 'package:app/helpers/routes.dart';
import 'package:app/screens/main_screens/authentication_screen/sign_up_screen/face_capture_camera.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class SignUpSelfieCameraScreen extends StatefulWidget {
  @override
  _SignUpSelfieCameraScreenState createState() =>
      _SignUpSelfieCameraScreenState();
}

class _SignUpSelfieCameraScreenState extends State<SignUpSelfieCameraScreen> {
  XFile? _capturedImage;

  void _handleCapturedImage(XFile image) {
    setState(() {
      _capturedImage = image;
    });

    // print("imageee gettingg");
    // print(_capturedImage!.path);
  }

  @override
  Widget build(BuildContext context) {
    // final commonProvider = Provider.of<CommonProvider>(context, listen: false);
    return Scaffold(
      body: Center(
        child: FaceCaptureCamera(
          assetImage: ImageAsset().iconImage,
          cameraText1:
              "Make sure the photo is not blurry and your face is clearly visible",
          cameraText2: "Keep your face within the oval",
          cameraLensDirection: CameraLensDirection.front,
          cameraPreviewShape: BoxShape.circle,
          onCapture: _handleCapturedImage,
          onTap: () {
            // commonProvider.toggleState("");
            pushScreen(context, ScreenRoutes.toNidScreen);
          },
        ),
      ),
    );
  }
}
