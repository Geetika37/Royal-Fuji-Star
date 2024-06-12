import 'package:flutter/material.dart';
import 'package:royal_fuji_star/screens/home/widgets/productdetail_container.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            ProductDetailContainer(),
          ],
        ),
      ),
    );
  }
}
