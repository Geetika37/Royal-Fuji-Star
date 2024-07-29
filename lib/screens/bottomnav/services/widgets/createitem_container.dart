import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/bottomnav/advisory/widgets/uploadpic.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/controllers/sparenotfound_controller.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/textformfield.dart';
import 'package:royal_fuji_star/utils/validators.dart';

class CreateItemContainer extends StatefulWidget {
  const CreateItemContainer({super.key});

  @override
  State<CreateItemContainer> createState() => _CreateItemContainerState();
}

class _CreateItemContainerState extends State<CreateItemContainer> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final SpareNotFoundController spareNotFoundController =
      Get.put(SpareNotFoundController());
  final RxList<File> selectedImagesController = <File>[].obs;
  TextEditingController descriptionController = TextEditingController();
  final RxBool isImageSelected = true.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        // height: ScreenSize.getHeight(context) * 0.65,
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
                              'validation21'.tr,
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
                    validator: Validators.validate,
                    controller: descriptionController,
                    hintText: 'annualcontainertext7'.tr,
                    hintTextSize: 12,
                  ),

                  SizedBox(height: screenHeight * 0.13),
                  Center(
                    child: BlueButtonn(
                      color: Appcolor.buttonColor,
                      height: screenHeight * 0.07,
                      width: screenWidth * 0.92,
                      circularRadius: 10,
                      text: spareNotFoundController.isLoading.value
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
                          await spareNotFoundController.saveSpareNotFoundItem(
                            descriptionController.text,
                            selectedImagesController,
                          );
                          selectedImagesController.clear();
                          descriptionController.clear();
                          isImageSelected.value = true;
                        } else {
                          isImageSelected.value =
                              selectedImagesController.isNotEmpty;
                        }
                      },
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _validateForm() {
    return formKey.currentState!.validate() &&
        selectedImagesController.isNotEmpty;
  }
}
