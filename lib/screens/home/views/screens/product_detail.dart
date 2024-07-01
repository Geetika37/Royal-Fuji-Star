import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                subTitle: productDetail['description'],
                maxLines: 7,
                fontSize: 10,
                color: Appcolor.blackPrimary,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: CustomTitle(
                textHeading: 'gallery'.tr,
                fontSize: 12,
                color: Appcolor.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            GalleryContainer(
              gallery: productDetail['gallery'],
            ),
            const Spacer(),
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: BlueButton(
                  fontSize: 14,
                  height: screenHeight * 0.06,
                  width: screenWidth,
                  circularRadius: 10,
                  text: 'enquiry'.tr,
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
