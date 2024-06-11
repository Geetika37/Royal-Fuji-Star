import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/about/widgets/aboutgridview.dart';
import 'package:royal_fuji_star/screens/about/widgets/contactinfo.dart';
import 'package:royal_fuji_star/screens/about/widgets/emailinfo.dart';
import 'package:royal_fuji_star/screens/about/widgets/videoplayer.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/textcustom.dart';

class Aboutcontainer extends StatelessWidget {
  const Aboutcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.58,
      width: screenWidth,
      decoration: const BoxDecoration(
          color: Appcolor.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45))),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              const CustomTitle(textHeading: 'Projects', fontSize: 16),
              SizedBox(height: screenHeight * 0.01),
              const CustomSubTitle(
                  subTitle:
                      'Exploring the heights of innovation, let’s have a deep look at our cutting-edge elevator projects in the UAE.',
                  maxLines: 2),
              SizedBox(height: screenHeight * 0.02),
              const CustomTitle(textHeading: 'Watch video', fontSize: 12),
              SizedBox(height: screenHeight * 0.02),
              const VideoPlayer(),
              SizedBox(height: screenHeight * 0.02),
              const CustomTitle(
                  textHeading: 'Why Royal Fuji Elevators....?', fontSize: 14),
              SizedBox(height: screenHeight * 0.01),
              const CustomSubTitle(
                subTitle:
                    "Elevators and escalators significantly enhance our everyday living, transforming mere transportation into a symbol of elegance.At Royal Fuji Elevator Company in the UAE, we pride ourselves on not just offering premium elevator solutions but also on our commitment to exceptional elevator maintenance and services.Our aim is to ensure the safety of our passengers and the durability of the elevators. From meticulous installations to comprehensive Annual Maintenance Contracts, our services are designed to prioritize the reliability and extended lifespan of your elevators.Discover how our Elevator Services can contribute to the enduring performance of your elevators.",
                maxLines: 14,
              ),
              SizedBox(height: screenHeight * 0.02),
              Aboutgridview(),
              SizedBox(height: screenHeight * 0.02),
              const CustomTitle(textHeading: 'Contact Info', fontSize: 14),
              SizedBox(height: screenHeight * 0.02),
              const Text(
                'AL Ramool Oasis Building, Office #211, Floor 1, Umm Ramool, Dubai, UAE',
                style: TextStyle(
                  color: Appcolor.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              const ContactInfo(text: '+971-50-6515493', text1: '– UAE'),
              const ContactInfo(text: '+971-50-6296037', text1: '– ABU DHABI'),
              const ContactInfo(text: '+971-50-6296247', text1: '– DUBAI'),
              const ContactInfo(text: '+971 4 331 9312', text1: '– Office'),
              SizedBox(height: screenHeight * 0.01),
              const EmailInfo(email: 'info@royalfujistar.com'),
              const EmailInfo(email: 'sales@royalfujistar.com'),
            ],
          ),
        ),
      ),
    );
  }
}
