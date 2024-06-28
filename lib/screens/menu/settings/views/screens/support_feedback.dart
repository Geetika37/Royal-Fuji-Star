import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/widgets/customappbar.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/textcustom.dart';

class SupportFeedback extends StatelessWidget {
  const SupportFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: 'Settingstitle5'.tr,
            titleSpacing: screenWidth * 0.2,
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
                    subTitle: 'supportsubtitle1'.tr,
                    maxLines: 4),
                SizedBox(height: screenHeight * 0.03),
                CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'supporttitle1'.tr,
                    fontSize: 12,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.01),
                CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'supporttitle2'.tr,
                    fontSize: 10,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.005),
                CustomSubTitle(
                    color: const Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle: 'supportsubtitle2'.tr,
                    maxLines: 2),
                SizedBox(height: screenHeight * 0.013),
                CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'supporttitle3'.tr,
                    fontSize: 10,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.005),
                CustomSubTitle(
                    color: const Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle: 'supportsubtitle3'.tr,
                    maxLines: 2),
                SizedBox(height: screenHeight * 0.013),
                CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'supporttitle4'.tr,
                    fontSize: 10,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.005),
                CustomSubTitle(
                    color: const Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle: 'supportsubtitle4'.tr,
                    maxLines: 2),
                SizedBox(height: screenHeight * 0.013),
                CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'supporttitle5'.tr,
                    fontSize: 10,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.005),
                CustomSubTitle(
                    color: const Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle: "supportsubtitle5".tr,
                    maxLines: 4),
                SizedBox(height: screenHeight * 0.013),
                CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'supporttitle6'.tr,
                    fontSize: 10,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.005),
                CustomSubTitle(
                    color: const Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle: "supportsubtitle6".tr,
                    maxLines: 3),
                SizedBox(height: screenHeight * 0.013),
                CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'supporttitle7'.tr,
                    fontSize: 10,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.005),
                CustomSubTitle(
                    color: const Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle: "supportsubtitle7".tr,
                    maxLines: 3),
                SizedBox(height: screenHeight * 0.013),
                CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'supporttitle8'.tr,
                    fontSize: 10,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.005),
                CustomSubTitle(
                    color: const Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle: 'supportsubtitle8'.tr,
                    maxLines: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
