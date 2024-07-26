import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/auth/signup/controller/signup_controller.dart';
import 'package:royal_fuji_star/screens/auth/signup/widgets/number_input.dart';
import 'package:royal_fuji_star/screens/auth/signup/widgets/richtext.dart';
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
  final TextEditingController locationController = TextEditingController();

  // final TextEditingController phoneController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: screenHeight * 0.65,
      width: screenWidth,
      decoration: const BoxDecoration(
        color: Appcolor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.06),
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
              // SizedBox(height: screenHeight * 0.02),
              // TextformfieldWithoutValidation(
              //   controller: phoneController,
              //   textfieldWidth: screenWidth * 0.8,
              //   hintText: 'phone'.tr,
              //   hintTextSize: 15,
              // ),
              SizedBox(height: screenHeight * 0.02),
              NumberInput(
                countryCodeController: countryCodeController,
                phoneController: phoneController,
              ),
              SizedBox(height: screenHeight * 0.02),
              Textformfield(
                controller: locationController,
                textfieldWidth: screenWidth * 0.8,
                hintText: 'location'.tr,
                hintTextSize: 15,
                validator: Validators.validateLocation,
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
              Obx(
                () => BlueButtonn(
                  color: Appcolor.buttonColor,
                  height: screenHeight * 0.07,
                  width: screenWidth * 0.8,
                  circularRadius: 10,
                  text: signupController.isLoading.value
                      ? LoadingAnimationWidget.prograssiveDots(
                          size: 35,
                          color: Appcolor.white,
                        )
                      : Text(
                          'sign_up'.tr,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Appcolor.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                  onTap: () async {
                    HapticFeedback.mediumImpact();
                    if (_validateForm()) {
                      signupController.signUp(
                        nameController.text,
                        countryCodeController.text,
                        phoneController.text,
                        emailController.text,
                        passwordController.text,
                        locationController.text,
                      );
                    }
                  },
                  fontSize: 14,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              const RichTextSignUp(),
              SizedBox(height: screenHeight * 0.02),
              Row(
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
              SizedBox(height: screenHeight * 0.002),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateForm() {
    return formKey.currentState!.validate();
  }
}
