import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/signup/controller/signup_controller.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/textformfield.dart';
import 'package:royal_fuji_star/utils/validators.dart';

class SignupContainer extends StatefulWidget {
  const SignupContainer({
    super.key,
    required this.onTap,
  });
  final Function() onTap;

  @override
  State<SignupContainer> createState() => _SignupContainerState();
}

class _SignupContainerState extends State<SignupContainer> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final SignupController signupController = Get.put(SignupController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              topLeft: Radius.circular(45),
              topRight: Radius.circular(45),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  Textformfield(
                    controller: nameController,
                    textfieldWidth: screenWidth * 0.8,
                    hintText: 'full_name'.tr,
                    hintTextSize: 15,
                    validator: Validators.validateName,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Textformfield(
                    controller: emailController,
                    textfieldWidth: screenWidth * 0.8,
                    hintText: 'email'.tr,
                    hintTextSize: 15,
                    validator: Validators.validateEmail,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextformfieldWithoutValidation(
                    controller: phoneController,
                    textfieldWidth: screenWidth * 0.8,
                    hintText: 'phone'.tr,
                    hintTextSize: 15,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextformfieldPass(
                    controller: passwordController,
                    textfieldWidth: screenWidth * 0.8,
                    hintText: 'password'.tr,
                    hintTextSize: 14,
                    obscureText: true,
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
                    onTap: () {
                      if (_validateForm()) {
                        signupController.signUp(
                          nameController.text,
                          phoneController.text,
                          emailController.text,
                          passwordController.text,
                        );
                      }
                    },
                  ),
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
                  'already_account'.tr,
                  style: poppins(
                    const Color.fromARGB(255, 163, 162, 162),
                    13,
                    FontWeight.w400,
                  ),
                ),
                SizedBox(width: screenWidth * 0.01),
                InkWell(
                  onTap: widget.onTap,
                  child: Text(
                    'login'.tr,
                    style: const TextStyle(
                      color: Appcolor.buttonColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
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
}
