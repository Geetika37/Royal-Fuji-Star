
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class ProfileDetailListTile extends StatelessWidget {
  const ProfileDetailListTile({
    super.key,
    required this.imagePath,
    required this.text,
  });

  final String imagePath, text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(imagePath),
      contentPadding: EdgeInsets.symmetric(horizontal: screenHeight * 0.1),
      title: Text(
        text,
        style: poppins(Appcolor.black, 14, FontWeight.w400),
      ),
    );
  }
}
