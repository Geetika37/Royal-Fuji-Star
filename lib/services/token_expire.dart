import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/auth/login/views/loginscreen.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class TokenExpire {
  static void handleTokenExpiration() {
    Get.snackbar(
      'validation12'.tr,
      'validation13'.tr,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Appcolor.white,
      backgroundColor: Colors.red,
    );
    Get.offAll(() => const LoginScreen());
  }
}
