// import 'package:get/get.dart';
// import 'package:royal_fuji_star/screens/home/widgets/bottomnav.dart';
// import 'package:royal_fuji_star/screens/splash/views/screens/getstarted.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Splashcontroller extends GetxController {
//   @override
//   void onInit() {
//     navigateToLogin();
//     super.onInit();
//   }

//   Future navigateToLogin() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     final value = prefs.getString('token');

//     await Future.delayed(const Duration(seconds: 2));

//     if (value == null) {
//       Get.to(() => const GetStarted());
//     } else {
//       Get.to(const Bottomnav());
//     }
//   }
// }

import 'dart:ui';
import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/home/controller/productcategory_controller.dart';
import 'package:royal_fuji_star/screens/home/widgets/bottomnav.dart';
import 'package:royal_fuji_star/screens/splash/views/screens/getstarted.dart';
import 'package:royal_fuji_star/services/token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashcontroller extends GetxController {
  final ProductCategoryController productCategoryController =
      Get.put(ProductCategoryController());
      
  @override
  void onInit() {
    super.onInit();
    navigateToLogin();
  }

  Future<void> navigateToLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final String? selectedLanguage = prefs.getString('selectedLanguage');

    print('selectedlang-------:=$selectedLanguage');

    await Future.delayed(const Duration(seconds: 2));

    if (token == null) {
      Get.off(() => const GetStarted());
    } else {
      if (selectedLanguage != null) {
        await TokenKey.saveValue('selectedLanguage', selectedLanguage);
        final Locale locale = selectedLanguage == 'en-US'
            ? const Locale('en', 'US')
            : const Locale('ar', 'AE');
        Get.updateLocale(locale);
        productCategoryController.loadLocale();
      }
      Get.off(() => const Bottomnav());
    }
  }
}
