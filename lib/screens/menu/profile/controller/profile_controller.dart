import 'dart:convert';

import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/menu/profile/views/profile.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/services/token.dart';
import 'package:royal_fuji_star/services/token_expire.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var profileData = {}.obs;

  Future<void> profileDetails() async {
    final token = await TokenKey.getValue('token');
    isLoading(true);
    try {
      final url = Uri.parse('${APIConstants.baseUrl}/api/users/me');
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
        Get.to(const ProfilePage());
        profileData.value = jsonResponse;
        print('response------$jsonResponse');
      }
      else if (response.statusCode == 401) {
        TokenExpire.handleTokenExpiration();
      }
       else {
        errorMessage.value = 'error---${jsonResponse['error']['message']}';
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  void updateProfileData({
    required String username,
    required String email,
    required String phone,
    required String location,
  }) {
    profileData['username'] = username;
    profileData['email'] = email;
    profileData['phone'] = phone;
    profileData['location'] = location;
  }
}
