import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/bottomnav/advisory/controllers/advisory_controller.dart';
import 'package:royal_fuji_star/screens/bottomnav/advisory/widgets/uploadpic.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/dropdown.dart';
import 'package:royal_fuji_star/utils/textformfield.dart';
import 'package:royal_fuji_star/utils/validators.dart';

class ConsultationContainer extends StatefulWidget {
  const ConsultationContainer({super.key});

  @override
  State<ConsultationContainer> createState() => _ConsultationContainerState();
}

class _ConsultationContainerState extends State<ConsultationContainer> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AdvisoryController advisoryController = Get.put(AdvisoryController());

  final RxList<File> selectedImagesController = <File>[].obs;
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController additionalCommentController =
      TextEditingController();
  final RxString consultationController = 'select'.tr.obs;
  final RxBool isImageSelected = true.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: screenHeight * 0.58,
        width: screenWidth,
        decoration: const BoxDecoration(
            color: Appcolor.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                      selectedImagesController.value = images;
                      isImageSelected.value = images.isNotEmpty;
                    },
                  ),
                  Obx(
                    () => isImageSelected.value
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 10, right: 10),
                            child: Text(
                              'Please select at least one image',
                              style: poppins(
                                  const Color.fromARGB(255, 166, 53, 53),
                                  12,
                                  FontWeight.w400),
                            ),
                          ),
                  ),
                  SizedBox(height: screenHeight * 0.01),

                  //Description of requirements
                  SizedBox(height: screenHeight * 0.01),
                  Text('advisorycontainertext6'.tr,
                      style: poppins(Appcolor.black, 12, FontWeight.w400)),
                  SizedBox(height: screenHeight * 0.01),
                  TextfieldMultipleLine(
                    validator: Validators.validateEmpty,
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
                    validator: Validators.validateEmpty,
                    controller: additionalCommentController,
                    hintText: 'annualcontainertext7'.tr,
                    hintTextSize: 12,
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  Center(
                    child: BlueButtonn(
                      color: Appcolor.buttonColor,
                      height: screenHeight * 0.07,
                      width: screenWidth * 0.92,
                      circularRadius: 10,
                      text: advisoryController.isLoading.value
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
                          await advisoryController.saveAdvisory(
                            consultationController.value,
                            descriptionController.text,
                            additionalCommentController.text,
                            selectedImagesController,
                          );
                          _resetForm();
                        } else {
                          isImageSelected.value =
                              selectedImagesController.isNotEmpty;
                        }
                      },
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _validateForm() {
    return formKey.currentState!.validate();
  }

  void _resetForm() {
    consultationController.value = 'select'.tr;
    descriptionController.clear();
    additionalCommentController.clear();
    selectedImagesController.clear();
    isImageSelected.value = true;
  }
}
