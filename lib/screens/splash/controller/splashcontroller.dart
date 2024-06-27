import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/home/widgets/bottomnav.dart';
import 'package:royal_fuji_star/screens/splash/views/screens/getstarted.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashcontroller extends GetxController {
  @override
  void onInit() {
    navigateToLogin();
    super.onInit();
  }

  Future navigateToLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final value = prefs.getString('token');

    await Future.delayed(const Duration(seconds: 2));

    if (value == null) {
      Get.to(() => const GetStarted());
    } else {
      Get.to(const Bottomnav());
    }
  }
}
