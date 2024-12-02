// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, sized_box_for_whitespace

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String initialValue;
  final double dropdownHeight;
  final double? dheight;
  final double? dwidth;
  final Color fillColor;
  final Color borderColor;
  final Color? dropDownFillColor;
  final double dropDownBorderRadius;

  CustomDropdown({
    required this.items,
    required this.initialValue,
    this.dropdownHeight = 50.0,
    this.fillColor = Colors.white,
    this.borderColor = Colors.blue,
    this.dheight,
    this.dwidth,
    this.dropDownFillColor,
    this.dropDownBorderRadius = 25.0,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return Container(
      decoration: BoxDecoration(
        color: widget.dropDownFillColor ?? HexColor("#E5E7EB"),
        borderRadius: BorderRadius.circular(widget.dropDownBorderRadius),
      ),
      height: widget.dheight ?? ScreenUtils.height * 0.5,
      width: widget.dwidth ?? ScreenUtils.width * 0.3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: DropdownButton<String>(
          value: _selectedValue,
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 25,
          dropdownColor: widget.fillColor,
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),

          //! Need to Change Once State Managemnet Fixed
          onChanged: (String? newValue) {
            setState(() {
              _selectedValue = newValue!;
            });
          },
          style: commonTextStyle.copyWith(color: HexColor("#475569")),
          underline: SizedBox(), // Hides the default underline
          isDense: true,
          itemHeight: widget.dropdownHeight, // Adjust dropdown height
        ),
      ),
    );
  }
}
