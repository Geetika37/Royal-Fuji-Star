import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/splash/views/screens/getstarted.dart';

class Splashcontroller extends GetxController
{
  @override
  void onReady() {
    navigateToLogin();
    super.onReady();
  }
  Future navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAll(() => const GetStarted());
  }
}