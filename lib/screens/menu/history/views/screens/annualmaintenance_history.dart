import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:royal_fuji_star/screens/menu/history/controller/history_controller.dart';
import 'package:royal_fuji_star/screens/menu/history/widgets/richtext_history.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class AnnualMaintenanceHistory extends StatelessWidget {
  const AnnualMaintenanceHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HistoryController historyController = Get.put(HistoryController());

    return Obx(() {
      if (historyController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      final annualMaintenance = historyController.annualMaintenance;
      if (historyController.annualMaintenance.isEmpty) {
        return const Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Text('No enquiry'),
        );
      }
      return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: annualMaintenance.length,
          itemBuilder: (context, index) {
            final annualMaintenanceItem = annualMaintenance[index];
            return Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              RichtextHistory(
                                mainTitle: 'Brand Name : ',
                                text: annualMaintenanceItem.brand,
                              ),
                              RichtextHistory(
                                mainTitle: 'Type : ',
                                text: annualMaintenanceItem.type,
                              ),
                              RichtextHistory(
                                mainTitle: 'Capacity : ',
                                text: annualMaintenanceItem.capacity,
                              ),
                              RichtextHistory(
                                mainTitle: 'No of Floors : ',
                                text: annualMaintenanceItem.numberOfFloors
                                    .toString(),
                              ),
                              RichtextHistory(
                                mainTitle: 'Description : ',
                                text: annualMaintenanceItem.description,
                                // overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat('dd-MM-yyyy')
                                  .format(annualMaintenanceItem.createdAt),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Appcolor.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              DateFormat('hh:mm a')
                                  .format(annualMaintenanceItem.createdAt),
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
          });
    });
  }
}
