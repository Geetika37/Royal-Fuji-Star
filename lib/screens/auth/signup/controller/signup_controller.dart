import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/auth/login/views/loginscreen.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/utils/appcolor.dart';

class SignupController extends GetxController {
  var isLoading = false.obs;

  Future<void> signUp(String name, String countryCode, String phone,
      String email, String password, String location) async {
    isLoading(true);
    try {
      final url = Uri.parse('${APIConstants.baseUrl}/api/auth/local/register');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': name,
          'phone': countryCode + phone,
          'email': email,
          'password': password,
          'location': location,
        }),
      );
      // final jsonResponse = jsonDecode(response.body);
      // print(jsonResponse);
      if (response.statusCode == 200) {
        Get.to(const LoginScreen());
      } else {
        Get.snackbar(
          'histor24'.tr,
          'validation31'.tr,
          backgroundColor: Colors.red,
          colorText: Appcolor.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'histor24',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Appcolor.white,
      );
      // print("error${e.toString()}");
    } finally {
      isLoading(false);
    }
  }
}
