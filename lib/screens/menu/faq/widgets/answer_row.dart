
import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';

class AnswerRow extends StatelessWidget {
  const AnswerRow({
    super.key,
    required this.text,
    required this.maxLines,
  });

  final String text;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'a. ',
          style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 86, 86, 86)),
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
    );
  }
}
