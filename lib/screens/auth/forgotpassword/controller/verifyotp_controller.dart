import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/auth/forgotpassword/view/screens/resetpassword.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/utils/appcolor.dart';

class VerifyotpController extends GetxController {
  var isLoading = false.obs;

  Future<void> verifyOtp(String otp) async {
    isLoading(true);

    try {
      final url = Uri.parse('${APIConstants.baseUrl}/api/auth/reset-password');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'mode': 'verifyOtp',
          'otpCode': otp,
        }),
      );

      final jsonResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Get.to(Resetpassword(
          otp: otp,
        ));
        Get.snackbar('histor21'.tr, jsonResponse['message'],
            colorText: Appcolor.white, backgroundColor: Colors.green);
      } else {
        Get.snackbar('Error', jsonResponse['error']['message'],
            colorText: Appcolor.white, backgroundColor: Colors.red);
      }
    } catch (e) {
      print('error:${e.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
