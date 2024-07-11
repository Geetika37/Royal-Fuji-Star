import 'dart:convert';

import 'package:get/get.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/services/token.dart';

class SubcategorySparesController extends GetxController {
  var isLoading = false.obs;
  var spares = [].obs;
  var errorMessage = ''.obs;

  Future<void> subCategorySpares(int id) async {
    isLoading(true);
    final token = await TokenKey.getValue('token');
    try {
      final url = Uri.parse(
          '${APIConstants.baseUrl}/api/spares-sub-category-spares/$id?title=desc');
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      final jsonResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // print('response--------->$jsonResponse');
        spares.value = jsonResponse['data'];
        // print('sparee data----------((()))$spares');
      } else {
        errorMessage.value =
            'Error Message==== ${jsonResponse['error']['message']}';
        print(errorMessage);
      }
    } catch (e) {
      print('error--->##${e.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
