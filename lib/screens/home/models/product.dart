import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/home/views/screens/lift_parts.dart';
import 'package:royal_fuji_star/screens/home/views/screens/product_page.dart';

class Product {
  final Function() onTap;
  final String imagePath;
  final String text;

  Product({
    required this.onTap,
    required this.imagePath,
    required this.text,
  });
}

final List<Product> products = [
  Product(
      onTap: () => Get.to(const ProductPage()),
      imagePath: 'assets/svg/product1.svg',
      text: 'Elevators'),
  Product(
      onTap: () => Get.to(() => const ProductPage()),
      imagePath: 'assets/svg/product2.svg',
      text: 'Escalators'),
  Product(
      onTap: () => Get.to(() => const LiftParts()),
      imagePath: 'assets/svg/product3.svg',
      text: 'Cargo Lift'),
  Product(
      onTap: () => Get.to(() => const ProductPage()),
      imagePath: 'assets/svg/product4.svg',
      text: 'Dumbwaiter'),
  Product(
      onTap: () => Get.to(() => const ProductPage()),
      imagePath: 'assets/svg/product4.svg',
      text: 'Car Elevator'),
];
