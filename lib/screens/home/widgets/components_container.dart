import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class ComponentsContainer extends StatefulWidget {
  const ComponentsContainer({super.key});

  @override
  State<ComponentsContainer> createState() => _ComponentsContainerState();
}

class _ComponentsContainerState extends State<ComponentsContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(
        right: 10,
        left: 10,
      ),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 7,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? Appcolor.buttonColor
                    : Appcolor.bgColor,
                border: Border.all(
                  color: selectedIndex == index
                      ? Appcolor.black
                      : Colors.transparent,
                  width: 3,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/png/testimg.png',
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  selectedIndex == index
                      ? SizedBox(
                          width: screenWidth * 0.25,
                          child: const Text(
                            'Item1',
                            style: TextStyle(color: Appcolor.white),
                          ),
                        )
                      : const Text(
                          'Item1',
                          style: TextStyle(color: Appcolor.black),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
