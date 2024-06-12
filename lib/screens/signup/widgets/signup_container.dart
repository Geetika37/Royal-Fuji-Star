import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/textformfield.dart';

class SignupContainer extends StatelessWidget {
  const SignupContainer({
    super.key,
    required this.onTap,
  });
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: screenHeight * 0.65,
          width: screenWidth,
          decoration: const BoxDecoration(
              color: Appcolor.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45), topRight: Radius.circular(45))),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.05),
                Textformfield(
                  textfieldWidth: screenWidth * 0.8,
                  hintText: 'full_name'.tr,
                  hintTextSize: 15,
                ),
                SizedBox(height: screenHeight * 0.03),
                Textformfield(
                  textfieldWidth: screenWidth * 0.8,
                  hintText: 'phone_email'.tr,
                  hintTextSize: 15,
                ),
                SizedBox(height: screenHeight * 0.03),
                TextformfieldWithIcons(
                  textfieldWidth: screenWidth * 0.8,
                  hintText: 'password'.tr,
                  suffixIcon: Image.asset('assets/png/eye.png'),
                ),
                SizedBox(height: screenHeight * 0.04),
                BlueButton(
                    fontSize: 14,
                    textColor: Appcolor.white,
                    color: Appcolor.buttonColor,
                    height: screenHeight * 0.07,
                    width: screenWidth * 0.8,
                    circularRadius: 10,
                    text: 'sign_up'.tr,
                    onTap: () {}),
                SizedBox(height: screenHeight * 0.01),
                SizedBox(
                  width: screenWidth * 0.5,
                  child: Text(
                    'policy_terms'.tr,
                    maxLines: 2,
                    style: poppins(Appcolor.buttonColor, 10, FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            child: Padding(
                padding: const EdgeInsets.only(right: 100, left: 100),
                child: Row(
                  children: [
                    Text(
                      'already_account'.tr,
                      style: poppins(const Color.fromARGB(255, 163, 162, 162),
                          13, FontWeight.w400),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    InkWell(
                      onTap: onTap,
                      child: Text(
                        'login'.tr,
                        style: const TextStyle(
                          color: Appcolor.buttonColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                )))
      ],
    );
  }
}
