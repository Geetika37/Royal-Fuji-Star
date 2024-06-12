import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/home/models/partlist.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';

class ListPartsContainer extends StatelessWidget {
  const ListPartsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: partList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 197, 229, 247),
                border: Border.all(
                  width: 1,
                  color: Appcolor.buttonColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset(partList[index].imagePath),
                    SizedBox(height: screenHeight * 0.005),
                    Text(
                      partList[index].text,
                      style: poppins(Appcolor.buttonColor, 10, FontWeight.w500),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    BlueButton(
                      height: screenHeight * 0.05,
                      width: screenWidth * 0.4,
                      circularRadius: 10,
                      text: 'Enquiry Now',
                      onTap: () {},
                      color: Appcolor.buttonColor,
                      textColor: Appcolor.white,
                      fontSize: 12,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
