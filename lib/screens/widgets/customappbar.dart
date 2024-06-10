import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key, required this.text, required this.titleSpacing,
  });
  final String text;
  final double titleSpacing;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_back,
          color: Appcolor.buttonColor,
          size: 25,
        ),
      ),
      title: Text(
        text,
        style: poppins(Appcolor.buttonColor, 15, FontWeight.w500),
      ),
      titleSpacing: titleSpacing,
    );
  }
}
