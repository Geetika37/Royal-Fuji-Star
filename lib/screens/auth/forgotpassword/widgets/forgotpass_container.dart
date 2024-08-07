import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/auth/forgotpassword/controller/forgotpass_controller.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/textformfield.dart';
import 'package:royal_fuji_star/utils/validators.dart';

class ForgotpassContainer extends StatefulWidget {
  const ForgotpassContainer({super.key});

  @override
  State<ForgotpassContainer> createState() => _ForgotpassContainerState();
}

class _ForgotpassContainerState extends State<ForgotpassContainer> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final ForgotpassController forgotpassController =
      Get.put(ForgotpassController());
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
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
                textfieldWidth: screenWidth * 0.8,
                hintText: 'email'.tr,
                hintTextSize: 15,
                controller: emailController,
              ),
              SizedBox(height: screenHeight * 0.05),
              Obx(
                () => BlueButtonn(
                  color: Appcolor.buttonColor,
                  height: screenHeight * 0.07,
                  width: screenWidth * 0.8,
                  circularRadius: 10,
                  text: forgotpassController.isLoading.value
                      ? LoadingAnimationWidget.prograssiveDots(
                          size: 35,
                          color: Appcolor.white,
                        )
                      : Text(
                          'annualcontainertext9'.tr,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Appcolor.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                  onTap: () async {
                    if (_validateForm()) {
                      forgotpassController.forgotPass(emailController.text);
                    }
                  },
                  fontSize: 14,
                ),
              ),
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
