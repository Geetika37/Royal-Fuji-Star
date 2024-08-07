import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/auth/forgotpassword/view/forgotpassword.dart';
import 'package:royal_fuji_star/screens/auth/login/controllers/login_controller.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/textformfield.dart';
import 'package:royal_fuji_star/utils/validators.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({
    super.key,
    required this.onTap,
  });
  final Function() onTap;

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // final _emailRegex =
  //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  // final _phoneRegex = r'^\d{10}$';
  final LoginController loginController = Get.put(LoginController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.1),
                  Textformfield(
                    validator: Validators.validateEmail,
                    controller: emailController,
                    textfieldWidth: screenWidth * 0.8,
                    hintText: 'email'.tr,
                    hintTextSize: 15,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  // TextformfieldWithIcons(
                  //   textfieldWidth: screenWidth * 0.8,
                  //   hintText: 'password'.tr,
                  //   suffixIcon: Image.asset('assets/png/eye.png'),
                  //   controller: passwordController,
                  // ),
                  TextformfieldPass(
                    validator: Validators.validatePassword,
                    textfieldWidth: screenWidth * 0.8,
                    hintText: 'password'.tr,
                    hintTextSize: 14,
                    controller: passwordController,
                    obscureText: true,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Align(
                    alignment: Alignment.topLeft * 0.8,
                    child: InkWell(
                      onTap: () {
                        Get.to(const Forgotpassword());
                      },
                      child: Text(
                        'forgot_password'.tr,
                        style:
                            poppins(Appcolor.buttonColor, 13, FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),

                  Obx(
                    () => BlueButtonn(
                      color: Appcolor.buttonColor,
                      height: screenHeight * 0.07,
                      width: screenWidth * 0.8,
                      circularRadius: 10,
                      text: loginController.isLoading.value
                          ? LoadingAnimationWidget.prograssiveDots(
                              size: 35,
                              color: Appcolor.white,
                            )
                          : Text(
                              'login'.tr,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Appcolor.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                      onTap: () async {
                        HapticFeedback.mediumImpact();
                        if (_validateForm()) {
                          await loginController.login(
                            emailController.text,
                            passwordController.text,
                          );
                        }
                      },
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: SizedBox(
            width: screenWidth,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'account_no'.tr,
                  style: poppins(
                    const Color.fromARGB(255, 163, 162, 162),
                    13,
                    FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.01,
                ),
                InkWell(
                  onTap: widget.onTap,
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
            ),
          ),
        )
      ],
    );
  }

  bool _validateForm() {
    return formKey.currentState!.validate();
  }

  // String? _emailMobileValidation(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Email or Phone cannot be empty';
  //   }
  //   if (!RegExp(_emailRegex).hasMatch(value) &&
  //       !RegExp(_phoneRegex).hasMatch(value)) {
  //     return 'Please enter valid Email or Phone';
  //   }
  //   return null;
  // }
}
