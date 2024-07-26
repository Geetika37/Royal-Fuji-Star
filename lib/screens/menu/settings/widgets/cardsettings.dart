import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class CardSettings extends StatelessWidget {
  const CardSettings({
    super.key,
    required this.text,
    required this.onTap,
    this.color = Appcolor.cardColor,
    this.elevation = 0,
  });
  final String text;
  final Function() onTap;
  final Color color;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      color: color,
      // child: ListTile(
      //   title: Text(
      //     text,
      //     style: poppins(Appcolor.black, 14, FontWeight.w500),
      //   ),
      //   trailing: IconButton(
      //       onPressed: onTap,
      //       icon: const Icon(
      //         Icons.arrow_forward_ios,
      //         size: 20,
      //       )),
      // ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 5,
          bottom: 5,
        ),
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 13,
                  right: 10,
                  left: 10,
                  bottom: 13,
                ),
                child: Text(
                  text,
                  style: poppins(Appcolor.black, 14, FontWeight.w500),
                ),
              ),
              const Spacer(),
              // IconButton(
              //     onPressed: onTap,
              //     icon: const Icon(
              //       Icons.arrow_forward_ios,
              //       size: 20,
              //     )),
              const Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
              SizedBox(width: screenWidth * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
