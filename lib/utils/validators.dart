class Validators {
  static String? validateName(String? value) {
    if (value == null ||
        value.isEmpty ||
        !RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Enter Correct Name';
    }
    return null;
  }

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
}
