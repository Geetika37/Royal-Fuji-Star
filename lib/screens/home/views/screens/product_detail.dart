import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/home/controller/oneproduct_controller.dart';
import 'package:royal_fuji_star/screens/home/widgets/gallercontainer.dart';
import 'package:royal_fuji_star/screens/home/widgets/productdetail_container.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/textcustom.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final OneProductController oneProductController =
        Get.put(OneProductController());

    return SafeArea(
      child: Scaffold(
        body: Obx(() {
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

          final product = oneProductController.product.value;

          // if (product == null) {
          //   return const Center(child: Text('No product details available.'));
          // }
          return ListView(
            children: [
              ProductDetailContainer(productDetails: product),
              SizedBox(height: screenHeight * 0.01),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: CustomTitle(
                  textHeading: 'description'.tr,
                  fontSize: 12,
                  color: Appcolor.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: CustomSubTitle(
                  subTitle: product!.data.description,
                  maxLines: 7,
                  fontSize: 10,
                  color: Appcolor.blackPrimary,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: CustomTitle(
                  textHeading: 'gallery'.tr,
                  fontSize: 12,
                  color: Appcolor.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const GalleryContainer(),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: CustomTitle(
                  textHeading: 'components'.tr,
                  fontSize: 12,
                  color: Appcolor.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: const CustomTitle(
                  textHeading: 'Parts',
                  fontSize: 12,
                  color: Appcolor.buttonColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // SizedBox(
              //   height: screenHeight * 0.20,
              //   child: const ComponentsContainer(),
              // ),
              SizedBox(height: screenHeight * 0.05),
              Center(
                child: BlueButton(
                    fontSize: 14,
                    height: screenHeight * 0.06,
                    width: screenWidth * 0.9,
                    circularRadius: 10,
                    text: 'enquiry'.tr,
                    onTap: () {},
                    color: Appcolor.buttonColor,
                    textColor: Appcolor.white),
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          );
        }),
      ),
    );
  }
}

// class ComponentsContainer {
//   const ComponentsContainer();
// }



// class ProductView extends StatefulWidget {
//   const ProductView({super.key});

//   @override
//   State<ProductView> createState() => _ProductViewState();
// }

// class _ProductViewState extends State<ProductView> {
//   final ProductController controller = Get.put(ProductController());

//   @override
//   void initState() {
//     controller.fetchProduct();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Product Details'),
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         } else {
//           return SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Display product details
//                 Text('Product Name: ${controller.product.name}'),
//                 Text('Description: ${controller.product.description}'),
//                 Text('Category: ${controller.product.productCategory.name}'),
//                 // Display main image
//                 Image.network(
//                   'https://royalfuji.jissanto.com${controller.product.mainImage.url}',
//                   width: 200,
//                   height: 200,
//                   fit: BoxFit.cover,
//                 ),

//                 SizedBox(height: 16),

//                 // Display components horizontally
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context)
//                       .size
//                       .height, //djust height as needed
//                   child: ListView.builder(
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     scrollDirection: Axis.vertical,
//                     itemCount: controller.product.components.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       ProductComponent component =
//                           controller.product.components[index];

//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Component ${index + 1}:'),
//                           SizedBox(
//                             height: 120,
//                             width: MediaQuery.of(context)
//                                 .size
//                                 .width, // Adjust height as needed
//                             child: ListView.builder(
//                               scrollDirection: Axis.horizontal,
//                               itemCount: component.panel.length,
//                               itemBuilder:
//                                   (BuildContext context, int panelIndex) {
//                                 ComponentItem panel =
//                                     component.panel[panelIndex];
//                                 return Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text('Panel Name: ${panel.name}'),
//                                     SizedBox(
//                                       width: 300,
//                                       height: 100, // Adjust height as needed
//                                       child: ListView.builder(
//                                         scrollDirection: Axis.horizontal,
//                                         itemCount: panel.gallery.length,
//                                         itemBuilder: (BuildContext context,
//                                             int imageIndex) {
//                                           GalleryItem image =
//                                               panel.gallery[imageIndex];
//                                           return Padding(
//                                             padding: const EdgeInsets.all(4.0),
//                                             child: Image.network(
//                                               'https://royalfuji.jissanto.com${image.url}',
//                                               width: 100,
//                                               height: 100,
//                                               fit: BoxFit.cover,
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ],
//                                 );
//                               },
//                             ),
//                           ),
//                           const Divider(),
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//       }),
//     );
//   }
// }
