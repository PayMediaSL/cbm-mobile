import 'package:cbm_one_app/helpers/colors.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final Color fillColor;
  final Color hintTextColor;
  final Color iconColor;
  final double heightFactor;
  final double widthFactor;
  final double borderRadius;
  final isBorderAvilable;

  const SearchTextField({
    Key? key,
    this.controller,
    this.onChanged,
    this.hintText = "Search",
    this.fillColor = Colors.grey,
    this.hintTextColor = Colors.white,
    this.iconColor = Colors.white,
    this.heightFactor = 0.12,
    this.widthFactor = 0.5,
    this.borderRadius = 30.0,
    this.isBorderAvilable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenWidth * heightFactor,
      width: screenWidth * widthFactor,
      decoration: BoxDecoration(
          color: fillColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(borderRadius),
          border: isBorderAvilable
              ? Border.all(color: HexColor("#E2E8F0"))
              : Border.all(color: Colors.transparent)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                color: hintTextColor,
                fontFamily: "inter",
                fontWeight: FontWeight.w400),
            prefixIcon: Icon(Icons.search, color: iconColor),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
