import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/home/widgets/fileshare.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class ProductDetailContainer extends StatelessWidget {
  const ProductDetailContainer({
    super.key,
    this.productDetail,
    required this.productCategoryTitle,
  });
  final dynamic productDetail;
  final String productCategoryTitle;

  @override
  Widget build(BuildContext context) {
    final imageUrl = productDetail['mainImage'] != null &&
            productDetail['mainImage'].isNotEmpty &&
            productDetail['mainImage']['url'] != null
        ? 'https://royalfuji.jissanto.com${productDetail['mainImage']['url']}'
        : null;
    return Container(
      height: screenHeight * 0.35,
      decoration: imageUrl != null
          ? BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover),
            )
          : null,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 172, 172, 172),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: InkWell(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back,
                        color: Appcolor.buttonColor),
                  ),
                ),
                InkWell(
                  onTap: () {
                    shareFile(productDetail);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xFF263239),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset('assets/svg/share.svg'),
                    ),
                  ),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  productCategoryTitle,
                  style: poppins(Appcolor.white, 17, FontWeight.w700),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
