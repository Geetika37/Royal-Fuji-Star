import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/widgets/customappbar.dart';

class NotificationEmpty extends StatelessWidget {
  const NotificationEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(text: 'Notifications', titleSpacing: 0),
        ),
        body: Column(
          children: [
            Image.asset('assets/png/notificationbg.png'),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'You currently have no notifications. When you receive any, you can view them here.',
                style: poppins(const Color(0xFF273039), 10, FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
