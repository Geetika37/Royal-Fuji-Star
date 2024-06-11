import 'package:flutter/material.dart';
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
                  width: screenWidth,
                  child: Image.asset(
                    'assets/png/getstarted.png',
                    height: screenHeight * 0.8,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/png/logo.png',
                          height: screenHeight * 0.2,
                        ),
                        Text(
                          'Discover how our Elevator Services at Royal Fuji Elevator Company in the UAE can contribute to the enduring performance of your elevators with meticulous installations and comprehensive Annual Maintenance Contracts prioritizingsafety and durability.',
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
              textColor: Appcolor.white,
              color: Appcolor.buttonColor,
              height: screenHeight * 0.07,
              width: screenWidth * 0.7,
              circularRadius: 10,
              text: 'Get Started',
              onTap: () {
                Get.to(const LanguageSelect());
              },
            ),
          ],
        ),
      ),
    );
  }
}
