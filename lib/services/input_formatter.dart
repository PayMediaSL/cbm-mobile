import 'package:flutter/services.dart';

// Formatter to allow only alphanumeric characters with specific symbols
class AlphaNumericInputFormatter extends TextInputFormatter {
  static final _alphaNumericRegex = RegExp(r'^[a-zA-Z0-9@\-. _]+$');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return _alphaNumericRegex.hasMatch(newValue.text)
        ? newValue
        : (newValue.text.isEmpty ? newValue : oldValue);
  }
}

// Formatter for address input allowing specific characters
class AddressFormatter extends TextInputFormatter {
  static final _addressRegex = RegExp(r'^[a-zA-Z0-9@,\-/.\s]+$');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return _addressRegex.hasMatch(newValue.text)
        ? newValue
        : (newValue.text.isEmpty ? newValue : oldValue);
  }
}

// Formatter to allow only valid email characters
class EmailInputFormatter extends TextInputFormatter {
  static final _emailRegex = RegExp(r'^[a-zA-Z0-9@.\-_]+$');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // If the new value matches the email pattern, return it; otherwise, revert to the old value.
    return _emailRegex.hasMatch(newValue.text)
        ? newValue
        : (newValue.text.isEmpty ? newValue : oldValue);
  }
}

// Formatter for password input allowing specific special characters
class PasswordInputFormatter extends TextInputFormatter {
  static final _passwordRegex = RegExp(r'^[a-zA-Z0-9@#!&\$\-. _]+$');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return _passwordRegex.hasMatch(newValue.text)
        ? newValue
        : (newValue.text.isEmpty ? newValue : oldValue);
  }
}

// Formatter to convert text to lowercase
class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}

// Formatter for formatting amount input with commas and validation
// class AmountInputFormatter extends TextInputFormatter {
//   static const separator = ',';
//   static const maxAmount = 10000000;

//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue oldValue,
//     TextEditingValue newValue,
//   ) {
//     var textWithoutSeparators = newValue.text.replaceAll(separator, '');

//     if (textWithoutSeparators.startsWith('0') &&
//         !textWithoutSeparators.startsWith('0.')) {
//       return oldValue;
//     }

//     var textParts = textWithoutSeparators.split('.');

//     // Format integer part with commas
//     String formattedInteger = _formatWithCommas(textParts[0]);

//     if (_exceedsMaxAmount(formattedInteger)) {
//       return oldValue;
//     }

//     // Reconstruct text with decimal part
//     String newText = formattedInteger;
//     if (textParts.length > 1) {
//       String decimalPart =
//           textParts[1].length > 2 ? textParts[1].substring(0, 2) : textParts[1];
//       newText = '$formattedInteger.$decimalPart';
//     }

//     return TextEditingValue(
//       text: newText,
//       selection: TextSelection.collapsed(offset: newText.length),
//     );
//   }

//   String _formatWithCommas(String text) {
//     final chars = text.split('');
//     String formatted = '';
//     for (int i = chars.length - 1; i >= 0; i--) {
//       if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1) {
//         formatted = separator + formatted;
//       }
//       formatted = chars[i] + formatted;
//     }
//     return formatted;
//   }

//   bool _exceedsMaxAmount(String text) {
//     double? parsedAmount = double.tryParse(text.replaceAll(separator, ''));
//     return parsedAmount != null && parsedAmount > maxAmount;
//   }
// }

// Formatter for mobile number with custom behavior
// class MobileNumberFormatter extends TextInputFormatter {
//   final String defaultCountryCode;
//   final int minLength;
//   final int maxLength;
//   final VoidCallback? onWalletIdDataRequested;

//   MobileNumberFormatter({
//     this.defaultCountryCode = '+94',
//     this.minLength = 10,
//     this.maxLength = 10,
//     this.onWalletIdDataRequested,
//   });

//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue oldValue,
//     TextEditingValue newValue,
//   ) {
//     String cleanNumber = newValue.text.replaceAll(RegExp(r'\D'), '');

//     if (cleanNumber.startsWith(defaultCountryCode)) {
//       return newValue.copyWith(
//         text: cleanNumber.substring(defaultCountryCode.length),
//       );
//     }

//     if (cleanNumber.length >= minLength && cleanNumber.length <= maxLength) {
//       return newValue.copyWith(text: cleanNumber);
//     }

//     String last7Digits = cleanNumber.length >= 7
//         ? cleanNumber.substring(cleanNumber.length - 7)
//         : '';

//     if (onWalletIdDataRequested != null && last7Digits.isNotEmpty) {
//       onWalletIdDataRequested!();
//     }

//     return newValue.copyWith(text: last7Digits);
//   }
// }
