import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:royal_fuji_star/screens/menu/history/controller/history_controller.dart';
import 'package:royal_fuji_star/screens/menu/history/widgets/richtext_history.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class AdvisoryHistory extends StatelessWidget {
  const AdvisoryHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HistoryController historyController = Get.put(HistoryController());

    return Obx(() {
      if (historyController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      final advisory = historyController.advisory;

      if (historyController.advisory.isEmpty) {
        return Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Text('noenquiry'.tr),
        );
      }
      return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: advisory.length,
          itemBuilder: (context, index) {
            final advisoryItem = advisory[index];
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
                                mainTitle: 'histor12'.tr,
                                text: advisoryItem.typeOfConsultation,
                              ),
                              RichtextHistory(
                                mainTitle: 'histor11'.tr,
                                text: advisoryItem.description,
                              ),
                              RichtextHistory(
                                mainTitle: 'histor13'.tr,
                                text: advisoryItem.commentsOrQuestion,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat('dd-MM-yyyy')
                                  .format(advisoryItem.createdAt),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Appcolor.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              DateFormat('hh:mm a')
                                  .format(advisoryItem.createdAt),
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
                    Text(
                      'histor18'.tr,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Appcolor.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 50,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: advisoryItem.uploadImages!.map((image) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  '${APIConstants.baseUrl}${image.url}',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: 50,
                                      height: 50,
                                      color: Colors.grey,
                                      child: const Icon(
                                        Icons.broken_image,
                                        color: Colors.white,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    });
  }
}
