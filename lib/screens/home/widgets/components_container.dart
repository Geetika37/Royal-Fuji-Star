import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/home/controller/oneproduct_controller.dart';
import 'package:royal_fuji_star/screens/home/models/oneproduct_model.dart';
import 'package:royal_fuji_star/screens/home/widgets/component_image.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';

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

        final components = widget.productDetails!.data.components;

        return ListView.builder(
          // padding: const EdgeInsets.only(
          //   // right: 10,
          //   // left: 10,
          //   bottom: 10,
          // ),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: components.length,
          itemBuilder: (context, outerIndex) {
            final componentsItem = components[outerIndex];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 5,
                  ),
                  child: Text(
                    componentsItem.componentCollection.name,
                    style: poppins(Appcolor.buttonColor, 14, FontWeight.w500),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                SizedBox(
                  height: screenHeight * 0.22,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        componentsItem.componentCollection.componentList.length,
                    itemBuilder: (context, innerIndex) {
                      final componentList = componentsItem
                          .componentCollection.componentList[innerIndex];

                      final gallery =
                          componentList.image.formats!.thumbnail.url;

                      final imageUrl = '${APIConstants.baseUrl}$gallery';

                      return InkWell(
                        onTap: () {
                          oneProductController.selectedIndex.value = innerIndex;
                        },
                        child: Obx(
                          () => Container(
                            margin: const EdgeInsets.only(
                              // horizontal: screenWidth * 0.01,
                              left: 20,
                            ),
                            width: screenWidth * 0.4,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 197, 229, 247),
                              border:
                                  oneProductController.selectedIndex.value ==
                                          innerIndex
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
                                  InkWell(
                                    onTap: () {
                                      Get.to( ComponentImage(
                                        imageUrl: imageUrl,
                                        name: componentList.name,
                                        description: componentList.description,
                                      ));
                                    },
                                    child: SizedBox(
                                      height:
                                          ScreenSize.getHeight(context) * 0.1,
                                      width: ScreenSize.getWidth(context) * 0.3,
                                      child: Image.network(
                                        imageUrl,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  Text(
                                    componentList.name,
                                    style: poppins(Appcolor.buttonColor, 10,
                                        FontWeight.w500),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  BlueButton(
                                    height: screenHeight * 0.05,
                                    width: screenWidth * 0.4,
                                    circularRadius: 10,
                                    text: 'Select',
                                    onTap: () {},
                                    color: Appcolor.buttonColor,
                                    textColor: Appcolor.white,
                                    fontSize: 13,
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
              ],
            );
          },
        );
      },
    );
  }
}
