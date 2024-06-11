import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/menu/settings/views/screens/delete_account.dart';
import 'package:royal_fuji_star/screens/menu/settings/views/screens/language_settings.dart';
import 'package:royal_fuji_star/screens/menu/settings/views/screens/notification_settings.dart';
import 'package:royal_fuji_star/screens/menu/settings/views/screens/privacy_security.dart';
import 'package:royal_fuji_star/screens/menu/settings/views/screens/support_feedback.dart';
import 'package:royal_fuji_star/screens/menu/settings/widgets/cardsettings.dart';
import 'package:royal_fuji_star/screens/widgets/customappbar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: 'Settings',
            titleSpacing: screenWidth * 0.2,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              CardSettings(
                text: 'Notification Settings',
                onTap: () => Get.to(const NotificationSettings()),
              ),
              CardSettings(
                text: 'Language Settings',
                onTap: () => Get.to(const LanguageSettings()),
              ),
              CardSettings(
                text: 'Privacy and Security',
                onTap: () => Get.to(const PrivacySecurity()),
              ),
              CardSettings(
                text: 'Support and Feedback',
                onTap: () => Get.to(const SupportFeedback()),
              ),
              CardSettings(
                text: 'Delete Account',
                onTap: () => Get.to(const DeleteAccount()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
