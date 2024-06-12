import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/services/widgets/partscontainer.dart';
import 'package:royal_fuji_star/screens/services/widgets/partsname.dart';
import 'package:royal_fuji_star/screens/widgets/customappbar.dart';

class SpareParts extends StatefulWidget {
  const SpareParts({super.key});

  @override
  State<SpareParts> createState() => _SparePartsState();
}

class _SparePartsState extends State<SpareParts> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: 'Spare Parts for all Brands',
            titleSpacing: screenWidth * 0.1,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 8,
          ),
          child: ListView(
            children: [
              const PartsName(),
              SizedBox(height: screenHeight * 0.01),
              SizedBox(
                height: screenHeight * 0.31,
                child: const PartsContainer(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
