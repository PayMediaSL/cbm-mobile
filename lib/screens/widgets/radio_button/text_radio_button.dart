import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants/ui_constants.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/radio_button/radio_button_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomRadioButton extends StatelessWidget {
  final String groupKey;
  final List<String> options;

  const CustomRadioButton({
    Key? key,
    required this.groupKey,
    required this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radioProvider = Provider.of<RadioButtonProvider>(context);
    final selectedOption = radioProvider.getSelectedOption(groupKey);

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: UI_Padding.AUTHLAYOUT_VERTICAL_PADDING,
          horizontal: UI_Padding.AUTHLAYOUT_HORIZONTAL_PADDING),
      child: Column(
        children: options.map((option) {
          return Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Text left, radio right
            children: [
              Text(option, style: radioButtonTextStyle),
              Radio<String>(
                value: option,
                groupValue: selectedOption,
                onChanged: (value) {
                  if (value != null) {
                    radioProvider.setSelectedOption(groupKey, value);
                  }
                },
                activeColor: AppColors.primaryRadioButtonFillColor,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
