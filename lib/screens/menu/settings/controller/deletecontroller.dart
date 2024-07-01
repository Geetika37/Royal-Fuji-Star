import 'dart:convert';

import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/splash/views/screens/getstarted.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/services/token.dart';

class Deletecontroller extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> deleteAccount() async {
    isLoading(true);
    try {
      final token = await TokenKey.getValue('token');
      final url = Uri.parse('${APIConstants.baseUrl}/api/auth/deleteAccount');
      final response = await http.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      final jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('jsresponse=====$jsonResponse');
        await TokenKey.clearValue('token');
        await TokenKey.clearValue('selectedLanguage');
        Get.to(const GetStarted());
      } else {
        errorMessage.value = 'error-${jsonResponse['error']['message']}';
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
