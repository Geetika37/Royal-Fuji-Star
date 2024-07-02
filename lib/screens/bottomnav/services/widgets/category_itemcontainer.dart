import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/controllers/category_subcategory_controller.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class CategoryItemcontainer extends StatefulWidget {
  const CategoryItemcontainer({super.key});

  @override
  State<CategoryItemcontainer> createState() => _CategoryItemcontainerState();
}

class _CategoryItemcontainerState extends State<CategoryItemcontainer> {
  final CategorySubcategoryController categorySubcategoryController =
      Get.put(CategorySubcategoryController());

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (categorySubcategoryController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      final subCategory = categorySubcategoryController.subCategory;
      // print('sub category===>$subCategory');
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: subCategory.length,
        itemBuilder: (context, index) {
          final categoryItem = subCategory[index];
          // print('category item===>$categoryItem');
          final iconUrl = categoryItem['icon'] != null &&
                  categoryItem['icon'].isNotEmpty &&
                  categoryItem['icon']['url'] != null
              ? 'https://royalfuji.jissanto.com${categoryItem['icon']['url']}'
              : null;
          // print('imagee---->$iconUrl');
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Column(
                children: [
                  Container(
                    height: screenHeight * 0.06,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Appcolor.buttonColor,
                        ),
                        color: selectedIndex == index
                            ? Appcolor.buttonColor
                            : Appcolor.bgColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 12, right: 12),
                      child: iconUrl != null
                          ? Image.network(
                              iconUrl,
                              // ignore: deprecated_member_use
                              // color: selectedIndex == index
                              //     ? Appcolor.white
                              //     : Appcolor.buttonColor,
                            )
                          : const SizedBox(),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.008),
                  Text(
                    categoryItem['name'],
                    style: selectedIndex == index
                        ? poppins(Appcolor.buttonColor, 11, FontWeight.w400)
                        : poppins(Appcolor.black, 11, FontWeight.w400),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
