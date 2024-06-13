import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/bottomnav/services/models/item_list.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class CategoryItemcontainer extends StatefulWidget {
  const CategoryItemcontainer({super.key});

  @override
  State<CategoryItemcontainer> createState() => _CategoryItemcontainerState();
}

class _CategoryItemcontainerState extends State<CategoryItemcontainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 10, right: 17),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Column(
              children: [
                Container(
                  height: screenHeight * 0.06,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Appcolor.buttonColor,
                      ),
                      color: selectedIndex == index
                          ? Appcolor.buttonColor
                          : Appcolor.bgColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 12, right: 12),
                    child: SvgPicture.asset(
                      itemList[index].imgPath,
                      // ignore: deprecated_member_use
                      color: selectedIndex == index
                          ? Appcolor.white
                          : Appcolor.buttonColor,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.008),
                Text(
                  itemList[index].text,
                  style: selectedIndex == index
                      ? poppins(Appcolor.buttonColor, 11, FontWeight.w400)
                      : poppins(Appcolor.black, 11, FontWeight.w400),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
