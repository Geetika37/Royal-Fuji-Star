import 'dart:convert';

import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/menu/history/model/history_model.dart';
import 'package:royal_fuji_star/screens/menu/history/views/history.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:royal_fuji_star/services/token.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/services/token_expire.dart';

class HistoryController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  var advisory = <Advisory>[].obs;
  var annualMaintenance = <AnnualMaintanence>[].obs;
  var productEnquiry = <ProductEnquiry>[].obs;
  var repair = <Repair>[].obs;
  var spareEnquiry = <SpareEnquiry>[].obs;
  var spareNotFound = <SpareNotFound>[].obs;

  Future<void> fetchHistory() async {
    isLoading(true);
    try {
      final token = await TokenKey.getValue('token');
      final url = Uri.parse('${APIConstants.baseUrl}/api/records');
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var historyDetails =
            HistoryResponse.fromJson(json.decode(response.body));
        advisory.value = historyDetails.data.advisories;
        annualMaintenance.value = historyDetails.data.annualMaintanences;
        productEnquiry.value = historyDetails.data.productEnquiries;
        repair.value = historyDetails.data.repairs;
        spareEnquiry.value = historyDetails.data.spareEnquiries;
        spareNotFound.value = historyDetails.data.spareNotFounds;
        Get.to(() => const HistoryPage());
        print('response.statusCode---${response.statusCode}');
      } else if (response.statusCode == 401) {
        print('response.statusCode---${response.statusCode}');
        TokenExpire.handleTokenExpiration();
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
