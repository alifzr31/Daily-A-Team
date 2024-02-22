import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/core/values/show_custombottomsheet.dart';
import 'package:dailyateam/app/modules/approve/components/reqattendance_bottomsheet.dart';
import 'package:dailyateam/app/modules/approve/components/approve_card.dart';
import 'package:dailyateam/app/modules/approve/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApproveAttendance extends StatelessWidget {
  ApproveAttendance({super.key});
  final controller = Get.find<ApproveController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.reqAttendanceLoading.value
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
              onRefresh: controller.refreshReqAttendance,
              child: ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: controller.reqAttendance.length,
                itemBuilder: (context, index) {
                  final reqAttendance = controller.reqAttendance[index];

                  return ApproveCard(
                    nama: reqAttendance.namaLengkap ?? '',
                    tag: 'attendance',
                    date: reqAttendance.tanggal,
                    jenis: reqAttendance.jenis,
                    index: index,
                    dataLength: controller.reqAttendance.length,
                    onTap: () {
                      showCustomBottomSheet(
                        height: 400,
                        child: reqAttendanceBottomSheet(
                          reqAttendance: reqAttendance,
                          onApprove: () => controller.approveReqAttendance(
                            date: reqAttendance.tanggal.toString(),
                            name: reqAttendance.namaLengkap ?? '',
                            status: 'approve',
                            idReqAttendance: reqAttendance.id ?? 0,
                          ),
                          onReject: () => controller.approveReqAttendance(
                            date: reqAttendance.tanggal.toString(),
                            name: reqAttendance.namaLengkap ?? '',
                            status: 'reject',
                            idReqAttendance: reqAttendance.id ?? 0,
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
