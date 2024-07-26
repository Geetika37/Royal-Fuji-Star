class Validators {
  // Password Validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }
    if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  // name
  static String? validateName(String? value) {
    if (value == null ||
        value.isEmpty ||
        !RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Enter Correct Name';
    }
    return null;
  }

  // location
  static String? validateLocation(String? value) {
    if (value == null ||
        value.isEmpty ||
        !RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Enter Correct Location';
    }
    return null;
  }

  // brand name
  static String? validateBrand(String? value) {
    if (value == null ||
        value.isEmpty ||
        !RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Enter Correct Brand Name';
    }
    return null;
  }

  // email
  static String? validateEmail(String? value) {
    final RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{3,}$');

    if (value == null ||
        value.isEmpty ||
        !emailRegExp.hasMatch(value) ||
        value.contains('..') ||
        value.split('@').last.contains('..') ||
        value.split('@').last.split('.').length > 2) {
      return 'Enter Correct Email';
    }
    return null;
  }

  // just empty
  static String? validateEmpty(String? value) {
    if (value == null ||
        value.isEmpty ||
        !RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Field cannot be empty';
    }
    return null;
  }
}
