import 'package:app/helpers/routes.dart';
import 'package:app/providers/other_provider/common_provider.dart';
import 'package:app/screens/main_screens/authentication_screen/sign_up_screen/face_capture_camera.dart';
import 'package:app/utils/assest_image.dart';
import 'package:app/utils/navigation_util.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NIDBackCameraScreen extends StatefulWidget {
  const NIDBackCameraScreen({super.key});

  @override
  State<NIDBackCameraScreen> createState() => _NIDBackCameraScreenState();
}

XFile? _capturedImage;

void _handleCapturedImage(XFile image) {}

class _NIDBackCameraScreenState extends State<NIDBackCameraScreen> {
  @override
  Widget build(BuildContext context) {
    final commonProvider = Provider.of<CommonProvider>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FaceCaptureCamera(
          assetImage: ImageAsset().iconImage,
          cameraText1:
              "Make sure the photo is not blurry and all details are clearly visible",
          cameraText2: "Position the back of your ID inside the frame",
          cameraLensDirection: CameraLensDirection.back,
          cameraPreviewShape: BoxShape.rectangle,
          onCapture: _handleCapturedImage,
          onTap: () {
            // commonProvider.toggleState("");
            commonProvider.toggleStates("identity");
            commonProvider.updateState("identity", true);

            pushScreen(context, ScreenRoutes.toClarifyIdentityScreen);
          },
        ),
      ),
    );
  }
}
