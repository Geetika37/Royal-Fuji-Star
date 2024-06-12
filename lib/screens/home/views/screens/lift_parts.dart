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
          padding: const EdgeInsets.only(
            left: 8,
          ),
          child: ListView(
            children: [
              const LiftPartsName(text: 'cabins'),
              SizedBox(height: screenHeight * 0.01),
              SizedBox(
                height: screenHeight * 0.31,
                child: const ListPartsContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
