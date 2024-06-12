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
          text: 'Delete Account',
          titleSpacing: screenWidth * 0.2,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.03),
            const CustomTitle(
                fontWeight: FontWeight.w500,
                textHeading: 'Are You Sure You Want to Delete Your Account?',
                fontSize: 12,
                color: Appcolor.black),
            SizedBox(height: screenHeight * 0.01),
            const CustomSubTitle(
                color: Color.fromARGB(255, 86, 86, 86),
                fontSize: 11,
                subTitle:
                    "We're sorry to see you go! Deleting your account is a permanent action that cannot be undone. Before you proceed, please read the following important information carefully:",
                maxLines: 3),
            SizedBox(height: screenHeight * 0.03),
            const CustomTitle(
                fontWeight: FontWeight.w500,
                textHeading: 'What Happens When You Delete Your Account:',
                fontSize: 12,
                color: Appcolor.black),
            const BulletPoint(
                maxLines: 2,
                text:
                    "Permanent Data Loss: All your personal information, service history, and settings will be permanently deleted from our servers."),
            const BulletPoint(
                maxLines: 1,
                text:
                    "Irreversibility: Once your account is deleted, it cannot be recovered."),
            const BulletPoint(
                maxLines: 2,
                text:
                    "Service Access: You will lose access to all features and services associated with your account."),
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
