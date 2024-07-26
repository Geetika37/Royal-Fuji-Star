import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/auth/login/views/loginscreen.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/utils/appcolor.dart';

class ResetpassController extends GetxController {
  var isLoading = false.obs;

  Future<void> resetPassword(
      String password, String confirmPassword, String otp) async {
    isLoading(true);

    try {
      final url = Uri.parse('${APIConstants.baseUrl}/api/auth/reset-password');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'mode': 'resetPassword',
          'otpCode': otp,
          'password': password,
          'passwordConfirmation': confirmPassword,
        }),
      );

      final jsonResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Get.snackbar(
          'success',
          jsonResponse['message'],
          colorText: Appcolor.white,
          backgroundColor: Colors.green,
        );
        Get.to(const LoginScreen());
      } else {
        Get.snackbar(
          'Error',
          jsonResponse['error']['message'],
          colorText: Appcolor.white,
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      print('error: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
