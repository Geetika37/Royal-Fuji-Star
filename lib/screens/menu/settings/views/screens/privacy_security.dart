import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/widgets/customappbar.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/textcustom.dart';

class PrivacySecurity extends StatelessWidget {
  const PrivacySecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: 'Privacy and Security',
            titleSpacing: screenWidth * 0.2,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'Introduction',
                    fontSize: 12,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.01),
                const CustomSubTitle(
                    color: Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle:
                        'At Royal Fuji Star, we value your privacy and are committed to protecting your personal information. This Privacy and Security policy explains how we collect, use, and protect your data when you use our mobile application. This policy was last updated on [Date].',
                    maxLines: 4),
                SizedBox(height: screenHeight * 0.02),
                const CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'Data Collection',
                    fontSize: 12,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.01),
                const CustomSubTitle(
                    color: Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle:
                        'We collect various types of information to provide and improve our services to you. This includes personal information such as your name, email address, and phone number, as well as usage data like your interactions with our app and location data if you have enabled location services.',
                    maxLines: 5),
                SizedBox(height: screenHeight * 0.02),
                const CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'Use of Data',
                    fontSize: 12,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.01),
                const CustomSubTitle(
                    color: Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle:
                        'We use the data we collect to provide and maintain our services, notify you of changes, allow you to participate in interactive features, and improve our app. Additionally, your data helps us monitor app usage and detect and address technical issues.',
                    maxLines: 4),
                SizedBox(height: screenHeight * 0.02),
                const CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'Data Sharing',
                    fontSize: 12,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.01),
                const CustomSubTitle(
                    color: Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle:
                        'We may share your data with third-party service providers to help us analyze and improve our services. We will not share your personal data without your consent unless required by law.',
                    maxLines: 3),
                SizedBox(height: screenHeight * 0.02),
                const CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'Data Security',
                    fontSize: 12,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.01),
                const CustomSubTitle(
                    color: Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle:
                        "We implement various security measures, including encryption and access controls, to protect your data. However, it's important that you also protect your information by using strong passwords and keeping your login details confidential.",
                    maxLines: 4),
                SizedBox(height: screenHeight * 0.02),
                const CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'User Rights',
                    fontSize: 12,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.01),
                const CustomSubTitle(
                    color: Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle:
                        "You have the right to access, correct, and delete your personal information. You can also request a copy of your data in a machine-readable format. Please contact us to exercise these rights.",
                    maxLines: 3),
                SizedBox(height: screenHeight * 0.02),
                const CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'Cookies and Tracking Technologies',
                    fontSize: 12,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.01),
                const CustomSubTitle(
                    color: Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle:
                        "We implement various security measures, including encryption and access controls, to protect your data. However, it's important that you also protect your information by using strong passwords and keeping your login details confidential.",
                    maxLines: 4),
                SizedBox(height: screenHeight * 0.02),
                const CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'Changes to This Policy',
                    fontSize: 12,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.01),
                const CustomSubTitle(
                    color: Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle:
                        "We use cookies to enhance your experience, analyze usage, and for advertising purposes. You can manage your cookie preferences in the app settings or through your browser settings.",
                    maxLines: 3),
                SizedBox(height: screenHeight * 0.02),
                const CustomTitle(
                    fontWeight: FontWeight.w500,
                    textHeading: 'Contact Information',
                    fontSize: 12,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.01),
                const CustomSubTitle(
                    color: Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle:
                        "If you have any questions or concerns about our Privacy and Security policy, please contact us at [Email Address], [Mailing Address], or [Phone Number].",
                    maxLines: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
