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
    loadLocale();
  }

  Future<void> loadLocale() async {
    locale.value = await TokenKey.getValue('selectedLanguage') ?? ' ';
    productCategory();
  }

  Future<void> updateLocale(String newLocale) async {
    locale.value = newLocale;
    await TokenKey.saveValue('selectedLanguage', newLocale);
    productCategory();
  }

  Future<void> productCategory() async {
    isLoading(true);
    try {
      final token = await TokenKey.getValue('token');
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
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print('jsonResponse is==== $jsonResponse');
        product.value = jsonResponse['data'];
        print('product is ##### $product');
      } else {
        final jsonResponse = jsonDecode(response.body);
        Get.snackbar('Error', jsonResponse['error']['message']);
      }
    } catch (e) {
      errorMessage.value = 'Error: ${e.toString()}';
    } finally {
      isLoading(false);
    }
  }
}




