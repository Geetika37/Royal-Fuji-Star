import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/widgets/customappbar.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool toggleValue = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: 'Settingstitle2'.tr,
            titleSpacing: screenWidth * 0.2,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'notifications'.tr,
                style: poppins(Appcolor.black, 15, FontWeight.w500),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                height: 28.0,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: toggleValue
                      ? Appcolor.buttonColor
                      : const Color.fromARGB(255, 117, 118, 118),
                ),
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeIn,
                      top: 0,
                      bottom: 0,
                      left: toggleValue ? 20.0 : 0.0,
                      right: toggleValue ? 0.0 : 20.0,
                      child: InkWell(
                        onTap: toggleButton,
                        child: AnimatedSwitcher(
                            duration: const Duration(
                              milliseconds: 1000,
                            ),
                            transitionBuilder: (child, animation) {
                              return ScaleTransition(
                                scale: animation,
                                child: child,
                              );
                            },
                            child: toggleValue
                                ? Icon(
                                    Icons.circle,
                                    color: Appcolor.white,
                                    size: 24,
                                    key: UniqueKey(),
                                  )
                                : Icon(
                                    Icons.circle,
                                    color: Appcolor.white,
                                    size: 24,
                                    key: UniqueKey(),
                                  )),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  toggleButton() {
    setState(() {
      toggleValue = !toggleValue;
    });
  }
}
