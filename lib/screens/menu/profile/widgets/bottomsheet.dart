import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';

class Bottomsheet extends StatelessWidget {
  const Bottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      height: screenHeight * 0.4,
      child: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Column(
          children: [
            SvgPicture.asset('assets/svg/bottomsheet1.svg'),
            SizedBox(height: screenHeight * 0.04),
            Text('Profile Updated Successfully',
                style: poppins(Appcolor.black, 18, FontWeight.w600)),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Your profile details have been saved.',
              style: poppins(const Color.fromARGB(255, 101, 101, 101), 11,
                  FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            Text(
              'Keep exploring the app to enjoy a personalized experience',
              style: poppins(
                  const Color.fromARGB(255, 71, 71, 71), 11, FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.04),
            BlueButton(
                height: screenHeight * 0.05,
                width: screenWidth * 0.4,
                circularRadius: 20,
                text: 'Continue',
                onTap: () {
                  Get.back();
                  Get.back();
                },
                color: Appcolor.buttonColor)
          ],
        ),
      ),
    );
  }
}
