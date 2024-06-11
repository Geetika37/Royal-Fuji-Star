import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/widgets/customappbar.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class LanguageSettings extends StatefulWidget {
  const LanguageSettings({super.key});

  @override
  State<LanguageSettings> createState() => _LanguageSettingsState();
}

class _LanguageSettingsState extends State<LanguageSettings> {
  bool firstValue = false;
  bool secondValue = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: 'Language Settings',
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
                  Text('Arabic',
                      style: poppins(Appcolor.black, 15, FontWeight.w500)),
                  Checkbox(
                    value: secondValue,
                    onChanged: (value) {
                      setState(() {
                        secondValue = value!;
                        firstValue = false;
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
