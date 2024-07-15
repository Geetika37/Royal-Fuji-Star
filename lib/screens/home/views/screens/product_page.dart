import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/home/controller/categoryprod_controller.dart';
import 'package:royal_fuji_star/screens/home/controller/oneproduct_controller.dart';
import 'package:royal_fuji_star/screens/home/views/screens/product_detail.dart';
import 'package:royal_fuji_star/screens/widgets/customappbar.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/shimmerloading.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key, required this.productCategoryTitle});

  final String productCategoryTitle;
  final CategoryProductController categoryProductController =
      Get.put(CategoryProductController());
  final OneProductController oneProductController =
      Get.put(OneProductController());

  @override
  Widget build(BuildContext context) {
    final categoryProduct = categoryProductController.product;
    // print('categoryProduct ))) $categoryProduct');

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: productCategoryTitle,
            titleSpacing: screenWidth * 0.2,
          ),
        ),
        body: Obx(() {
          if (categoryProductController.isLoading.value) {
            return const Center(child: ShimmerLoading());
          }
          return ListView.builder(
            itemCount: categoryProduct.length,
            itemBuilder: (context, index) {
              final categoryProd = categoryProduct[index];
              // print('categoryProd%%%%----$categoryProd');
              final imageUrl = categoryProd['mainImage'] != null &&
                      categoryProd['mainImage'].isNotEmpty &&
                      categoryProd['mainImage']['url'] != null
                  ? 'https://royalfuji.jissanto.com${categoryProd['mainImage']['url']}'
                  : null;
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: InkWell(
                  onTap: () {
                    print('category id-->${categoryProd['id']}');
                    oneProductController.fetchProduct(categoryProd['id']);

                    Get.to(const ProductDetail());
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 197, 229, 247)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        right: 10,
                        left: 10,
                        bottom: 35,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          imageUrl != null
                              ? Image.network(
                                  imageUrl,
                                  height: screenHeight * 0.27,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                )
                              : const SizedBox(),
                          SizedBox(height: screenHeight * 0.015),
                          Text(
                            categoryProd['name'],
                            style: poppins(
                                Appcolor.buttonColor, 16, FontWeight.w600),
                          ),
                          SizedBox(height: screenHeight * 0.006),
                          Text(
                            'description'.tr,
                            style: poppins(
                                Appcolor.blackPrimary, 12, FontWeight.w500),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            categoryProd['description'],
                            style: poppins(
                                Appcolor.blackPrimary, 10, FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
