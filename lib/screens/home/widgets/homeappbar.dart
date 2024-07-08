import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
    required this.scaffoldKey,
  });
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
          onTap: () {
            HapticFeedback.mediumImpact();
            scaffoldKey.currentState?.openDrawer();
          },
          child: Image.asset('assets/png/drawer.png')),
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
      // actions: [
      //   InkWell(
      //     onTap: () {
      //       Get.to(const NotificationPage());
      //     },
      //     child: SvgPicture.asset('assets/svg/notification.svg'),
      //   ),
      //   SizedBox(
      //     width: screenWidth * 0.02,
      //   )
      // ],
    );
  }
}
