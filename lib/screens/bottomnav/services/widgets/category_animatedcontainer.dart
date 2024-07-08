import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/controllers/category_subcategory_controller.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/controllers/sparecategory_controller.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/controllers/subcategory_spare.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class CategoryAnimatedcontainer extends StatefulWidget {
  const CategoryAnimatedcontainer({super.key});

  @override
  State<CategoryAnimatedcontainer> createState() =>
      _CategoryAnimatedcontainerState();
}

class _CategoryAnimatedcontainerState extends State<CategoryAnimatedcontainer> {
  int selectedIndex = 1;
  final SparecategoryController sparecategoryController =
      Get.put(SparecategoryController());
  final CategorySubcategoryController categorySubcategoryController =
      Get.put(CategorySubcategoryController());
  final SubcategorySparesController subcategorySparesController =
      Get.put(SubcategorySparesController());

  @override
  void initState() {
    super.initState();
    categorySubcategoryController.catSubCategory(3);
    subcategorySparesController.subCategorySpares(1);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Container(
        width: screenWidth,
        height: screenHeight * 0.04,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Appcolor.buttonColor),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              left: selectedIndex * 128.0,
              child: Container(
                width: screenWidth * 0.295,
                height: screenHeight * 0.039,
                decoration: BoxDecoration(
                  color: Appcolor.buttonColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Obx(() {
              if (sparecategoryController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              return Row(
                children: sparecategoryController.sparecategory
                    .asMap()
                    .entries
                    .map((entry) => categories(
                        entry.value['name'], entry.key, entry.value['id']))
                    .toList(),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget categories(String title, int index, int id) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
          categorySubcategoryController.catSubCategory(id);
        },
        child: Container(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: selectedIndex == index
                  ? Appcolor.white
                  : const Color.fromARGB(255, 133, 133, 133),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:royal_fuji_star/constants/size.dart';
// import 'package:royal_fuji_star/screens/bottomnav/services/controllers/category_subcategory_controller.dart';
// import 'package:royal_fuji_star/screens/bottomnav/services/controllers/sparecategory_controller.dart';
// import 'package:royal_fuji_star/utils/appcolor.dart';

// class CategoryAnimatedcontainer extends StatefulWidget {
//   const CategoryAnimatedcontainer({super.key});

//   @override
//   State<CategoryAnimatedcontainer> createState() =>
//       _CategoryAnimatedcontainerState();
// }

// class _CategoryAnimatedcontainerState extends State<CategoryAnimatedcontainer> {
//   int selectedIndex = 1;
//   final SparecategoryController sparecategoryController =
//       Get.put(SparecategoryController());
//   final CategorySubcategoryController categorySubcategoryController =
//       Get.put(CategorySubcategoryController());

//   @override
//   void initState() {
//     super.initState();
//     // Fetch data for the initially selected category

//     categorySubcategoryController
//         .catSubCategory(2); // Fetch subcategories for ID 1
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 10, left: 10),
//       child: Container(
//         width: screenWidth,
//         height: screenHeight * 0.04,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: Appcolor.buttonColor),
//         ),
//         child: Stack(
//           children: [
//             Obx(() {
//               if (sparecategoryController.isLoading.value) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//               if (sparecategoryController.sparecategory.isEmpty) {
//                 print("Category list is empty");
//                 return const Center(child: Text('No categories available'));
//               }
//               return AnimatedPositioned(
//                 duration: const Duration(milliseconds: 200),
//                 left: selectedIndex * (screenWidth * 0.295),
//                 child: Container(
//                   width: screenWidth * 0.295,
//                   height: screenHeight * 0.039,
//                   decoration: BoxDecoration(
//                     color: Appcolor.buttonColor,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               );
//             }),
//             Obx(() {
//               if (sparecategoryController.isLoading.value) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//               if (sparecategoryController.sparecategory.isEmpty) {
//                 return const Center(child: Text('No categories available'));
//               }
//               return Row(
//                 children: sparecategoryController.sparecategory
//                     .asMap()
//                     .entries
//                     .map((entry) {
//                   print(
//                       "Category: ${entry.value['name']}, Index: ${entry.key}");
//                   return categories(
//                       entry.value['name'], entry.key, entry.value['id']);
//                 }).toList(),
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget categories(String title, int index, int id) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: () {
//           setState(() {
//             selectedIndex = index;
//           });
//           categorySubcategoryController.catSubCategory(id);
//         },
//         child: Container(
//           alignment: Alignment.center,
//           child: Text(
//             title,
//             style: TextStyle(
//               fontSize: 12,
//               color: selectedIndex == index
//                   ? Appcolor.white
//                   : const Color.fromARGB(255, 133, 133, 133),
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
