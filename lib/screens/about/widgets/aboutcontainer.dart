import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/textcustom.dart';

class Aboutcontainer extends StatelessWidget {
  const Aboutcontainer({super.key});

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.01),
              const CustomTitle(textHeading: 'Projects', fontSize: 16),
              SizedBox(height: screenHeight * 0.01),
              const CustomSubTitle(
                  subTitle:
                      'Exploring the heights of innovation, let’s have a deep look at our cutting-edge elevator projects in the UAE.',
                  maxLines: 2),
              SizedBox(height: screenHeight * 0.01),
              const CustomTitle(textHeading: 'Watch video', fontSize: 12),
            ],
          ),
        ),
      ),
    );
  }
}
