import 'package:flutter/material.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('WELCOME TO ROYAL FUJI STAR',
                  style: poppins(Appcolor.black, 9, FontWeight.w600)),
              SizedBox(height: screenHeight * 0.007),
              Text('Sky-High Convenience',
                  style: poppins(Appcolor.buttonColor, 14, FontWeight.w700)),
              Text('Elevators to transform your life',
                  style: poppins(Appcolor.black, 10, FontWeight.w500)),
              SizedBox(height: screenHeight * 0.022),
              Text(
                  "Royal Fuji is a leading lift company in Dubai, with over 15 years of experience. We specialize in manufacturing, supplying, installing, repairing, maintaining, and modernizing all types of lifts for residential and commercial buildings. Our reputation is built on professionalism, hard work, and high-quality products tailored to our customers' needs.",
                  style: poppins(const Color(0xFF273039), 9, FontWeight.w400)),
              SizedBox(height: screenHeight * 0.01),
              const CustomCarouselSlider(),
              SizedBox(height: screenHeight * 0.02),
              Center(
                child: Text(
                  'OUR PRODUCTS',
                  style: poppins(Appcolor.white, 12, FontWeight.w600),
                ),
              ),
              const Expanded(child: ProductsContainer())
            ],
          ),
        ),
      ),
    );
  }
}
