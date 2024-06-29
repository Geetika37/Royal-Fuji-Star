import 'dart:convert';
import 'package:get/get.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/services/token.dart';

// class ProductCategoryController extends GetxController {
//   var isLoading = false.obs;
//   var product = <dynamic>[].obs;
//   var errorMessage = ''.obs;
//   var locale = 'en'.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     loadLocale();
//   }

//   Future<void> loadLocale() async {
//     try {
//       final savedLocale = await TokenKey.getValue('selectedLanguage');
//       locale.value = savedLocale ?? 'en';
//       print('Loaded locale: ${locale.value}');
//       productCategory();
//     } catch (e) {
//       print('Error loading locale: $e');
//     }
//   }

//   Future<void> updateLocale(String newLocale) async {
//     try {
//       locale.value = newLocale;
//       await TokenKey.saveValue('selectedLanguage', newLocale);
//       print('Updated locale: ${locale.value}');
//       productCategory();
//     } catch (e) {
//       print('Error updating locale: $e');
//     }
//   }

//   Future<void> productCategory() async {
//     isLoading(true);
//     try {
//       final token = await TokenKey.getValue('token');
//       if (token == null) {
//         errorMessage.value = 'Token is missing';
//         Get.snackbar('Error', 'Token is missing');
//         isLoading(false);
//         return;
//       }

//       print('Using token: $token');

//       final url = Uri.parse(
//           '${APIConstants.baseUrl}/api/product-categories?locale=${locale.value}');
//       print('Requesting URL: $url');

//       final response = await http.get(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//       );

//       print('Response Status Code: ${response.statusCode}');
//       print('Response Body: ${response.body}');

//       if (response.statusCode == 200) {
//         final jsonResponse = jsonDecode(response.body);
//         product.value = jsonResponse['data'];
//         print('Product categories: $product');
//       } else {
//         final jsonResponse = jsonDecode(response.body);
//         final error = jsonResponse['error']['message'] ?? 'Unknown error';
//         errorMessage.value = error;
//         Get.snackbar('Error', error);
//       }
//     } catch (e) {
//       errorMessage.value = 'Error: ${e.toString()}';
//       Get.snackbar('Error', 'Failed to fetch product categories');
//     } finally {
//       isLoading(false);
//     }
//   }
// }

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

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse['data'] != null) {
          product.value = jsonResponse['data'];
        } else {
          errorMessage.value = 'Error: No data in response';
        }
      } else {
        final jsonResponse = jsonDecode(response.body);
        errorMessage.value = 'Error: ${jsonResponse['error']['message']}';
      }
    } catch (e) {
      errorMessage.value = 'Error: ${e.toString()}';
    } finally {
      isLoading(false);
    }
  }
}


