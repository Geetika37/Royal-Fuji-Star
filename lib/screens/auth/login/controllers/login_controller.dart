import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/home/widgets/bottomnav.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/services/token.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  Future<void> login(String identifier, String password) async {
    isLoading(true);
    try {
      final url = Uri.parse('${APIConstants.baseUrl}/api/auth/local');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'identifier': identifier,
          'password': password,
        }),
      );
      final jsonResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final token = jsonResponse['data']['jwt'];
        print('Token received: $token');
        await TokenKey.saveValue('token', token);
        Get.offAll(const Bottomnav());
      } else {
        Get.snackbar('histor24'.tr, jsonResponse['error']['message'],
            backgroundColor: Colors.red, colorText: Appcolor.white);
      }
    } catch (e) {
      print('Error: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
