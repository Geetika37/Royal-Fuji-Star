import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/consultation/widgets/consultation_container.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class Consultation extends StatelessWidget {
  const Consultation({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/png/loginbg.png',
                ),
                fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Appcolor.white,
                ),
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.06,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Appcolor.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/png/logo.png'),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Text(
                      'Advisory',
                      style: poppins(Appcolor.white, 20, FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const Positioned(
                bottom: 0,
                child: ConsultationContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
