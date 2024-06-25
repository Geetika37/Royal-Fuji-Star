import 'dart:convert';

import 'package:get/get.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;

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
        Get.snackbar('Success', jsonResponse['message']);
      } else {
        Get.snackbar('Error', jsonResponse['error']['message']);
      }
    } catch (e) {
      print('error:${e.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
