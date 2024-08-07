import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/views/screens/annualmaintenance.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/views/screens/repair.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/views/screens/spare_parts.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/widgets/service_types.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class ServiceContainer extends StatelessWidget {
  const ServiceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.58,
      width: screenWidth,
      decoration: const BoxDecoration(
          color: Appcolor.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45))),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.05),
            ServiceTypes(
              onTap: () {
                Get.to(const AnualMaintenance());
              },
              image: 'assets/svg/service1.svg',
              text: 'servicetypes1'.tr,
            ),
            SizedBox(height: screenHeight * 0.04),
            ServiceTypes(
              onTap: () {
                Get.to(const Repair());
              },
              text: 'servicetypes3'.tr,
              image: 'assets/svg/service2.svg',
            ),
            SizedBox(height: screenHeight * 0.04),
            ServiceTypes(
              onTap: () {
                Get.to(const SpareParts());
              },
              image: 'assets/svg/service2.svg',
              text: 'servicetypes2'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
