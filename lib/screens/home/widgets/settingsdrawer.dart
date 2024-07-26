import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/menu/history/controller/history_controller.dart';
import 'package:royal_fuji_star/screens/menu/profile/controller/profile_controller.dart';
import 'package:royal_fuji_star/screens/menu/settings/views/settings.dart';
import 'package:royal_fuji_star/screens/splash/views/screens/getstarted.dart';
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
    final HistoryController historyController = Get.put(HistoryController());

    final ProfileController profileController = Get.put(ProfileController());
    TextStyle drawertext = poppins(Appcolor.white, 14, FontWeight.w500);

    return Drawer(
      backgroundColor: const Color(0xFFD9D9D9),
      width: width * 0.67,
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.1,
            width: screenWidth,
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 10, left: 15, top: 50, right: 15),
              child: Text(
                'drawertext1'.tr,
                style: poppins(Appcolor.buttonColor, 14, FontWeight.w700),
              ),
            ),
          ),
          Expanded(
            child: Container(
                // height: screenHeight * 0.76,
                color: Appcolor.buttonColor,
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.045,
                    ),
                    ListTile(
                      leading: Image.asset('assets/png/profile.png'),
                      title: Text('drawertext2'.tr, style: drawertext),
                      onTap: () {
                        HapticFeedback.lightImpact();

                        profileController.profileDetails();
                      },
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: width * 0.05,
                      ),
                    ),
                    const Divider(),
                    ListTile(
                        leading: Image.asset('assets/png/settings.png'),
                        title: Text('drawertext3'.tr, style: drawertext),
                        onTap: () {
                          HapticFeedback.lightImpact();

                          Get.to(const SettingsPage());
                        },
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: width * 0.05)),
                    // const Divider(),
                    // ListTile(
                    //   leading: Image.asset('assets/png/faq.png'),
                    //   title: Text('FAQ'.tr, style: drawertext),
                    //   onTap: () {
                    //     HapticFeedback.lightImpact();

                    //     Get.to(const FAQPage());
                    //   },
                    //   contentPadding:
                    //       EdgeInsets.symmetric(horizontal: width * 0.05),
                    // ),
                    const Divider(),
                    ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                            color: Appcolor.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset(
                            'assets/png/history.png',
                            width: 17,
                            height: 17,
                            color: Appcolor.buttonColor,
                          ),
                        ),
                      ),
                      title: Text('History'.tr, style: drawertext),
                      onTap: () async {
                        HapticFeedback.lightImpact();
                        await historyController.fetchHistory();
                      },
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: width * 0.05),
                    ),
                    const Divider(),
                    ListTile(
                        leading: Image.asset('assets/png/logout.png'),
                        title: Text('drawertext5'.tr, style: drawertext),
                        onTap: () async {
                          HapticFeedback.lightImpact();

                          await TokenKey.clearValue('token');
                          Get.to(const GetStarted());
                        },
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: width * 0.05)),
                  ],
                )),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Image.asset(
                  'assets/png/logo.png',
                ),
                Expanded(
                  child: Text(
                    'drawertext6'.tr,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: poppins(Appcolor.black, 18, FontWeight.w600),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
