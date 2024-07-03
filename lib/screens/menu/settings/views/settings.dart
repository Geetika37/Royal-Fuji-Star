import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/screens/menu/settings/views/screens/change_password.dart';
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
            text: 'Settingstitle1'.tr,
            titleSpacing: screenWidth * 0.28,
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            CardSettings(
              text: 'Settingstitle2'.tr,
              onTap: () => Get.to(const NotificationSettings()),
            ),
            CardSettings(
              text: 'Settingstitle3'.tr,
              onTap: () => Get.to(LanguageSettings()),
            ),
            CardSettings(
              text: 'Settingstitle7'.tr,
              onTap: () => Get.to(const ChangePassword()),
            ),
            CardSettings(
              text: 'Settingstitle4'.tr,
              onTap: () => Get.to(const PrivacySecurity()),
            ),
            CardSettings(
              text: 'Settingstitle5'.tr,
              onTap: () => Get.to(const SupportFeedback()),
            ),
            CardSettings(
              text: 'Settingstitle6'.tr,
              onTap: () => Get.to(const DeleteAccount()),
            ),
          ],
        ),
      ),
    );
  }
}
