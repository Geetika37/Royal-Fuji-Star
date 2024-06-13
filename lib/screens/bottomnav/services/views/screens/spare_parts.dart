import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/widgets/category_animatedcontainer.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/widgets/category_itemcontainer.dart';
import 'package:royal_fuji_star/screens/home/widgets/lift_partscontainer.dart';
import 'package:royal_fuji_star/screens/home/widgets/lift_partsname.dart';
import 'package:royal_fuji_star/screens/widgets/customappbar.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
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
            text: 'Spare Parts for all Brands',
            titleSpacing: screenWidth * 0.12,
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.only(left: 10, top: 5),
          children: [
            const CustomTitle(
              textHeading: 'Cabin Categories',
              fontSize: 12,
              color: Appcolor.blackPrimary,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: screenHeight * 0.01),
            const CategoryAnimatedcontainer(),
            SizedBox(height: screenHeight * 0.015),
            const CustomTitle(
              textHeading: 'Item Categories',
              fontSize: 11,
              color: Appcolor.blackPrimary,
              fontWeight: FontWeight.w400,
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
            SizedBox(height: screenHeight * 0.005),
            const LiftPartsName(
              fontWeight: FontWeight.w600,
              text: 'KONE',
              fontSize: 13,
              textColor: Color.fromARGB(255, 88, 88, 88),
              dividerColor: Color.fromARGB(255, 48, 55, 62),
            ),
            SizedBox(height: screenHeight * 0.005),
            SizedBox(
              height: screenHeight * 0.31,
              child: const LiftPartsContainer(),
            ),
          ],
        ),
      ),
    );
  }
}
