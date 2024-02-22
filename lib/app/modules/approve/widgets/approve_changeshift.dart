import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/core/values/show_custombottomsheet.dart';
import 'package:dailyateam/app/modules/approve/components/approve_card.dart';
import 'package:dailyateam/app/modules/approve/components/reqchangeshift_bottomsheet.dart';
import 'package:dailyateam/app/modules/approve/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApproveChangeShift extends StatelessWidget {
  ApproveChangeShift({super.key});
  final controller = Get.find<ApproveController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.reqChangeShiftLoading.value
          ? ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(15),
              itemCount: 25,
              itemBuilder: (context, index) {
                return BaseShimmer(
                  child: ApproveCard(
                    nama: '',
                    tag: 'changeshift',
                    index: index,
                    dataLength: 25,
                  ),
                );
              },
            )
          : RefreshIndicator(
              onRefresh: controller.refreshReqChangeShift,
              child: ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: controller.reqChangeShift.length,
                itemBuilder: (context, index) {
                  final reqChangeShift = controller.reqChangeShift[index];

                  return ApproveCard(
                    nama: reqChangeShift.namaLengkap ?? '',
                    tag: 'changeshift',
                    shiftAwal: reqChangeShift.shiftAwal,
                    shiftAkhir: reqChangeShift.shiftAkhir,
                    index: index,
                    dataLength: controller.reqChangeShift.length,
                    onTap: () {
                      showCustomBottomSheet(
                        height: 400,
                        child: reqChangeShiftBottomSheet(
                          reqChangeShift: reqChangeShift,
                          onApprove: () => controller.approveReqChangeShift(
                            idReqChangeShift: reqChangeShift.id ?? 0,
                            status: 'approve',
                          ),
                          onReject: () => controller.approveReqChangeShift(
                            idReqChangeShift: reqChangeShift.id ?? 0,
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
