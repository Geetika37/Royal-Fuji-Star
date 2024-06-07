import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/splash/views/screens/getstarted.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: screenWidth,
              child: Image.asset(
                'assets/png/splashbg.png',
                height: screenHeight * 0.73,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Image.asset('assets/png/logo.png'),
            Text(
              'رويال فوجي ستار للمصاعد والسلالم المتحركة ذ.م.م',
              style: poppins(Colors.black, 14, FontWeight.w700),
            ),
            Text(
              'ROYAL FUJI STAR ELEVATOR AND ESCALATOR',
              style: poppins(Colors.black, 14, FontWeight.w700),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.small(
          onPressed: () {
            Get.to(const GetStarted());
          },
          child: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
        ),
      ),
    );
  }
}
