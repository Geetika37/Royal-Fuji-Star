import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/services/token.dart';
import 'package:royal_fuji_star/services/token_expire.dart';

class AdvisoryController extends GetxController {
  var isLoading = false.obs;

  Future<void> saveAdvisory(
    String typeConsultation,
    String description,
    String additionalComment,
    List<File> uploadImages,
  ) async {
    final token = await TokenKey.getValue('token');

    isLoading(true);
    try {
      final url = Uri.parse('${APIConstants.baseUrl}/api/advisories');

      var request = http.MultipartRequest('POST', url);
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });

      request.fields['typeOfConsultation'] = typeConsultation;
      request.fields['description'] = description;
      request.fields['commentsOrQuestion'] = additionalComment;

      for (var image in uploadImages) {
        request.files
            .add(await http.MultipartFile.fromPath('uploadImages', image.path));
      }

      // sendd
      var response = await request.send();

      var responseData = await response.stream.bytesToString();
      var jsonResponse = jsonDecode(responseData);
      if (response.statusCode == 200) {
        Get.snackbar(
          'Success',
          jsonResponse['message'],
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } 
      else if (response.statusCode == 401) {
        TokenExpire.handleTokenExpiration();
      }
       else {
        Get.snackbar(
          'Error',
          jsonResponse['error']['message'],
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print("error${e.toString()}");
    } finally {
      isLoading(false);
    }
  }
}
