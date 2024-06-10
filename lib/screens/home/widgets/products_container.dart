import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal_fuji_star/constants/size.dart';
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
  final List<Product> products = [
    Product(imagePath: 'assets/svg/product1.svg', text: 'Elevators'),
    Product(imagePath: 'assets/svg/product2.svg', text: 'Escalators'),
    Product(imagePath: 'assets/svg/product3.svg', text: 'Lift Parts'),
    Product(imagePath: 'assets/svg/product4.svg', text: 'More'),
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Appcolor.white, width: 2.5),
                borderRadius: BorderRadius.circular(8.0),
                gradient: const LinearGradient(
                    colors: [Color(0xFF00286A), Color(0xFF0052B6)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SvgPicture.asset(products[index].imagePath),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      products[index].text,
                      style: poppins(Appcolor.white, 12, FontWeight.w600),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
