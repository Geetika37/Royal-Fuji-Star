import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/widgets/annualcontainer.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class AnualMaintenance extends StatelessWidget {
  const AnualMaintenance({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/png/loginbg.png',
                ),
                fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: screenHeight * 0.06,
                  ),
                  Container(
                    width: screenWidth * 0.3,
                    height: screenWidth * 0.3,
                    decoration: const BoxDecoration(
                      color: Appcolor.white,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/png/logo.png'),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Text(
                    'servicetypes1'.tr,
                    style: poppins(Appcolor.white, 20, FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  const Annualcontainer(),
                ],
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Appcolor.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
