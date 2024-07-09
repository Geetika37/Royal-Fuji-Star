// import 'package:flutter/material.dart';
// import 'package:royal_fuji_star/constants/size.dart';
// import 'package:royal_fuji_star/utils/appcolor.dart';

// class ComponentsContainer extends StatefulWidget {
//   const ComponentsContainer({super.key});

//   @override
//   State<ComponentsContainer> createState() => _ComponentsContainerState();
// }

// class _ComponentsContainerState extends State<ComponentsContainer> {
//   int selectedIndex = -1;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: const EdgeInsets.only(
//         right: 10,
//         left: 10,
//       ),
//       shrinkWrap: true,
//       scrollDirection: Axis.horizontal,
//       itemCount: 7,
//       itemBuilder: (context, index) {
//         return InkWell(
//           onTap: () {
//             setState(() {
//               selectedIndex = index;
//             });
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: selectedIndex == index
//                     ? Appcolor.buttonColor
//                     : Appcolor.bgColor,
//                 border: Border.all(
//                   color: selectedIndex == index
//                       ? Appcolor.black
//                       : Colors.transparent,
//                   width: 3,
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Image.asset(
//                     'assets/png/testimg.png',
//                   ),
//                   SizedBox(height: screenHeight * 0.01),
//                   selectedIndex == index
//                       ? SizedBox(
//                           width: screenWidth * 0.25,
//                           child: const Text(
//                             'Item1',
//                             style: TextStyle(color: Appcolor.white),
//                           ),
//                         )
//                       : const Text(
//                           'Item1',
//                           style: TextStyle(color: Appcolor.black),
//                         ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:royal_fuji_star/constants/size.dart';
// import 'package:royal_fuji_star/constants/textstyle.dart';
// import 'package:royal_fuji_star/screens/home/controller/oneproduct_controller.dart';
// import 'package:royal_fuji_star/utils/appcolor.dart';
// import 'package:royal_fuji_star/utils/buttons.dart';

// class ComponentsContainer extends StatefulWidget {
//   const ComponentsContainer({super.key});

//   @override
//   State<ComponentsContainer> createState() => _ComponentsContainerState();
// }

// class _ComponentsContainerState extends State<ComponentsContainer> {
//   final OneProductController oneProductController =
//       Get.put(OneProductController());
//   int selectedIndex = -1;

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (oneProductController.isLoading.value) {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       }
//       return ListView.builder(
//         padding: const EdgeInsets.only(
//           right: 10,
//           left: 10,
//         ),
//         shrinkWrap: true,
//         scrollDirection: Axis.horizontal,
//         itemCount: 7,
//         itemBuilder: (context, index) {
//           return InkWell(
//             onTap: () {
//               setState(() {
//                 selectedIndex = index;
//               });
//             },
//             child: Padding(
//               padding:
//                   const EdgeInsets.only(right: 10, left: 10, top: 4, bottom: 4),
//               child: Container(
//                 width: screenWidth * 0.4,
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 197, 229, 247),
//                   border: Border.all(
//                     width: 1,
//                     color: Appcolor.buttonColor,
//                   ),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       // Image.network(
//                       //   'imageUrl',
//                       //   fit: BoxFit.cover,
//                       // ),
//                       SizedBox(height: screenHeight * 0.005),
//                       Text(
//                         'spareItem',
//                         style:
//                             poppins(Appcolor.buttonColor, 10, FontWeight.w500),
//                       ),
//                       SizedBox(height: screenHeight * 0.01),
//                       BlueButton(
//                         height: screenHeight * 0.05,
//                         width: screenWidth * 0.4,
//                         circularRadius: 10,
//                         text: 'submit'.tr,
//                         onTap: () {},
//                         color: Appcolor.buttonColor,
//                         textColor: Appcolor.white,
//                         fontSize: 12,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       );
//     });
//   }
// }
