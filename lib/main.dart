import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:royal_fuji_star/languages/translations.dart';
import 'package:royal_fuji_star/screens/splash/views/base.dart';
import 'package:royal_fuji_star/services/token.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String? savedLanguage;

  const MyApp({super.key, this.savedLanguage});

  @override
  Widget build(BuildContext context) {
    final savedLanguage = TokenKey.getValue('selectedLanguage');

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Appcolor.buttonColor,
        ),
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Appcolor.bgColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Appcolor.bgColor,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Appcolor.buttonColor),
        useMaterial3: true,
      ),

      translations: AppTranslations(), // Your translation class
      locale: savedLanguage.toString() == 'ar'
          ? const Locale('ar', 'AE')
          : const Locale('en', 'US'), // Initial locale based on savedLanguage
      fallbackLocale:
          const Locale('en', 'US'), // Fallback locale if not available
      home: const BasePage(), // Your initial home page
    );
  }
}







// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:royal_fuji_star/languages/translations.dart';
// import 'package:royal_fuji_star/screens/splash/views/base.dart';
// import 'package:royal_fuji_star/utils/appcolor.dart';

// void main() async {
//   await GetStorage.init();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final box = GetStorage();

//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         fontFamily: 'Poppins',
//         scaffoldBackgroundColor: Appcolor.bgColor,
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Appcolor.bgColor,
//         ),
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       translations: AppTranslations(),
//       locale: _getLocale(box),
//       fallbackLocale: const Locale('en', 'US'),
//       home: const BasePage(),
//     );
//   }

//   Locale _getLocale(GetStorage box) {
//     String? locale = box.read('locale');
//     if (locale != null) {
//       var parts = locale.split('_');
//       return Locale(parts[0], parts[1]);
//     }
//     return const Locale('en', 'US');
//   }
// }
