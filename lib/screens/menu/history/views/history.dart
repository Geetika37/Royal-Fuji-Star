import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: 'History'.tr,
            titleSpacing: screenWidth * 0.28,
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HistoryHeading(historyHeading: 'Annual Maintenance'),
                AnnualMaintenanceHistory(),
                HistoryHeading(historyHeading: 'Repair'),
                RepairHistory(),
                HistoryHeading(historyHeading: 'Advisory'),
                AdvisoryHistory(),
                HistoryHeading(historyHeading: 'Product Enquiry'),
                ProductenquiryHistory(),
                HistoryHeading(historyHeading: 'Spare Enquiry'),
                SpareEnquiryHistory(),
                HistoryHeading(historyHeading: 'Spare Not Found'),
                SpareNotFoundHistory(),
              ],
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
