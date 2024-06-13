import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';

class LiftPartsName extends StatelessWidget {
  const LiftPartsName({
    super.key,
    required this.text,
    required this.fontWeight, required this.textColor, required this.dividerColor, required this.fontSize,
  });

  final String text;
  final FontWeight fontWeight;
  final Color textColor, dividerColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        children: [
          Text(
            text,
            style: poppins(
                textColor, fontSize, fontWeight),
          ),
          SizedBox(width: screenWidth * 0.03),
           Expanded(
            child: Divider(
              color:dividerColor,
            ),
          ),
        ],
      ),
    );
  }
}
