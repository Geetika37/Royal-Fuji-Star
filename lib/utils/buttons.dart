import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class BlueButton extends StatelessWidget {
  const BlueButton({
    super.key,
    required this.height,
    required this.width,
    required this.circularRadius,
    required this.text,
    required this.onTap,
    required this.color,
    required this.textColor,
    required this.fontSize,
  });
  final double height, width, circularRadius, fontSize;
  final String text;
  final Function() onTap;
  final Color color, textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(circularRadius),
        ),
        child: Center(
            child: Text(
          text,
          style: poppins(
            textColor,
            fontSize,
            FontWeight.w600,
          ),
        )),
      ),
    );
  }
}

class BlueButtonOutlined extends StatelessWidget {
  const BlueButtonOutlined({
    super.key,
    required this.height,
    required this.width,
    required this.circularRadius,
    required this.text,
    required this.onTap,
  });
  final double height, width, circularRadius;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Appcolor.buttonColor,
          ),
          borderRadius: BorderRadius.circular(circularRadius),
        ),
        child: Center(
            child: Text(
          text,
          style: poppins(
            Appcolor.buttonColor,
            14,
            FontWeight.w600,
          ),
        )),
      ),
    );
  }
}





