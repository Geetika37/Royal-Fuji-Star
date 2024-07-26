import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/auth/login/views/loginscreen.dart';
import 'package:royal_fuji_star/screens/auth/signup/widgets/signup_container.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/png/loginbg.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
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
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/png/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Text(
                'register_heading'.tr,
                style: poppins(Appcolor.white, 20, FontWeight.w600),
                textAlign: TextAlign.center, // center the text
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              SignupContainer(
                onTap: () {
                  Get.to(const LoginScreen());
                  // Get.to(const NumberInput());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// class SignUp extends StatelessWidget {
//   const SignUp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: Container(
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage(
//                 'assets/png/loginbg.png',
//               ),
//               fit: BoxFit.cover),
//         ),
//         child: Stack(
//           children: [
//             Center(
//               child: ListView(
//                 children: [
//                   SizedBox(
//                     height: screenHeight * 0.06,
//                   ),
//                   Container(
//                     width: screenWidth * 0.1, // using 10% of the screen width
//                     decoration: const BoxDecoration(
//                       color: Appcolor.white,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Image.asset(
//                         'assets/png/logo.png',
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: screenHeight * 0.03,
//                   ),
//                   Text(
//                     'register_heading'.tr,
//                     style: poppins(Appcolor.white, 20, FontWeight.w600),
//                   ),
//                 ],
//               ),
//             ),
//             // Positioned(
//             //   bottom: 0,
//             //   child: SignupContainer(
//             //     onTap: () {
//             //       Get.to(const LoginScreen());
//             //       // Get.to(const NumberInput());
//             //     },
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     ));
//   }
// }

