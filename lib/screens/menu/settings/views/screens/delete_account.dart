import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/menu/settings/widgets/bottomsheetdelete.dart';
import 'package:royal_fuji_star/screens/menu/settings/widgets/bulletpoint.dart';
import 'package:royal_fuji_star/screens/widgets/customappbar.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/textcustom.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppbar(
          text: 'Settingstitle6'.tr,
          titleSpacing: screenWidth * 0.2,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.03),
            CustomTitle(
                fontWeight: FontWeight.w500,
                textHeading: 'deletetitle1'.tr,
                fontSize: 12,
                color: Appcolor.black),
            SizedBox(height: screenHeight * 0.01),
            CustomSubTitle(
                color: const Color.fromARGB(255, 86, 86, 86),
                fontSize: 11,
                subTitle: "deletesubtitle1".tr,
                maxLines: 3),
            SizedBox(height: screenHeight * 0.03),
            CustomTitle(
                fontWeight: FontWeight.w500,
                textHeading: 'deletetitle2'.tr,
                fontSize: 12,
                color: Appcolor.black),
            BulletPoint(maxLines: 2, text: "deletesubtitle2".tr),
            BulletPoint(maxLines: 1, text: "deletesubtitle3".tr),
            BulletPoint(maxLines: 2, text: "deletesubtitle4".tr),
            SizedBox(height: screenHeight * 0.4),
            BlueButton(
              fontSize: 14,
              textColor: Appcolor.white,
              height: screenHeight * 0.07,
              width: screenWidth,
              circularRadius: 15,
              text: 'Delete  Account',
              onTap: () {
                Get.bottomSheet(
                  backgroundColor: Appcolor.white,
                  const BottomsheetDelete(),
                );
              },
              color: Appcolor.buttonColor,
            ),
          ],
        ),
      ),
    ));
  }
}
