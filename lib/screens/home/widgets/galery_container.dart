import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';

class GalleryContainer extends StatelessWidget {
  const GalleryContainer({
    super.key,
    this.gallery,
  });
  final dynamic gallery;

  @override
  Widget build(BuildContext context) {
    // print('galleryy-----$gallery');
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 20,
        right: 20,
      ),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: gallery.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final galleritem = gallery[index];
            final imageUrl =
                galleritem['url'] != null && galleritem['url'].isNotEmpty
                    ? '${APIConstants.baseUrl}${galleritem['url']}'
                    : null;
            // print('${APIConstants.baseUrl}${galleritem['url']}');
            // print(galleritem);
            // print('image url===>$imageUrl');

            return ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                height: screenHeight * 0.1,
                decoration: imageUrl != null
                    ? BoxDecoration(
                        image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.low,
                      ))
                    : null,
              ),
            );
          }),
    );
  }
}
