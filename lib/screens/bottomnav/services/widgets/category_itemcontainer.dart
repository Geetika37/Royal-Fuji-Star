// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:royal_fuji_star/constants/size.dart';
// import 'package:royal_fuji_star/constants/textstyle.dart';
// import 'package:royal_fuji_star/screens/bottomnav/services/controllers/spare_category_subcategory_controller.dart';
// import 'package:royal_fuji_star/screens/bottomnav/services/controllers/spare_subcategory_spare_controller.dart';
// import 'package:royal_fuji_star/utils/appcolor.dart';

// class CategoryItemContainer extends StatelessWidget {
//   CategoryItemContainer({super.key});

//   final CategorySubcategoryController categorySubcategoryController =
//       Get.put(CategorySubcategoryController());

//   final SubcategorySparesController subcategorySparesController =
//       Get.put(SubcategorySparesController());

//   final RxInt selectedIndex = 0.obs;

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (categorySubcategoryController.isLoading.value) {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       }
//       final subCategory = categorySubcategoryController.subCategory;

//       return ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: subCategory.length,
//         itemBuilder: (context, index) {
//           final categoryItem = subCategory[index];
//           final iconUrl = categoryItem['icon'] != null &&
//                   categoryItem['icon'].isNotEmpty &&
//                   categoryItem['icon']['url'] != null
//               ? 'https://royalfuji.jissanto.com${categoryItem['icon']['url']}'
//               : null;

//           final categoryId = categoryItem['categories'][0]['id'];
//           // final categoryName = categoryItem['categories'][0]['name'];

//           return Padding(
//             padding: const EdgeInsets.only(left: 10, right: 10),
//             child: GestureDetector(
//               onTap: () {
//                 selectedIndex.value = index;
//                 subcategorySparesController.spare.value = null;
//                 subcategorySparesController.subCategorySpares(
//                     categoryItem['id'], categoryId);
//               },
//               child: Obx(() => Column(
//                     children: [
//                       Container(
//                         constraints: BoxConstraints(
//                           minHeight: ScreenSize.getHeight(context) * 0.07,
//                           maxWidth: ScreenSize.getWidth(context) * 0.15,
//                         ),
//                         height: screenHeight * 0.06,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             width: 1,
//                             color: Appcolor.buttonColor,
//                           ),
//                           color: selectedIndex.value == index
//                               ? Appcolor.buttonColor
//                               : Appcolor.bgColor,
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(10)),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 10, horizontal: 12),
//                           child: iconUrl != null
//                               ? Image.network(iconUrl)
//                               : const SizedBox(),
//                         ),
//                       ),
//                       SizedBox(height: screenHeight * 0.008),
//                       Text(
//                         categoryItem['name'],
//                         style: selectedIndex.value == index
//                             ? poppins(Appcolor.buttonColor, 11, FontWeight.w400)
//                             : poppins(Appcolor.black, 11, FontWeight.w400),
//                       ),
//                     ],
//                   )),
//             ),
//           );
//         },
//       );
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/controllers/spare_category_subcategory_controller.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/controllers/spare_subcategory_spare_controller.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class CategoryItemContainer extends StatelessWidget {
  CategoryItemContainer({Key? key});

  final CategorySubcategoryController categorySubcategoryController =
      Get.put(CategorySubcategoryController());

  final SubcategorySparesController subcategorySparesController =
      Get.put(SubcategorySparesController());

  final RxInt selectedIndex = 2000.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (categorySubcategoryController.isLoading.value) {
        return _buildShimmerListView();
      }
      final subCategory = categorySubcategoryController.subCategory;

      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: subCategory.length,
        itemBuilder: (context, index) {
          final categoryItem = subCategory[index];
          final iconUrl = categoryItem['icon'] != null &&
                  categoryItem['icon'].isNotEmpty &&
                  categoryItem['icon']['url'] != null
              ? 'https://royalfuji.jissanto.com${categoryItem['icon']['url']}'
              : null;

          final categoryId = categoryItem['categories'][0]['id'];
          // final categoryName = categoryItem['categories'][0]['name'];

          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: GestureDetector(
              onTap: () {
                selectedIndex.value = index;
                subcategorySparesController.spare.value = null;
                subcategorySparesController.subCategorySpares(
                    categoryItem['id'], categoryId);
              },
              child: Obx(() => Column(
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          minHeight: ScreenSize.getHeight(context) * 0.07,
                          maxWidth: ScreenSize.getWidth(context) * 0.15,
                        ),
                        height: screenHeight * 0.06,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Appcolor.buttonColor,
                          ),
                          color: selectedIndex.value == index
                              ? Appcolor.buttonColor
                              : Appcolor.bgColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          child: iconUrl != null
                              ? Image.network(iconUrl)
                              : const SizedBox(),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.008),
                      Text(
                        categoryItem['name'],
                        style: selectedIndex.value == index
                            ? poppins(Appcolor.buttonColor, 11, FontWeight.w400)
                            : poppins(Appcolor.black, 11, FontWeight.w400),
                      ),
                    ],
                  )),
            ),
          );
        },
      );
    });
  }

  Widget _buildShimmerListView() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Adjust according to your design
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Container(
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                      color: Appcolor.buttonColor,
                      width: 1,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.008),
                Container(
                  height: screenHeight * 0.02,
                  width: screenWidth * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
