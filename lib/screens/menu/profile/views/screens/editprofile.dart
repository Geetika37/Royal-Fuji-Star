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
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: 'Edit Profile',
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
              const TextfieldWithoutborder(
                  imagePath: 'assets/png/picon1.png', text: 'Username'),
              SizedBox(height: screenHeight * 0.02),
              const TextfieldWithoutborder(
                  imagePath: 'assets/png/picon2.png', text: 'Email id'),
              SizedBox(height: screenHeight * 0.02),
              const TextfieldWithoutborder(
                  imagePath: 'assets/png/picon3.png', text: 'Mobile'),
              SizedBox(height: screenHeight * 0.02),
              const TextfieldWithoutborder(
                  imagePath: 'assets/png/picon4.png', text: 'Location'),
              SizedBox(height: screenHeight * 0.14),
              BlueButton(
                
                fontSize: 14,
                textColor: Appcolor.white,
                height: screenHeight * 0.08,
                width: screenWidth * 0.9,
                circularRadius: 20,
                text: 'Save',
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
