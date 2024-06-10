
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.menu,
          color: Appcolor.buttonColor,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/png/logo.png',
            height: screenHeight * 0.05,
          ),
          Text('Royal Fuji Star',
              style: poppins(Appcolor.black, 18, FontWeight.w600))
        ],
      ),
      actions: [
        SvgPicture.asset('assets/svg/notification.svg'),
        SizedBox(
          width: screenWidth * 0.04,
        )
      ],
    );
  }
}
