import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:royal_fuji_star/screens/menu/history/controller/history_controller.dart';
import 'package:royal_fuji_star/screens/menu/history/widgets/richtext_history.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class ProductenquiryHistory extends StatelessWidget {
  const ProductenquiryHistory({
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
        final productEnquiry = historyController.productEnquiry;

        if (historyController.productEnquiry.isEmpty) {
          return Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text('noenquiry'.tr),
          );
        }
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: productEnquiry.length,
          itemBuilder: (context, index) {
            final productEnquiryItem = productEnquiry[index];
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
                                mainTitle: 'histor14'.tr,
                                text: productEnquiryItem.product.name,
                              ),
                              RichtextHistory(
                                mainTitle: 'histor16'.tr,
                                text: productEnquiryItem.components.isEmpty
                                    ? 'histor15'.tr
                                    : productEnquiryItem.components
                                        .map((component) => component.name)
                                        .join(', '),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat('dd-MM-yyyy')
                                  .format(productEnquiryItem.createdAt),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Appcolor.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              DateFormat('hh:mm a')
                                  .format(productEnquiryItem.createdAt),
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
