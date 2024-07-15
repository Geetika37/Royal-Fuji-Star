// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:royal_fuji_star/screens/home/controller/carousel_controller.dart';

// class CustomCarouselSlider extends StatefulWidget {
//   const CustomCarouselSlider({
//     super.key,
//   });

//   @override
//   State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
// }

// class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
//   // List imageList = [
//   //   {"id": 1, "image_path": "assets/png/slider1.png"},
//   //   {"id": 2, "image_path": "assets/png/slider2.png"},
//   //   {"id": 3, "image_path": "assets/png/slider3.png"},
//   // ];

//   final CarouselSliderController carouselSliderController=Get.put(CarouselSliderController());

//   final CarouselController carouselController = CarouselController();
//   int currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     final carouselImage=carouselSliderController.carouselImage.value;
//     return Column(
//       children: [
//         Stack(
//           children: [
//             InkWell(
//               onTap: () {},
//               child: CarouselSlider(
//                 items: carouselImage.data.length,
//                 carouselController: carouselController,
//                 options: CarouselOptions(
//                     scrollPhysics: const BouncingScrollPhysics(),
//                     autoPlay: true,
//                     aspectRatio: 2,
//                     viewportFraction: 1,
//                     onPageChanged: (index, reason) {
//                       setState(() {
//                         currentIndex = index;
//                       });
//                     }),
//               ),
//             ),
//             Positioned(
//               bottom: 10,
//               left: 0,
//               right: 0,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: imageList.asMap().entries.map((entry) {
//                   return GestureDetector(
//                     onTap: () => carouselController.animateToPage(entry.key),
//                     child: Container(
//                       width: currentIndex == entry.key ? 10 : 7,
//                       height: 7.0,
//                       margin: const EdgeInsets.symmetric(horizontal: 3.0),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: currentIndex == entry.key
//                               ? Colors.blue.shade200
//                               : Colors.grey.shade500),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             )
//           ],
//         )
//       ],
//     );
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/home/controller/carousel_controller.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final CarouselSliderController carouselSliderController =
      Get.put(CarouselSliderController());
  final CarouselController carouselController = CarouselController();
  final currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (carouselSliderController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      final carouselImage = carouselSliderController.carouselImage.value;
      if (carouselImage == null || carouselImage.data.isEmpty) {
        return Center(child: Text(carouselSliderController.errorMessage.value));
      }

      // Flatten the list of images
      final List<String> allImages = [];
      for (var entry in carouselImage.data) {
        for (var image in entry.images) {
          allImages.add('${APIConstants.baseUrl}${image.url}');
        }
      }

      return Column(
        children: [
          Stack(
            children: [
              InkWell(
                onTap: () {},
                child: CarouselSlider.builder(
                  itemCount: allImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final imageUrl = allImages[index];
                    return ClipRRect(
                      borderRadius:
                          BorderRadius.circular(15.0), // Circular border
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(child: Icon(Icons.error));
                        },
                      ),
                    );
                  },
                  carouselController: carouselController,
                  options: CarouselOptions(
                    scrollPhysics: const BouncingScrollPhysics(),
                    autoPlay: true,
                    aspectRatio: 2,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      currentIndex.value = index;
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: allImages.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => carouselController.animateToPage(entry.key),
                      child: Obx(() {
                        return Container(
                          clipBehavior: Clip.antiAlias,
                          width: currentIndex.value == entry.key ? 10 : 7,
                          height: 7.0,
                          margin: const EdgeInsets.symmetric(horizontal: 3.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: currentIndex.value == entry.key
                                ? Colors.blue.shade200
                                : Colors.grey.shade500,
                          ),
                        );
                      }),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
