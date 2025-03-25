import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final double radius;
  final Color backgroundColor;
  final String? imagePath;
  final String? text;
  final TextStyle? textStyle;

  const CustomCircleAvatar({
    Key? key,
    this.radius = 20.0,
    required this.backgroundColor,
    this.imagePath,
    this.text,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      child: imagePath != null
          ? Image.asset(
              imagePath!,
              height: radius * 1.1,
            )
          : Text(
              text ?? "",
              style: textStyle ??
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
    );
  }
}
