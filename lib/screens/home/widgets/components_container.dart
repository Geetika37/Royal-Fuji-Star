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
  const ComponentsContainer(
      {super.key,
      required this.productDetails,
      required this.onSelectionChanged});
  final Product? productDetails;
  final Function(List<int>) onSelectionChanged;

  @override
  State<ComponentsContainer> createState() => _ComponentsContainerState();
}

class _ComponentsContainerState extends State<ComponentsContainer> {
  final OneProductController oneProductController =
      Get.put(OneProductController());

  final Map<String, RxInt> selectedIndices = {};
  final List<int> selectedComponentIds = [];

  @override
  void initState() {
    super.initState();
    if (widget.productDetails != null) {
      for (var component in widget.productDetails!.data.components) {
        selectedIndices[component.componentCollection.name] = (-1).obs;
      }
    }
  }

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
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: components.length,
          itemBuilder: (context, outerIndex) {
            final componentsItem = components[outerIndex];
            final componentName = componentsItem.componentCollection.name;

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
                      // final gallery =
                      //     componentList.image.formats!.thumbnail.url;
                      // final gallery =
                      //     componentList.image.formats?.thumbnail.url ?? '';

                      // final imageUrl = '${APIConstants.baseUrl}$gallery';
                      final gallery =
                          componentList.image.formats?.thumbnail.url ?? '';

                      final imageUrl = gallery.isNotEmpty
                          ? '${APIConstants.baseUrl}$gallery'
                          : null;

                      return InkWell(
                        child: Obx(
                          () {
                            final isSelected =
                                selectedIndices[componentName]?.value ==
                                    innerIndex;
                            return Container(
                              margin: const EdgeInsets.only(
                                left: 20,
                              ),
                              width: screenWidth * 0.4,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 197, 229, 247),
                                border: isSelected
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
                                        if (imageUrl != null) {
                                          Get.to(ComponentImage(
                                            imageUrl: imageUrl,
                                            name: componentList.name,
                                            description:
                                                componentList.description,
                                          ));
                                        }
                                      },
                                      child: SizedBox(
                                        height:
                                            ScreenSize.getHeight(context) * 0.1,
                                        width:
                                            ScreenSize.getWidth(context) * 0.3,
                                        child: imageUrl != null
                                            ? Image.network(
                                                imageUrl,
                                                fit: BoxFit.contain,
                                              )
                                            : const Placeholder(),
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
                                      text:
                                          isSelected ? 'unselect'.tr : 'select'.tr,
                                      onTap: () {
                                        setState(() {
                                          if (isSelected) {
                                            selectedComponentIds
                                                .remove(componentList.id);
                                            selectedIndices[componentName]
                                                ?.value = -1;
                                          } else {
                                            selectedComponentIds
                                                .add(componentList.id);
                                            selectedIndices[componentName]
                                                ?.value = innerIndex;
                                          }
                                        });

                                        widget.onSelectionChanged(
                                            selectedComponentIds);
                                      },
                                      color: Appcolor.buttonColor,
                                      textColor: Appcolor.white,
                                      fontSize: 13,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
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
