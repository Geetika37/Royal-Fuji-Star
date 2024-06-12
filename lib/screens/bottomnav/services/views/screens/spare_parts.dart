import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/widgets/customappbar.dart';

class SpareParts extends StatelessWidget {
  const SpareParts({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppbar(
          text: 'Spare Parts for all Brands',
          titleSpacing: screenWidth * 0.12,
        ),
      ),
    ));
  }
}
