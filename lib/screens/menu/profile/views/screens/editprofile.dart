import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/menu/profile/controller/editprofile_controller.dart';
import 'package:royal_fuji_star/screens/menu/profile/widgets/textfieldwithoutborder.dart';
import 'package:royal_fuji_star/screens/widgets/customappbar.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/validators.dart';

class EditProfile extends StatefulWidget {
  const EditProfile(
      {super.key,
      required this.username,
      required this.email,
      required this.phone,
      required this.location});
  final String username;
  final String email;
  final String phone;
  final String location;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final EditprofileController editprofileController =
      Get.put(EditprofileController());

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController =
        TextEditingController(text: widget.username);
    TextEditingController emailIDController =
        TextEditingController(text: widget.email);
    TextEditingController mobileController =
        TextEditingController(text: widget.phone);
    TextEditingController locationController =
        TextEditingController(text: widget.location);

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: 'editprofile'.tr,
            titleSpacing: screenWidth * 0.25,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            right: 15,
            left: 15,
            top: screenHeight * 0.1,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextfieldWithoutborder(
                    validator: Validators.validateName,
                    imagePath: 'assets/png/picon1.png',
                    text: 'editprofilehinttext1'.tr,
                    controller: userNameController,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextfieldWithoutborder(
                    validator: Validators.validateEmail,
                    imagePath: 'assets/png/picon2.png',
                    text: 'editprofilehinttext2'.tr,
                    controller: emailIDController,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextfieldWithoutborderWithoutValidation(
                      controller: mobileController,
                      imagePath: 'assets/png/picon3.png',
                      text: 'editprofilehinttext3'.tr),
                  SizedBox(height: screenHeight * 0.02),
                  TextfieldWithoutborder(
                      validator: Validators.validateName,
                      controller: locationController,
                      imagePath: 'assets/png/picon4.png',
                      text: 'editprofilehinttext4'.tr),
                  SizedBox(height: screenHeight * 0.14),
                  Obx(
                    () => BlueButtonn(
                      color: Appcolor.buttonColor,
                      height: screenHeight * 0.07,
                      width: screenWidth * 0.92,
                      circularRadius: 10,
                      text: editprofileController.isLoading.value
                          ? LoadingAnimationWidget.prograssiveDots(
                              size: 35,
                              color: Appcolor.white,
                            )
                          : Text(
                              'save'.tr,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Appcolor.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                      onTap: () async {
                        HapticFeedback.mediumImpact();
                        if (_validateForm()) {
                          await editprofileController.editProfile(
                            userNameController.text,
                            emailIDController.text,
                            mobileController.text,
                            locationController.text,
                          );
                        }
                      },
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _validateForm() {
    return formKey.currentState!.validate();
  }
}
