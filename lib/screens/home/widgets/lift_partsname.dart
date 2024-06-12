import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';

class LiftPartsName extends StatelessWidget {
  const LiftPartsName({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        children: [
          Text(
            text,
            style: poppins(
                const Color.fromARGB(255, 133, 133, 133), 12, FontWeight.w500),
          ),
          SizedBox(width: screenWidth * 0.03),
          const Expanded(
            child: Divider(
              color: Color.fromARGB(255, 206, 206, 206),
            ),
          ),
        ],
      ),
    );
  }
}
