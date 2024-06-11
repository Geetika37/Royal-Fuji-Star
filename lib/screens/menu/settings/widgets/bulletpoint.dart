
import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';

class BulletPoint extends StatelessWidget {
  final String text;
  final int maxLines;

  const BulletPoint({super.key, required this.text, required this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style:
                TextStyle(fontSize: 20, color: Color.fromARGB(255, 86, 86, 86)),
          ),
          Expanded(
            child: Text(
              text,
              style: poppins(
                  const Color.fromARGB(255, 86, 86, 86), 11, FontWeight.w400),
              maxLines: maxLines,
            ),
          ),
        ],
      ),
    );
  }
}
