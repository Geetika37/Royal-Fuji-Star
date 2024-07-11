import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              borderRadius: BorderRadius.circular(10),
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
            shape: const RoundedRectangleBorder(),
            backgroundColor: Colors.transparent,
            child: Stack(
              children: [
                SizedBox(
                  // width: double.infinity,
                  // height: double.infinity,
                  child: PhotoViewGallery.builder(
                    scrollPhysics: const BouncingScrollPhysics(),
                    builder: (BuildContext context, int index) {
                      return PhotoViewGalleryPageOptions(
                        imageProvider: NetworkImage(
                          images[index],
                        ),
                        initialScale: PhotoViewComputedScale.contained,
                        heroAttributes:
                            PhotoViewHeroAttributes(tag: images[index]),
                      );
                    },
                    itemCount: images.length,
                    backgroundDecoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    pageController: PageController(initialPage: initialIndex),
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
      },
    );
  }
}
