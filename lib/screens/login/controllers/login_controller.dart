import 'dart:convert';

import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/home/widgets/bottomnav.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/services/token.dart';


class LoginController extends GetxController {
  var isLoading = false.obs;

  Future<void> login(String identifier, String password) async {
    isLoading(true);
    try {
      final url = Uri.parse('${APIConstants.baseUrl}/api/auth/local');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'identifier': identifier,
          'password': password,
        }),
      );
      final jsonResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final token = jsonResponse['data']['jwt'];
        print('Token received: $token');
        await TokenKey.saveValue('token', token); 
        Get.to(const Bottomnav());
      } else {
        Get.snackbar('Error', jsonResponse['error']['message']);
      }
    } catch (e) {
      print('Error: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }
}




