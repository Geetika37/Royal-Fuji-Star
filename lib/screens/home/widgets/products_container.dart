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
            childAspectRatio: 1.4,
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
                        ? Image.network(
                            imageUrl,
                            fit: BoxFit.fill,
                          )
                        : const SizedBox(),
                    Container(
                      height: screenHeight * 0.03,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.black54.withOpacity(0.7),
                      ),
                      child: Center(
                        child: Text(
                          category['name'],
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
