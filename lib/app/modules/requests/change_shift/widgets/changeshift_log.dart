import 'package:dailyateam/app/components/base_nodata.dart';
import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/modules/requests/change_shift/components/changeshift_card.dart';
import 'package:dailyateam/app/modules/requests/change_shift/controller.dart';
import 'package:dailyateam/app/modules/requests/components/cancel_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeShiftLog extends StatelessWidget {
  ChangeShiftLog({super.key});
  final controller = Get.find<ChangeShiftController>();

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
                  child: ChangeShiftCard(
                    fromShift: '',
                    toShift: '',
                    requestDate: '',
                    reason: '',
                    statusApprove: '',
                    createdAt: DateTime(0000),
                    index: index,
                    dataLength: 25,
                  ),
                );
              },
            )
          : controller.changeShift.isEmpty
              ? BaseNoData(
                  image: 'change_shift.svg',
                  title: 'Log Req Change Shift Empty',
                  subtitle: 'Log req change shift is empty',
                  onPressed: () {
                    controller.logLoading.value = true;
                    controller.changeShift.clear();
                    controller.fetchLogChangeShift();
                  },
                )
              : RefreshIndicator(
                  onRefresh: controller.refreshLogChangeShift,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: controller.changeShift.length,
                    itemBuilder: (context, index) {
                      final changeShift = controller.changeShift[index];

                      return ChangeShiftCard(
                        fromShift: changeShift.shiftAwal ?? '',
                        toShift: changeShift.shiftAkhir ?? '',
                        requestDate: changeShift.tanggalAwal ==
                                changeShift.tanggalAkhir
                            ? AppHelpers.dateFormat(
                                changeShift.tanggalAwal ?? DateTime(0000))
                            : '${AppHelpers.dateFormat(changeShift.tanggalAwal ?? DateTime(0000))} - ${AppHelpers.dateFormat(changeShift.tanggalAkhir ?? DateTime(0000))}',
                        offDate: changeShift.tanggalOff,
                        reason: changeShift.keterangan ?? '-',
                        statusApprove: changeShift.statusApprove ?? '',
                        createdAt: changeShift.createdAt ?? DateTime(0000),
                        index: index,
                        dataLength: controller.changeShift.length,
                        onPressedCancel: () => cancelAlert(
                          context,
                          request: '${changeShift.shiftAwal} to ${changeShift.shiftAkhir}',
                          requestDate: changeShift.tanggalAwal,
                          onConfirmBtnTap: () => controller.cancelChangeShift(changeShift.id),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
