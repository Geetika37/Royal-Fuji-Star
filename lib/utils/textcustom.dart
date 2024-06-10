import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class CustomSubTitle extends StatelessWidget {
  const CustomSubTitle({
    super.key,
    required this.subTitle,
    required this.maxLines,
  });
  final String subTitle;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: poppins(Appcolor.black, 11, FontWeight.w400),
      maxLines: maxLines,
    );
  }
}

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.textHeading,
    required this.fontSize,
  });
  final String textHeading;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      textHeading,
      style: poppins(Appcolor.buttonColor, fontSize, FontWeight.w500),
    );
  }
}
