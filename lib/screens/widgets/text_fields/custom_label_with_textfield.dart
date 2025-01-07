import 'package:app/helpers/text_styles.dart';
import 'package:app/screens/widgets/drop_down/custom_drop_down_field.dart';
import 'package:app/screens/widgets/text_fields/custom_text_field.dart';
import 'package:flutter/material.dart';

class LabelWithTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final double borderRadius;
  final bool isSmallContentPadding;
  final String hint;
  final Widget? suffixIcon;

  const LabelWithTextField({
    Key? key,
    required this.label,
    required this.controller,
    required this.borderRadius,
    required this.isSmallContentPadding,
    required this.hint,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: commonTextFieldTitleStyle,
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height *
                0.005), // ColumnSpacer(0.005)
        CustomLableTextField(
          controller,
          borderradius: borderRadius,
          isSmallContentPadding: isSmallContentPadding,
          hint: hint,
          suffixIcon: suffixIcon,
        ),
      ],
    );
  }
}

class LabelWithDropdown extends StatelessWidget {
  final String label;
  final double borderRadius;
  final String dropdownKey;
  final List<String> items;

  const LabelWithDropdown({
    Key? key,
    required this.label,
    required this.borderRadius,
    required this.dropdownKey,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: commonTextFieldTitleStyle,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.005),
        CustomDropdown(
          borderradius: borderRadius,
          dropdownKey: dropdownKey,
          items: items,
        ),
      ],
    );
  }
}
