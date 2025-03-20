import 'package:flutter/material.dart';

class CustomAppImage extends StatelessWidget {
  final String assetPath;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit fit;

  const CustomAppImage({
    Key? key,
    required this.assetPath,
    this.color,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      color: color,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
