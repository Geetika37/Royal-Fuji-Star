import 'dart:convert';

import 'package:get/get.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/services/token.dart';

class CategorySubcategoryController extends GetxController {
  var isLoading = false.obs;
  var subCategory = [].obs;

  Future<void> catSubCategory(int id) async {
    isLoading(true);
    final token = await TokenKey.getValue('token');
    try {
      final url = Uri.parse(
          '${APIConstants.baseUrl}/api/findCategorySubCategories/$id?&title=desc');
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
        // print('jsonresp======>${jsonResponse}');
        subCategory.value = jsonResponse['data'];
        print('subcategory=====>$subCategory');
      } else {
        print('error message --->${jsonResponse['error']['message']}');
      }
    } catch (e) {
      print('error---${e.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
