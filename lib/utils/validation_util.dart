import 'package:flutter/services.dart';

bool isValidEmail(String? email) {
  final emailRegex = RegExp(
      r"^(?!\.)[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$");

  if (email == null || email.isEmpty) {
    return false;
  }

  final match = emailRegex.firstMatch(email);
  if (match == null) {
    return false;
  }

  final domain = email.substring(match.start + 1);
  if (!domain.contains('.') ||
      !['com', 'net', 'org', 'lk']
          .contains(domain.split('.').last.toLowerCase())) {
    return false;
  }

  return true;
}

class PasswordValidationResult {
  final bool isValid;
  final String error;

  PasswordValidationResult({required this.isValid, this.error = ""});
}

PasswordValidationResult validatePassword(String password) {
  if (password.isEmpty) {
    return PasswordValidationResult(
        isValid: false, error: "Password cannot be empty");
  }

  if (password.length < 8) {
    return PasswordValidationResult(
        isValid: false, error: "Password must be at least 8 characters long");
  }

  final hasUpperCase = RegExp(r'[A-Z]').hasMatch(password);
  final hasLowerCase = RegExp(r'[a-z]').hasMatch(password);
  final hasDigit = RegExp(r'[0-9]').hasMatch(password);

  if (!hasUpperCase) {
    return PasswordValidationResult(
        isValid: false,
        error: "Password must contain at least one uppercase letter");
  }
  if (!hasLowerCase) {
    return PasswordValidationResult(
        isValid: false,
        error: "Password must contain at least one lowercase letter");
  }
  if (!hasDigit) {
    return PasswordValidationResult(
        isValid: false, error: "Password must contain at least one digit");
  }

  return PasswordValidationResult(isValid: true);
}

bool isValidMobile(String mobile) {
  final pattern = r'^(?:[+0]9)?[0-9]{10}$';
  return RegExp(pattern).hasMatch(mobile);
}

bool isValidMaldiveMobile(String mobile) {
  final pattern = r'^(7|9)\d{6}$';
  return RegExp(pattern).hasMatch(mobile);
}

bool isValidMaldivianNID(String nid) {
  final pattern = r'^[A-Za-z]\d{6,11}[xXvV]?$';
  return RegExp(pattern).hasMatch(nid);
}

bool isValidName(String text) {
  return RegExp(r'^[a-zA-Z ]*$').hasMatch(text);
}

bool isValidLetterAndNumber(String text) {
  return RegExp(r'^[A-Za-z0-9]*$').hasMatch(text);
}

String? validateDate(String value) {
  if (value.isEmpty) {
    return 'Expiry date is required';
  }

  final split = value.split('/');
  if (split.length != 2) {
    return 'Invalid expiry date format';
  }

  final month = int.parse(split[0]);
  final year = int.parse(split[1]);

  if (month < 1 || month > 12) {
    return 'Expiry month is invalid';
  }

  final currentYear = DateTime.now().year;
  final expiryYear = year < 100 ? currentYear - 100 + year : year;

  if (expiryYear < currentYear ||
      (expiryYear == currentYear && month < DateTime.now().month)) {
    return 'Card has expired';
  }

  return null;
}

String formatMobileNumber(String number) {
  return number.replaceAll(RegExp(r'[+\-()/\s]'), '');
}

TextInputFormatter onlyNumbers() {
  return FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));
}

TextInputFormatter validLetterAndNumber() {
  return FilteringTextInputFormatter.allow(RegExp(r'^[A-Za-z0-9]*$'));
}
