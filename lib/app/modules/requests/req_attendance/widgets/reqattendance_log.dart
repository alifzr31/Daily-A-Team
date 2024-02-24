import 'package:dailyateam/app/components/base_nodata.dart';
import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/modules/requests/components/cancel_alert.dart';
import 'package:dailyateam/app/modules/requests/req_attendance/components/reqattendance_card.dart';
import 'package:dailyateam/app/modules/requests/req_attendance/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReqAttendanceLog extends StatelessWidget {
  ReqAttendanceLog({super.key});
  final controller = Get.find<ReqAttendanceController>();

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
                  child: ReqAttendanceCard(
                    jenis: '',
                    time: '',
                    requestDate: DateTime(0000),
                    reason: '',
                    statusApprove: '',
                    createdAt: DateTime(0000),
                    index: index,
                    dataLength: 25,
                  ),
                );
              },
            )
          : controller.logReqAttendance.isEmpty
              ? BaseNoData(
                  image: 'req_attendance.svg',
                  title: 'Log Req Attendance Empty',
                  subtitle: 'Log req attendance is empty',
                  onPressed: () {
                    controller.logLoading.value = true;
                    controller.logReqAttendance.clear();
                    controller.fetchLogReqAttendance();
                  },
                )
              : RefreshIndicator(
                  onRefresh: controller.refreshLogReqAttendance,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: controller.logReqAttendance.length,
                    itemBuilder: (context, index) {
                      final logReqAttendance =
                          controller.logReqAttendance[index];

                      return ReqAttendanceCard(
                        jenis: logReqAttendance.jenis ?? '',
                        time: logReqAttendance.jam ?? '',
                        requestDate: logReqAttendance.tanggal ?? DateTime(0000),
                        reason: logReqAttendance.notes ?? '-',
                        statusApprove: logReqAttendance.statusApprove ?? '',
                        createdAt: logReqAttendance.createdAt ?? DateTime(0000),
                        index: index,
                        dataLength: controller.logReqAttendance.length,
                        onPressedCancel: () => cancelAlert(
                          context,
                          request: '${logReqAttendance.jenis} (${logReqAttendance.jam})',
                          requestDate: logReqAttendance.tanggal,
                          onConfirmBtnTap: () => controller.cancelReqAttendance(logReqAttendance.id),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
