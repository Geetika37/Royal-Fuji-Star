import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/home/views/screens/product_detail.dart';

class EscalatorList {
  final String imagePath, title, subTitle, description;
  final Function() onTap;
  EscalatorList(
      {required this.imagePath,
      required this.title,
      required this.subTitle,
      required this.description,
      required this.onTap});
}

final List<EscalatorList> escalatorList = [
  EscalatorList(
    imagePath: 'assets/png/elevator.png',
    title: 'MRL Passenger lift',
    subTitle: 'Description :',
    description:
        'Lorem ipsum dolor sit amet consectetur. Vitae tellus quam diam bibendum quam risus sit. Sit ut at viverra sodales convallis. Felis vel velit est risus et tempus amet phasellus bibendum. At fringilla dignissim. Lorem ipsum dolor sit amet consectetur. ',
    onTap: () => Get.to(const ProductDetail()),
  ),
  EscalatorList(
    imagePath: 'assets/png/elevator.png',
    title: 'MRL Passenger lift',
    subTitle: 'Description :',
    description:
        'Lorem ipsum dolor sit amet consectetur. Vitae tellus quam diam bibendum quam risus sit. Sit ut at viverra sodales convallis. Felis vel velit est risus et tempus amet phasellus bibendum. At fringilla dignissim. Lorem ipsum dolor sit amet consectetur. ',
    onTap: () => Get.to(const ProductDetail()),
  ),
  EscalatorList(
    imagePath: 'assets/png/elevator.png',
    title: 'MRL Passenger lift',
    subTitle: 'Description :',
    description:
        'Lorem ipsum dolor sit amet consectetur. Vitae tellus quam diam bibendum quam risus sit. Sit ut at viverra sodales convallis. Felis vel velit est risus et tempus amet phasellus bibendum. At fringilla dignissim. Lorem ipsum dolor sit amet consectetur. ',
    onTap: () => Get.to(const ProductDetail()),
  ),
  EscalatorList(
    imagePath: 'assets/png/elevator.png',
    title: 'MRL Passenger lift',
    subTitle: 'Description :',
    description:
        'Lorem ipsum dolor sit amet consectetur. Vitae tellus quam diam bibendum quam risus sit. Sit ut at viverra sodales convallis. Felis vel velit est risus et tempus amet phasellus bibendum. At fringilla dignissim. Lorem ipsum dolor sit amet consectetur. ',
    onTap: () => Get.to(const ProductDetail()),
  ),
];
