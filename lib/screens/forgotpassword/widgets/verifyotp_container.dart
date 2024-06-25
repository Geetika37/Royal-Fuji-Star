import 'package:flutter/widgets.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';

class VerifyOTPContainer extends StatelessWidget {
  const VerifyOTPContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.65,
      width: screenWidth,
      decoration: const BoxDecoration(
          color: Appcolor.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45))),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.1),
            
            SizedBox(height: screenHeight * 0.05),
            BlueButton(
              height: screenHeight * 0.07,
              width: screenWidth * 0.8,
              circularRadius: 10,
              text: 'Submit',
              onTap: () {
                
              },
              color: Appcolor.buttonColor,
              textColor: Appcolor.white,
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}