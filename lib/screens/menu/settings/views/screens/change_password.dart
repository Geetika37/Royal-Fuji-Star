import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/menu/settings/controller/changepassword_controller.dart';
import 'package:royal_fuji_star/screens/widgets/customappbar.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/textformfield.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangePasswordController changePasswordController =
        Get.put(ChangePasswordController());

    TextEditingController currentPassController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: 'Settingstitle7'.tr,
            titleSpacing: screenWidth * 0.2,
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: screenHeight * 0.03,
          ),
          children: [
            Textformfield(
              textfieldWidth: screenWidth,
              hintText: 'changepassword1'.tr,
              hintTextSize: 14,
              controller: currentPassController,
            ),
            SizedBox(height: screenHeight * 0.03),
            Textformfield(
              textfieldWidth: screenWidth,
              hintText: 'password'.tr,
              hintTextSize: 14,
              controller: passwordController,
            ),
            SizedBox(height: screenHeight * 0.03),
            Textformfield(
              textfieldWidth: screenWidth,
              hintText: 'changepassword2'.tr,
              hintTextSize: 14,
              controller: confirmPassController,
            ),
            SizedBox(height: screenHeight * 0.2),
            BlueButton(
              height: screenHeight * 0.07,
              width: screenWidth,
              circularRadius: 10,
              text: 'Settingstitle7'.tr,
              onTap: () {
                changePasswordController.changePassword(
                  currentPassController.text,
                  passwordController.text,
                  confirmPassController.text,
                );
              },
              color: Appcolor.buttonColor,
              textColor: Appcolor.white,
              fontSize: 15,
            ),
          ],
        ),
      ),
    );
  }
}
