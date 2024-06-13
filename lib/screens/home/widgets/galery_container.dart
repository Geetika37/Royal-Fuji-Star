
import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';

class GalleryContainer extends StatelessWidget {
  const GalleryContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Container(
            height: screenHeight * 0.1,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/png/galleryimage.png'))),
          );
        });
  }
}
