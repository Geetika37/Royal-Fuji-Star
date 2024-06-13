
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class EnglishContainer extends StatelessWidget {
  const EnglishContainer({
    super.key,
    required this.onPressed1,
  });

  final bool onPressed1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.06,
      width: screenWidth * 0.45,
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: onPressed1
                ? Appcolor.buttonColor
                : Appcolor.buttonColor,
          ),
          color: onPressed1 ? Appcolor.buttonColor : Appcolor.white,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text('English',
                style:
                    poppins(onPressed1? Appcolor.white:Appcolor.buttonColor, 14, FontWeight.w600)),
          ),
          SizedBox(width: screenWidth * 0.1),
          onPressed1
              ? Container(
                  height: screenHeight * 0.1,
                  decoration: const BoxDecoration(
                      color: Appcolor.white,
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/svg/tick.svg',
                        // ignore: deprecated_member_use
                        color: Appcolor.buttonColor,
                      ),
                    ),
                  ),
                )
              : Container(
                  height: screenHeight * 0.1,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Appcolor.buttonColor,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                  ),
                ),
        ],
      ),
    );
  }
}
