import 'dart:convert';

import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/models/spare_subcategory_spare_modek.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/services/token.dart';

class SubcategorySparesController extends GetxController {
  var isLoading = false.obs;
  // var spares = [].obs;
  var errorMessage = ''.obs;

  var spare = Rxn<Spare>();

  Future<void> subCategorySpares(int id, int categoryID) async {
    isLoading(true);
    final token = await TokenKey.getValue('token');

    try {
      final url = Uri.parse(
          '${APIConstants.baseUrl}/api/spares-sub-category-spares/$id?title=desc&categoryId=$categoryID');
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
        print('response--------->$jsonResponse');
        if (jsonResponse['success']) {
          try {
            // print('response==$jsonResponse');
            // final spareData = Spare.fromJson(jsonResponse);
            spare.value = Spare.fromJson(jsonResponse);
            // print('Spare Data: $spareData');
          } catch (e) {
            // print('Parsing Error: $e');
            errorMessage.value = 'Error parsing product data: ${e.toString()}';
          }
        } else {
          errorMessage.value = 'Error: ${jsonResponse['message']}';
          // print('error-->$errorMessage');
        }
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
