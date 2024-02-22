import 'package:dailyateam/app/components/base_nodata.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/modules/log_attendance/components/lateout_card.dart';
import 'package:dailyateam/app/modules/log_attendance/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LateOutWidget extends StatelessWidget {
  LateOutWidget({super.key});
  final controller = Get.find<LogAttendanceController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Column(
              children: [
                BaseText(
                  text: 'Period',
                  size: 12,
                  color: Colors.grey.shade600,
                ),
                BaseText(
                  text: controller.periodName.value ?? '',
                  size: 16,
                  bold: FontWeight.w600,
                ),
                Divider(
                  color: Colors.grey.shade300,
                  height: 15,
                ),
              ],
            ),
          ),
          Expanded(
            child: controller.lateAttendance.isEmpty &&
                    controller.noOutAttendance.isEmpty
                ? const SingleChildScrollView(
                    child: BaseNoDataLottie(
                      lottie: 'goodjob.json',
                      lottieSize: 40,
                      title: 'Good Job!',
                      subtitle: "You're never late and forget to clock out",
                      showButton: false,
                    ),
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        if (controller.lateAttendance.isNotEmpty)
                          LateOutCard(
                            title: 'Total Late',
                            listData: controller.lateAttendance,
                            tag: 'late',
                          ),
                        if (controller.noOutAttendance.isNotEmpty)
                          LateOutCard(
                            title: 'No Clock Out',
                            listData: controller.noOutAttendance,
                            tag: 'noOut',
                          ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
