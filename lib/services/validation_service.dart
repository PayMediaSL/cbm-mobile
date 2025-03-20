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

  static String? validateOTPField(
    String? value,
  ) {
    if (value!.isEmpty) {
      return 'PIN cannot be empty';
    }
    if (value.length != 5) {
      return 'PIN must be exactly 5 digits long';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'PIN can only contain numeric digits';
    }
    // Add more validation rules if needed
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

  static String? validatePassword(String? password, {bool allowEmpty = false}) {
    if ((password == null || password.trim().isEmpty) && !allowEmpty) {
      return 'Password is required';
    }

    if (!allowEmpty && password != null) {
      // Define password rules
      final passwordRegex = RegExp(
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}$', // At least 8 characters, one uppercase, one lowercase, and one number
      );

      if (!passwordRegex.hasMatch(password)) {
        return 'Invalid Password Format';
      }
    }

    return null;
  }

  static String? validateConfirmPassword(
    String? confirmPassword, {
    required String? createPassword,
    bool allowEmpty = false,
  }) {
    if ((confirmPassword == null || confirmPassword.trim().isEmpty) &&
        !allowEmpty) {
      return 'Confirm password is required';
    }

    if (confirmPassword != createPassword) {
      return 'Passwords do not match';
    }

    return null; // Confirm password is valid
  }

  static String? validatePassCode(String? passcode, String? previousPasscode) {
    if (passcode == null || passcode.trim().isEmpty) {
      return 'Passcode cannot be empty';
    }

    if (!RegExp(r'^\d{6}$').hasMatch(passcode)) {
      return 'Passcode must 6 digits';
    }

    if (previousPasscode != null && passcode != previousPasscode) {
      return 'Passcodes do not match';
    }

    return null; // Valid passcode
  }
}
