import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class CardSettings extends StatelessWidget {
  const CardSettings({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Appcolor.cardColor,
      child: ListTile(
        title: Text(
          text,
          style: poppins(Appcolor.black, 14, FontWeight.w500),
        ),
        trailing: IconButton(
            onPressed: onTap,
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            )),
      ),
    );
  }
}
