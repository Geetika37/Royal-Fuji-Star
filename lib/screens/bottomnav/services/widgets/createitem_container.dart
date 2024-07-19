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

class CreateItemContainer extends StatelessWidget {
  const CreateItemContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final SpareNotFoundController spareNotFoundController =
        Get.put(SpareNotFoundController());
    final RxList<File> selectedImagesController = <File>[].obs;
    TextEditingController descriptionController = TextEditingController();

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
                    // print('selected images --->$selectedImagesController');
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
                      await spareNotFoundController.saveSpareNotFoundItem(
                        descriptionController.text,
                        selectedImagesController,
                      );
                      selectedImagesController.clear();
                      descriptionController.clear();
                    },
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
