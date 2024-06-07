import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/screens/splash/views/base.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // fontFamily: GoogleFonts.poppins().toString(),
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Appcolor.bgColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Appcolor.bgColor,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BasePage(),
    );
  }
}
