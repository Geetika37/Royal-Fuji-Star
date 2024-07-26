// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:royal_fuji_star/constants/size.dart';
// import 'package:royal_fuji_star/constants/textstyle.dart';
// import 'package:royal_fuji_star/screens/home/controller/categoryprod_controller.dart';
// import 'package:royal_fuji_star/screens/home/controller/productcategory_controller.dart';
// import 'package:royal_fuji_star/screens/home/views/screens/product_page.dart';
// import 'package:royal_fuji_star/utils/appcolor.dart';
// import 'package:royal_fuji_star/utils/shimmerloading.dart';

// class ProductsContainer extends StatefulWidget {
//   const ProductsContainer({super.key});

//   @override
//   State<ProductsContainer> createState() => _ProductsContainerState();
// }

// class _ProductsContainerState extends State<ProductsContainer> {
//   final ProductCategoryController productCategoryController =
//       Get.put(ProductCategoryController());

//   @override
//   void initState() {
//     super.initState();
//     productCategoryController.loadLocale();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final CategoryProductController categoryProductController =
//         Get.put(CategoryProductController());
//     return Obx(() {
//       if (productCategoryController.isLoading.value) {
//         return const Center(child: ShimmerLoading());
//       }

//       final productCategories = productCategoryController.product;

//       return SizedBox(
//         child: GridView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: productCategories.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 8,
//             crossAxisSpacing: 8,
//             childAspectRatio: 1.0,
//           ),
//           itemBuilder: (context, index) {
//             final category = productCategories[index];

//             final imageUrl = category['image'] != null &&
//                     category['image'].isNotEmpty &&
//                     category['image']['url'] != null
//                 ? 'https://royalfuji.jissanto.com${category['image']['url']}'
//                 : null;

//             return InkWell(
//               onTap: () {
//                 categoryProductController.categoryProduct(category['id']);
//                 Get.to(ProductPage(
//                   productCategoryTitle: category['name'],
//                 ));
//               },
//               child: Container(
//                 clipBehavior: Clip.antiAlias,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Appcolor.white, width: 2.5),
//                 ),
//                 child: Column(
//                   children: [
//                     imageUrl != null
//                         ? Expanded(
//                             child: Image.network(
//                               imageUrl,
//                               fit: BoxFit.cover,
//                               width: double.infinity,
//                             ),
//                           )
//                         : const SizedBox(),
//                     Container(
//                       height: screenHeight * 0.05,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: Colors.black54.withOpacity(0.7),
//                       ),
//                       child: Center(
//                         child: Text(
//                           category['name'] ?? '',
//                           maxLines: 2,
//                           style: poppins(Appcolor.white, 12, FontWeight.w600),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       );
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/home/controller/categoryprod_controller.dart';
import 'package:royal_fuji_star/screens/home/controller/productcategory_controller.dart';
import 'package:royal_fuji_star/screens/home/views/screens/product_page.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:shimmer/shimmer.dart';

class ProductsContainer extends StatefulWidget {
  const ProductsContainer({super.key});

  @override
  State<ProductsContainer> createState() => _ProductsContainerState();
}

class _ProductsContainerState extends State<ProductsContainer> {
  final ProductCategoryController productCategoryController =
      Get.put(ProductCategoryController());

  @override
  void initState() {
    super.initState();
    productCategoryController.loadLocale();
  }

  @override
  Widget build(BuildContext context) {
    final CategoryProductController categoryProductController =
        Get.put(CategoryProductController());
    return Obx(() {
      if (productCategoryController.isLoading.value) {
        return const Center(child: ShimmerLoadingGrid());
      }

      final productCategories = productCategoryController.product;

      return SizedBox(
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: productCategories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) {
            final category = productCategories[index];

            final imageUrl = category['image'] != null &&
                    category['image'].isNotEmpty &&
                    category['image']['url'] != null
                ? 'https://royalfuji.jissanto.com${category['image']['url']}'
                : null;

            return InkWell(
              onTap: () {
                categoryProductController.categoryProduct(category['id']);
                Get.to(ProductPage(
                  productCategoryTitle: category['name'],
                ));
              },
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  border: Border.all(color: Appcolor.white, width: 2.5),
                ),
                child: Column(
                  children: [
                    imageUrl != null
                        ? Expanded(
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          )
                        : const SizedBox(),
                    Container(
                      height: screenHeight * 0.05,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black54.withOpacity(0.7),
                      ),
                      child: Center(
                        child: Text(
                          category['name'] ?? '',
                          maxLines: 2,
                          style: poppins(Appcolor.white, 12, FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}

class ShimmerLoadingGrid extends StatelessWidget {
  const ShimmerLoadingGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4, // Number of shimmer items to show while loading
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Appcolor.white, width: 2.5),
            ),
          ),
        );
      },
    );
  }
}
