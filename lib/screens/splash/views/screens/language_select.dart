import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/splash/views/screens/joinus.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';

class LanguageSelect extends StatefulWidget {
  const LanguageSelect({super.key});

  @override
  State<LanguageSelect> createState() => _LanguageSelectState();
}

class _LanguageSelectState extends State<LanguageSelect> {
  var onPressed1 = false;
  var onPressed2 = false;
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'welcome'.tr,
                style: poppins(Appcolor.buttonColor, 20, FontWeight.w700),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Text(
                'choose_language'.tr,
                style: poppins(
                  Appcolor.buttonColor,
                  15,
                  FontWeight.w500,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    onPressed1 = true;
                    onPressed2 = false;
                  });
                },
                child: onPressed1
                    ? BlueButtonWithIcon(
                        height: screenHeight * 0.06,
                        width: screenWidth * 0.45,
                        circularRadius: 10,
                        text: 'english'.tr,
                        onTap: () {
                          var locale = const Locale('en', 'US');
                          Get.updateLocale(locale);
                          box.write('locale', 'en_US');
                        },
                      )
                    : OutlineBlueButtonWithIcon(
                        height: screenHeight * 0.06,
                        width: screenWidth * 0.45,
                        circularRadius: 10,
                        text: 'english'.tr,
                        onTap: () {
                          var locale = const Locale('en', 'US');
                          Get.updateLocale(locale);
                          box.write('locale', 'en_US');
                        }),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    onPressed2 = true;
                    onPressed1 = false;
                  });
                },
                child: onPressed2 == false
                    ? OutlineBlueButtonWithIcon(
                        height: screenHeight * 0.06,
                        width: screenWidth * 0.45,
                        circularRadius: 10,
                        text: 'arabic'.tr,
                        onTap: () {
                          var locale = const Locale('ar', 'SA');
                          Get.updateLocale(locale);
                          box.write('locale', 'ar_SA');
                        },
                      )
                    : BlueButtonWithIcon(
                        height: screenHeight * 0.06,
                        width: screenWidth * 0.45,
                        circularRadius: 10,
                        text: 'arabic'.tr,
                        onTap: () {
                          var locale = const Locale('ar', 'SA');
                          Get.updateLocale(locale);
                          box.write('locale', 'ar_SA');
                        }),
              ),
              SizedBox(
                height: screenHeight * 0.07,
              ),
              SizedBox(
                width: screenWidth * 0.5,
                child: Text(
                  'change_preference'.tr,
                  maxLines: 2,
                  style: poppins(Appcolor.black, 10, FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.23,
              ),
              BlueButton(
                textColor: Appcolor.white,
                color: Appcolor.buttonColor,
                height: screenHeight * 0.07,
                width: screenWidth * 0.7,
                circularRadius: 10,
                text: 'continue'.tr,
                onTap: () {
                  Get.to(const JoinUs());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
