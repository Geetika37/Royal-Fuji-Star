import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/home/controller/categoryprod_controller.dart';
import 'package:royal_fuji_star/screens/home/controller/productcategory_controller.dart';
import 'package:royal_fuji_star/screens/home/views/screens/product_page.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class ProductsContainer extends StatelessWidget {
  final ProductCategoryController productCategoryController =
      Get.put(ProductCategoryController());

  ProductsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryProductController categoryProductController =
        Get.put(CategoryProductController());
    // productCategoryController.productCategory();
    return Obx(() {
      if (productCategoryController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      final productCategories = productCategoryController.product;

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: productCategories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.45,
          ),
          itemBuilder: (context, index) {
            final category = productCategories[index];
            print('category---$category');
            print('category ID---${category['id']}');

            final imageUrl = category['gallery'] != null &&
                    category['gallery'].isNotEmpty &&
                    category['gallery'][0]['url'] != null
                ? 'https://royalfuji.jissanto.com${category['gallery'][0]['url']}'
                : null;

            return InkWell(
              onTap: () {
                categoryProductController.categoryProduct(category['id']);
                Get.to(ProductPage(
                  productTitle: category['name'],
                ));
              },
              child: Stack(
                children: [
                  Container(
                    height: screenHeight * 0.15,
                    width: screenWidth * 0.41,
                    decoration: BoxDecoration(
                      border: Border.all(color: Appcolor.white, width: 2.5),
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: const LinearGradient(
                          colors: [Color(0xFF00286A), Color(0xFF0052B6)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 30,
                        left: 50,
                        right: 50,
                      ),
                      child: imageUrl != null
                          ? Image.network(imageUrl)
                          : const SizedBox(),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 40,
                    left: 40,
                    child: Text(
                      category['name'],
                      maxLines: 2,
                      style: poppins(Appcolor.white, 12, FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
