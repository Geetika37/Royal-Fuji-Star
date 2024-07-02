import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/controllers/subcategory_spare.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';

class LiftPartsContainer extends StatelessWidget {
  const LiftPartsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SubcategorySparesController subcategorySparesController =
        Get.put(SubcategorySparesController());

    return Obx(() {
      if (subcategorySparesController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      final spares = subcategorySparesController.spares;
      // print('---===spare item---==$spares');

      return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: spares.length,
          itemBuilder: (context, index) {
            final spareItem = spares[index];
            // print('---spare item )))$spareItem');

            final imageUrl = spareItem['gallery'] != null &&
                    spareItem['gallery'].isNotEmpty &&
                    spareItem['gallery'][0]['url'] != null
                ? 'https://royalfuji.jissanto.com${spareItem['gallery'][0]['url']}'
                : null;
            // print('image url--->$imageUrl');
            return Padding(
              padding:
                  const EdgeInsets.only(right: 10, left: 10, top: 4, bottom: 4),
              child: Container(
                width: screenWidth * 0.4,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 197, 229, 247),
                  border: Border.all(
                    width: 1,
                    color: Appcolor.buttonColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      imageUrl != null
                          ? Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                            )
                          : const SizedBox(),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        spareItem['name'],
                        style:
                            poppins(Appcolor.buttonColor, 10, FontWeight.w500),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      BlueButton(
                        height: screenHeight * 0.05,
                        width: screenWidth * 0.4,
                        circularRadius: 10,
                        text: 'enquiry'.tr,
                        onTap: () {},
                        color: Appcolor.buttonColor,
                        textColor: Appcolor.white,
                        fontSize: 12,
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }
}
