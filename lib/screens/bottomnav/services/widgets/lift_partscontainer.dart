// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:royal_fuji_star/constants/size.dart';
// import 'package:royal_fuji_star/constants/textstyle.dart';
// import 'package:royal_fuji_star/screens/bottomnav/services/controllers/spare_subcategory_spare_controller.dart';
// import 'package:royal_fuji_star/screens/bottomnav/services/controllers/spareenquiry_controller.dart';
// import 'package:royal_fuji_star/screens/home/widgets/lift_partsname.dart';
// import 'package:royal_fuji_star/services/api_baseurl.dart';
// import 'package:royal_fuji_star/utils/appcolor.dart';
// import 'package:royal_fuji_star/utils/buttons.dart';

// class LiftPartsContainer extends StatelessWidget {
//   const LiftPartsContainer({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final SubcategorySparesController subcategorySparesController =
//         Get.put(SubcategorySparesController());

//     final SpareEnquiryController spareEnquiryController =
//         Get.put(SpareEnquiryController());

//     return Obx(() {
//       if (subcategorySparesController.isLoading.value) {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       }

//       final spare = subcategorySparesController.spare.value;
//       // print('spare--->$spare');

//       if (spare == null || spare.data!.isEmpty) {
//         return SizedBox(
//           height: screenHeight * 0.1,
//           child: const Center(
//             child: Text(
//               'No Spares Found',
//               style: TextStyle(color: Colors.black),
//             ),
//           ),
//         );
//       }

//       return ListView.builder(
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: spare.data!.length,
//           itemBuilder: (context, index) {
//             final sparetem = spare.data![index];
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 LiftPartsName(
//                   fontWeight: FontWeight.w600,
//                   text: sparetem.brandSpares.name,
//                   fontSize: 13,
//                   textColor: const Color.fromARGB(255, 88, 88, 88),
//                   dividerColor: const Color.fromARGB(255, 48, 55, 62),
//                 ),
//                 SizedBox(
//                   height: screenHeight * 0.22,
//                   child: ListView.builder(
//                       shrinkWrap: true,
//                       scrollDirection: Axis.horizontal,
//                       itemCount: sparetem.brandSpares.spareList!.length,
//                       itemBuilder: (context, index) {
//                         final spareListItem =
//                             sparetem.brandSpares.spareList![index];

//                         final imageUrl = spareListItem.image.url;
//                         // final categoryId = spareListItem.subCategory.id;

//                         return Padding(
//                           padding: const EdgeInsets.only(
//                               right: 10, left: 10, top: 4, bottom: 4),
//                           child: Container(
//                             width: screenWidth * 0.4,
//                             decoration: BoxDecoration(
//                               color: const Color.fromARGB(255, 197, 229, 247),
//                               border: Border.all(
//                                 width: 1,
//                                 color: Appcolor.buttonColor,
//                               ),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 children: [
//                                   SizedBox(
//                                     height: ScreenSize.getHeight(context) * 0.1,
//                                     width: ScreenSize.getWidth(context) * 0.3,
//                                     child: Image.network(
//                                       '${APIConstants.baseUrl}$imageUrl',
//                                       fit: BoxFit.contain,
//                                     ),
//                                   ),
//                                   SizedBox(height: screenHeight * 0.005),
//                                   Text(
//                                     spareListItem.name,
//                                     style: poppins(Appcolor.buttonColor, 10,
//                                         FontWeight.w500),
//                                   ),
//                                   SizedBox(height: screenHeight * 0.01),
//                                   Obx(
//                                     () => BlueButtonn(
//                                       color: Appcolor.buttonColor,
//                                       height: screenHeight * 0.05,
//                                       width: screenWidth * 0.4,
//                                       circularRadius: 10,
//                                       text:
//                                           spareEnquiryController.isLoading.value
//                                               ? LoadingAnimationWidget
//                                                   .prograssiveDots(
//                                                   size: 20,
//                                                   color: Appcolor.white,
//                                                 )
//                                               : Text(
//                                                   'enquiry'.tr,
//                                                   style: const TextStyle(
//                                                     fontSize: 14,
//                                                     color: Appcolor.white,
//                                                     fontWeight: FontWeight.w600,
//                                                   ),
//                                                 ),
//                                       onTap: () async {
//                                         await spareEnquiryController
//                                             .saveSpareEnquiry(spareListItem.id);
//                                       },
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       }),
//                 ),
//               ],
//             );
//           });
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/controllers/spare_subcategory_spare_controller.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/controllers/spareenquiry_controller.dart';
import 'package:royal_fuji_star/screens/home/widgets/lift_partsname.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';

class LiftPartsContainer extends StatefulWidget {
  const LiftPartsContainer({super.key});

  @override
  _LiftPartsContainerState createState() => _LiftPartsContainerState();
}

class _LiftPartsContainerState extends State<LiftPartsContainer> {
  final SubcategorySparesController subcategorySparesController =
      Get.put(SubcategorySparesController());
  final SpareEnquiryController spareEnquiryController =
      Get.put(SpareEnquiryController());

  // State variable to track which button is loading
  int? loadingItemId;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (subcategorySparesController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      final spare = subcategorySparesController.spare;
      // print('spare--$spare');

      if (spare.isEmpty) {
        return SizedBox(
          height: screenHeight * 0.1,
          child: Center(
            child: Text(
              'sparenotfound'.tr,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        );
      }

      return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: spare.length,
          itemBuilder: (context, index) {
            final sparetem = spare[index];
            print('spare name-->${sparetem.brandSpares.name}');
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LiftPartsName(
                  fontWeight: FontWeight.w600,
                  text: sparetem.brandSpares.name,
                  fontSize: 13,
                  textColor: const Color.fromARGB(255, 88, 88, 88),
                  dividerColor: const Color.fromARGB(255, 48, 55, 62),
                ),
                SizedBox(
                  height: screenHeight * 0.22,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: sparetem.brandSpares.spareList.length,
                      itemBuilder: (context, index) {
                        final spareListItem =
                            sparetem.brandSpares.spareList[index];
                        final imageUrl = spareListItem.image!.url;

                        return Padding(
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, top: 4, bottom: 4),
                          child: Container(
                            width: screenWidth * 0.4,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 197, 229, 247),
                              border: Border.all(
                                width: 1,
                                color: Appcolor.buttonColor,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: ScreenSize.getHeight(context) * 0.1,
                                    width: ScreenSize.getWidth(context) * 0.3,
                                    child: Image.network(
                                      '${APIConstants.baseUrl}$imageUrl',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  Text(
                                    spareListItem.name,
                                    style: poppins(Appcolor.buttonColor, 10,
                                        FontWeight.w500),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Obx(
                                    () => BlueButtonn(
                                      color: Appcolor.buttonColor,
                                      height: screenHeight * 0.05,
                                      width: screenWidth * 0.4,
                                      circularRadius: 10,
                                      text: (spareEnquiryController
                                                  .isLoading.value &&
                                              loadingItemId == spareListItem.id)
                                          ? LoadingAnimationWidget
                                              .prograssiveDots(
                                              size: 20,
                                              color: Appcolor.white,
                                            )
                                          : Text(
                                              'enquiry'.tr,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Appcolor.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                      onTap: () async {
                                        setState(() {
                                          loadingItemId = spareListItem.id;
                                        });
                                        await spareEnquiryController
                                            .saveSpareEnquiry(spareListItem.id);
                                        setState(() {
                                          loadingItemId = null;
                                        });
                                      },
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            );
          });
    });
  }
}
