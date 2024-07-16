import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: screenWidth,
          child: Image.asset(
            'assets/png/bottomshadow.png',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, left: 8),
          child: Row(
            children: [
              Image.asset('assets/png/logo.png'),
              Text(
                'companyname'.tr,
                style: poppins(Appcolor.black, 12, FontWeight.w500),
              )
            ],
          ),
        )
      ],
    );
  }
}
