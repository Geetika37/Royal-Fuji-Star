import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/home/models/esclatorlist.dart';
import 'package:royal_fuji_star/screens/widgets/customappbar.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class Escalators extends StatelessWidget {
  const Escalators({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: 'Escalators',
            titleSpacing: screenWidth * 0.2,
          ),
        ),
        body: ListView.builder(
          itemCount: escalatorList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: InkWell(
                onTap: escalatorList[index].onTap,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 197, 229, 247)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      right: 10,
                      left: 10,
                      bottom: 35,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          escalatorList[index].imagePath,
                          height: screenHeight * 0.27,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        Text(
                          escalatorList[index].title,
                          style: poppins(
                              Appcolor.buttonColor, 16, FontWeight.w600),
                        ),
                        SizedBox(height: screenHeight * 0.006),
                        Text(
                          escalatorList[index].subTitle,
                          style: poppins(
                              Appcolor.blackPrimary, 12, FontWeight.w500),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          escalatorList[index].description,
                          style: poppins(
                              Appcolor.blackPrimary, 10, FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
