import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/widgets/customappbar.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
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
            const CustomTitle(
                textHeading: 'Are You Sure You Want to Delete Your Account?',
                fontSize: 12,
                color: Appcolor.black),
            SizedBox(height: screenHeight * 0.01),
            const CustomSubTitle(
                color: Color.fromARGB(255, 114, 114, 114),
                fontSize: 10,
                subTitle:
                    "We're sorry to see you go! Deleting your account is a permanent action that cannot be undone. Before you proceed, please read the following important information carefully:",
                maxLines: 3),
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    ));
  }
}
