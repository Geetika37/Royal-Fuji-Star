import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/home/controller/oneproduct_controller.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/textcustom.dart';

class ComponentImage extends StatelessWidget {
  const ComponentImage(
      {super.key,
      required this.imageUrl,
      required this.description,
      required this.name});

  final String imageUrl;
  final String description;
  final String name;

  @override
  Widget build(BuildContext context) {
    final OneProductController oneProductController =
        Get.put(OneProductController());
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () {
            if (oneProductController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            if (oneProductController.errorMessage.isNotEmpty) {
              return Center(
                child: Text(
                  oneProductController.errorMessage.value,
                  style: const TextStyle(color: Colors.blue),
                ),
              );
            }

            return SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showImageZoom(context, imageUrl);
                          },
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.contain,
                            width: ScreenSize.getWidth(context),
                            height: ScreenSize.getHeight(context) * 0.65,
                          ),
                        ),
                        Positioned(
                          left: 15,
                          top: 20,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Appcolor.buttonColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: InkWell(
                              onTap: () => Get.back(),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Appcolor.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: ScreenSize.getWidth(context) * 0.03,
                        vertical: ScreenSize.getHeight(context) * 0.02,
                      ),
                      decoration: BoxDecoration(
                        color: Appcolor.buttonColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          name,
                          style: poppins(Appcolor.white, 17, FontWeight.w700),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenSize.getWidth(context) * 0.03),
                      child: CustomTitle(
                        textHeading: 'description'.tr,
                        fontSize: 16,
                        color: Appcolor.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenSize.getWidth(context) * 0.03),
                      child: CustomSubTitle(
                        subTitle: description,
                        maxLines: 7,
                        fontSize: 13,
                        color: Appcolor.blackPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void showImageZoom(BuildContext context, String imageUrl) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              backgroundColor: Colors.transparent,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    // height: double.infinity,
                    child: PhotoView(
                      imageProvider: NetworkImage(imageUrl),
                      backgroundDecoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Appcolor.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: InkWell(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.close,
                          color: Appcolor.buttonColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ));
        });
  }
}
