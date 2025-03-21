import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double size;
  final Color backgroundColor;
  final Color iconColor;
  final double iconSize;
  const CircularIconButton(
      {Key? key,
      required this.icon,
      required this.onTap,
      required this.size,
      required this.backgroundColor,
      required this.iconColor,
      required this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: Icon(icon, color: iconColor, size: iconSize),
      ),
    );
  }
}

class CircularBorderButton extends StatelessWidget {
  final VoidCallback onTap;
  final double size;
  final Color borderColor;
  final double borderWidth;

  const CircularBorderButton({
    Key? key,
    required this.onTap,
    required this.size,
    required this.borderColor,
    this.borderWidth = 5.0, // Default border width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: borderWidth),
        ),
      ),
    );
  }
}
