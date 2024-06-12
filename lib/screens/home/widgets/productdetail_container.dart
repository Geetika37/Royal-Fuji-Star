import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class ProductDetailContainer extends StatelessWidget {
  const ProductDetailContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.35,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/png/productbg.png'), fit: BoxFit.cover),
      ),
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
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFF263239),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset('assets/svg/share.svg'),
                  ),
                )
              ],
            ),
            Text(
              'MRL Passenger Elevator',
              style: poppins(Appcolor.white, 17, FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
