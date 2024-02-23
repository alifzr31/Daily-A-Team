import 'package:dailyateam/app/components/base_nodata.dart';
import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/modules/requests/time_off/components/logtimeoff_card.dart';
import 'package:dailyateam/app/modules/requests/time_off/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeOffLog extends StatelessWidget {
  TimeOffLog({super.key});
  final controller = Get.find<TimeOffController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.logLoading.value
          ? ListView.builder(
              padding: const EdgeInsets.all(15),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 25,
              itemBuilder: (context, index) {
                return BaseShimmer(
                  child: LogTimeOffCard(
                    statusOff: '',
                    requestDate: DateTime(0000),
                    reason: '',
                    notes: '',
                    document: '',
                    createdAt: DateTime(0000),
                    statusApprove: '',
                    index: index,
                    dataLength: 25,
                  ),
                );
              },
            )
          : controller.timeOff.isEmpty
              ? BaseNoData(
                  image: 'timeoff.svg',
                  title: 'Log Req Time Off Empty',
                  subtitle: 'Log req time off is empty',
                  onPressed: () {
                    controller.logLoading.value = true;
                    controller.timeOff.clear();
                    controller.fetchLogTimeOff();
                  },
                )
              : RefreshIndicator(
                  onRefresh: controller.refreshLogTimeOff,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: controller.timeOff.length,
                    itemBuilder: (context, index) {
                      final timeOff = controller.timeOff[index];

                      return LogTimeOffCard(
                        statusOff: timeOff.statusoff ?? '',
                        requestDate: timeOff.tanggal ?? DateTime(0000),
                        reason: timeOff.notesAju ?? '-',
                        notes: timeOff.notesAju ?? '',
                        document: timeOff.dokumen ?? '',
                        createdAt: timeOff.createdAt ?? DateTime(0000),
                        statusApprove: timeOff.statusApprove ?? '',
                        index: index,
                        dataLength: controller.timeOff.length,
                        onPressedCancel: () =>
                            controller.cancelTimeOff(timeOff.id),
                      );
                    },
                  ),
                ),
    );
  }
}
