import 'dart:convert';

import 'package:get/get.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/services/token.dart';

// class SparecategoryController extends GetxController {
//   var isLoading = false.obs;
//   // var sparecategory = [].obs;
//   var sparecategory = Rxn<Data>();

//   var errorMessage = ''.obs;
//   var locale = 'en'.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     loadLocale();
//   }

//   Future<void> loadLocale() async {
//     try {
//       locale.value = await TokenKey.getValue('selectedLanguage') ?? 'en';
//       // print('locale: ---- ${locale.value}');
//     } catch (e) {
//       errorMessage.value = 'Error loading locale: ${e.toString()}';
//     } finally {
//       await spareCategory();
//     }
//   }

//   Future<void> spareCategory() async {
//     isLoading(true);
//     final token = await TokenKey.getValue('token');
//     try {
//       final url = Uri.parse(
//           '${APIConstants.baseUrl}/api/spare-categories?locale=${locale.value}');
//       final response = await http.get(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//       );

//       final jsonResponse = jsonDecode(response.body);

//       if (response.statusCode == 200) {
//         // print('jsonnrespon------->$jsonResponse');
//         sparecategory.value = jsonResponse['data'];
//         // print('spare category----====>$sparecategory');

//       } else {
//         print('error message --->${jsonResponse['error']['message']}');
//       }
//     } catch (e) {
//       print('error---${e.toString()}');
//     } finally {
//       isLoading(false);
//     }
//   }
// }

class SparecategoryController extends GetxController {
  var isLoading = false.obs;
  var sparecategory = <dynamic>[].obs; // Initialize as an empty list

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
      await spareCategory();
    }
  }

  Future<void> spareCategory() async {
    isLoading(true);
    final token = await TokenKey.getValue('token');
    try {
      print('local value--->${locale.value}');
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
        sparecategory.value = jsonResponse['data'];
        // print('sparecategory vale===$sparecategory');
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
