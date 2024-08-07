import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/home/widgets/bottomnav.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/services/token.dart';
import 'package:royal_fuji_star/services/token_expire.dart';

class SpareEnquiryController extends GetxController {
  var isLoading = false.obs;
  Future<void> saveSpareEnquiry(int spareId) async {
    final token = await TokenKey.getValue('token');
    isLoading(true);
    try {
      final url = Uri.parse('${APIConstants.baseUrl}/api/spare-enquiries');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          "spareId": spareId,
        }),
      );

      final jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (jsonResponse['success']) {
          Get.snackbar(
            'histor21'.tr,
            'histor22'.tr,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          Get.offAll(const Bottomnav());
        }
      } else if (response.statusCode == 401) {
        TokenExpire.handleTokenExpiration();
      } else {
        Get.snackbar(
          'histor24'.tr,
          jsonResponse['error']['message'],
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        print('jsonResponse---->${jsonResponse['error']['message']}');
      }
    } catch (e) {
      print("error${e.toString()}");
    } finally {
      isLoading(false);
    }
  }
}
