import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/notification/views/screens/notification_empty.dart';
import 'package:royal_fuji_star/screens/widgets/customappbar.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: 'notifications'.tr,
            titleSpacing: 0,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 13,
            right: 15,
            left: 15,
          ),
          child: InkWell(
            onTap: () {
              Get.to(const NotificationEmpty());
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Appcolor.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 10,
                    blurRadius: 10,
                    offset: const Offset(0, 7),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 18,
                  right: 18,
                  bottom: 30,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'notification_msg'.tr,
                      style: poppins(const Color.fromARGB(255, 126, 130, 133),
                          14, FontWeight.w600),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Text(
                      '10/05/2024',
                      style: poppins(const Color.fromARGB(255, 126, 130, 133),
                          14, FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
