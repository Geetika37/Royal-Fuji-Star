import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/controllers/annualmaintenance_controller.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class RadioButton extends StatefulWidget {
  final ValueChanged<String> onValueChanged;
  const RadioButton({super.key, required this.onValueChanged});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  final AnnualMaintenanceController annualMaintenanceController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      activeColor: Appcolor.buttonColor,
                      value: 'Comprehensive',
                      groupValue:
                          annualMaintenanceController.typeController.value,
                      onChanged: (String? newValue) {
                        annualMaintenanceController.typeController.value =
                            newValue!;
                        widget.onValueChanged(newValue);
                        // validateSelection();
                      },
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'annualcontainertext4'.tr,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: poppins(Appcolor.black, 12, FontWeight.w500),
                          ),
                          Text(
                            'annualcontainertext10'.tr,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: poppins(Appcolor.black, 9, FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      activeColor: Appcolor.buttonColor,
                      value: 'Non-Comprehensive',
                      groupValue:
                          annualMaintenanceController.typeController.value,
                      onChanged: (String? newValue) {
                        annualMaintenanceController.typeController.value =
                            newValue!;
                        widget.onValueChanged(newValue);
                        // validateSelection();
                      },
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'annualcontainertext5'.tr,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: poppins(Appcolor.black, 11, FontWeight.w500),
                          ),
                          Text(
                            'annualcontainertext11'.tr,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: poppins(Appcolor.black, 9, FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:royal_fuji_star/constants/textstyle.dart';
// import 'package:royal_fuji_star/screens/bottomnav/services/controllers/annualmaintenance_controller.dart';
// import 'package:royal_fuji_star/utils/appcolor.dart';

// class RadioButton extends StatefulWidget {
//   final ValueChanged<String> onValueChanged;
//   const RadioButton({super.key, required this.onValueChanged});

//   @override
//   State<RadioButton> createState() => _RadioButtonState();
// }

// class _RadioButtonState extends State<RadioButton> {
//   final AnnualMaintenanceController annualMaintenanceController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Radio(
//                   activeColor: Appcolor.buttonColor,
//                   value: 'Comprehensive',
//                   groupValue: annualMaintenanceController.typeController.value,
//                   onChanged: (String? newValue) {
//                     annualMaintenanceController.typeController.value =
//                         newValue!;
//                     widget.onValueChanged(newValue);
//                   },
//                 ),
//                 Flexible(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'annualcontainertext4'.tr,
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 1,
//                         style: poppins(Appcolor.black, 12, FontWeight.w500),
//                       ),
//                       Text(
//                         'annualcontainertext10'.tr,
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 1,
//                         style: poppins(Appcolor.black, 9, FontWeight.w300),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Radio(
//                   activeColor: Appcolor.buttonColor,
//                   value: 'Non-Comprehensive',
//                   groupValue: annualMaintenanceController.typeController.value,
//                   onChanged: (String? newValue) {
//                     annualMaintenanceController.typeController.value =
//                         newValue!;
//                     widget.onValueChanged(newValue);
//                   },
//                 ),
//                 Flexible(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'annualcontainertext5'.tr,
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 1,
//                         style: poppins(Appcolor.black, 11, FontWeight.w500),
//                       ),
//                       Text(
//                         'annualcontainertext11'.tr,
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 1,
//                         style: poppins(Appcolor.black, 9, FontWeight.w300),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     });
//   }
// }
