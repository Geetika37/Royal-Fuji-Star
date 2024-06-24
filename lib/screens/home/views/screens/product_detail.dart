import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/home/widgets/productdetail_container.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/textcustom.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const ProductDetailContainer(),
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
            const Padding(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: CustomSubTitle(
                subTitle:
                    'Lorem ipsum dolor sit amet consectetur. Vitae tellus quam diam bibendum quam risus sit. Sit ut at viverra sodales convallis. Felis vel velit est risus et tempus amet phasellus bibendum. At fringilla dignissim.Lorem ipsum dolor sit amet consectetur. Vitae tellus quam diam bibendum quam risus sit. Sit ut at viverra sodales convallis. Felis vel velit est risus et tempus amet phasellus bibendum. At fringilla dignissim.',
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
            const GalleryContainer(),
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
