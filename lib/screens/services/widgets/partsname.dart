import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';

class PartsName extends StatelessWidget {
  const PartsName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'cabins',
          style: poppins(const Color.fromARGB(255, 133, 133, 133), 12,
              FontWeight.w500),
        ),
        SizedBox(width: screenWidth * 0.03),
        const Expanded(
          child: Divider(
            color: Color.fromARGB(255, 206, 206, 206),
          ),
        ),
      ],
    );
  }
}
