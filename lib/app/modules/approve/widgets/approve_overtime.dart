import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/core/values/show_custombottomsheet.dart';
import 'package:dailyateam/app/modules/approve/components/approve_card.dart';
import 'package:dailyateam/app/modules/approve/components/reqovertime_bottomsheet.dart';
import 'package:dailyateam/app/modules/approve/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApproveOvertime extends StatelessWidget {
  ApproveOvertime({super.key});
  final controller = Get.find<ApproveController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.reqOvertimeLoading.value
          ? ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(15),
              itemCount: 25,
              itemBuilder: (context, index) {
                return BaseShimmer(
                  child: ApproveCard(
                    nama: '',
                    tag: 'overtime',
                    index: index,
                    dataLength: 25,
                  ),
                );
              },
            )
          : RefreshIndicator(
              onRefresh: controller.refreshReqOvertime,
              child: ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: controller.reqOvertime.length,
                itemBuilder: (context, index) {
                  final reqOvertime = controller.reqOvertime[index];

                  return ApproveCard(
                    nama: reqOvertime.getkar?.namaLengkap ?? '',
                    tag: 'overtime',
                    date: reqOvertime.tanggal,
                    jenis: reqOvertime.getkar?.cabang?.nama,
                    index: index,
                    dataLength: controller.reqOvertime.length,
                    onTap: () {
                      showCustomBottomSheet(
                        height: 400,
                        child: reqOvertimeBottomSheet(
                          reqOvertime: reqOvertime,
                          onApprove: () => controller.approveReqOvertime(
                            idOvertime: reqOvertime.id ?? 0,
                            status: 'approve',
                          ),
                          onReject: () => controller.approveReqOvertime(
                            idOvertime: reqOvertime.id ?? 0,
                            status: 'reject',
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
