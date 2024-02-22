import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/modules/requests/overtime/components/overtime_card.dart';
import 'package:dailyateam/app/modules/requests/overtime/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OvertimeLog extends StatelessWidget {
  OvertimeLog({super.key});
  final controller = Get.find<OvertimeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.logLoading.value
          ? ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(15),
              itemCount: 25,
              itemBuilder: (context, index) {
                return BaseShimmer(
                  child: OvertimeCard(
                    time: '',
                    duration: '',
                    requestDate: DateTime(0000),
                    compensation: '',
                    reason: '',
                    statusApprove: '',
                    createdAt: DateTime(0000),
                    index: index,
                    dataLength: 25,
                  ),
                );
              },
            )
          : RefreshIndicator(
              onRefresh: controller.refreshLogOvertime,
              child: ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: controller.overtime.length,
                itemBuilder: (context, index) {
                  final overtime = controller.overtime[index];

                  return OvertimeCard(
                    time: '${overtime.mulai} - ${overtime.akhir}',
                    duration: AppHelpers.convertDuration(overtime.durasi ?? ''),
                    requestDate: overtime.tanggalOvertime ?? DateTime(0000),
                    compensation: overtime.kompensasi ?? '',
                    reason: overtime.note ?? '-',
                    statusApprove: overtime.statusApprove ?? '',
                    createdAt: overtime.createdAt ?? DateTime(0000),
                    index: index,
                    dataLength: controller.overtime.length,
                  );
                },
              ),
            ),
    );
  }
}
