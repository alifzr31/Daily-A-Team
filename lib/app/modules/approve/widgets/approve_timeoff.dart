import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/core/values/show_custombottomsheet.dart';
import 'package:dailyateam/app/modules/approve/components/approve_card.dart';
import 'package:dailyateam/app/modules/approve/components/reqtimeoff_bottomsheet.dart';
import 'package:dailyateam/app/modules/approve/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApproveTimeOff extends StatelessWidget {
  ApproveTimeOff({super.key});
  final controller = Get.find<ApproveController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.reqTimeOffLoading.value
          ? ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(15),
              itemCount: 25,
              itemBuilder: (context, index) {
                return BaseShimmer(
                  child: ApproveCard(
                    nama: '',
                    tag: '',
                    index: index,
                    dataLength: 25,
                  ),
                );
              },
            )
          : RefreshIndicator(
              onRefresh: controller.refreshReqTimeOff,
              child: ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: controller.reqTimeOff.length,
                itemBuilder: (context, index) {
                  final reqTimeOff = controller.reqTimeOff[index];

                  return ApproveCard(
                    nama: reqTimeOff.namaLengkap ?? '',
                    tag: 'timeoff',
                    date: reqTimeOff.tanggal,
                    jenis: reqTimeOff.statusoff,
                    index: index,
                    dataLength: controller.reqTimeOff.length,
                    onTap: () {
                      showCustomBottomSheet(
                        height: reqTimeOff.dokumen != null
                            ? 450
                            : reqTimeOff.notesAju != null
                                ? 330
                                : 250,
                        child: reqTimeOffBottomSheet(
                          reqTimeOff: reqTimeOff,
                          onApprove: () => controller.approveReqTimeOff(
                            date: reqTimeOff.tanggal.toString(),
                            status: 'approve',
                            idReqATimeOff: reqTimeOff.id ?? 0,
                          ),
                          onReject: () => controller.approveReqTimeOff(
                            date: reqTimeOff.tanggal.toString(),
                            status: 'reject',
                            idReqATimeOff: reqTimeOff.id ?? 0,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
    );
  }
}
