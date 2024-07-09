import 'dart:convert';

import 'package:get/get.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:royal_fuji_star/services/token.dart';
import 'package:http/http.dart' as http;

class OneProductController extends GetxController {
  var isLoading = false.obs;
  var product = <dynamic>[].obs;
  var errorMessage = ''.obs;

  Future<void> oneProduct(int id) async {
    isLoading(true);
    try {
      final token = await TokenKey.getValue('token');
      final url = Uri.parse('${APIConstants.baseUrl}/api/products/$id');
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      final jsonResponse = jsonDecode(response.body);
      print('jsonresponse====>$jsonResponse');

      if (response.statusCode == 200) {
        print('jsonresponse====>$jsonResponse');
      } else {
        print(response.statusCode);

        errorMessage.value = 'Error: ${jsonResponse['error']['message']}';
        print('errorrrr----$errorMessage');
      }
    } catch (e) {
      print('Error---${e.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
