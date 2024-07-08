import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/widgets/category_animatedcontainer.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/widgets/category_itemcontainer.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/widgets/create_item.dart';
import 'package:royal_fuji_star/screens/home/widgets/lift_partscontainer.dart';
import 'package:royal_fuji_star/screens/home/widgets/lift_partsname.dart';
import 'package:royal_fuji_star/screens/widgets/customappbar.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/textcustom.dart';

class SpareParts extends StatefulWidget {
  const SpareParts({super.key});

  @override
  State<SpareParts> createState() => _SparePartsState();
}

class _SparePartsState extends State<SpareParts> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: 'servicetypes2'.tr,
            titleSpacing: screenWidth * 0.12,
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.only(top: 5),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: CustomTitle(
                textHeading: 'sparecontainertext1'.tr,
                fontSize: 12,
                color: Appcolor.blackPrimary,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            const CategoryAnimatedcontainer(),
            SizedBox(height: screenHeight * 0.015),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: CustomTitle(
                textHeading: 'sparecontainertext2'.tr,
                fontSize: 11,
                color: Appcolor.blackPrimary,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            SizedBox(
              height: screenHeight * 0.1,
              child: const CategoryItemcontainer(),
            ),
            const LiftPartsName(
              fontWeight: FontWeight.w600,
              text: 'Otis',
              fontSize: 13,
              textColor: Color.fromARGB(255, 88, 88, 88),
              dividerColor: Color.fromARGB(255, 48, 55, 62),
            ),
            SizedBox(
              height: screenHeight * 0.31,
              child: const LiftPartsContainer(),
            ),
            SizedBox(height: screenHeight * 0.005),
            const LiftPartsName(
              fontWeight: FontWeight.w600,
              text: 'Hitachi',
              fontSize: 13,
              textColor: Color.fromARGB(255, 88, 88, 88),
              dividerColor: Color.fromARGB(255, 48, 55, 62),
            ),
            SizedBox(height: screenHeight * 0.005),
            SizedBox(
              height: screenHeight * 0.31,
              child: const LiftPartsContainer(),
            ),
            SizedBox(height: screenHeight * 0.01),
            Center(
              child: BlueButton(
                  fontSize: 14,
                  textColor: Appcolor.white,
                  color: Appcolor.buttonColor,
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.95,
                  circularRadius: 10,
                  text: 'sparecontainertext3'.tr,
                  onTap: () {
                    Get.to(const CreateItem());
                  }),
            ),
            SizedBox(height: screenHeight * 0.01),
          ],
        ),
      ),
    );
  }
}
