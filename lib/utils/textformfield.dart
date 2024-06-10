import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class Textformfield extends StatelessWidget {
  const Textformfield(
      {super.key, required this.textfieldWidth, required this.hintText, required this.hintTextSize});
  final double textfieldWidth;
  final String hintText;
  final double hintTextSize;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: textfieldWidth,
        height: screenHeight * 0.06,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: poppins(
                const Color.fromARGB(255, 149, 147, 147), hintTextSize, FontWeight.w300),
            filled: true,
            fillColor: const Color.fromARGB(255, 227, 228, 229),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

class TextformfieldWithIcons extends StatelessWidget {
  const TextformfieldWithIcons({
    super.key,
    required this.textfieldWidth,
    required this.hintText,
    required this.suffixIcon,
  });
  final double textfieldWidth;
  final String hintText;
  final Widget suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: textfieldWidth,
        child: TextFormField(
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: poppins(
                const Color.fromARGB(255, 149, 147, 147), 15, FontWeight.w400),
            filled: true,
            fillColor: Appcolor.bgColorTextformfield,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
