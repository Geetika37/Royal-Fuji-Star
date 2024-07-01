import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/home/widgets/carousel_slider.dart';
import 'package:royal_fuji_star/screens/home/widgets/homeappbar.dart';
import 'package:royal_fuji_star/screens/home/widgets/products_container.dart';
import 'package:royal_fuji_star/screens/home/widgets/settingsdrawer.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required this.onDrawerChanged});
  final Function(bool) onDrawerChanged;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: HomeAppbar(
          scaffoldKey: _scaffoldKey,
        ),
      ),
      drawer: SettingsDrawer(
        onDrawerChanged: widget.onDrawerChanged,
        width: screenWidth * 0.999,
        height: screenHeight,
      ),
      onDrawerChanged: widget.onDrawerChanged,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/png/homebg.png',
                ),
                fit: BoxFit.fitWidth)),
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: ListView(
            children: [
              Text('hometitle1'.tr,
                  style: poppins(Appcolor.black, 9, FontWeight.w600)),
              SizedBox(height: screenHeight * 0.007),
              Text('hometitle2'.tr,
                  style: poppins(Appcolor.buttonColor, 14, FontWeight.w700)),
              Text('hometitle3'.tr,
                  style: poppins(Appcolor.black, 10, FontWeight.w500)),
              SizedBox(height: screenHeight * 0.022),
              Text("hometitle4".tr,
                  style: poppins(const Color(0xFF273039), 9, FontWeight.w400)),
              SizedBox(height: screenHeight * 0.01),
              const CustomCarouselSlider(),
              SizedBox(height: screenHeight * 0.02),
              Center(
                child: Text(
                  'hometitle5'.tr,
                  style: poppins(Appcolor.white, 12, FontWeight.w600),
                ),
              ),
              ProductsContainer()
            ],
          ),
        ),
      ),
    );
  }
}

