import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/forgotpassword/widgets/verifyotp_container.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class VerifyOtp extends StatelessWidget {
  const VerifyOtp({super.key});

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
                      'verifyotp1'.tr,
                      style: poppins(Appcolor.white, 20, FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const Positioned(
                bottom: 0,
                child: VerifyOTPContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
