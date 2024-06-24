import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/login/controllers/login_controller.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/textformfield.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({
    super.key,
    required this.onTap,
  });
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

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
                SizedBox(height: screenHeight * 0.1),
                Textformfield(
                  controller: emailController,
                  textfieldWidth: screenWidth * 0.8,
                  hintText: 'phone_email'.tr,
                  hintTextSize: 15,
                ),
                SizedBox(height: screenHeight * 0.03),
                TextformfieldWithIcons(
                  textfieldWidth: screenWidth * 0.8,
                  hintText: 'password'.tr,
                  suffixIcon: Image.asset('assets/png/eye.png'),
                  controller: passwordController,
                ),
                SizedBox(height: screenHeight * 0.01),
                Align(
                  alignment: Alignment.topLeft * 0.8,
                  child: Text(
                    'forgot_password'.tr,
                    style: poppins(Appcolor.buttonColor, 13, FontWeight.w500),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                Obx(() => loginController.isLoading.value
                    ? Center(
                        child: LoadingAnimationWidget.prograssiveDots(
                          size: 50,
                          color: Appcolor.black,
                        ),
                      )
                    : BlueButton(
                        fontSize: 14,
                        textColor: Appcolor.white,
                        color: Appcolor.buttonColor,
                        height: screenHeight * 0.07,
                        width: screenWidth * 0.8,
                        circularRadius: 10,
                        text: 'login'.tr,
                        onTap: () {
                          loginController.login(
                            emailController.text,
                            passwordController.text,
                          );
                        },
                      )),
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
                      'account_no'.tr,
                      style: poppins(const Color.fromARGB(255, 163, 162, 162),
                          13, FontWeight.w400),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    InkWell(
                      onTap: onTap,
                      child: Text(
                        'sign_up'.tr,
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
