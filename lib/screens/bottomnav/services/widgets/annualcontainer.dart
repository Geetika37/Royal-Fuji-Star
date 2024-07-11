// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:royal_fuji_star/constants/size.dart';
// import 'package:royal_fuji_star/constants/textstyle.dart';
// import 'package:royal_fuji_star/screens/bottomnav/services/controllers/annualmaintenance_controller.dart';
// import 'package:royal_fuji_star/screens/bottomnav/services/widgets/radio_button.dart';
// import 'package:royal_fuji_star/utils/appcolor.dart';
// import 'package:royal_fuji_star/utils/buttons.dart';
// import 'package:royal_fuji_star/utils/dropdown.dart';
// import 'package:royal_fuji_star/utils/textformfield.dart';

// class Annualcontainer extends StatelessWidget {
//   const Annualcontainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final AnnualMaintenanceController annualMaintenanceController =
//         Get.put(AnnualMaintenanceController());

//     TextEditingController brandNameController = TextEditingController();
//     TextEditingController descriptionController = TextEditingController();
//     RxString capacityController = 'Select'.obs;
//     RxString numFloorController = 'Select'.obs;
//     RxString typeController = ''.obs;

//     return Container(
//       height: ScreenSize.getHeight(context) * 0.65,
//       width: screenWidth,
//       decoration: const BoxDecoration(
//           color: Appcolor.white,
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(40), topRight: Radius.circular(40))),
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: screenHeight * 0.02),
//               Text(
//                 'annualcontainertext1'.tr,
//                 style: poppins(Appcolor.black, 12, FontWeight.w400),
//               ),
//               SizedBox(height: screenHeight * 0.01),
//               TextformfieldWithoutValidation(
//                 controller: brandNameController,
//                 textfieldWidth: screenWidth,
//                 hintText: 'annualcontainertext13'.tr,
//                 hintTextSize: 12,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: DropdownCapacity(
//                       title: 'annualcontainertext2'.tr,
//                       onValueChanged: (value) {
//                         capacityController.value = value;
//                         // print('cap controller----->>$capacityController');
//                       },
//                     ),
//                   ),
//                   SizedBox(width: screenWidth * 0.02),
//                   Expanded(
//                     child: DropdownNumFloor(
//                       title: 'annualcontainertext3'.tr,
//                       onValueChanged: (String value) {
//                         numFloorController.value = value;
//                         // print('floor controller----->>$numFloorController');
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: screenHeight * 0.01),
//               Text(
//                 'annualcontainertext12'.tr,
//                 style: poppins(Appcolor.black, 12, FontWeight.w400),
//               ),
//               RadioButton(
//                 onValueChanged: (String value) {
//                   typeController.value = value;
//                   // print('type controller----->>$typeController');
//                 },
//               ),
//               Text(
//                 'description'.tr,
//                 style: poppins(Appcolor.black, 12, FontWeight.w400),
//               ),
//               SizedBox(height: screenHeight * 0.01),
//               TextfieldMultipleLine(
//                 controller: descriptionController,
//                 hintText: 'annualcontainertext7'.tr,
//                 hintTextSize: 12,
//               ),
//               SizedBox(height: screenHeight * 0.02),
//               const Divider(),
//               SizedBox(height: screenHeight * 0.01),
//               Center(
//                 child: BlueButton(
//                     fontSize: 14,
//                     textColor: Appcolor.white,
//                     color: Appcolor.buttonColor,
//                     height: screenHeight * 0.06,
//                     width: screenWidth * 0.7,
//                     circularRadius: 10,
//                     text: 'annualcontainertext9'.tr,
//                     onTap: () {
//                       HapticFeedback.mediumImpact();
//                       annualMaintenanceController.saveAnnualMaintenance(
//                         brandNameController.text,
//                         descriptionController.text,
//                         capacityController.value,
//                         numFloorController.value,
//                         typeController.value,
//                       );
//                     }),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/controllers/annualmaintenance_controller.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/widgets/radio_button.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/dropdown.dart';
import 'package:royal_fuji_star/utils/textformfield.dart';

class Annualcontainer extends StatelessWidget {
  const Annualcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    final AnnualMaintenanceController annualMaintenanceController =
        Get.put(AnnualMaintenanceController());

    TextEditingController brandNameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    RxString capacityController = 'Select'.obs;
    RxString numFloorController = 'Select'.obs;

    return Container(
      height: ScreenSize.getHeight(context) * 0.65,
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
                    onTap: () {
                      annualMaintenanceController.saveAnnualMaintenance(
                        brandNameController.text,
                        descriptionController.text,
                        capacityController.value,
                        numFloorController.value,
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
