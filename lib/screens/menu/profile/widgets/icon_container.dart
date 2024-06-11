
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Appcolor.white,
          border: Border.all(
            color: Appcolor.buttonColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(100)),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SvgPicture.asset('assets/svg/progileicon.svg'),
      ),
    );
  }
}
