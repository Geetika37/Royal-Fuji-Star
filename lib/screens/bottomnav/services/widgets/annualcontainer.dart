import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/controllers/annualmaintenance_controller.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/widgets/radio_button.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/dropdown.dart';
import 'package:royal_fuji_star/utils/textformfield.dart';
import 'package:royal_fuji_star/utils/validators.dart';

class Annualcontainer extends StatefulWidget {
  const Annualcontainer({super.key});

  @override
  State<Annualcontainer> createState() => _AnnualcontainerState();
}

class _AnnualcontainerState extends State<Annualcontainer> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AnnualMaintenanceController annualMaintenanceController =
      Get.put(AnnualMaintenanceController());

  TextEditingController brandNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  RxString capacityController = 'select'.tr.obs;
  RxString numFloorController = 'select'.tr.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.only(top: 10),
        height: ScreenSize.getHeight(context) * 0.65,
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
                  Row(
                    children: [
                      Expanded(
                        child: DropdownCapacity(
                          title: 'annualcontainertext2'.tr,
                          onValueChanged: (value) {
                            capacityController.value = value;
                          },
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Expanded(
                        child: DropdownNumFloor(
                          title: 'annualcontainertext3'.tr,
                          onValueChanged: (String value) {
                            numFloorController.value = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'annualcontainertext12'.tr,
                    style: poppins(Appcolor.black, 12, FontWeight.w400),
                  ),
                  RadioButton(
                    onValueChanged: (String value) {
                      annualMaintenanceController.typeController.value = value;
                    },
                  ),
                  Text(
                    'description'.tr,
                    style: poppins(Appcolor.black, 12, FontWeight.w400),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  TextfieldMultipleLine(
                    controller: descriptionController,
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
                      text: annualMaintenanceController.isLoading.value
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
                          await annualMaintenanceController
                              .saveAnnualMaintenance(
                            brandNameController.text,
                            descriptionController.text,
                            capacityController.value,
                            numFloorController.value,
                          );
                        }
                        // Clear the input fields after successful submission
                        brandNameController.clear();
                        descriptionController.clear();
                        capacityController.value = 'select'.tr;
                        numFloorController.value = 'select'.tr;
                        annualMaintenanceController.typeController.value = '';
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
    return formKey.currentState!.validate();
  }
}
