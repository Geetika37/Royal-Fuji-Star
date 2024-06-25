import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/menu/faq/views/faq.dart';
import 'package:royal_fuji_star/screens/menu/profile/views/profile.dart';
import 'package:royal_fuji_star/screens/menu/settings/views/settings.dart';
import 'package:royal_fuji_star/screens/splash/views/base.dart';
import 'package:royal_fuji_star/services/token.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class SettingsDrawer extends StatelessWidget {
  final double width;
  final double height;
  final Function(bool) onDrawerChanged;
  const SettingsDrawer(
      {super.key,
      required this.onDrawerChanged,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    TextStyle drawertext = poppins(Appcolor.white, 14, FontWeight.w500);

    return Drawer(
      width: width * 0.67,
      child: Column(
        children: [
          Container(
            height: screenHeight * 0.1,
            color: const Color(0xFFD9D9D9),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 15),
                child: Text(
                  'We are ready to elevate you',
                  style: poppins(Appcolor.buttonColor, 14, FontWeight.w700),
                ),
              ),
            ),
          ),
          Container(
              height: screenHeight * 0.76,
              color: Appcolor.buttonColor,
              child: Column(
                children: [
                  ListTile(
                    leading: Image.asset('assets/png/profile.png'),
                    title: Text('Profile', style: drawertext),
                    onTap: () {
                      Get.to(const ProfilePage());
                    },
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: width * 0.05,
                    ),
                    minTileHeight: screenHeight * 0.11,
                  ),
                  const Divider(),
                  ListTile(
                      leading: Image.asset('assets/png/settings.png'),
                      title: Text('Settings', style: drawertext),
                      onTap: () {
                        Get.to(const SettingsPage());
                      },
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: width * 0.05)),
                  const Divider(),
                  ListTile(
                    leading: Image.asset('assets/png/faq.png'),
                    title: Text('FAQ', style: drawertext),
                    onTap: () {
                      Get.to(const FAQPage());
                    },
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: width * 0.05),
                  ),
                  const Divider(),
                  ListTile(
                      leading: Image.asset('assets/png/logout.png'),
                      title: Text('Logout', style: drawertext),
                      onTap: () async {
                        await TokenKey.clearValue('token');
                        Get.to(const BasePage());
                      },
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: width * 0.05)),
                ],
              )),
          Container(
            width: double.infinity,
            color: const Color(0xFFD9D9D9),
            child: Row(
              children: [
                Image.asset(
                  'assets/png/logo.png',
                ),
                Text(
                  'ROYAL FUJI STAR',
                  style: poppins(Appcolor.black, 20, FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
