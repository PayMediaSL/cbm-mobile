import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeField extends StatelessWidget {
  final TextEditingController controller;
  final int length;
  final String? Function(String?)? validator;
  final Color cursorColor;
  final Color activeColor;
  final Color inactiveColor;
  final Color selectedColor;
  final Color backgroundColor;
  final double fieldWidth;
  final double fieldHeight;

  const CustomPinCodeField({
    Key? key,
    required this.controller,
    this.length = 5,
    this.validator,
    this.cursorColor = Colors.blue,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.grey,
    this.selectedColor = Colors.blueAccent,
    this.backgroundColor = Colors.white,
    this.fieldWidth = 40,
    this.fieldHeight = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: controller,
      appContext: context,
      autoDisposeControllers: false,
      length: length,
      keyboardType: TextInputType.number,
      obscureText: false,
      textStyle: TextStyle(color: activeColor),
      blinkWhenObscuring: true,
      enableActiveFill: false,
      cursorColor: cursorColor,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        activeBorderWidth: 0,
        inactiveBorderWidth: 0,
        borderWidth: 0,
        disabledBorderWidth: 0,
        fieldHeight: fieldHeight,
        fieldWidth: fieldWidth,
        disabledColor: backgroundColor,
        inactiveFillColor: backgroundColor,
        inactiveColor: inactiveColor,
        activeColor: activeColor,
        selectedColor: selectedColor,
      ),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
    );
  }
}
