import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class ServiceTypes extends StatelessWidget {
  const ServiceTypes({super.key, required this.image, required this.text, required this.onTap});
  final String image;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: screenWidth * 0.25,
        height: screenHeight * 0.12,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Appcolor.buttonColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 5, left: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                image,
                width: 40,
                height: 40,
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                text,
                style: poppins(Appcolor.buttonColor, 11, FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
