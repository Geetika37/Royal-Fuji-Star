import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/home/widgets/components_container.dart';
import 'package:royal_fuji_star/screens/home/widgets/productdetail_container.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
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
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: CustomTitle(
                textHeading: 'components'.tr,
                fontSize: 12,
                color: Appcolor.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            // GalleryContainer(
            //   gallery: productDetail['gallery'],
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: const CustomTitle(
                textHeading: 'Parts',
                fontSize: 12,
                color: Appcolor.buttonColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.19,
              child: const ComponentsContainer(),
            ),

            SizedBox(height: screenHeight * 0.05),
            // Center(
            //   child: BlueButton(
            //       fontSize: 14,
            //       height: screenHeight * 0.06,
            //       width: screenWidth * 0.9,
            //       circularRadius: 10,
            //       text: 'enquiry'.tr,
            //       onTap: () {},
            //       color: Appcolor.buttonColor,
            //       textColor: Appcolor.white),
            // )
          ],
        ),
      ),
    );
  }
}
