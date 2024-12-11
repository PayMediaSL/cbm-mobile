// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:permission_handler/permission_handler.dart';

// class FaceCaptureCamera extends StatefulWidget {
//   final Function(XFile) onCapture;

//   const FaceCaptureCamera({Key? key, required this.onCapture})
//       : super(key: key);

//   @override
//   _FaceCaptureCameraState createState() => _FaceCaptureCameraState();
// }

// class _FaceCaptureCameraState extends State<FaceCaptureCamera> {
//   late CameraController _cameraController;
//   late List<CameraDescription> _cameras;
//   bool _isInitialized = false;
//   XFile? _capturedImage;

//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//   }

//   Future<void> _initializeCamera() async {
//     if (await Permission.camera.request().isGranted) {
//       _cameras = await availableCameras();
//       _cameraController = CameraController(
//         _cameras.firstWhere(
//             (camera) => camera.lensDirection == CameraLensDirection.front),
//         ResolutionPreset.high,
//       );

//       await _cameraController.initialize();
//       setState(() {
//         _isInitialized = true;
//       });
//     } else {
//       // Handle permission denial
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Camera permission is required.')),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _cameraController.dispose();
//     super.dispose();
//   }

//   void _capturePhoto() async {
//     if (_cameraController.value.isInitialized) {
//       final XFile photo = await _cameraController.takePicture();
//       widget.onCapture(photo);
//       setState(() {
//         _capturedImage = photo;
//       });
//     }
//   }

//   void _retakePhoto() {
//     setState(() {
//       _capturedImage = null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.init(context);
//     if (!_isInitialized) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Container(
//               color: Colors.black,
//               child: Center(
//                 child: ClipOval(
//                   child: SizedBox(
//                     width: 250.w,
//                     height: 250.w,
//                     child: _capturedImage == null
//                         ? CameraPreview(_cameraController)
//                         : Image.file(
//                             File(_capturedImage!.path),
//                             fit: BoxFit.cover,
//                           ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           _buildOverlay(),
//           if (_capturedImage == null)
//             Positioned(
//               bottom: 40.h,
//               left: 0,
//               right: 0,
//               child: Center(
//                 child: GestureDetector(
//                   onTap: _capturePhoto,
//                   child: Container(
//                     width: 70.w,
//                     height: 70.w,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(color: Colors.white, width: 5),
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           else
//             Positioned(
//               bottom: 40.h,
//               left: 0,
//               right: 0,
//               child: Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     GestureDetector(
//                       onTap: _retakePhoto,
//                       child: Container(
//                         width: 70.w,
//                         height: 70.w,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.white,
//                         ),
//                         child: const Icon(Icons.refresh,
//                             color: Colors.black, size: 30),
//                       ),
//                     ),
//                     SizedBox(width: 20.w),
//                     Container(
//                       width: 70.w,
//                       height: 70.w,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.white,
//                       ),
//                       child:
//                           const Icon(Icons.done, color: Colors.black, size: 30),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _buildOverlay() {
//     return Stack(
//       children: [
//         Positioned(
//           top: 80.h,
//           left: 20.w,
//           right: 20.w,
//           child: Text(
//             'Make sure the photo is not blurry and your face is clearly visible',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16.sp, // Responsive font size
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         Positioned(
//           bottom: 120.h,
//           left: 20.w,
//           right: 20.w,
//           child: Text(
//             'Keep your face within the oval',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 14.sp, // Responsive font size
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

class FaceCaptureCamera extends StatefulWidget {
  final Function(XFile) onCapture;
  final CameraLensDirection cameraLensDirection; // Front or rear camera
  final BoxShape cameraPreviewShape; // Circle or Rectangle
  final String cameraText1;
  final String cameraText2;
  final String assetImage;
  final bool isImage;
  final void Function()? onTap;

  const FaceCaptureCamera({
    Key? key,
    required this.onCapture,
    this.cameraLensDirection =
        CameraLensDirection.front, // Default to front camera
    this.cameraPreviewShape = BoxShape.circle,
    this.cameraText1 = "",
    this.cameraText2 = "",
    this.assetImage = "",
    this.isImage = false,
    this.onTap,
  }) : super(key: key);

  @override
  _FaceCaptureCameraState createState() => _FaceCaptureCameraState();
}

class _FaceCaptureCameraState extends State<FaceCaptureCamera> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  bool _isInitialized = false;
  XFile? _capturedImage;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    if (await Permission.camera.request().isGranted) {
      _cameras = await availableCameras();
      _cameraController = CameraController(
        _cameras.firstWhere(
            (camera) => camera.lensDirection == widget.cameraLensDirection),
        ResolutionPreset.high,
      );

      await _cameraController.initialize();
      setState(() {
        _isInitialized = true;
      });
    } else {
      // Handle permission denial
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Camera permission is required.')),
      );
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  void _capturePhoto() async {
    if (_cameraController.value.isInitialized) {
      final XFile photo = await _cameraController.takePicture();
      widget.onCapture(photo);
      setState(() {
        _capturedImage = photo;
      });
    }
  }

  void _retakePhoto() {
    setState(() {
      _capturedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    if (!_isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.black,
              child: Center(
                child: _buildCameraPreview(),
              ),
            ),
          ),
          _buildOverlay(),
          if (_capturedImage == null)
            Positioned(
              bottom: 40.h,
              left: 0,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: _capturePhoto,
                  child: Container(
                    width: 70.w,
                    height: 70.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 5),
                    ),
                  ),
                ),
              ),
            )
          else
            Positioned(
              bottom: 40.h,
              left: 0,
              right: 0,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _retakePhoto,
                      child: Container(
                        width: 70.w,
                        height: 70.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(Icons.refresh,
                            color: Colors.black, size: 30),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Container(
                        width: 70.w,
                        height: 70.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(Icons.done,
                            color: Colors.black, size: 30),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Method to build the camera preview with the desired shape
  Widget _buildCameraPreview() {
    if (widget.cameraPreviewShape == BoxShape.circle) {
      return ClipOval(
        child: SizedBox(
          width: 250.w,
          height: 250.w,
          child: _capturedImage == null
              ? CameraPreview(_cameraController)
              : Image.file(
                  File(_capturedImage!.path),
                  fit: BoxFit.cover,
                ),
        ),
      );
    } else {
      return ClipRect(
        child: SizedBox(
          width: 300.w,
          height: 200.w,
          child: _capturedImage == null
              ? CameraPreview(_cameraController)
              : Image.file(
                  File(_capturedImage!.path),
                  fit: BoxFit.cover,
                ),
        ),
      );
    }
  }

  Widget _buildOverlay() {
    return Stack(
      children: [
        Positioned(
          top: 80.h,
          left: 20.w,
          right: 20.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.isImage
                  ? Image(height: 20.sp, image: AssetImage(widget.assetImage))
                  : SizedBox.shrink(),
              SizedBox(
                width: 10.w,
              ),
              SizedBox(
                // height: 50.h,
                width: 280.w,
                child: Text(
                  widget.cameraText1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "inter",
                    color: Colors.white,
                    fontSize: 16.sp, // Responsive font size
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 200.h,
          left: 20.w,
          right: 20.w,
          child: Text(
            widget.cameraText2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontFamily: "inter",
              fontSize: 16.sp, // Responsive font size
            ),
          ),
        ),
      ],
    );
  }
}
