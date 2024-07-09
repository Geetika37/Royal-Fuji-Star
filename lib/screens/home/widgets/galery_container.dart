import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/home/models/oneproduct_model.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';

class GalleryContainer extends StatelessWidget {
  const GalleryContainer({
    super.key,
    required this.productDetails,
  });
  final Product? productDetails;

  @override
  Widget build(BuildContext context) {
    final List<Brochure>? gallery = productDetails!.data.gallery;
    print('galerr$gallery');
    return Padding(
        padding: const EdgeInsets.only(
          // top: 10,
          // bottom: 10,
          left: 20,
          right: 20,
        ),
        child: gallery!.isEmpty
            ? const SizedBox()
            : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  // mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  // final galleritem = gallery[index];
                  // final image = galleritem['formats']['thumbnail']['url'];
                  // final imageUrl = image != null && image.isNotEmpty
                  //     ? '${APIConstants.baseUrl}$image'
                  //     : null;
                  // print('${APIConstants.baseUrl}${galleritem['url']}');

                  // final gallery = products!.data.gallery;
                  final galleryItem = gallery[index];
                  print('gallery items----->$galleryItem');
                  // final imageurl =
                  //     '${APIConstants.baseUrl}${galleryItem['formats']['thumbnail']['url']}';
                  // print(
                  //     'gallery item---${galleritem['formats']['thumbnail']['url']}');
                  // print('image url===>$imageUrl');

                  //   return ClipRRect(
                  //     borderRadius: BorderRadius.circular(12.0),
                  //     child: Container(
                  //       height: screenHeight * 0.1,
                  //       decoration: imageurl.isNotEmpty
                  //           ? BoxDecoration(
                  //               image: DecorationImage(
                  //               image: NetworkImage(imageurl),
                  //               fit: BoxFit.cover,
                  //               filterQuality: FilterQuality.low,
                  //             ))
                  //           : null,
                  //     ),
                  //   );
                  // }),
                }));
  }
}
