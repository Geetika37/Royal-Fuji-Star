import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/home/controller/oneproduct_controller.dart';
import 'package:royal_fuji_star/screens/home/controller/oneproduct_enquiry_controller.dart';
import 'package:royal_fuji_star/screens/home/models/oneproduct_model.dart';
import 'package:royal_fuji_star/screens/home/widgets/components_container.dart';
import 'package:royal_fuji_star/screens/home/widgets/gallercontainer.dart';
import 'package:royal_fuji_star/screens/home/widgets/productdetail_container.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/shimmerloading.dart';
import 'package:royal_fuji_star/utils/textcustom.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({
    super.key,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final List<int> selectedComponentIds = [];
  @override
  Widget build(BuildContext context) {
    final OneProductController oneProductController =
        Get.put(OneProductController());
    final OneproductEnquiryController oneproductEnquiryController =
        Get.put(OneproductEnquiryController());

    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          if (oneProductController.isLoading.value) {
            return const Center(child: ShimmerLoading());
          }

          if (oneProductController.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                oneProductController.errorMessage.value,
                style: const TextStyle(color: Colors.blue),
              ),
            );
          }

          final product = oneProductController.product.value;
          final List<Brochure>? gallery = product!.data.gallery;
          final List<Component> components = product.data.components;

          return SizedBox(
            height: ScreenSize.getHeight(context),
            width: ScreenSize.getWidth(context),
            child: ListView(
              children: [
                ProductDetailContainer(productDetails: product),
                SizedBox(height: screenHeight * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: CustomTitle(
                    textHeading: 'description'.tr,
                    fontSize: 14,
                    color: Appcolor.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: CustomSubTitle(
                    subTitle: product.data.description,
                    maxLines: 7,
                    fontSize: 12,
                    color: Appcolor.blackPrimary,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                gallery == null
                    ? const SizedBox()
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05),
                        child: CustomTitle(
                          textHeading: 'gallery'.tr,
                          fontSize: 14,
                          color: Appcolor.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                SizedBox(height: screenHeight * 0.02),
                GalleryContainer(productDetails: product),
                SizedBox(height: screenHeight * 0.02),
                components.isEmpty
                    ? const SizedBox()
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05),
                        child: CustomTitle(
                          textHeading: 'components'.tr,
                          fontSize: 14,
                          color: Appcolor.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                // SizedBox(height: screenHeight * 0.01),
                ComponentsContainer(
                  productDetails: product,
                  onSelectionChanged: (selectedIds) {
                    setState(() {
                      selectedComponentIds.clear();
                      selectedComponentIds.addAll(selectedIds);
                    });
                  },
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Center(
                  child: Obx(
                    () => BlueButtonn(
                      color: Appcolor.buttonColor,
                      height: screenHeight * 0.06,
                      width: screenWidth * 0.9,
                      circularRadius: 10,
                      text: oneproductEnquiryController.isLoading.value
                          ? LoadingAnimationWidget.prograssiveDots(
                              size: 35,
                              color: Appcolor.white,
                            )
                          : Text(
                              'enquiry'.tr,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Appcolor.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                      onTap: () async {
                        oneproductEnquiryController.saveEnquiryOneProduct(
                          product.data.id,
                          selectedComponentIds,
                        );
                      },
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          );
        }),
      ),
    );
  }
}
