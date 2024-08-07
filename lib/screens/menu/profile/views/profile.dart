import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/menu/profile/controller/profile_controller.dart';
import 'package:royal_fuji_star/screens/menu/profile/views/screens/editprofile.dart';
import 'package:royal_fuji_star/screens/menu/profile/widgets/icon_container.dart';
import 'package:royal_fuji_star/screens/menu/profile/widgets/profiledetail_listtile.dart';
import 'package:royal_fuji_star/screens/splash/views/screens/getstarted.dart';
import 'package:royal_fuji_star/services/token.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());
    final profileDetails = profileController.profileData;

    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: screenHeight * 0.4,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/png/profilebg2.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenHeight * 0.02,
                      vertical: screenHeight * 0.01,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(Icons.arrow_back,
                                color: Appcolor.white)),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.01,
                          ),
                          child: BlueButton(
                            fontSize: 14,
                            textColor: Appcolor.white,
                            color: Colors.red,
                            height: screenHeight * 0.04,
                            width: screenWidth * 0.3,
                            circularRadius: 20,
                            text: 'logout'.tr,
                            onTap: () async {
                              HapticFeedback.mediumImpact();

                              await TokenKey.clearValue('token');
                              Get.to(const GetStarted());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(() {
                  if (profileController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (profileController.profileData.isEmpty) {
                    return const Text('No profile data available');
                  }
                  print('profile data######----$profileDetails');
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ProfileDetailListTile(
                            imagePath: 'assets/svg/nams.svg',
                            text: profileDetails['username'] ?? ''),
                        SizedBox(height: screenHeight * 0.01),
                        ProfileDetailListTile(
                            imagePath: 'assets/svg/email.svg',
                            text: profileDetails['email'] ?? ''),
                        SizedBox(height: screenHeight * 0.01),
                        ProfileDetailListTile(
                            imagePath: 'assets/svg/phone.svg',
                            text: profileDetails['phone'] ?? ''),
                        SizedBox(height: screenHeight * 0.01),
                        ProfileDetailListTile(
                            imagePath: 'assets/svg/location.svg',
                            text: profileDetails['location'] ?? ''),
                      ],
                    ),
                  );
                }),
                SizedBox(height: screenHeight * 0.04),
                BlueButton(
                  fontSize: 14,
                  textColor: Appcolor.white,
                  height: screenHeight * 0.08,
                  width: screenWidth * 0.9,
                  circularRadius: 20,
                  text: 'editprofile'.tr,
                  onTap: () {
                    HapticFeedback.mediumImpact();
                    Get.to(EditProfile(
                      username: profileDetails['username'] ?? '',
                      email: profileDetails['email'] ?? '',
                      phone: profileDetails['phone'] ?? '',
                      location: profileDetails['location'] ?? '',
                    ));
                  },
                  color: Appcolor.buttonColor,
                )
              ],
            ),
          ),
          Positioned(
            top: screenHeight * 0.2,
            left: screenWidth * 0.35,
            child: const IconContainer(),
          ),
        ],
      ),
    ));
  }
}
