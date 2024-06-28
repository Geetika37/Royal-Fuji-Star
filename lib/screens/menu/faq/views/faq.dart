import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/menu/faq/widgets/answer_row.dart';
import 'package:royal_fuji_star/screens/widgets/customappbar.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/textcustom.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: 'faqtitle1'.tr,
            titleSpacing: screenWidth * 0.1,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.01),
              CustomTitle(
                  fontWeight: FontWeight.w600,
                  textHeading: 'faqtitle2'.tr,
                  fontSize: 12,
                  color: Appcolor.black),
              SizedBox(height: screenHeight * 0.01),
              const AnswerRow(
                  text:
                      'We take pride in our rapid delivery service – your desired elevator product will be at your doorstep within just 30 days.',
                  maxLines: 2),
              SizedBox(height: screenHeight * 0.03),
              CustomTitle(
                  fontWeight: FontWeight.w600,
                  textHeading: 'faqtitle3'.tr,
                  fontSize: 12,
                  color: Appcolor.black),
              SizedBox(height: screenHeight * 0.01),
              const AnswerRow(
                  text:
                      'Our expert technicians efficiently complete elevator installations from the ground floor to the tenth floor within an astonishing 40 to 42 days. Residential or commercial, we’ve got you covered.',
                  maxLines: 3),
              SizedBox(height: screenHeight * 0.03),
              CustomTitle(
                  fontWeight: FontWeight.w600,
                  textHeading: 'faqtitle4'.tr,
                  fontSize: 12,
                  color: Appcolor.black),
              SizedBox(height: screenHeight * 0.01),
              const AnswerRow(
                  text:
                      'Our experienced technicians promptly diagnose and efficiently repair elevator malfunctions, ensuring uninterrupted vertical mobility',
                  maxLines: 2),
              SizedBox(height: screenHeight * 0.03),
              CustomTitle(
                  fontWeight: FontWeight.w600,
                  textHeading: 'faqtitle5'.tr,
                  fontSize: 12,
                  color: Appcolor.black),
              SizedBox(height: screenHeight * 0.01),
              const AnswerRow(
                  text:
                      'Royal Fuji’s meticulous attention ensures the longevity of your elevator. Our technicians conduct regular inspections, check oil levels, and test components for seamless functionality.',
                  maxLines: 3),
              SizedBox(height: screenHeight * 0.03),
              CustomTitle(
                  fontWeight: FontWeight.w600,
                  textHeading: 'faqtitle6'.tr,
                  fontSize: 12,
                  color: Appcolor.black),
              SizedBox(height: screenHeight * 0.01),
              const AnswerRow(
                  text:
                      'Quality spare parts are essential for maintaining elevator safety and efficiency. We offer an extensive collection of elevator components, available within 2-3 hours regardless of brand.',
                  maxLines: 3),
              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
