import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:royal_fuji_star/screens/menu/history/controller/history_controller.dart';
import 'package:royal_fuji_star/screens/menu/history/widgets/richtext_history.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class SpareEnquiryHistory extends StatelessWidget {
  const SpareEnquiryHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HistoryController historyController = Get.put(HistoryController());

    return Obx(
      () {
        if (historyController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        final spareEnquiry = historyController.spareEnquiry;

        if (spareEnquiry.isEmpty) {
          return Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text('noenquiry'.tr),
          );
        }

        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: spareEnquiry.length,
          itemBuilder: (context, index) {
            final spareEnquiryItem = spareEnquiry[index];
            return Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichtextHistory(
                                mainTitle: 'histor19'.tr,
                                text:
                                    spareEnquiryItem.spare?.name ?? 'histor20'.tr,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat('dd-MM-yyyy')
                                  .format(spareEnquiryItem.createdAt),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Appcolor.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              DateFormat('hh:mm a')
                                  .format(spareEnquiryItem.createdAt),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Appcolor.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
