import 'dart:convert';

import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/home/models/carousel_model.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:royal_fuji_star/services/token.dart';

class CarouselSliderController extends GetxController {
  var isLoading = false.obs;
  var carouselImage = Rxn<CarouselSliderModel>();
  var errorMessage = ''.obs;
  var locale = 'en'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCarouselImage();
    loadLocale();
  }

  Future<void> loadLocale() async {
    try {
      locale.value = await TokenKey.getValue('selectedLanguage') ?? 'en';
      // print('Locale: ${locale.value}');
    } catch (e) {
      errorMessage.value = 'Error loading locale: ${e.toString()}';
    } finally {
      await fetchCarouselImage();
    }
  }

  Future<void> fetchCarouselImage() async {
    isLoading(true);

    try {
      final url = Uri.parse(
          '${APIConstants.baseUrl}/api/home-page?locale=${locale.value}');

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer c35abca4b93af8c66574ff6237d42864eae839e26eb6db9766635983bca5f0ac361a512c201c4962873fad07d1c710a4ca6cfa2dff2ffb1bc0cce41375585a897871b0f6310466c8292bdcfd9e71cd4365b545580d6f05d7718a0f7d7f59ad5cfb39a39bf2ed20768fe1c5795c45757ba9667a41343dbe8b32969cca59b69261',
        },
      );

      final jsonResponse = jsonDecode(response.body);
      // print('JSON Response: $jsonResponse');

      if (response.statusCode == 200) {
        final imageData = CarouselSliderModel.fromJson(jsonResponse);
        carouselImage.value = imageData;
        print('status code--${response.statusCode}');
      } else {
        errorMessage.value = 'Error: ${jsonResponse['error']['message']}';
        print('Status Code: ${response.statusCode}');
        print('JSON Response: $jsonResponse');
      }
    } catch (e) {
      errorMessage.value = 'Error: ${e.toString()}';
      // print('Error Message: ${errorMessage.value}');
    } finally {
      isLoading.value = false;
    }
  }
}
