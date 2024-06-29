import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/home/controller/productcategory_controller.dart';
import 'package:royal_fuji_star/screens/widgets/customappbar.dart';
import 'package:royal_fuji_star/services/token.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class LanguageSettings extends StatefulWidget {
  LanguageSettings({super.key});
  final ProductCategoryController productCategoryController =
      Get.put(ProductCategoryController());

  @override
  State<LanguageSettings> createState() => _LanguageSettingsState();
}

class _LanguageSettingsState extends State<LanguageSettings> {
  bool firstValue = false;
  bool secondValue = false;

  @override
  void initState() {
    super.initState();
    loadSelectedLanguage();
  }

  Future<void> loadSelectedLanguage() async {
    String? selectedLanguage = await TokenKey.getValue('selectedLanguage');

    setState(() {
      if (selectedLanguage == 'en-US') {
        firstValue = true;
        secondValue = false;
      } else if (selectedLanguage == 'ar-AE') {
        firstValue = false;
        secondValue = true;
      }
    });
  }

  Future<void> saveSelectedLanguage(String languageCode) async {
    await TokenKey.saveValue('selectedLanguage', languageCode);
    Get.updateLocale(languageCode == 'en-US'
        ? const Locale('en', 'US')
        : const Locale('ar', 'AE'));
    widget.productCategoryController.loadLocale();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: 'Settingstitle3'.tr,
            titleSpacing: screenWidth * 0.2,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('English',
                      style: poppins(Appcolor.black, 15, FontWeight.w500)),
                  Checkbox(
                    value: firstValue,
                    onChanged: (value) {
                      setState(
                        () {
                          firstValue = value!;
                          secondValue = false;
                          saveSelectedLanguage('en-US');
                        },
                      );
                    },
                    activeColor: Appcolor.buttonColor,
                    side: const BorderSide(color: Appcolor.buttonColor),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('arabic'.tr,
                      style: poppins(Appcolor.black, 15, FontWeight.w500)),
                  Checkbox(
                    value: secondValue,
                    onChanged: (value) {
                      setState(() {
                        secondValue = value!;
                        firstValue = false;
                        saveSelectedLanguage('ar-AE');
                      });
                    },
                    activeColor: Appcolor.buttonColor,
                    side: const BorderSide(color: Appcolor.buttonColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
