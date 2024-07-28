import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/menu/settings/controller/changepassword_controller.dart';
import 'package:royal_fuji_star/screens/widgets/customappbar.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/textformfield.dart';
import 'package:royal_fuji_star/utils/validators.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final ChangePasswordController changePasswordController =
      Get.put(ChangePasswordController());

  TextEditingController currentPassController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: 'Settingstitle7'.tr,
            titleSpacing: screenWidth * 0.2,
          ),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: screenHeight * 0.03,
            ),
            children: [
              TextformfieldPass(
                validator: Validators.validatePassword,
                textfieldWidth: screenWidth,
                hintText: 'changepassword1'.tr,
                hintTextSize: 14,
                controller: currentPassController,
                obscureText: true,
              ),
              SizedBox(height: screenHeight * 0.03),
              TextformfieldPass(
                validator: Validators.validatePassword,
                textfieldWidth: screenWidth,
                hintText: 'password'.tr,
                hintTextSize: 14,
                controller: passwordController,
                obscureText: true,
              ),
              SizedBox(height: screenHeight * 0.03),
              TextformfieldPass(
                validator: Validators.validatePassword,
                textfieldWidth: screenWidth,
                hintText: 'changepassword2'.tr,
                hintTextSize: 14,
                controller: confirmPassController,
                obscureText: true,
              ),
              SizedBox(height: screenHeight * 0.2),
              Obx(
                () => BlueButtonn(
                  color: Appcolor.buttonColor,
                  height: screenHeight * 0.07,
                  width: screenWidth * 0.92,
                  circularRadius: 10,
                  text: changePasswordController.isLoading.value
                      ? LoadingAnimationWidget.prograssiveDots(
                          size: 35,
                          color: Appcolor.white,
                        )
                      : Text(
                          'Settingstitle7'.tr,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Appcolor.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                  onTap: () async {
                    HapticFeedback.mediumImpact();
                    if (_validateForm()) {
                      await changePasswordController.changePassword(
                        currentPassController.text,
                        passwordController.text,
                        confirmPassController.text,
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
    );
  }

  bool _validateForm() {
    return formKey.currentState!.validate();
  }
}
