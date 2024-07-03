import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/menu/settings/controller/deletecontroller.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';

class BottomsheetDelete extends StatelessWidget {
  const BottomsheetDelete({super.key});

  @override
  Widget build(BuildContext context) {
    final Deletecontroller deletecontroller = Get.put(Deletecontroller());
    return SizedBox(
      width: screenWidth,
      height: screenHeight * 0.4,
      child: Padding(
        padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
        child: Column(
          children: [
            SvgPicture.asset('assets/svg/delete.svg'),
            SizedBox(height: screenHeight * 0.04),
            Text('deleteacbutton'.tr,
                style: poppins(Appcolor.black, 18, FontWeight.w600)),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'deletebottomsheet1'.tr,
              style: poppins(const Color.fromARGB(255, 101, 101, 101), 11,
                  FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            Text(
              'deletebottomsheet2'.tr,
              style: poppins(
                  const Color.fromARGB(255, 71, 71, 71), 11, FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: BlueButton(
                      fontSize: 14,
                      textColor: const Color.fromARGB(255, 149, 149, 149),
                      height: screenHeight * 0.05,
                      width: screenWidth,
                      circularRadius: 20,
                      text: 'deletebottomsheet3'.tr,
                      onTap: () {
                        Get.back();
                      },
                      color: const Color(0xFFE5E7E8)),
                ),
                SizedBox(
                  width: screenWidth * 0.04,
                ),
                Expanded(
                  child: BlueButton(
                      fontSize: 14,
                      textColor: Appcolor.white,
                      height: screenHeight * 0.05,
                      width: screenWidth,
                      circularRadius: 20,
                      text: 'deletebottomsheet4'.tr,
                      onTap: () {
                        deletecontroller.deleteAccount();
                      },
                      color: Appcolor.buttonColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
