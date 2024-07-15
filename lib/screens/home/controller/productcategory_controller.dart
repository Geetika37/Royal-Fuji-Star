import 'dart:convert';
import 'package:get/get.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/services/token.dart';

class ProductCategoryController extends GetxController {
  var isLoading = false.obs;
  var product = <dynamic>[].obs;
  var errorMessage = ''.obs;
  var locale = 'en'.obs;

  @override
  void onInit() {
    super.onInit();
    productCategory();

    loadLocale();
  }

  Future<void> loadLocale() async {
    try {
      locale.value = await TokenKey.getValue('selectedLanguage') ?? 'en';
      print('locale: ---- ${locale.value}');
    } catch (e) {
      errorMessage.value = 'Error loading locale: ${e.toString()}';
    } finally {
      await productCategory();
    }
  }

  Future<void> productCategory() async {
    isLoading(true);
    try {
      final token = await TokenKey.getValue('token');
      if (token == null) {
        errorMessage.value = 'Error: Token is null';
        isLoading(false);
        return;
      }

      final url = Uri.parse(
          '${APIConstants.baseUrl}/api/product-categories?locale=${locale.value}');
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
        if (jsonResponse['data'] != null) {
          product.value = jsonResponse['data'];
        } else {
          errorMessage.value = 'Error: No data in response';
        }
      } else {
        errorMessage.value = 'Error: ${jsonResponse['error']['message']}';
      }
    } catch (e) {
      errorMessage.value = 'Error: ${e.toString()}';
    } finally {
      isLoading(false);
    }
  }
}
