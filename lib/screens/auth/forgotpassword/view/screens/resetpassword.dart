import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/auth/forgotpassword/widgets/resetpass_container.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class Resetpassword extends StatelessWidget {
  const Resetpassword({super.key, required this.otp});

  final String otp;
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
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.06,
                    ),
                    Container(
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
                      'resetpass'.tr,
                      style: poppins(Appcolor.white, 20, FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: ResetpassContainer(
                  otp: otp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
