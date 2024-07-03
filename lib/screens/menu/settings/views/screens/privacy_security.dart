import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/widgets/customappbar.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/textcustom.dart';

class PrivacySecurity extends StatelessWidget {
  const PrivacySecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: 'Settingstitle4'.tr,
            titleSpacing: screenWidth * 0.17,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'privacytitle1'.tr,
                    fontSize: 12,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.01),
                CustomSubTitle(
                    color: const Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle: 'privacysubtitle1'.tr,
                    maxLines: 4),
                SizedBox(height: screenHeight * 0.02),
                CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'privacytitle2'.tr,
                    fontSize: 12,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.01),
                CustomSubTitle(
                    color: const Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle: 'privacysubtitle2'.tr,
                    maxLines: 5),
                SizedBox(height: screenHeight * 0.02),
                CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'privacytitle3'.tr,
                    fontSize: 12,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.01),
                CustomSubTitle(
                    color: const Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle: 'privacysubtitle3'.tr,
                    maxLines: 4),
                SizedBox(height: screenHeight * 0.02),
                CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'privacytitle4'.tr,
                    fontSize: 12,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.01),
                CustomSubTitle(
                    color: const Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle: 'privacysubtitle4'.tr,
                    maxLines: 3),
                SizedBox(height: screenHeight * 0.02),
                CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'privacytitle5'.tr,
                    fontSize: 12,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.01),
                CustomSubTitle(
                    color: const Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle: "privacysubtitle5".tr,
                    maxLines: 4),
                SizedBox(height: screenHeight * 0.02),
                CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'privacytitle6'.tr,
                    fontSize: 12,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.01),
                CustomSubTitle(
                    color: const Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle: "privacysubtitle6".tr,
                    maxLines: 3),
                SizedBox(height: screenHeight * 0.02),
                CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'privacytitle7'.tr,
                    fontSize: 12,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.01),
                CustomSubTitle(
                    color: const Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle: "privacysubtitle7".tr,
                    maxLines: 4),
                SizedBox(height: screenHeight * 0.02),
                CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'privacytitle8'.tr,
                    fontSize: 12,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.01),
                CustomSubTitle(
                    color: const Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle: "privacysubtitle8".tr,
                    maxLines: 3),
                SizedBox(height: screenHeight * 0.02),
                CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'privacytitle9'.tr,
                    fontSize: 12,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.01),
                CustomSubTitle(
                    color: const Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle: "privacysubtitle9".tr,
                    maxLines: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
