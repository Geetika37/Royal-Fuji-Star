import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/auth/forgotpassword/view/screens/verify_otp.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/utils/appcolor.dart';

class ForgotpassController extends GetxController {
  var isLoading = false.obs;

  Future<void> forgotPass(String email) async {
    isLoading(true);
    try {
      final url = Uri.parse('${APIConstants.baseUrl}/api/auth/forgot-password');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
        }),
      );
      final jsonresponse = jsonDecode(response.body);
      print(jsonresponse);
      if (response.statusCode == 200) {
        Get.to(const VerifyOtp());
        Get.snackbar(
          'Success',
          'OTP Successfully Sent',
          backgroundColor: Colors.green,
          colorText: Appcolor.white,
        );
      } else {
        print('error ${jsonresponse['error']['message']}');
        Get.snackbar(
          'Error',
          jsonresponse['error']['message'],
          backgroundColor: Colors.red,
          colorText: Appcolor.white,
        );
      }
    } catch (e) {
      print('error${e.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
