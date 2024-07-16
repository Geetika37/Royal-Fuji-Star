// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:royal_fuji_star/constants/size.dart';
// import 'package:royal_fuji_star/screens/bottomnav/services/controllers/spare_category_subcategory_controller.dart';
// import 'package:royal_fuji_star/screens/bottomnav/services/controllers/sparecategory_controller.dart';
// import 'package:royal_fuji_star/screens/bottomnav/services/controllers/spare_subcategory_spare_controller.dart';
// import 'package:royal_fuji_star/utils/appcolor.dart';

// class CategoryAnimatedContainer extends StatelessWidget {
//   CategoryAnimatedContainer({super.key});

//   final SparecategoryController sparecategoryController =
//       Get.put(SparecategoryController());
//   final CategorySubcategoryController categorySubcategoryController =
//       Get.put(CategorySubcategoryController());
//   final SubcategorySparesController subcategorySparesController =
//       Get.put(SubcategorySparesController());

//   final RxInt selectedIndex = 1.obs;

//   @override
//   Widget build(BuildContext context) {
//     // // Load initial data
//     categorySubcategoryController.catSubCategory(1);
//     subcategorySparesController.subCategorySpares(1, 1);

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
//               return AnimatedPositioned(
//                 duration: const Duration(milliseconds: 200),
//                 left: selectedIndex.value * 128.0,
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
//               return Row(
//                 children: sparecategoryController.sparecategory
//                     .asMap()
//                     .entries
//                     .map((entry) => categories(
//                         entry.value['name'], entry.key, entry.value['id']))
//                     .toList(),
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
//           selectedIndex.value = index;

//           categorySubcategoryController.catSubCategory(id);
//           // print('cabin category item ---title$title---index$index---id$id');
//         },
//         child: Container(
//           alignment: Alignment.center,
//           child: Obx(() {
//             return Text(
//               title,
//               style: TextStyle(
//                 fontSize: 12,
//                 color: selectedIndex.value == index
//                     ? Appcolor.white
//                     : const Color.fromARGB(255, 133, 133, 133),
//                 fontWeight: FontWeight.w500,
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/controllers/spare_category_subcategory_controller.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/controllers/sparecategory_controller.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/controllers/spare_subcategory_spare_controller.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/shimmerloading.dart';

class CategoryAnimatedContainer extends StatelessWidget {
  CategoryAnimatedContainer({super.key});

  final SparecategoryController sparecategoryController =
      Get.put(SparecategoryController());
  final CategorySubcategoryController categorySubcategoryController =
      Get.put(CategorySubcategoryController());
  final SubcategorySparesController subcategorySparesController =
      Get.put(SubcategorySparesController());

  final RxInt selectedIndex = 2000.obs;

  @override
  Widget build(BuildContext context) {
    final spareValue = sparecategoryController.sparecategory;
    print('-sssparee valuee-->$spareValue');

    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Container(
        width: screenWidth,
        height: screenHeight * 0.04,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Appcolor.buttonColor),
        ),
        child: Stack(
          children: [
            Obx(() {
              double leftPosition = selectedIndex.value * (screenWidth * 0.34);
              if (Directionality.of(context) == TextDirection.rtl) {
                leftPosition = screenWidth -
                    (selectedIndex.value + 1) * (screenWidth * 0.34);
              }
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                left: leftPosition,
                child: Container(
                  width: screenWidth * 0.291,
                  height: screenHeight * 0.039,
                  decoration: BoxDecoration(
                    color: Appcolor.buttonColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              );
            }),
            Obx(() {
              if (sparecategoryController.isLoading.value) {
                return const Center(child: ShimmerLoading());
              }
              return Row(
                children: sparecategoryController.sparecategory
                    .map((category) => categories(
                        category['name'],
                        sparecategoryController.sparecategory.indexOf(category),
                        category['id']))
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
          // Update the index on tap
          selectedIndex.value = index;
          categorySubcategoryController.catSubCategory(id);
        },
        child: Container(
          alignment: Alignment.center,
          child: Obx(() {
            return Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: selectedIndex.value == index
                    ? Appcolor.white
                    : const Color.fromARGB(255, 133, 133, 133),
                fontWeight: FontWeight.w500,
              ),
            );
          }),
        ),
      ),
    );
  }
}
