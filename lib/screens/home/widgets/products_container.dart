import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/home/models/product.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class ProductsContainer extends StatefulWidget {
  const ProductsContainer({
    super.key,
  });

  @override
  State<ProductsContainer> createState() => _ProductsContainerState();
}

class _ProductsContainerState extends State<ProductsContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1.45,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: products[index].onTap,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Appcolor.white, width: 2.5),
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: const LinearGradient(
                        colors: [Color(0xFF00286A), Color(0xFF0052B6)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 30,
                      left: 50,
                      right: 50,
                    ),
                    child: SvgPicture.asset(products[index].imagePath),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 40,
                  left: 50,
                  child: Text(
                    products[index].text,
                    maxLines: 2,
                    style: poppins(Appcolor.white, 12, FontWeight.w600),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
