import 'dart:convert';

import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/menu/profile/controller/profile_controller.dart';
import 'package:royal_fuji_star/screens/menu/profile/widgets/bottomsheet.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/services/token.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class EditprofileController extends GetxController {
  var isLoading = false.obs;

  Future<void> editProfile(
      String username, String email, String phone, String location) async {
    isLoading(true);
    final token = await TokenKey.getValue('token');

    try {
      final url = Uri.parse('${APIConstants.baseUrl}/api/auth/changeProfile');
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          "username": username,
          "email": email,
          "phone": phone,
          "location": location,
        }),
      );
      final jsonResponse = jsonDecode(response.body);
      print('jsonresponse=====###===$jsonResponse');
      if (response.statusCode == 200) {
        Get.find<ProfileController>().updateProfileData(
          username: username,
          email: email,
          phone: phone,
          location: location,
        );
        Get.bottomSheet(
          backgroundColor: Appcolor.bgColor,
          const Bottomsheet(),
        );
      } else {
        Get.snackbar('success', jsonResponse['error']['message']);
      }
    } catch (e) {
      print(e);
    }
  }
}
