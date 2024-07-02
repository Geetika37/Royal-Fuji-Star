import 'dart:convert';
import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/login/views/loginscreen.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/services/token.dart';

class ChangePasswordController extends GetxController {
  var isLoading = false.obs;
  var successMessage = ''.obs;
  var errorMessage = ''.obs;

  Future<void> changePassword(
      String currentPassword, String password, String confirmPassword) async {
    isLoading(true);
    final token = await TokenKey.getValue('token');
    try {
      final url = Uri.parse('${APIConstants.baseUrl}/api/auth/change-password');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          "currentPassword": currentPassword,
          "password": password,
          "passwordConfirm": confirmPassword,
        }),
      );

      final jsonResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Get.to(const LoginScreen());
        successMessage.value =
            'Successfully changed password--${jsonResponse['success']}';
        print(successMessage);
      } else {
        errorMessage.value = 'Error---${jsonResponse['error']['message']}';
        Get.snackbar('Error', errorMessage.value);

        print(errorMessage);
      }
    } catch (e) {
      errorMessage.value = 'Error Message ${e.toString()}';
    } finally {
      isLoading(false);
    }
  }
}
