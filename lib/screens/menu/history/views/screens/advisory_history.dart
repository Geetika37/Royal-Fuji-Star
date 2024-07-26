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
        return const Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Text('No enquiry'),
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
                                mainTitle: 'Type of Consultation : ',
                                text: advisoryItem.typeOfConsultation,
                              ),
                              RichtextHistory(
                                mainTitle: 'Description : ',
                                text: advisoryItem.description,
                              ),
                              RichtextHistory(
                                mainTitle: 'Comments Or Questions : ',
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
                    const Text(
                      'Images',
                      style: TextStyle(
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
