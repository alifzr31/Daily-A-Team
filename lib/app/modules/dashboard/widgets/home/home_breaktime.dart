import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/dashboard/components/home/breaktime_button.dart';
import 'package:dailyateam/app/modules/dashboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeBreakTime extends StatelessWidget {
  HomeBreakTime({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 120,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            elevation: 1,
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Container(
                  color: softBlue,
                  width: Get.width,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 15,
                  ),
                  child: const BaseText(
                    text: 'Break Time Today',
                    bold: FontWeight.w600,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Expanded(
                          child: controller.todayBreakLoading.value
                              ? BaseShimmer(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: softBlue,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                )
                              : BreaktimeButton(
                                  bgColor: controller.todayAttendance.value
                                              ?.jamMasuk ==
                                          null
                                      ? Colors.grey.shade100
                                      : controller.todayBreak.value
                                                  ?.istirahatKeluar ==
                                              null
                                          ? softBlue
                                          : Colors.red.shade100,
                                  label: controller
                                          .todayBreak.value?.istirahatKeluar ??
                                      'Out',
                                  labelColor: controller.todayAttendance.value
                                              ?.jamMasuk ==
                                          null
                                      ? Colors.grey
                                      : controller.todayBreak.value
                                                  ?.istirahatKeluar ==
                                              null
                                          ? null
                                          : controller.todayBreak.value
                                                      ?.istirahatMasuk ==
                                                  null
                                              ? null
                                              : Colors.red.shade800,
                                  icon: MingCute.exit_fill,
                                  iconColor: controller.todayAttendance.value
                                              ?.jamMasuk ==
                                          null
                                      ? Colors.grey
                                      : Colors.red.shade800,
                                  onTap: controller.todayBreak.value
                                                  ?.istirahatKeluar !=
                                              null ||
                                          controller.todayAttendance.value
                                                  ?.jamMasuk ==
                                              null
                                      ? null
                                      : () {
                                          controller.jenisBreak.value = 'Out';
                                          controller.postBreakTime();
                                        },
                                ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: controller.todayBreakLoading.value
                              ? BaseShimmer(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: softBlue,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                )
                              : BreaktimeButton(
                                  bgColor: controller.todayBreak.value
                                              ?.istirahatKeluar ==
                                          null
                                      ? Colors.grey.shade100
                                      : controller.todayBreak.value
                                                  ?.istirahatMasuk ==
                                              null
                                          ? softBlue
                                          : Colors.green.shade100,
                                  label: controller
                                          .todayBreak.value?.istirahatMasuk ??
                                      'In',
                                  labelColor: controller.todayBreak.value
                                              ?.istirahatKeluar ==
                                          null
                                      ? Colors.grey
                                      : controller.todayBreak.value
                                                  ?.istirahatMasuk ==
                                              null
                                          ? null
                                          : Colors.green.shade800,
                                  icon: MingCute.entrance_fill,
                                  iconColor: controller.todayBreak.value
                                              ?.istirahatKeluar ==
                                          null
                                      ? Colors.grey
                                      : Colors.green.shade800,
                                  onTap: controller.todayBreak.value
                                                  ?.istirahatKeluar ==
                                              null ||
                                          controller.todayBreak.value
                                                  ?.istirahatMasuk !=
                                              null
                                      ? null
                                      : () {
                                          controller.jenisBreak.value = 'In';
                                          controller.postBreakTime();
                                        },
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
