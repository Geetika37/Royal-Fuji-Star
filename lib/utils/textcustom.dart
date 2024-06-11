import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';

class CustomSubTitle extends StatelessWidget {
  const CustomSubTitle({
    super.key,
    required this.subTitle,
    required this.maxLines,
    required this.fontSize, required this.color,
  });
  final String subTitle;
  final int maxLines;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: poppins(
         color, fontSize, FontWeight.w400),
      maxLines: maxLines,
    );
  }
}

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.textHeading,
    required this.fontSize,
    required this.color,
  });
  final String textHeading;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      textHeading,
      style: poppins(color, fontSize, FontWeight.w500),
    );
  }
}
