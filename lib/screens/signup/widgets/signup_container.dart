import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/signup/controller/signup_controller.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/textformfield.dart';

class SignupContainer extends StatefulWidget {
  const SignupContainer({
    super.key,
    required this.onTap,
  });
  final Function() onTap;

  @override
  State<SignupContainer> createState() => _SignupContainerState();
}

class _SignupContainerState extends State<SignupContainer> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final SignupController signupController = Get.put(SignupController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: screenHeight * 0.65,
          width: screenWidth,
          decoration: const BoxDecoration(
            color: Appcolor.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45),
              topRight: Radius.circular(45),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  Textformfield(
                    controller: nameController,
                    textfieldWidth: screenWidth * 0.8,
                    hintText: 'full_name'.tr,
                    hintTextSize: 15,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                        return 'Enter Correct Name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Textformfield(
                    controller: emailController,
                    textfieldWidth: screenWidth * 0.8,
                    hintText: 'email'.tr,
                    hintTextSize: 15,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                              .hasMatch(value)) {
                        return 'Enter Correct Email ID';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextformfieldWithoutValidation(
                    controller: phoneController,
                    textfieldWidth: screenWidth * 0.8,
                    hintText: 'phone'.tr,
                    hintTextSize: 15,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextformfieldPass(
                    controller: passwordController,
                    textfieldWidth: screenWidth * 0.8,
                    hintText: 'password'.tr,
                    hintTextSize: 14,
                    obscureText: true,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  BlueButton(
                    fontSize: 14,
                    textColor: Appcolor.white,
                    color: Appcolor.buttonColor,
                    height: screenHeight * 0.07,
                    width: screenWidth * 0.8,
                    circularRadius: 10,
                    text: 'sign_up'.tr,
                    onTap: () {
                      if (_validateForm()) {
                        signupController.signUp(
                          nameController.text,
                          phoneController.text,
                          emailController.text,
                          passwordController.text,
                        );
                      }
                    },
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  SizedBox(
                    width: screenWidth * 0.5,
                    child: Text(
                      'policy_terms'.tr,
                      maxLines: 2,
                      style: poppins(Appcolor.buttonColor, 10, FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.only(right: 100, left: 100),
            child: Row(
              children: [
                Text(
                  'already_account'.tr,
                  style: poppins(const Color.fromARGB(255, 163, 162, 162), 13,
                      FontWeight.w400),
                ),
                SizedBox(height: screenHeight * 0.05),
                InkWell(
                  onTap: widget.onTap,
                  child: Text(
                    'login'.tr,
                    style: const TextStyle(
                      color: Appcolor.buttonColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  bool _validateForm() {
    return formKey.currentState!.validate();
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:royal_fuji_star/constants/size.dart';
// import 'package:royal_fuji_star/constants/textstyle.dart';
// import 'package:royal_fuji_star/screens/signup/controller/signup_controller.dart';
// import 'package:royal_fuji_star/utils/appcolor.dart';
// import 'package:royal_fuji_star/utils/buttons.dart';
// import 'package:royal_fuji_star/utils/textformfield.dart';

// class SignupContainer extends StatefulWidget {
//   const SignupContainer({
//     super.key,
//     required this.onTap,
//   });
//   final Function() onTap;

//   @override
//   State<SignupContainer> createState() => _SignupContainerState();
// }

// class _SignupContainerState extends State<SignupContainer> {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final SignupController signupController = Get.put(SignupController());
//   TextEditingController nameController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           height: screenHeight * 0.65,
//           width: screenWidth,
//           decoration: const BoxDecoration(
//               color: Appcolor.white,
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(45), topRight: Radius.circular(45))),
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Form(
//               key: formKey,
//               child: Column(
//                 children: [
//                   SizedBox(height: screenHeight * 0.05),
//                   Textformfield(
//                     validator: (value) {
//                       if (value!.isEmpty ||
//                           !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
//                         return 'Enter Correct Name';
//                       } else {
//                         return null;
//                       }
//                     },
//                     textfieldWidth: screenWidth * 0.8,
//                     hintText: 'full_name'.tr,
//                     hintTextSize: 15,
//                     controller: nameController,
//                   ),
//                   SizedBox(height: screenHeight * 0.02),
//                   Textformfield(
//                     validator: (value) {
//                       if (value!.isEmpty ||
//                           !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
//                               .hasMatch(value)) {
//                         return 'Enter Correct Email ID';
//                       } else {
//                         return null;
//                       }
//                     },
//                     controller: emailController,
//                     textfieldWidth: screenWidth * 0.8,
//                     hintText: 'email'.tr,
//                     hintTextSize: 15,
//                   ),
//                   SizedBox(height: screenHeight * 0.02),
//                   TextformfieldWithoutValidation(
//                     controller: phoneController,
//                     textfieldWidth: screenWidth * 0.8,
//                     hintText: 'phone'.tr,
//                     hintTextSize: 15,
//                   ),
//                   SizedBox(height: screenHeight * 0.02),
//                   // TextformfieldWithIcons(
//                   //   controller: passwordController,
//                   //   textfieldWidth: screenWidth * 0.8,
//                   //   hintText: 'password'.tr,
//                   //   suffixIcon: Image.asset('assets/png/eye.png'),
//                   // ),
//                   TextformfieldPass(
//                     textfieldWidth: screenWidth * 0.8,
//                     hintText: 'password'.tr,
//                     hintTextSize: 14,
//                     controller: passwordController,
//                     obscureText: true,
//                   ),
//                   SizedBox(height: screenHeight * 0.04),
//                   BlueButton(
//                       fontSize: 14,
//                       textColor: Appcolor.white,
//                       color: Appcolor.buttonColor,
//                       height: screenHeight * 0.07,
//                       width: screenWidth * 0.8,
//                       circularRadius: 10,
//                       text: 'sign_up'.tr,
//                       onTap: () {
//                         if(_validateForm())
//                         {
//                           signupController.signUp(
//                           nameController.text,
//                           phoneController.text,
//                           emailController.text,
//                           passwordController.text,
//                         );
//                         }
//                       }),
//                   SizedBox(height: screenHeight * 0.01),
//                   SizedBox(
//                     width: screenWidth * 0.5,
//                     child: Text(
//                       'policy_terms'.tr,
//                       maxLines: 2,
//                       style: poppins(Appcolor.buttonColor, 10, FontWeight.w500),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//             bottom: 0,
//             child: Padding(
//                 padding: const EdgeInsets.only(right: 100, left: 100),
//                 child: Row(
//                   children: [
//                     Text(
//                       'already_account'.tr,
//                       style: poppins(const Color.fromARGB(255, 163, 162, 162),
//                           13, FontWeight.w400),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.05,
//                     ),
//                     InkWell(
//                       onTap: widget.onTap,
//                       child: Text(
//                         'login'.tr,
//                         style: const TextStyle(
//                           color: Appcolor.buttonColor,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     )
//                   ],
//                 )))
//       ],
//     );
//   }

//   bool _validateForm() {
//     if (!formKey.currentState!.validate()) {
//       return false;
//     }

//     return true;
//   }
// }
