import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/bottomnav/advisory/widgets/uploadpic.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/controllers/repair_controller.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/dropdown.dart';
import 'package:royal_fuji_star/utils/textformfield.dart';
import 'package:royal_fuji_star/utils/validators.dart';

class RepairContainer extends StatefulWidget {
  const RepairContainer({super.key});

  @override
  State<RepairContainer> createState() => _RepairContainerState();
}

class _RepairContainerState extends State<RepairContainer> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final RepairController repairController = Get.put(RepairController());

    TextEditingController brandNameController = TextEditingController();
    RxString typeRepairController = 'select'.tr.obs;
    TextEditingController descriptionController = TextEditingController();
    final RxList<File> selectedImagesController = <File>[].obs;

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
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'annualcontainertext1'.tr,
                  style: poppins(Appcolor.black, 12, FontWeight.w400),
                ),
                SizedBox(height: screenHeight * 0.01),
                Textformfield(
                  validator: Validators.validateBrand,
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
                    selectedImagesController.value = images;
                    // print('selected images --->$selectedImagesController');
                  },
                ),
                SizedBox(height: screenHeight * 0.03),

                Center(
                  child: Obx(
                    () => BlueButtonn(
                      color: Appcolor.buttonColor,
                      height: screenHeight * 0.07,
                      width: screenWidth * 0.92,
                      circularRadius: 10,
                      text: repairController.isLoading.value
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
                        HapticFeedback.mediumImpact();

                        if (_validateForm()) {
                          await repairController.saveRepairData(
                            brandNameController.text,
                            descriptionController.text,
                            typeRepairController.value,
                            selectedImagesController,
                          );
                        }
                        brandNameController.clear();
                        descriptionController.clear();
                        typeRepairController.value = 'select'.tr;
                        selectedImagesController.clear();
                      },
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _validateForm() {
    return formKey.currentState!.validate();
  }
}
