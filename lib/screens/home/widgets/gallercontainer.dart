// import 'package:flutter/material.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:royal_fuji_star/constants/size.dart';
// import 'package:royal_fuji_star/screens/home/models/oneproduct_model.dart';
// import 'package:royal_fuji_star/services/api_baseurl.dart';

// class GalleryContainer extends StatelessWidget {
//   const GalleryContainer({
//     super.key,
//     required this.productDetails,
//   });
//   final Product? productDetails;

//   @override
//   Widget build(BuildContext context) {
//     final List<Brochure>? gallery = productDetails?.data.gallery ?? [];
//     print('gallery: $gallery');

//     return GridView.builder(
//       padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: gallery!.length,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         mainAxisSpacing: 20,
//         crossAxisSpacing: 20,
//       ),
//       itemBuilder: (context, index) {
//         final galleryImage = gallery[index];
//         print('galleryImage: $galleryImage');

//         return Container(
//           height: screenHeight * 0.1,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             // image: DecorationImage(
//             //   image: NetworkImage('${APIConstants.baseUrl}${galleryImage.url}'),
//             //   fit: BoxFit.cover,
//             // ),
//           ),
//           child: PhotoView(
//             imageProvider:
//                 NetworkImage('${APIConstants.baseUrl}${galleryImage.url}'),
//           ),
//         );
//       },
//     );
//   }

// }

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/home/models/oneproduct_model.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class GalleryContainer extends StatelessWidget {
  const GalleryContainer({
    super.key,
    required this.productDetails,
  });

  final Product? productDetails;

  @override
  Widget build(BuildContext context) {
    final List<Brochure> gallery = productDetails?.data.gallery ?? [];
    final List<String> imageUrls = gallery
        .map((brochure) => '${APIConstants.baseUrl}${brochure.url}')
        .toList();

    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: gallery.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        // final galleryImage = gallery[index];

        return GestureDetector(
          onTap: () {
            _showImageDialog(context, imageUrls, index);
          },
          child: Container(
            height: screenHeight * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(imageUrls[index]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  void _showImageDialog(
      BuildContext context, List<String> images, int initialIndex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            width: double.infinity,
            // height: double.infinity,
            child: PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(
                    images[index],
                  ),
                  initialScale: PhotoViewComputedScale.contained,
                  heroAttributes: PhotoViewHeroAttributes(tag: images[index]),
                );
              },
              itemCount: images.length,
              backgroundDecoration:const BoxDecoration(
                color: Appcolor.black,
              ),
              pageController: PageController(initialPage: initialIndex),
            ),
          ),
        );
      },
    );
  }
}
