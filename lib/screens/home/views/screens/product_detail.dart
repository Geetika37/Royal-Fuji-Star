import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/home/widgets/productdetail_container.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/textcustom.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail(
      {super.key, this.productDetail, required this.productCategoryTitle});
  final dynamic productDetail;
  final String productCategoryTitle;

  @override
  Widget build(BuildContext context) {
    print('productdetails@@@@----$productDetail');
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            ProductDetailContainer(
              productDetail: productDetail,
              productCategoryTitle: productCategoryTitle,
            ),
            SizedBox(height: screenHeight * 0.01),
            const Padding(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: CustomTitle(
                textHeading: 'Description :',
                fontSize: 12,
                color: Appcolor.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: CustomSubTitle(
                subTitle: productDetail['description'],
                maxLines: 7,
                fontSize: 10,
                color: Appcolor.blackPrimary,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            const Padding(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: CustomTitle(
                textHeading: 'Gallery :',
                fontSize: 12,
                color: Appcolor.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            GalleryContainer(
              gallery: productDetail['gallery'],
            ),
            SizedBox(height: screenHeight * 0.01),
            Center(
              child: BlueButton(
                  fontSize: 14,
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.7,
                  circularRadius: 10,
                  text: 'Enquiry Now',
                  onTap: () {},
                  color: Appcolor.buttonColor,
                  textColor: Appcolor.white),
            )
          ],
        ),
      ),
    );
  }
}

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
        padding: const EdgeInsets.all(10),
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
