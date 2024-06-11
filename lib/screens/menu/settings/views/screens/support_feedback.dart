import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/widgets/customappbar.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/textcustom.dart';

class SupportFeedback extends StatelessWidget {
  const SupportFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: 'Support and Feedback',
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
                    textHeading: 'Introduction',
                    fontSize: 12,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.01),
                const CustomSubTitle(
                    color: Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle:
                        'Welcome to the Support and Feedback page! Here, you can find various ways to get help, report problems, and share your feedback with us. Our goal is to ensure you have the best experience with our app.',
                    maxLines: 4),
                SizedBox(height: screenHeight * 0.03),
                const CustomTitle(
                    textHeading: 'Contact Support',
                    fontSize: 12,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.01),
                const CustomTitle(
                    textHeading: 'Email Support',
                    fontSize: 10,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.005),
                const CustomSubTitle(
                    color: Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle:
                        'If you need assistance, please email us at support@company.com. Our support team will get back to you within 24 hours.',
                    maxLines: 2),
                SizedBox(height: screenHeight * 0.013),
                const CustomTitle(
                    textHeading: 'Phone Support',
                    fontSize: 10,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.005),
                const CustomSubTitle(
                    color: Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle:
                        'For immediate help, call us at [1-800-123-4567]. Our support lines are open Monday to Friday, from 9 AM to 5 PM.',
                    maxLines: 2),
                SizedBox(height: screenHeight * 0.013),
                const CustomTitle(
                    textHeading: 'Support Hours',
                    fontSize: 10,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.005),
                const CustomSubTitle(
                    color: Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle:
                        'Our support team is available from 9 AM to 5 PM, Monday to Friday. We aim to respond to all inquiries within one business day.',
                    maxLines: 2),
                SizedBox(height: screenHeight * 0.013),
                const CustomTitle(
                    textHeading: 'Report a Problem',
                    fontSize: 10,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.005),
                const CustomSubTitle(
                    color: Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle:
                        "Encountered a problem? Let us know! Please provide as much detail as possible, including any error messages and screenshots. You can report issues directly through the app by navigating to the 'Report a Problem' section in the menu, or email us at support@company.com.",
                    maxLines: 4),
                SizedBox(height: screenHeight * 0.013),
                const CustomTitle(
                    textHeading: 'Send Feedback',
                    fontSize: 10,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.005),
                const CustomSubTitle(
                    color: Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle:
                        "We value your feedback! To share your thoughts, suggestions, or feature requests, please fill out our Feedback Form. Your input helps us improve and provide a better experience for all users.",
                    maxLines: 3),
                SizedBox(height: screenHeight * 0.013),
                const CustomTitle(
                    textHeading: 'Status Updates',
                    fontSize: 10,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.005),
                const CustomSubTitle(
                    color: Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle:
                        "Check our Status Page for updates on ongoing issues, scheduled maintenance, and system status. We keep this page updated to ensure you are informed about any service interruptions.",
                    maxLines: 3),
                SizedBox(height: screenHeight * 0.013),
                const CustomTitle(
                    textHeading: 'Additional Resources',
                    fontSize: 10,
                    color: Appcolor.black),
                SizedBox(height: screenHeight * 0.005),
                const CustomSubTitle(
                    color: Color.fromARGB(255, 114, 114, 114),
                    fontSize: 10,
                    subTitle:
                        '"Explore our User Guides and Tutorials to get the most out of our app. Join our Community Forum to connect with other users, share tips, and ask questions."',
                    maxLines: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
