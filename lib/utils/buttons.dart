import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class BlueButton extends StatelessWidget {
  const BlueButton({
    super.key,
    required this.height,
    required this.width,
    required this.circularRadius,
    required this.text,
    required this.onTap, required this.color, required this.textColor,
  });
  final double height, width, circularRadius;
  final String text;
  final Function() onTap;
  final Color color,textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(circularRadius),
        ),
        child: Center(
            child: Text(
          text,
          style: poppins(
            textColor,
            14,
            FontWeight.w600,
          ),
        )),
      ),
    );
  }
}

class BlueButtonOutlined extends StatelessWidget {
  const BlueButtonOutlined({
    super.key,
    required this.height,
    required this.width,
    required this.circularRadius,
    required this.text,
    required this.onTap,
  });
  final double height, width, circularRadius;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Appcolor.buttonColor,
          ),
          borderRadius: BorderRadius.circular(circularRadius),
        ),
        child: Center(
            child: Text(
          text,
          style: poppins(
            Appcolor.buttonColor,
            14,
            FontWeight.w600,
          ),
        )),
      ),
    );
  }
}

class BlueButtonWithIcon extends StatelessWidget {
  const BlueButtonWithIcon({
    super.key,
    required this.height,
    required this.width,
    required this.circularRadius,
    required this.text,
    required this.onTap,
  });
  final double height, width, circularRadius;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Appcolor.buttonColor,
          borderRadius: BorderRadius.circular(circularRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                text,
                style: poppins(
                  Appcolor.white,
                  14,
                  FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.1,
            ),
            Container(
              height: screenHeight * 0.1,
              decoration: const BoxDecoration(
                color: Appcolor.white,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/svg/tick.svg',
                    color: Appcolor.buttonColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OutlineBlueButtonWithIcon extends StatelessWidget {
  const OutlineBlueButtonWithIcon({
    super.key,
    required this.height,
    required this.width,
    required this.circularRadius,
    required this.text,
    required this.onTap,
  });
  final double height, width, circularRadius;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Appcolor.buttonColor,
          ),
          borderRadius: BorderRadius.circular(circularRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                text,
                style: poppins(
                  Appcolor.buttonColor,
                  14,
                  FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.15,
            ),
            Container(
              height: screenHeight * 0.1,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Appcolor.buttonColor,
                ),
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding:  EdgeInsets.all(8),
              ),
            )
          ],
        ),
      ),
    );
  }
}
