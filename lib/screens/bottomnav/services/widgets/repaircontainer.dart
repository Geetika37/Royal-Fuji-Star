import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/bottomnav/advisory/widgets/uploadpic.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/controllers/repair_controller.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/dropdown.dart';
import 'package:royal_fuji_star/utils/textformfield.dart';

class RepairContainer extends StatelessWidget {
  const RepairContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final RepairController repairController = Get.put(RepairController());

    TextEditingController brandNameController = TextEditingController();
    RxString typeRepairController = 'Select'.obs;
    TextEditingController descriptionController = TextEditingController();
    List<File> selectedImagesController = [];

    return Container(
      height: ScreenSize.getHeight(context) * 0.65,
      width: screenWidth,
      decoration: const BoxDecoration(
        color: Appcolor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              Text(
                'annualcontainertext1'.tr,
                style: poppins(Appcolor.black, 12, FontWeight.w400),
              ),
              SizedBox(height: screenHeight * 0.01),
              TextformfieldWithoutValidation(
                controller: brandNameController,
                textfieldWidth: screenWidth,
                hintText: 'annualcontainertext13'.tr,
                hintTextSize: 12,
              ),
              SizedBox(height: screenHeight * 0.01),
              DropdownRepair(
                title: 'repairtext1'.tr,
                onValueChanged: (String value) {
                  typeRepairController.value = value;
                },
              ),
              SizedBox(height: screenHeight * 0.01),

              //Description
              SizedBox(height: screenHeight * 0.01),
              Text('advisorycontainertext6'.tr,
                  style: poppins(Appcolor.black, 12, FontWeight.w400)),
              SizedBox(height: screenHeight * 0.01),
              TextfieldMultipleLine(
                hintText: 'annualcontainertext7'.tr,
                hintTextSize: 12,
                controller: descriptionController,
              ),
              SizedBox(height: screenHeight * 0.01),

              //Upload images
              SizedBox(height: screenHeight * 0.01),
              Text('advisorycontainertext5'.tr,
                  style: poppins(Appcolor.black, 12, FontWeight.w400)),
              SizedBox(height: screenHeight * 0.01),
              UploadPicBoxRectangle(
                deviceWidth: screenWidth,
                onImageSelected: (images) {
                  selectedImagesController = images;
                  // print('selected images --->$selectedImagesController');
                },
              ),
              SizedBox(height: screenHeight * 0.03),

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
                      repairController.saveRepairData(
                        brandNameController.text,
                        descriptionController.text,
                        typeRepairController.value,
                        selectedImagesController,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
