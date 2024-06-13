import 'package:flutter/widgets.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class CategoryAnimatedcontainer extends StatefulWidget {
  const CategoryAnimatedcontainer({super.key});

  @override
  State<CategoryAnimatedcontainer> createState() =>
      _CategoryAnimatedcontainerState();
}

class _CategoryAnimatedcontainerState extends State<CategoryAnimatedcontainer> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: screenWidth,
        height: screenHeight * 0.04,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Appcolor.buttonColor),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              left: selectedIndex * 128.0,
              child: Container(
                width: screenWidth * 0.295,
                height: screenHeight * 0.039,
                decoration: BoxDecoration(
                  color: Appcolor.buttonColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Row(
              children: [
                categories('Standard', 0),
                categories('Premium', 1),
                categories('Luxury', 2),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget categories(String title, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: selectedIndex == index
                  ? Appcolor.white
                  : const Color.fromARGB(255, 133, 133, 133),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
