import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/home/controller/oneproduct_controller.dart';
import 'package:royal_fuji_star/screens/home/models/oneproduct_model.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';

// class ComponentsContainer extends StatefulWidget {
//   const ComponentsContainer({super.key, required this.productDetails});
//   final Product? productDetails;

//   @override
//   State<ComponentsContainer> createState() => _ComponentsContainerState();
// }

// class _ComponentsContainerState extends State<ComponentsContainer> {
//   final OneProductController oneProductController =
//       Get.put(OneProductController());

//   @override
//   Widget build(BuildContext context) {
//     int selectedIndex = -1;

//     return Obx(
//       () {
//         if (oneProductController.isLoading.value) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }

//         List<Component>? components = widget.productDetails!.data.components;

//         return ListView.builder(
//           padding: const EdgeInsets.only(
//             right: 10,
//             left: 10,
//           ),
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: components.length ,
//           itemBuilder: (context, index) {
//             final componentsItem = components[index];

//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10, right: 10),
//                   child: Text(
//                   ,
//                     style: poppins(Appcolor.buttonColor, 14, FontWeight.w500),
//                   ),
//                 ),
//                 SizedBox(
//                   height: screenHeight * 0.25,
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     scrollDirection: Axis.horizontal,
//                     itemCount: 7,
//                     itemBuilder: (context, index) {
//                       return InkWell(
//                         onTap: () {
//                           setState(() {
//                             selectedIndex = index;
//                           });
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.only(
//                               right: 10, left: 10, top: 4, bottom: 4),
//                           child: Container(
//                             width: screenWidth * 0.4,
//                             decoration: BoxDecoration(
//                               color: const Color.fromARGB(255, 197, 229, 247),
//                               border: selectedIndex == index
//                                   ? Border.all(
//                                       width: 2.5,
//                                       color: Appcolor.buttonColor,
//                                     )
//                                   : Border.all(
//                                       width: 1,
//                                       color: Appcolor.buttonColor,
//                                     ),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 children: [
//                                   // Image.network(
//                                   //   'imageUrl',
//                                   //   fit: BoxFit.cover,
//                                   // ),
//                                   SizedBox(height: screenHeight * 0.005),
//                                   Text(
//                                     'componentsItem',
//                                     style: poppins(Appcolor.buttonColor, 10,
//                                         FontWeight.w500),
//                                   ),
//                                   SizedBox(height: screenHeight * 0.01),
//                                   BlueButton(
//                                     height: screenHeight * 0.05,
//                                     width: screenWidth * 0.4,
//                                     circularRadius: 10,
//                                     text: 'submit'.tr,
//                                     onTap: () {},
//                                     color: Appcolor.buttonColor,
//                                     textColor: Appcolor.white,
//                                     fontSize: 12,
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }
// }

class ComponentsContainer extends StatefulWidget {
  const ComponentsContainer({super.key, required this.productDetails});
  final Product? productDetails;

  @override
  State<ComponentsContainer> createState() => _ComponentsContainerState();
}

class _ComponentsContainerState extends State<ComponentsContainer> {
  final OneProductController oneProductController =
      Get.put(OneProductController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (oneProductController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Component>? components = widget.productDetails!.data.components;
        print('comp------?${components}');

        if (components.isEmpty) {
          return const Center(
            child: Text("No components available."),
          );
        }

        // Gather all component data
        List<Cabin> panels =
            components.expand((c) => c.panel ?? []).cast<Cabin>().toList();
        List<Cabin> floors =
            components.expand((c) => c.floor ?? []).cast<Cabin>().toList();
        List<Cabin> ceilings =
            components.expand((c) => c.ceiling ?? []).cast<Cabin>().toList();
        List<Cabin> handrails =
            components.expand((c) => c.handrail ?? []).cast<Cabin>().toList();
        List<Cabin> cabins =
            components.expand((c) => c.cabin ?? []).cast<Cabin>().toList();

        // Combine all component types and their names into lists
        List<List<Cabin>> allCabins = [
          panels,
          floors,
          ceilings,
          handrails,
          cabins
        ];
        List<String> componentNames = [
          'Panel',
          'Floor',
          'Ceiling',
          'Handrail',
          'Cabin'
        ];

        // Debug prints
        for (int i = 0; i < allCabins.length; i++) {
          print('${componentNames[i]} count: ${allCabins[i].length}');
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: allCabins.length,
          itemBuilder: (context, i) {
            int selectedIndex = -1;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    componentNames[i],
                    style: poppins(Appcolor.buttonColor, 14, FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.25,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: allCabins[i].length,
                    itemBuilder: (context, cabinIndex) {
                      final cabin = allCabins[i][cabinIndex];
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = cabinIndex;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Container(
                            width: screenWidth * 0.4,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 197, 229, 247),
                              border: selectedIndex == cabinIndex
                                  ? Border.all(
                                      width: 2.5,
                                      color: Appcolor.buttonColor,
                                    )
                                  : Border.all(
                                      width: 1,
                                      color: Appcolor.buttonColor,
                                    ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  if (cabin.gallery.isNotEmpty)
                                    Image.network(
                                      '${APIConstants.baseUrl}${cabin.gallery[0].url}',
                                      fit: BoxFit.cover,
                                      height: screenHeight * 0.12,
                                      width: screenWidth,
                                    ),
                                  Text(
                                    cabin.name,
                                    style: poppins(Appcolor.buttonColor, 10,
                                        FontWeight.w500),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  BlueButton(
                                    height: screenHeight * 0.05,
                                    width: screenWidth * 0.4,
                                    circularRadius: 10,
                                    text: 'submit'.tr,
                                    onTap: () {},
                                    color: Appcolor.buttonColor,
                                    textColor: Appcolor.white,
                                    fontSize: 12,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (allCabins[i].isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'No ${componentNames[i]} available',
                      style: poppins(Appcolor.buttonColor, 14, FontWeight.w500),
                    ),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
