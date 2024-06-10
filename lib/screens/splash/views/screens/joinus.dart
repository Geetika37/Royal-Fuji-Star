import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/login/views/loginscreen.dart';
import 'package:royal_fuji_star/screens/notification/views/notification.dart';
import 'package:royal_fuji_star/screens/signup/views/signup.dart';
import 'package:royal_fuji_star/screens/splash/widgets/bottom_container.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';

class JoinUs extends StatelessWidget {
  const JoinUs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.5,
                      width: screenWidth,
                      child: Image.asset(
                        'assets/png/joinus.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Join us!',
                              style:
                                  poppins(Appcolor.white, 35, FontWeight.w600),
                            ),
                            Text(
                              'Explore our innovations',
                              style:
                                  poppins(Appcolor.white, 14, FontWeight.w300),
                            ),
                            SizedBox(
                              height: screenHeight * 0.03,
                            ),
                          ],
                        ))
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.06,
                ),
                BlueButton(
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.45,
                  circularRadius: 10,
                  text: 'Sign Up',
                  onTap: () {
                    Get.to(const SignUp());
                  },
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                BlueButtonOutlined(
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.45,
                  circularRadius: 10,
                  text: 'Login',
                  onTap: () {
                    Get.to(const LoginScreen());
                  },
                )
              ],
            ),
            const Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: BottomContainer(),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Get.to(const NotificationPage());
        }),
      ),
    );
  }
}
