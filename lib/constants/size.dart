import 'package:flutter/material.dart';
import 'package:get/get.dart';

final double screenWidth = Get.width;

final double screenHeight = Get.height;

class ScreenSize {
  static double getWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }
}
