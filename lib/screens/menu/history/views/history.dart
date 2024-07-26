import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/screens/menu/history/controller/history_controller.dart';
import 'package:royal_fuji_star/screens/menu/history/views/screens/advisory_history.dart';
import 'package:royal_fuji_star/screens/menu/history/views/screens/annualmaintenance_history.dart';
import 'package:royal_fuji_star/screens/menu/history/views/screens/productenquiry_history.dart';
import 'package:royal_fuji_star/screens/menu/history/views/screens/repair_history.dart';
import 'package:royal_fuji_star/screens/menu/history/views/screens/spare_enquiry.dart';
import 'package:royal_fuji_star/screens/menu/history/views/screens/sparenot_found.dart';

import 'package:royal_fuji_star/screens/widgets/customappbar.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HistoryController historyController = Get.put(HistoryController());
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: 'drawertext4'.tr,
            titleSpacing: screenWidth * 0.28,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Obx(
              () {
                if (historyController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (historyController.advisory.isEmpty &&
                    historyController.annualMaintenance.isEmpty &&
                    historyController.productEnquiry.isEmpty &&
                    historyController.repair.isEmpty &&
                    historyController.spareEnquiry.isEmpty &&
                    historyController.spareNotFound.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 100),
                    child: Center(
                      child: Text(
                        'noenquiry'.tr,
                        style:
                            poppins(Appcolor.buttonColor, 15, FontWeight.w500),
                      ),
                    ),
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HistoryHeading(historyHeading: 'history1'.tr),
                    const AnnualMaintenanceHistory(),
                    HistoryHeading(historyHeading: 'history2'.tr),
                    const RepairHistory(),
                    HistoryHeading(historyHeading: 'history3'.tr),
                    const AdvisoryHistory(),
                    HistoryHeading(historyHeading: 'history4'.tr),
                    const ProductenquiryHistory(),
                    HistoryHeading(historyHeading: 'history5'.tr),
                    const SpareEnquiryHistory(),
                    HistoryHeading(historyHeading: 'history6'.tr),
                    const SpareNotFoundHistory(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class HistoryHeading extends StatelessWidget {
  const HistoryHeading({
    super.key,
    required this.historyHeading,
  });
  final String historyHeading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: screenHeight * 0.05,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Appcolor.buttonColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 5, right: 5),
          child: Text(
            historyHeading,
            style: poppins(
              Appcolor.white,
              16,
              FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
