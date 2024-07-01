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
              AnswerRow(
                text: 'faqsubtitle1'.tr,
                maxLines: 2,
              ),
              SizedBox(height: screenHeight * 0.03),
              CustomTitle(
                  fontWeight: FontWeight.w600,
                  textHeading: 'faqtitle3'.tr,
                  fontSize: 12,
                  color: Appcolor.black),
              SizedBox(height: screenHeight * 0.01),
              AnswerRow(text: 'faqsubtitle2'.tr, maxLines: 3),
              SizedBox(height: screenHeight * 0.03),
              CustomTitle(
                  fontWeight: FontWeight.w600,
                  textHeading: 'faqtitle4'.tr,
                  fontSize: 12,
                  color: Appcolor.black),
              SizedBox(height: screenHeight * 0.01),
              AnswerRow(text: 'faqsubtitle3'.tr, maxLines: 2),
              SizedBox(height: screenHeight * 0.03),
              CustomTitle(
                  fontWeight: FontWeight.w600,
                  textHeading: 'faqtitle5'.tr,
                  fontSize: 12,
                  color: Appcolor.black),
              SizedBox(height: screenHeight * 0.01),
              AnswerRow(text: 'faqsubtitle4'.tr, maxLines: 3),
              SizedBox(height: screenHeight * 0.03),
              CustomTitle(
                  fontWeight: FontWeight.w600,
                  textHeading: 'faqtitle6'.tr,
                  fontSize: 12,
                  color: Appcolor.black),
              SizedBox(height: screenHeight * 0.01),
              AnswerRow(text: 'faqsubtitle5'.tr, maxLines: 3),
              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
