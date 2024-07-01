import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class TextfieldWithoutborder extends StatelessWidget {
  const TextfieldWithoutborder({
    super.key,
    required this.imagePath,
    required this.text, required this.controller,
  });

  final String imagePath, text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: poppins(
              const Color.fromARGB(255, 32, 32, 32), 10, FontWeight.w400),
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: Image.asset(imagePath),
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Appcolor.black,
                width: 1.1,
              ))),
        ),
      ],
    );
  }
}
