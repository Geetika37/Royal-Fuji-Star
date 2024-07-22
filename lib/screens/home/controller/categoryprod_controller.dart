import 'dart:convert';
import 'package:get/get.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:royal_fuji_star/services/token.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/services/token_expire.dart';

class CategoryProductController extends GetxController {
  var isLoading = false.obs;
  var product = <dynamic>[].obs;
  var errorMessage = ''.obs;

  Future<void> categoryProduct(int id) async {
    isLoading(true);
    errorMessage.value = ''; // Clear previous error message
    product.clear(); // Clear previous data

    try {
      final token = await TokenKey.getValue('token');
      final url = Uri.parse(
          '${APIConstants.baseUrl}/api/products-find-category-products/$id?&title=desc');
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
      } 
      else if (response.statusCode == 401) {
        TokenExpire.handleTokenExpiration();
      }
      else {
        errorMessage.value = 'Error: ${jsonResponse['error']['message']}';
      }
    } catch (e) {
      errorMessage.value = 'Error: ${e.toString()}';
    } finally {
      isLoading(false);
    }
  }
}

// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:royal_fuji_star/services/api_baseurl.dart';
// import 'package:royal_fuji_star/services/token.dart';
// import 'package:http/http.dart' as http;

// class CategoryProductController extends GetxController {
//   var isLoading = false.obs;
//   var product = <dynamic>[].obs;
//   var errorMessage = ''.obs;

//   Future<void> categoryProduct(int id) async {
//     isLoading(true);
//     try {
//       final token = await TokenKey.getValue('token');
//       final url = Uri.parse(
//           '${APIConstants.baseUrl}/api/products-find-category-products/$id?&title=desc');
//       final response = await http.get(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//       );

//       final jsonResponse = jsonDecode(response.body);
//       // print('jsonResponse is ******* :$jsonResponse');

//       if (response.statusCode == 200) {
//         if (jsonResponse['data'] != null) {
//           product.value = jsonResponse['data'];
//           // print('product ###----$product');
//           // print(response.statusCode);
//         } else {
//           errorMessage.value = 'Error: No data in response';
//         }
//       } else {
//         print(response.statusCode);

//         errorMessage.value = 'Error: ${jsonResponse['error']['message']}';
//       }
//     } catch (e) {
//       print(e);
//     } finally {
//       isLoading(false);
//     }
//   }
// }



