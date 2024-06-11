
import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class EmailInfo extends StatelessWidget {
  const EmailInfo({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: screenWidth * 0.05),
        Text(
          email,
          style: const TextStyle(
            color: Appcolor.black,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}