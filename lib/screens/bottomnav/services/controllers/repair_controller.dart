// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:royal_fuji_star/services/api_baseurl.dart';
// import 'package:http/http.dart' as http;
// import 'package:royal_fuji_star/services/token.dart';

// class RepairController extends GetxController {
//   var isLoading = false.obs;

//   Future<void> saveRepairData(String brand, String description,
//       String typeOfRepairs, List<File> uploadImage) async {
//     isLoading(true);
//     // final token = await TokenKey.getValue('token');
//     print('image-->$uploadImage');
//     try {
//       final url = Uri.parse('${APIConstants.baseUrl}/api/repairs');
//       final response = await http.post(
//         url,
//         // headers: {
//         //   'Content-Type': 'application/json',
//         //   'Accept': 'application/json',
//         //   'Authorization': 'Bearer $token',
//         // },
//         body: ({
//           "brand": brand,
//           "description": description,
//           "typeOfRepairs": typeOfRepairs,
//           "uploadImages": uploadImage,
//         }),
//       );

//       final jsonResponse = jsonDecode(response.body);
//       if (response.statusCode == 200) {
//         Get.snackbar(
//           'Success',
//           'Uploaded',
//           backgroundColor: Colors.green,
//           colorText: Colors.white,
//         );
//       } else {
//         Get.snackbar(
//           'Error',
//           jsonResponse['error']['message'],
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//       }
//     } catch (e) {
//       print("error${e.toString()}");
//     } finally {
//       isLoading(false);
//     }
//   }
// }

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/services/token.dart';
import 'package:royal_fuji_star/services/token_expire.dart';

class RepairController extends GetxController {
  var isLoading = false.obs;

  Future<void> saveRepairData(String brand, String description,
      String typeOfRepairs, List<File> uploadImages) async {
    isLoading(true);
    final token = await TokenKey.getValue('token');
    try {
      final url = Uri.parse('${APIConstants.baseUrl}/api/repairs');

      // create multipart request

      var request = http.MultipartRequest('POST', url);
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });

      request.fields['brand'] = brand;
      request.fields['description'] = description;
      request.fields['typeOfRepairs'] = typeOfRepairs;

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
      } else if (response.statusCode == 401) {
        TokenExpire.handleTokenExpiration();
      } else {
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
