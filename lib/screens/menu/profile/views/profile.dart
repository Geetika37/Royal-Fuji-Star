import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/menu/profile/views/screens/editprofile.dart';
import 'package:royal_fuji_star/screens/menu/profile/widgets/icon_container.dart';
import 'package:royal_fuji_star/screens/menu/profile/widgets/profiledetail_listtile.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: screenHeight * 0.4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/png/profilebg2.png'),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                      BlueButton(
                        textColor: Appcolor.white,
                        color: Colors.red,
                        height: screenHeight * 0.04,
                        width: screenWidth * 0.2,
                        circularRadius: 20,
                        text: 'Logout',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              const ProfileDetailListTile(
                  imagePath: 'assets/svg/nams.svg', text: ' Anna Avetisyan'),
              SizedBox(height: screenHeight * 0.01),
              const ProfileDetailListTile(
                  imagePath: 'assets/svg/email.svg',
                  text: ' anna123jkl@gmail.com'),
              SizedBox(height: screenHeight * 0.01),
              const ProfileDetailListTile(
                  imagePath: 'assets/svg/phone.svg', text: ' +91 123 125 4952'),
              SizedBox(height: screenHeight * 0.01),
              const ProfileDetailListTile(
                  imagePath: 'assets/svg/location.svg', text: ' Abu Dhabi'),
              SizedBox(height: screenHeight * 0.04),
              BlueButton(
                textColor: Appcolor.white,
                height: screenHeight * 0.08,
                width: screenWidth * 0.9,
                circularRadius: 20,
                text: 'Edit Profile',
                onTap: () {
                  Get.to(const EditProfile());
                },
                color: Appcolor.buttonColor,
              )
            ],
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
