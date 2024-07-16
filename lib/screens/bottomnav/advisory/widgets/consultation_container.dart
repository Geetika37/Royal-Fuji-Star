import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/bottomnav/advisory/controllers/advisory_controller.dart';
import 'package:royal_fuji_star/screens/bottomnav/advisory/widgets/uploadpic.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/dropdown.dart';
import 'package:royal_fuji_star/utils/textformfield.dart';

class ConsultationContainer extends StatelessWidget {
  const ConsultationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final AdvisoryController advisoryController = Get.put(AdvisoryController());
    List<File> selectedImagesController = [];
    TextEditingController descriptionController = TextEditingController();
    TextEditingController additionalCommentController = TextEditingController();
    RxString consultationController = 'select'.tr.obs;

    return Container(
      height: screenHeight * 0.58,
      width: screenWidth,
      decoration: const BoxDecoration(
          color: Appcolor.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //dropdown
              SizedBox(height: screenHeight * 0.001),
              DropdownConsultation(
                title: 'advisorycontainertext4'.tr,
                onValueChanged: (String value) {
                  consultationController.value = value;
                },
              ),

              //Upload images
              SizedBox(height: screenHeight * 0.01),
              Text('advisorycontainertext5'.tr,
                  style: poppins(Appcolor.black, 12, FontWeight.w400)),
              SizedBox(height: screenHeight * 0.01),
              UploadPicBoxRectangle(
                deviceWidth: screenWidth,
                onImageSelected: (images) {
                  selectedImagesController = images;
                },
              ),
              SizedBox(height: screenHeight * 0.01),

              //Description of requirements
              SizedBox(height: screenHeight * 0.01),
              Text('advisorycontainertext6'.tr,
                  style: poppins(Appcolor.black, 12, FontWeight.w400)),
              SizedBox(height: screenHeight * 0.01),
              TextfieldMultipleLine(
                controller: descriptionController,
                hintText: 'annualcontainertext7'.tr,
                hintTextSize: 12,
              ),

              //Additional Comments or Questions
              SizedBox(height: screenHeight * 0.01),
              Text('advisorycontainertext7'.tr,
                  style: poppins(Appcolor.black, 12, FontWeight.w400)),
              SizedBox(height: screenHeight * 0.01),
              TextfieldMultipleLine(
                controller: additionalCommentController,
                hintText: 'annualcontainertext7'.tr,
                hintTextSize: 12,
              ),

              SizedBox(height: screenHeight * 0.01),
              // SizedBox(height: screenHeight * 0.01),

              Center(
                child: BlueButton(
                  fontSize: 14,
                  textColor: Appcolor.white,
                  color: Appcolor.buttonColor,
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.7,
                  circularRadius: 10,
                  text: 'annualcontainertext9'.tr,
                  onTap: () {
                    advisoryController.saveAdvisory(
                      consultationController.value,
                      descriptionController.text,
                      additionalCommentController.text,
                      selectedImagesController,
                    );
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}
