import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/home/widgets/bottomnav.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/services/token.dart';

class OneproductEnquiryController extends GetxController {
  var isLoading = false.obs;

  Future<void> saveEnquiryOneProduct(
      int productId, List<int> componentId) async {
    isLoading(true);
    final token = await TokenKey.getValue('token');
    try {
      final url = Uri.parse('${APIConstants.baseUrl}/api/product-enquiries');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          "productId": productId,
          "components": componentId,
        }),
      );

      final jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (jsonResponse['success']) {
          Get.snackbar(
            'Success',
            'Submitted',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          print('success-->${jsonResponse['success']}');
          Get.offAll(const Bottomnav());
        }
      } else {
        Get.snackbar(
          'Error',
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
