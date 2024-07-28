import 'package:get/get.dart';

class Validators {
  // Password Validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'validation1'.tr;
    }
    if (value.length < 8) {
      return 'validation2'.tr;
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'validation3'.tr;
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'validation4'.tr;
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      return 'validation5'.tr;
    }
    if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
      return 'validation6'.tr;
    }
    return null;
  }

  // name
  static String? validateName(String? value) {
    if (value == null ||
        value.isEmpty ||
        !RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'validation7'.tr;
    }
    return null;
  }

  // name
  static String? validate(String? value) {
    if (value == null) {
      return 'validation8'.tr;
    }
    return null;
  }

  // location
  static String? validateLocation(String? value) {
    if (value == null ||
        value.isEmpty ||
        !RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'validation9'.tr;
    }
    return null;
  }

  // brand name
  static String? validateBrand(String? value) {
    if (value == null ||
        value.isEmpty ||
        !RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'validation10'.tr;
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
      return 'validation11'.tr;
    }
    return null;
  }

  // just empty
  static String? validateEmpty(String? value) {
    if (value == null ||
        value.isEmpty ||
        !RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'validation8'.tr;
    }
    return null;
  }
}
