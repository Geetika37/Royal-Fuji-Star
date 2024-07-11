import 'dart:convert';
import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/home/models/oneproduct_model.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:royal_fuji_star/services/token.dart';
import 'package:http/http.dart' as http;

class OneProductController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var selectedIndex = (-1).obs;
  var product = Rxn<Product>(); // Using Rxn for nullable reactive variables

  Future<void> fetchProduct(int id) async {
    isLoading.value = true; // Update isLoading using .value
    try {
      final token = await TokenKey.getValue('token');
      final url = Uri.parse('${APIConstants.baseUrl}/api/products/$id');

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
        print('JSON Response: $jsonResponse');

        if (jsonResponse['success']) {
          try {
            final productData = Product.fromJson(jsonResponse);
            product.value = productData;
            print('Product Data: $productData');
          } catch (e) {
            print('Parsing Error: $e');
            errorMessage.value = 'Error parsing product data: ${e.toString()}';
          }
        } else {
          errorMessage.value = 'Error: ${jsonResponse['message']}';
        }
      } else {
        final jsonResponse = jsonDecode(response.body);
        errorMessage.value = 'Error: ${jsonResponse['error']['message']}';
        print('Error Message: ${errorMessage.value}');
      }
    } catch (e) {
      errorMessage.value = 'Error: ${e.toString()}';
      print('Error Message: ${errorMessage.value}');
    } finally {
      isLoading.value = false;
    }
  }
}




// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:royal_fuji_star/screens/home/models/oneproduct_model.dart';
// import 'package:http/http.dart' as http;


// class ProductController extends GetxController {
//   var isLoading = true.obs;
//   Product product = Product(
//     id: 0,
//     name: '',
//     description: '',
//     createdAt: DateTime.now(),
//     updatedAt: DateTime.now(),
//     publishedAt: DateTime.now(),
//     locale: '',
//     productCategory: ProductCategory(id: 0, name: ''),
//     mainImage: ProductImage(id: 0, url: ''),
//     components: [],
//   );

//   @override
//   void onInit() {
//     super.onInit();
//     fetchProduct();
//   }

//   void fetchProduct() async {
//     try {
//       isLoading(true);
//       var response = await http.get(
//         Uri.parse('https://royalfuji.jissanto.com/api/products/1'),
//         headers: {
//           'Authorization':
//               'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsImlhdCI6MTcxOTIxNTE4NiwiZXhwIjoxNzIxODA3MTg2fQ.7yl9f4cYN5SXR6P0KZ9Y8_ETncM1hd9C5Z3i6bYDWJw',
//         },
//       );

//       if (response.statusCode == 200) {
//         var jsonResponse = json.decode(response.body);
//         product = Product.fromJson(jsonResponse['data']);

//         print('Product fetched successfully: $product');
//       } else {
//         print('Failed to load product');
//       }
//     } catch (e) {
//       print('Error--->${e.toString()}');
//       // NotificationHelper.showErrorMessage(
//       //   Get.context!,
//       //   'Error: $e',
//       // );

//       print('Error: $e');
//     } finally {
//       isLoading(false);
//     }
//   }
// }