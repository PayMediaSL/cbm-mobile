import 'package:app/utils/validation_util.dart';

class ValidationService {
  /// Validates mobile numbers based on country and format.
  static String? validateMobile(
    String? mobile, {
    String? countryShortName,
    int? maxLength,
  }) {
    if (mobile == null || mobile.trim().isEmpty) {
      return 'Mobile number is required';
    }

    if (countryShortName?.trim() == 'MV') {
      if (!isValidMaldiveMobile(mobile)) {
        return 'Invalid mobile number';
      }
    } else {
      if ((maxLength != null && mobile.length != maxLength) ||
          !isValidMobile(mobile)) {
        return 'Invalid mobile number';
      }
    }

    return null;
  }

  static String? validateAccoutNumber(
    String? value,
  ) {
    if (value == null || value.isEmpty) {
      return 'Account number  is required';
    } else if (value.length != 10) {
      return 'Invalid Account Number';
    }

    return null;
  }

  static String? validateUserMobileNumber(
    String? value,
  ) {
    if (value == null || value.isEmpty) {
      return 'Mobile number  is required';
    } else if (value.length != 10) {
      return 'Invalid Account Number';
    }

    return null;
  }

  /// Validates if the given [value] is not empty.
  static String? validateIsNotEmptyField(String? value, String name) {
    if (value == null || value.isEmpty) {
      return '${name}  is required';
    }

    return null;
  }

  /// Validates if the given [value] is not empty.
  static String? validateIsNotEmptyFieldRequired(String? value, String name) {
    if (value == null || value.isEmpty) {
      return '${name}  required';
    }

    return null;
  }

  /// Validates Maldivian IDs.
  static String? validateID(String? value, {String? fieldName = 'ID'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    if (!isValidMaldivianNID(value)) {
      return 'Invalid $fieldName format. Please enter a valid $fieldName.';
    }
    return null;
  }

  /// Validates names to ensure they are not empty and follow a valid format.
  static String? validateName(String? value, {String? fieldName = 'Name'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    if (!isValidName(value)) {
      return 'Invalid $fieldName. Please enter a valid $fieldName.';
    }
    return null;
  }

  /// Validates email addresses with an option to allow empty values.
  static String? validateEmail(String? email, {bool allowEmpty = false}) {
    if ((email == null || email.trim().isEmpty) && !allowEmpty) {
      return 'Email is required';
    }

    if (!allowEmpty && email != null) {
      final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,})$',
      );
      if (!emailRegex.hasMatch(email)) {
        return 'Invalid email address';
      }
    }

    return null;
  }
}
