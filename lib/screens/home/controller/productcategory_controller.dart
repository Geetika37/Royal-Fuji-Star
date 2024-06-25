import 'dart:convert';
import 'package:get/get.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/services/token.dart';

class ProductCategoryController extends GetxController {
  var isLoading = false.obs;
  var product = <dynamic>[].obs;
  var errorMessage = ''.obs;

  Future<void> productCategory() async {
    isLoading(true);
    try {
      final token = await TokenKey.getValue('token');
      final url =
          Uri.parse('${APIConstants.baseUrl}/api/product-categories?locale=');
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      final jsonResponse = jsonDecode(response.body);
      print('jsonResponse is==== $jsonResponse');
      if (response.statusCode == 200) {
        product.value = jsonResponse['data'];
        print('product  is ##### $product');
      } else {
        Get.snackbar('Error', jsonResponse['error']['message']) ;
      }
    } catch (e) {
      errorMessage.value = 'Error: ${e.toString()}';
    } finally {
      isLoading(false);
    }
  }
}
