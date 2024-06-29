import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/home/controller/productcategory_controller.dart';
import 'package:royal_fuji_star/screens/splash/views/screens/arabic_container.dart';
import 'package:royal_fuji_star/screens/splash/views/screens/english_container.dart';
import 'package:royal_fuji_star/screens/splash/views/screens/joinus.dart';
import 'package:royal_fuji_star/services/token.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';

class LanguageSelect extends StatefulWidget {
  LanguageSelect({super.key});
  final ProductCategoryController productCategoryController =
      Get.put(ProductCategoryController());

  @override
  State<LanguageSelect> createState() => _LanguageSelectState();
}

class _LanguageSelectState extends State<LanguageSelect> {
  var onPressed1 = false;
  var onPressed2 = false;

  @override
  void initState() {
    super.initState();
    loadSelectedLanguage(); // Update language on initialization if necessary
  }

  Future<void> loadSelectedLanguage() async {
    String? selectedLanguage = await TokenKey.getValue('selectedLanguage');

    setState(() {
      if (selectedLanguage == 'en-US') {
        onPressed1 = true;
        onPressed2 = false;
      } else if (selectedLanguage == 'ar-AE') {
        onPressed1 = false;
        onPressed2 = true;
      }
    });
  }

  Future<void> saveSelectedLanguage(String languageCode) async {
    await TokenKey.saveValue('selectedLanguage', languageCode);
    Get.updateLocale(languageCode == 'en'
        ? const Locale('en', 'US')
        : const Locale('ar', 'AE'));
    widget.productCategoryController.loadLocale();
  }

  @override
  Widget build(BuildContext context) {
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
                  HapticFeedback.heavyImpact();
                  setState(() {
                    onPressed1 = true;
                    onPressed2 = false;
                    saveSelectedLanguage('en');

                    widget.productCategoryController.loadLocale();
                  });
                },
                child: EnglishContainer(onPressed1: onPressed1),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              InkWell(
                onTap: () {
                  HapticFeedback.heavyImpact();
                  setState(() {
                    onPressed2 = true;
                    onPressed1 = false;
                    saveSelectedLanguage('ar-AE');
                    widget.productCategoryController.loadLocale();
                  });
                },
                child: ArabicContainer(onPressed2: onPressed2),
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
                fontSize: 14,
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

