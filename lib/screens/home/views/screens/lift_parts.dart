import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/home/widgets/lift_partscontainer.dart';
import 'package:royal_fuji_star/screens/home/widgets/lift_partsname.dart';
import 'package:royal_fuji_star/screens/widgets/customappbar.dart';

class LiftParts extends StatefulWidget {
  const LiftParts({super.key});

  @override
  State<LiftParts> createState() => _LiftPartsState();
}

class _LiftPartsState extends State<LiftParts> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: 'Parts',
            titleSpacing: screenWidth * 0.3,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: ListView(
            children: [
              const LiftPartsName(
                fontWeight: FontWeight.w500,
                text: 'Cabins',
                fontSize: 12,
                textColor: Color.fromARGB(255, 133, 133, 133),
                dividerColor: Color.fromARGB(255, 206, 206, 206),
              ),
              SizedBox(height: screenHeight * 0.01),
              SizedBox(
                height: screenHeight * 0.31,
                child: const LiftPartsContainer(),
              ),
              SizedBox(height: screenHeight * 0.01),
              const LiftPartsName(
                fontWeight: FontWeight.w500,
                text: 'Door System',
                fontSize: 12,
                textColor: Color.fromARGB(255, 133, 133, 133),
                dividerColor: Color.fromARGB(255, 206, 206, 206),
              ),
              SizedBox(height: screenHeight * 0.01),
              SizedBox(
                height: screenHeight * 0.31,
                child: const LiftPartsContainer(),
              ),
              SizedBox(height: screenHeight * 0.01),
              const LiftPartsName(
                fontWeight: FontWeight.w500,
                text: 'Safety Components',
                fontSize: 12,
                textColor: Color.fromARGB(255, 133, 133, 133),
                dividerColor: Color.fromARGB(255, 206, 206, 206),
              ),
              SizedBox(height: screenHeight * 0.01),
              SizedBox(
                height: screenHeight * 0.31,
                child: const LiftPartsContainer(),
              ),
              SizedBox(height: screenHeight * 0.01),
              const LiftPartsName(
                fontWeight: FontWeight.w500,
                text: 'Encoder',
                fontSize: 12,
                textColor: Color.fromARGB(255, 133, 133, 133),
                dividerColor: Color.fromARGB(255, 206, 206, 206),
              ),
              SizedBox(height: screenHeight * 0.01),
              SizedBox(
                height: screenHeight * 0.31,
                child: const LiftPartsContainer(),
              ),
              SizedBox(height: screenHeight * 0.01),
              const LiftPartsName(
                fontWeight: FontWeight.w500,
                text: 'Cross Flow fan',
                fontSize: 12,
                textColor: Color.fromARGB(255, 133, 133, 133),
                dividerColor: Color.fromARGB(255, 206, 206, 206),
              ),
              SizedBox(height: screenHeight * 0.01),
              SizedBox(
                height: screenHeight * 0.31,
                child: const LiftPartsContainer(),
              ),
              SizedBox(height: screenHeight * 0.01),
              const LiftPartsName(
                fontWeight: FontWeight.w500,
                text: '3 Phase Filter',
                fontSize: 12,
                textColor: Color.fromARGB(255, 133, 133, 133),
                dividerColor: Color.fromARGB(255, 206, 206, 206),
              ),
              SizedBox(height: screenHeight * 0.01),
              SizedBox(
                height: screenHeight * 0.31,
                child: const LiftPartsContainer(),
              ),
              SizedBox(height: screenHeight * 0.01),
              const LiftPartsName(
                fontWeight: FontWeight.w500,
                text: 'Steel Rope & Chain',
                fontSize: 12,
                textColor: Color.fromARGB(255, 133, 133, 133),
                dividerColor: Color.fromARGB(255, 206, 206, 206),
              ),
              SizedBox(height: screenHeight * 0.01),
              SizedBox(
                height: screenHeight * 0.31,
                child: const LiftPartsContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
