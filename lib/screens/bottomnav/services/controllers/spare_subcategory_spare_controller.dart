import 'dart:convert';

import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/models/spare_model.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/services/token.dart';
import 'package:royal_fuji_star/services/token_expire.dart';

class SubcategorySparesController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var spare = <Datum>[].obs;

  Future<void> subCategorySpares(int categoryID) async {
    // print('category id---$categoryID');

    isLoading(true);
    final token = await TokenKey.getValue('token');
    // spare.clear();

    try {
      final url = Uri.parse(
          '${APIConstants.baseUrl}/api/spares-find-category-spares/$categoryID?title=desc');
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      final jsonResponse = jsonDecode(response.body);
      // print('response--------->$jsonResponse');

      if (response.statusCode == 200) {
        if (jsonResponse['success']) {
          try {
            var spareData = SpareResponse.fromJson(json.decode(response.body));
            spare.value = spareData.data;
            print('spare data--${spare}');
          } catch (e) {
            // print('Parsing Error: $e');
            errorMessage.value = 'Error parsing product data: ${e.toString()}';
          }
        } else {
          errorMessage.value = 'Error: ${jsonResponse['message']}';
        }
      } else if (response.statusCode == 401) {
        TokenExpire.handleTokenExpiration();
      } else {
        errorMessage.value =
            'Error Message==== ${jsonResponse['error']['message']}';
        print('error-->$errorMessage');
      }
    } catch (e) {
      print('error--->##${e.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
