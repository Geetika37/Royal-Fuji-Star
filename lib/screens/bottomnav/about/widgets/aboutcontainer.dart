
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:royal_fuji_star/constants/size.dart';
// import 'package:royal_fuji_star/screens/bottomnav/about/widgets/aboutgridview.dart';
// import 'package:royal_fuji_star/screens/bottomnav/about/widgets/contactinfo.dart';
// import 'package:royal_fuji_star/screens/bottomnav/about/widgets/emailinfo.dart';
// import 'package:royal_fuji_star/screens/bottomnav/about/widgets/videoplayer.dart';
// import 'package:royal_fuji_star/utils/appcolor.dart';
// import 'package:royal_fuji_star/utils/textcustom.dart';

// class Aboutcontainer extends StatelessWidget {
//   const Aboutcontainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // height: screenHeight * 0.58,
//       height: ScreenSize.getHeight(context) * 0.58,
//       width: ScreenSize.getWidth(context),
//       decoration: const BoxDecoration(
//           color: Appcolor.white,
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(45), topRight: Radius.circular(45))),
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: screenHeight * 0.02),
//               CustomTitle(
//                   fontWeight: FontWeight.w500,
//                   textHeading: 'abouttext1'.tr,
//                   fontSize: 16,
//                   color: Appcolor.buttonColor),
//               SizedBox(height: screenHeight * 0.01),
//               CustomSubTitle(
//                   color: Appcolor.black,
//                   fontSize: 11,
//                   subTitle: 'abouttext2'.tr,
//                   maxLines: 2),
//               SizedBox(height: screenHeight * 0.02),
//               CustomTitle(
//                   fontWeight: FontWeight.w500,
//                   textHeading: 'abouttext3'.tr,
//                   fontSize: 12,
//                   color: Appcolor.buttonColor),
//               SizedBox(height: screenHeight * 0.02),
//               const VideoPlayer(),
//               SizedBox(height: screenHeight * 0.02),
//               CustomTitle(
//                   fontWeight: FontWeight.w500,
//                   textHeading: 'abouttext4'.tr,
//                   fontSize: 14,
//                   color: Appcolor.buttonColor),
//               SizedBox(height: screenHeight * 0.01),
//               CustomSubTitle(
//                 color: Appcolor.black,
//                 fontSize: 11,
//                 subTitle: "abouttext5".tr,
//                 maxLines: 14,
//               ),
//               SizedBox(height: screenHeight * 0.02),
//               Aboutgridview(),
//               SizedBox(height: screenHeight * 0.02),
//               CustomTitle(
//                   fontWeight: FontWeight.w500,
//                   textHeading: 'abouttext10'.tr,
//                   fontSize: 14,
//                   color: Appcolor.buttonColor),
//               SizedBox(height: screenHeight * 0.02),
//               const Text(
//                 'AL Ramool Oasis Building, Office #211, Floor 1, Umm Ramool, Dubai, UAE',
//                 style: TextStyle(
//                   color: Appcolor.black,
//                   fontSize: 12,
//                   fontWeight: FontWeight.w400,
//                   decoration: TextDecoration.underline,
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.01),
//               const ContactInfo(text: '+971-50-6515493', text1: '– UAE'),
//               const ContactInfo(text: '+971-50-6296037', text1: '– ABU DHABI'),
//               const ContactInfo(text: '+971-50-6296247', text1: '– DUBAI'),
//               const ContactInfo(text: '+971 4 331 9312', text1: '– Office'),
//               SizedBox(height: screenHeight * 0.01),
//               const EmailInfo(email: 'info@royalfujistar.com'),
//               const EmailInfo(email: 'sales@royalfujistar.com'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/bottomnav/about/widgets/aboutgridview.dart';
import 'package:royal_fuji_star/screens/bottomnav/about/widgets/contactinfo.dart';
import 'package:royal_fuji_star/screens/bottomnav/about/widgets/emailinfo.dart';
import 'package:royal_fuji_star/screens/bottomnav/about/widgets/videoplayer.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/textcustom.dart';

class Aboutcontainer extends StatelessWidget {
  const Aboutcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return const Scaffold(
            body: VideoPlayer(),
          );
        } else {
          return Container(
            height: ScreenSize.getHeight(context) * 0.58,
            width: ScreenSize.getWidth(context),
            decoration: const BoxDecoration(
              color: Appcolor.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: ScreenSize.getHeight(context) * 0.02),
                    CustomTitle(
                      fontWeight: FontWeight.w500,
                      textHeading: 'abouttext1'.tr,
                      fontSize: 16,
                      color: Appcolor.buttonColor,
                    ),
                    SizedBox(height: ScreenSize.getHeight(context) * 0.01),
                    CustomSubTitle(
                      color: Appcolor.black,
                      fontSize: 11,
                      subTitle: 'abouttext2'.tr,
                      maxLines: 2,
                    ),
                    SizedBox(height: ScreenSize.getHeight(context) * 0.02),
                    CustomTitle(
                      fontWeight: FontWeight.w500,
                      textHeading: 'abouttext3'.tr,
                      fontSize: 12,
                      color: Appcolor.buttonColor,
                    ),
                    SizedBox(height: ScreenSize.getHeight(context) * 0.02),
                    Container(
                      height: ScreenSize.getHeight(context) * 0.25,
                      child: const VideoPlayer(),
                    ),
                    SizedBox(height: ScreenSize.getHeight(context) * 0.02),
                    CustomTitle(
                      fontWeight: FontWeight.w500,
                      textHeading: 'abouttext4'.tr,
                      fontSize: 14,
                      color: Appcolor.buttonColor,
                    ),
                    SizedBox(height: ScreenSize.getHeight(context) * 0.01),
                    CustomSubTitle(
                      color: Appcolor.black,
                      fontSize: 11,
                      subTitle: "abouttext5".tr,
                      maxLines: 14,
                    ),
                    SizedBox(height: ScreenSize.getHeight(context) * 0.02),
                    Aboutgridview(),
                    SizedBox(height: ScreenSize.getHeight(context) * 0.02),
                    CustomTitle(
                      fontWeight: FontWeight.w500,
                      textHeading: 'abouttext10'.tr,
                      fontSize: 14,
                      color: Appcolor.buttonColor,
                    ),
                    SizedBox(height: ScreenSize.getHeight(context) * 0.02),
                    const Text(
                      'AL Ramool Oasis Building, Office #211, Floor 1, Umm Ramool, Dubai, UAE',
                      style: TextStyle(
                        color: Appcolor.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(height: ScreenSize.getHeight(context) * 0.01),
                    const ContactInfo(text: '+971-50-6515493', text1: '– UAE'),
                    const ContactInfo(text: '+971-50-6296037', text1: '– ABU DHABI'),
                    const ContactInfo(text: '+971-50-6296247', text1: '– DUBAI'),
                    const ContactInfo(text: '+971 4 331 9312', text1: '– Office'),
                    SizedBox(height: ScreenSize.getHeight(context) * 0.01),
                    const EmailInfo(email: 'info@royalfujistar.com'),
                    const EmailInfo(email: 'sales@royalfujistar.com'),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
