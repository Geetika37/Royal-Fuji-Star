import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/home/models/oneproduct_model.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';

// class GalleryContainer extends StatelessWidget {
//   const GalleryContainer({
//     super.key,
//     required this.productDetails,
//   });
//   final Product? productDetails;

//   @override
//   Widget build(BuildContext context) {
//     final List<Brochure>? gallery = productDetails!.data.gallery;
//     print('galerr$gallery');

//     return GridView.builder(
//         padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: gallery?.length ?? 0,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           mainAxisSpacing: 20,
//           crossAxisSpacing: 20,
//         ),
//         itemBuilder: (context, index) {
//           final galleryImage = gallery?[index];
//           print('galleryImage!!!-----$galleryImage');

//           return Container(
//             height: screenHeight * 0.1,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               image: DecorationImage(
//                 image: NetworkImage(
//                     '${APIConstants.baseUrl}${galleryImage!.url}'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           );
//         });
//   }
// }

class GalleryContainer extends StatelessWidget {
  const GalleryContainer({
    super.key,
    required this.productDetails,
  });
  final Product? productDetails;

  @override
  Widget build(BuildContext context) {
    final List<Brochure>? gallery = productDetails?.data.gallery ?? [];
    print('gallery: $gallery');

    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: gallery!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        final galleryImage = gallery[index];
        print('galleryImage: $galleryImage');

        return Container(
          height: screenHeight * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage('${APIConstants.baseUrl}${galleryImage.url}'),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

