import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/login/widgets/login_container.dart';
import 'package:royal_fuji_star/screens/signup/views/signup.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                    'Login to Your Account',
                    style: poppins(Appcolor.white, 20, FontWeight.w600),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: LoginContainer(
                onTap: () {
                  HapticFeedback.heavyImpact();
                  Get.to(const SignUp());
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
