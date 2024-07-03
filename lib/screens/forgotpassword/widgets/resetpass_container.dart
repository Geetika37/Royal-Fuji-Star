import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/forgotpassword/controller/resetpass_controller.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/textformfield.dart';

class ResetpassContainer extends StatelessWidget {
  const ResetpassContainer({super.key, required this.otp});

  final String otp;

  @override
  Widget build(BuildContext context) {
    final ResetpassController resetpassController =
        Get.put(ResetpassController());
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Container(
      height: screenHeight * 0.65,
      width: screenWidth,
      decoration: const BoxDecoration(
        color: Appcolor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.1),
            TextformfieldPass(
              textfieldWidth: screenWidth * 0.8,
              hintText: 'Password',
              hintTextSize: 14,
              controller: passwordController,
              obscureText: true,
            ),
            SizedBox(height: screenHeight * 0.02),
            TextformfieldPass(
              textfieldWidth: screenWidth * 0.8,
              hintText: 'Confirm Password',
              hintTextSize: 14,
              controller: confirmPasswordController,
              obscureText: true,
            ),
            SizedBox(height: screenHeight * 0.03),
            BlueButton(
              height: screenHeight * 0.07,
              width: screenWidth * 0.8,
              circularRadius: 10,
              text: 'Submit',
              onTap: () async {
                await resetpassController.resetPassword(passwordController.text,
                    confirmPasswordController.text, otp);
              },
              color: Appcolor.buttonColor,
              textColor: Appcolor.white,
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}
