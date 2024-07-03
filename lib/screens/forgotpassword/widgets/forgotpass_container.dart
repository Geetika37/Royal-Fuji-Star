import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/forgotpassword/controller/forgotpass_controller.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';

class ForgotpassContainer extends StatelessWidget {
  const ForgotpassContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotpassController forgotpassController =
        Get.put(ForgotpassController());
    TextEditingController emailController = TextEditingController();
    return Container(
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
            SizedBox(height: screenHeight * 0.1),
            // Textformfield(
            //   textfieldWidth: screenWidth * 0.8,
            //   hintText: 'Email',
            //   hintTextSize: 15,
            //   controller: emailController,
            // ),
            SizedBox(height: screenHeight * 0.05),
            BlueButton(
              height: screenHeight * 0.07,
              width: screenWidth * 0.8,
              circularRadius: 10,
              text: 'Submit',
              onTap: () {
                forgotpassController.forgotPass(emailController.text);
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
