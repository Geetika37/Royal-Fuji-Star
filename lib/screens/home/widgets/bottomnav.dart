import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/bottomnav/about/views/about.dart';
import 'package:royal_fuji_star/screens/bottomnav/advisory/views/consultation.dart';
import 'package:royal_fuji_star/screens/home/views/homepage.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/views/services.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  final _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;
  bool _isDrawerOpen = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onDrawerChanged(bool isOpen) {
    setState(() {
      _isDrawerOpen = isOpen;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      HapticFeedback.mediumImpact();
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> bottomBarPages = [
      Homepage(onDrawerChanged: _onDrawerChanged),
      const Services(),
      const Consultation(),
      const About(),
    ];
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: bottomBarPages,
        ),
        extendBody: true,
        bottomNavigationBar: _isDrawerOpen
            ? null
            : Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 30, left: 30),
                child: Container(
                  height: screenHeight * 0.10,
                  decoration: const BoxDecoration(
                    color: Appcolor.buttonColor,
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 0,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BottomBarItem(
                        image: bottombarContents[0].image,
                        pressedimage: bottombarContents[0].pressedimage,
                        label: bottombarContents[0].label,
                        isSelected: _currentIndex == 0,
                        index: 0,
                        onTap: _onItemTapped,
                      ),
                      BottomBarItem(
                        image: bottombarContents[1].image,
                        pressedimage: bottombarContents[1].pressedimage,
                        label: bottombarContents[1].label,
                        isSelected: _currentIndex == 1,
                        index: 1,
                        onTap: _onItemTapped,
                      ),
                      BottomBarItem(
                        image: bottombarContents[2].image,
                        pressedimage: bottombarContents[2].pressedimage,
                        label: bottombarContents[2].label,
                        isSelected: _currentIndex == 2,
                        index: 2,
                        onTap: _onItemTapped,
                      ),
                      BottomBarItem(
                        image: bottombarContents[3].image,
                        pressedimage: bottombarContents[3].pressedimage,
                        label: bottombarContents[3].label,
                        isSelected: _currentIndex == 3,
                        index: 3,
                        onTap: _onItemTapped,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final String image;
  final String pressedimage;
  final String label;
  final bool isSelected;
  final int index;
  final Function(int) onTap;

  const BottomBarItem({
    super.key,
    required this.image,
    required this.pressedimage,
    required this.label,
    required this.isSelected,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(index),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          height: screenHeight * 0.09,
          decoration: isSelected
              ? const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                )
              : null,
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                isSelected ? pressedimage : image,
                height: screenHeight * 0.03,
              ),
              SizedBox(
                height: screenHeight * 0.005,
              ),
              Text(
                label,
                style: TextStyle(
                    color: isSelected ? Appcolor.buttonColor : Colors.white,
                    fontSize: 11.0,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class BottombarContent {
  final String image;
  final String pressedimage;
  final String label;
  BottombarContent(this.image, this.pressedimage, this.label);
}

List<BottombarContent> bottombarContents = [
  BottombarContent(
      "assets/svg/wproduct.svg", "assets/svg/bproduct.svg", "Products"),
  BottombarContent(
      "assets/svg/wservice.svg", "assets/svg/bservice.svg", "Services"),
  BottombarContent(
      "assets/svg/wadvisory.svg", "assets/svg/badvisory.svg", "Advisory"),
  BottombarContent("assets/svg/wabout.svg", "assets/svg/babout.svg", "About"),
];
