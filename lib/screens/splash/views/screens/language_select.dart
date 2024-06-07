import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/splash/views/screens/joinus.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';

class LanguageSelect extends StatelessWidget {
  const LanguageSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Royal Fuji Star',
              style: poppins(Appcolor.buttonColor, 20, FontWeight.w700),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Text(
              'Choose your language',
              style: poppins(
                Appcolor.buttonColor,
                15,
                FontWeight.w500,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            BlueButtonWithIcon(
              height: screenHeight * 0.06,
              width: screenWidth * 0.45,
              circularRadius: 10,
              text: 'English',
              onTap: () {},
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            OutlineBlueButtonWithIcon(
              height: screenHeight * 0.06,
              width: screenWidth * 0.45,
              circularRadius: 10,
              text: 'عربي',
              onTap: () {},
            ),
            SizedBox(
              height: screenHeight * 0.07,
            ),
            SizedBox(
              width: screenWidth * 0.5,
              child: Text(
                'Your language preference can be changed at any time in settings',
                maxLines: 2,
                style: poppins(Appcolor.black, 10, FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.23,
            ),
            BlueButton(
              height: screenHeight * 0.07,
              width: screenWidth * 0.7,
              circularRadius: 10,
              text: 'Continue',
              onTap: () {
                Get.to(const JoinUs());
              },
            )
          ],
        ),
      ),
    ));
  }
}
