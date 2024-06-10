import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/textformfield.dart';

class Annualcontainer extends StatelessWidget {
  const Annualcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.58,
      width: screenWidth,
      decoration: const BoxDecoration(
          color: Appcolor.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45))),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Brand',
              style: poppins(Appcolor.black, 12, FontWeight.w400),
            ),
            SizedBox(height: screenHeight * 0.01),
            Textformfield(
              textfieldWidth: screenWidth,
              hintText: 'Enter the brand name here',
              hintTextSize: 12,
            )
          ],
        ),
      ),
    );
  }
}
