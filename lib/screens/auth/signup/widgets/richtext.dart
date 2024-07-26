import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class RichTextSignUp extends StatelessWidget {
  const RichTextSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.5,
      child: RichText(
        maxLines: 2,
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: 'policy_terms1'.tr,
            style: const TextStyle(
              color: Color.fromARGB(255, 159, 158, 158),
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: 'policy_terms2'.tr,
            style: const TextStyle(
              color: Appcolor.buttonColor,
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: 'policy_terms3'.tr,
            style: const TextStyle(
              color: Color.fromARGB(255, 159, 158, 158),
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: 'policy_terms4'.tr,
            style: const TextStyle(
              color: Appcolor.buttonColor,
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ]),
      ),
    );
  }
}
