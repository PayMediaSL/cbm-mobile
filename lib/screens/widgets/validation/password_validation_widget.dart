import 'package:app/helpers/spacers.dart';
import 'package:app/providers/validation_provider/password_validation_provider.dart';
import 'package:app/screens/widgets/validation_indicator/validation_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordValidationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ValidationProvider>(
      builder: (context, validationProvider, _) {
        // List of validation rules
        final List<Map<String, dynamic>> rules = [
          {
            "text": "Minimum 8 characters",
            "isValid": validationProvider.hasMinLength
          },
          {
            "text": "At least 1 uppercase letter (A-Z)",
            "isValid": validationProvider.hasUpperCase
          },
          {
            "text": "At least 1 lowercase letter (a-z)",
            "isValid": validationProvider.hasLowerCase
          },
          {
            "text": "At least 1 number (0-9)",
            "isValid": validationProvider.hasNumber
          },
        ];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < rules.length; i++) ...[
              ValidationIndicator(
                text: rules[i]['text'],
                isValid: rules[i]['isValid'],
                isChecked: validationProvider.isPasswordChecked,
              ),
              if (i != rules.length - 1) ColumnSpacer(0.003),
            ]
          ],
        );
      },
    );
  }
}
