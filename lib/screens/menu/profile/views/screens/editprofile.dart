import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/menu/profile/widgets/bottomsheet.dart';
import 'package:royal_fuji_star/screens/menu/profile/widgets/textfieldwithoutborder.dart';
import 'package:royal_fuji_star/screens/widgets/customappbar.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController emailIDController = TextEditingController();
    TextEditingController mobileController = TextEditingController();
    TextEditingController locationController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: 'editprofile'.tr,
            titleSpacing: screenWidth * 0.2,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            right: 15,
            left: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextfieldWithoutborder(
                imagePath: 'assets/png/picon1.png',
                text: 'editprofilehinttext1'.tr,
                controller: userNameController,
              ),
              SizedBox(height: screenHeight * 0.02),
              TextfieldWithoutborder(
                imagePath: 'assets/png/picon2.png',
                text: 'editprofilehinttext2'.tr,
                controller: emailIDController,
              ),
              SizedBox(height: screenHeight * 0.02),
              TextfieldWithoutborder(
                  controller: mobileController,
                  imagePath: 'assets/png/picon3.png',
                  text: 'editprofilehinttext3'.tr),
              SizedBox(height: screenHeight * 0.02),
              TextfieldWithoutborder(
                  controller: locationController,
                  imagePath: 'assets/png/picon4.png',
                  text: 'editprofilehinttext4'.tr),
              SizedBox(height: screenHeight * 0.14),
              BlueButton(
                fontSize: 14,
                textColor: Appcolor.white,
                height: screenHeight * 0.08,
                width: screenWidth * 0.9,
                circularRadius: 20,
                text: 'save'.tr,
                onTap: () {
                  Get.bottomSheet(
                    backgroundColor: Appcolor.bgColor,
                    const Bottomsheet(),
                  );
                },
                color: Appcolor.buttonColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
