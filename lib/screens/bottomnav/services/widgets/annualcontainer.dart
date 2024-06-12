import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/widgets/radio_button.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/dropdown.dart';
import 'package:royal_fuji_star/utils/textformfield.dart';

class Annualcontainer extends StatelessWidget {
  const Annualcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.58,
      width: screenWidth,
      decoration: const BoxDecoration(
          color: Appcolor.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45))),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.01),
              Text(
                'Brand',
                style: poppins(Appcolor.black, 12, FontWeight.w400),
              ),
              SizedBox(height: screenHeight * 0.01),
              Textformfield(
                textfieldWidth: screenWidth,
                hintText: 'Enter the brand name here',
                hintTextSize: 12,
              ),
              Row(
                children: [
                  const Expanded(child: Dropdown(title: 'Capacity')),
                  SizedBox(width: screenWidth * 0.02),
                  const Expanded(child: Dropdown(title: 'Number of Floors')),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'Brand',
                style: poppins(Appcolor.black, 12, FontWeight.w400),
              ),
              const RadioButton(),
              Text(
                'Description',
                style: poppins(Appcolor.black, 12, FontWeight.w400),
              ),
              SizedBox(height: screenHeight * 0.01),
              const TextfieldMultipleLine(
                hintText: 'Type here',
                hintTextSize: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (bool? newValue) {},
                  ),
                  Text(
                    'I have read and agree to terms of service',
                    style: poppins(Appcolor.black, 12, FontWeight.w400),
                  ),
                ],
              ),
              const Divider(),
              SizedBox(height: screenHeight * 0.01),
              Center(
                child: BlueButton(
                    fontSize: 14,
                    textColor: Appcolor.white,
                    color: Appcolor.buttonColor,
                    height: screenHeight * 0.06,
                    width: screenWidth * 0.7,
                    circularRadius: 10,
                    text: 'Submit',
                    onTap: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
