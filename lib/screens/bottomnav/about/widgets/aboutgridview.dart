import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/bottomnav/about/models/aboutitem.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class Aboutgridview extends StatelessWidget {
  Aboutgridview({super.key});
  final List<AboutGridType> about = [
    AboutGridType(title: '242', subTitle: 'abouttext6'.tr),
    AboutGridType(title: '17', subTitle: 'abouttext7'.tr),
    AboutGridType(title: '100+', subTitle: 'abouttext8'.tr),
    AboutGridType(title: '300+', subTitle: 'abouttext9'.tr),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: about.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.8,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Container(
          height: screenHeight * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: const Color.fromARGB(255, 227, 228, 229),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                about[index].title,
                style: poppins(Appcolor.buttonColor, 16, FontWeight.w600),
              ),
              Text(
                about[index].subTitle,
                style: poppins(Appcolor.buttonColor, 12, FontWeight.w400),
              ),
            ],
          ),
        );
      },
    );
  }
}
