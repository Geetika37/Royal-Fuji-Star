import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/consultation/widgets/uploadpic.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';
import 'package:royal_fuji_star/utils/dropdown.dart';
import 'package:royal_fuji_star/utils/textformfield.dart';

class ConsultationContainer extends StatelessWidget {
  const ConsultationContainer({super.key});

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
              //name
              SizedBox(height: screenHeight * 0.01),
              Text('Name', style: poppins(Appcolor.black, 12, FontWeight.w400)),
              SizedBox(height: screenHeight * 0.01),
              Textformfield(
                textfieldWidth: screenWidth,
                hintText: 'Enter the brand name here',
                hintTextSize: 12,
              ),

              //email
              SizedBox(height: screenHeight * 0.01),
              Text('Email',
                  style: poppins(Appcolor.black, 12, FontWeight.w400)),
              SizedBox(height: screenHeight * 0.01),
              Textformfield(
                textfieldWidth: screenWidth,
                hintText: '@',
                hintTextSize: 12,
              ),

              //phone number
              SizedBox(height: screenHeight * 0.01),
              Text('Phone Number',
                  style: poppins(Appcolor.black, 12, FontWeight.w400)),
              SizedBox(height: screenHeight * 0.01),
              Textformfield(
                textfieldWidth: screenWidth,
                hintText: '+971',
                hintTextSize: 12,
              ),

              //dropdown
              SizedBox(height: screenHeight * 0.001),
              const Dropdown(title: 'Type of Consultation Needed'),

              //Upload images
              SizedBox(height: screenHeight * 0.01),
              Text('Upload images',
                  style: poppins(Appcolor.black, 12, FontWeight.w400)),
              SizedBox(height: screenHeight * 0.01),
              UploadPicBoxRectangle(
                  deviceWidth: screenWidth, onImageSelected: () {}),
              SizedBox(height: screenHeight * 0.01),

              //Description of requirements
              SizedBox(height: screenHeight * 0.01),
              Text('Description of requirements',
                  style: poppins(Appcolor.black, 12, FontWeight.w400)),
              SizedBox(height: screenHeight * 0.01),
              const TextfieldMultipleLine(
                hintText: 'Type here',
                hintTextSize: 12,
              ),

              //Additional Comments or Questions
              SizedBox(height: screenHeight * 0.01),
              Text('Additional Comments or Questions',
                  style: poppins(Appcolor.black, 12, FontWeight.w400)),
              SizedBox(height: screenHeight * 0.01),
              const TextfieldMultipleLine(
                hintText: 'Type here',
                hintTextSize: 12,
              ),

              SizedBox(height: screenHeight * 0.01),
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
              ),
              SizedBox(height: screenHeight * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}
