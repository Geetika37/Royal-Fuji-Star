
import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';

class ContactInfo extends StatelessWidget {
  final String text;
  final String text1;

  const ContactInfo({
    super.key,
    required this.text,
    required this.text1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: screenWidth * 0.05),
        Row(
          children: [
            Text(
              text,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline),
            ),
            Text(
              text1,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}
