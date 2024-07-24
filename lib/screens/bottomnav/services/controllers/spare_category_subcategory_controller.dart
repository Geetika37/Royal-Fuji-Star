import 'dart:convert';

import 'package:get/get.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/services/token.dart';
import 'package:royal_fuji_star/services/token_expire.dart';

class CategorySubcategoryController extends GetxController {
  var isLoading = false.obs;
  var subCategory = [].obs;
  var errorMessage = ''.obs;

  var locale = 'en'.obs;

  @override
  void onInit() {
    super.onInit();
    loadLocale();
  }

  Future<void> loadLocale() async {
    try {
      locale.value = await TokenKey.getValue('selectedLanguage') ?? 'en';
    } catch (e) {
      errorMessage.value = 'Error loading locale: ${e.toString()}';
    } finally {
      await catSubCategory();
    }
  }

  Future<void> catSubCategory() async {
    isLoading(true);
    final token = await TokenKey.getValue('token');
    try {
      final url = Uri.parse(
          '${APIConstants.baseUrl}/api/spare-categories?locale=${locale.value}');
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
        // print('subcategory=====>$subCategory');
      } else if (response.statusCode == 401) {
        TokenExpire.handleTokenExpiration();
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
