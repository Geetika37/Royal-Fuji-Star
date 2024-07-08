
import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';

class GalleryContainer extends StatelessWidget {
  const GalleryContainer({
    super.key,
    this.gallery,
  });
  final List<dynamic>? gallery;

  @override
  Widget build(BuildContext context) {
    print('galleryimages----)))==$gallery');
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: gallery?.length ?? 0,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          final galleryImage = gallery?[index];
          print('galleryImage!!!-----$galleryImage');

          return Container(
            height: screenHeight * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                    'https://royalfuji.jissanto.com${galleryImage['url']}'),
                fit: BoxFit.cover,
              ),
            ),
          );
        });
  }
}
