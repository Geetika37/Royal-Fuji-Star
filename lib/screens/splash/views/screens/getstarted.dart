import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:royal_fuji_star/screens/splash/views/screens/language_select.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: screenHeight * 0.8,
                  width: screenWidth,
                  child: Image.asset(
                    'assets/png/getstartedbg1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 60, right: 60, top: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          child: Image.asset(
                            'assets/png/royallogo.png',
                            height: screenHeight * 0.18,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          'started'.tr,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 9,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            BlueButton(
              fontSize: 14,
              textColor: Appcolor.white,
              color: Appcolor.buttonColor,
              height: screenHeight * 0.07,
              width: screenWidth * 0.7,
              circularRadius: 10,
              text: 'get_button'.tr,
              onTap: () {
                HapticFeedback.mediumImpact();
                Get.to(LanguageSelect());
              },
            ),
          ],
        ),
      ),
    );
  }
}
