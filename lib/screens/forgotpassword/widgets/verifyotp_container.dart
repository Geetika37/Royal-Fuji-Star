import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pinput/pinput.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/forgotpassword/controller/verifyotp_controller.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/buttons.dart';

class VerifyOTPContainer extends StatelessWidget {
  const VerifyOTPContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifyotpController verifyotpController =
        Get.put(VerifyotpController());

    TextEditingController pinController = TextEditingController();
    return Container(
      height: screenHeight * 0.65,
      width: screenWidth,
      decoration: const BoxDecoration(
        color: Appcolor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.1),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'verifyotp2'.tr,
                  style: poppins(Appcolor.buttonColor, 16, FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Pinput(
              controller: pinController,
              length: 4,
              onCompleted: (pin) => print(pin),
            ),
            SizedBox(height: screenHeight * 0.05),
            Obx(
              () => BlueButtonn(
                color: Appcolor.buttonColor,
                height: screenHeight * 0.07,
                width: screenWidth * 0.8,
                circularRadius: 10,
                text: verifyotpController.isLoading.value
                    ? LoadingAnimationWidget.prograssiveDots(
                        size: 35,
                        color: Appcolor.white,
                      )
                    : Text(
                        'annualcontainertext9'.tr,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Appcolor.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                onTap: () async {
                  verifyotpController.verifyOtp(pinController.text);
                },
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
