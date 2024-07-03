import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/bottomnav/advisory/widgets/uploadpic.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/dropdown.dart';
import 'package:royal_fuji_star/utils/textformfield.dart';

class ConsultationContainer extends StatelessWidget {
  const ConsultationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    // TextEditingController nameController = TextEditingController();
    // TextEditingController emailController = TextEditingController();
    // TextEditingController phoneController = TextEditingController();

    return Container(
      height: screenHeight * 0.58,
      width: screenWidth,
      decoration: const BoxDecoration(
          color: Appcolor.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45))),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // name
              SizedBox(height: screenHeight * 0.01),
              Text('advisorycontainertext1'.tr,
                  style: poppins(Appcolor.black, 12, FontWeight.w400)),
              SizedBox(height: screenHeight * 0.01),
              // Textformfield(
              //   textfieldWidth: screenWidth,
              //   hintText: 'advisorycontainertext2'.tr,
              //   hintTextSize: 12,
              //   controller: nameController,
              // ),

              //email
              SizedBox(height: screenHeight * 0.01),
              Text('email'.tr,
                  style: poppins(Appcolor.black, 12, FontWeight.w400)),
              SizedBox(height: screenHeight * 0.01),
              // Textformfield(
              //   textfieldWidth: screenWidth,
              //   hintText: '@',
              //   hintTextSize: 12,
              //   controller: emailController,
              // ),

              //phone number
              SizedBox(height: screenHeight * 0.01),
              Text('advisorycontainertext3'.tr,
                  style: poppins(Appcolor.black, 12, FontWeight.w400)),
              SizedBox(height: screenHeight * 0.01),
              // Textformfield(
              //   textfieldWidth: screenWidth,
              //   hintText: '+971',
              //   hintTextSize: 12,
              //   controller: phoneController,
              // ),

              //dropdown
              SizedBox(height: screenHeight * 0.001),
              Dropdown(title: 'advisorycontainertext4'.tr),

              //Upload images
              SizedBox(height: screenHeight * 0.01),
              Text('advisorycontainertext5'.tr,
                  style: poppins(Appcolor.black, 12, FontWeight.w400)),
              SizedBox(height: screenHeight * 0.01),
              UploadPicBoxRectangle(
                  deviceWidth: screenWidth, onImageSelected: () {}),
              SizedBox(height: screenHeight * 0.01),

              //Description of requirements
              SizedBox(height: screenHeight * 0.01),
              Text('advisorycontainertext6'.tr,
                  style: poppins(Appcolor.black, 12, FontWeight.w400)),
              SizedBox(height: screenHeight * 0.01),
              TextfieldMultipleLine(
                hintText: 'annualcontainertext7'.tr,
                hintTextSize: 12,
              ),

              //Additional Comments or Questions
              SizedBox(height: screenHeight * 0.01),
              Text('advisorycontainertext7'.tr,
                  style: poppins(Appcolor.black, 12, FontWeight.w400)),
              SizedBox(height: screenHeight * 0.01),
              TextfieldMultipleLine(
                hintText: 'annualcontainertext7'.tr,
                hintTextSize: 12,
              ),

              SizedBox(height: screenHeight * 0.01),
              const Divider(),
              SizedBox(height: screenHeight * 0.01),

              Center(
                child: BlueButton(
                    fontSize: 14,
                    textColor: Appcolor.white,
                    color: Appcolor.buttonColor,
                    height: screenHeight * 0.06,
                    width: screenWidth * 0.7,
                    circularRadius: 10,
                    text: 'annualcontainertext9'.tr,
                    onTap: () {}),
              ),
              SizedBox(height: screenHeight * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}
